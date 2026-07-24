import fs from 'fs';
import path from 'path';
import { GluaApiWriter } from '../src/api-writer/glua-api-writer.js';

describe('Custom class overrides emission', () => {
	const tmpDir = path.join(process.cwd(), 'output_test_tmp');

	beforeEach(() => {
		fs.rmSync(tmpDir, { recursive: true, force: true });
		fs.mkdirSync(tmpDir, { recursive: true });
	});

	afterAll(() => {
		if (fs.existsSync(tmpDir)) {
			fs.rmSync(tmpDir, { recursive: true, force: true });
		}
	});

	test('orphan class override (class.ENT) is written when no wiki page exists', () => {
		const writer = new GluaApiWriter(tmpDir);
		writer.addOverride('class.ENT', '@---@class ENT\nENT = {}\n');
		writer.writeToDisk();
		const customFile = path.join(tmpDir, 'custom_classes.lua');
		expect(fs.existsSync(customFile)).toBe(true);
		const content = fs.readFileSync(customFile, 'utf8');
		expect(content).toMatch(/@class ENT/);
		expect(content).toMatch(/ENT = {}/);
	});

	test('class overrides retain canonical metadata and deduplicated structure fields', () => {
		const writer = new GluaApiWriter(tmpDir);
		writer.addOverride('class.GM', [
			'---@class GM',
			'---@field FolderName? integer Custom field shape.',
			'GM = {}',
			'',
		].join('\n'));

		writer.writePages([<any>{
			type: 'hook',
			name: 'Think',
			address: 'GM:Think',
			parent: 'GM',
			description: 'Runs every frame.',
			arguments: [],
			returns: [],
		}], path.join(tmpDir, 'gm.lua'), 0);
		writer.writePages([<any>{
			type: 'struct',
			name: 'GM',
			address: 'GM',
			description: 'Gamemode data.',
			realm: 'shared',
			deprecated: 'Use the replacement gamemode type.',
			url: 'https://wiki.facepunch.com/gmod/Structures/GM',
			fields: [
				{ name: 'FolderName', type: 'string', description: 'Generated folder name.' },
				{ name: 'Folder', type: 'string', description: 'Generated folder path.' },
				{ name: 'Folder', type: 'number', description: 'Duplicate field from the same page.' },
			],
		}], path.join(tmpDir, 'structures.lua'), 1);

		writer.writeToDisk();

		const gmOutput = fs.readFileSync(path.join(tmpDir, 'gm.lua'), 'utf8');
		expect(gmOutput).toContain('--- Gamemode data.');
		expect(gmOutput).toContain('---@realm shared');
		expect(gmOutput).toContain('---@source https://wiki.facepunch.com/gmod/Structures/GM');
		expect(gmOutput).toContain('---@deprecated Use the replacement gamemode type.');
		expect(gmOutput).toContain('---@field FolderName? integer Custom field shape.');
		expect(gmOutput).not.toContain('---@field FolderName string');
		expect(gmOutput).toContain('---@field Folder string');
		expect(gmOutput).not.toContain('---@field Folder number');
		expect(gmOutput).toContain('function GM:Think() end');
		expect((gmOutput.match(/---@class GM/g) ?? [])).toHaveLength(1);
		expect((gmOutput.match(/---@field FolderName\?? /g) ?? [])).toHaveLength(1);
		expect((gmOutput.match(/---@field Folder\?? /g) ?? [])).toHaveLength(1);
	});

	test('class placement and content are stable when modules are registered in reverse order', () => {
		const generate = (directory: string, reverse: boolean) => {
			fs.mkdirSync(directory, { recursive: true });
			const writer = new GluaApiWriter(directory);
			writer.addOverride('class.GM', '---@class GM\nGM = {}\n');

			const modules: Array<[any[], string, number]> = [
				[[<any>{
					type: 'hook',
					name: 'Think',
					address: 'GM:Think',
					parent: 'GM',
					description: 'Runs every frame.',
					arguments: [],
					returns: [],
				}], path.join(directory, 'gm.lua'), 0],
				[[
					<any>{
						type: 'class',
						name: 'GM',
						address: 'GM_Class',
						parent: 'BaseGM',
						description: 'Canonical gamemode class.',
						realm: 'shared',
						url: 'https://wiki.facepunch.com/gmod/GM_Class',
					},
					<any>{
						type: 'struct',
						name: 'GM',
						address: 'GM',
						description: 'Gamemode data.',
						realm: 'shared',
						deprecated: 'Legacy structure metadata.',
						url: 'https://wiki.facepunch.com/gmod/Structures/GM',
						fields: [{ name: 'FolderName', type: 'string', description: 'Generated folder name.' }],
					},
				], path.join(directory, 'structures.lua'), 1],
			];

			for (const [pages, filePath, index] of reverse ? modules.reverse() : modules) {
				writer.writePages(pages, filePath, index);
			}
			writer.writeToDisk();

			return fs.readFileSync(path.join(directory, 'gm.lua'), 'utf8');
		};

		const forward = generate(path.join(tmpDir, 'forward'), false);
		const reverse = generate(path.join(tmpDir, 'reverse'), true);

		expect(reverse).toBe(forward);
		expect(forward).toContain('--- Canonical gamemode class.');
		expect(forward).toContain('---@source https://wiki.facepunch.com/gmod/GM_Class');
		expect(forward).toContain('---@deprecated Legacy structure metadata.');
		expect(forward).toContain('---@class GM : BaseGM');
		expect((forward.match(/---@class GM/g) ?? [])).toHaveLength(1);
		expect(forward.indexOf('---@class GM')).toBeLessThan(forward.indexOf('function GM:Think() end'));
		expect(fs.existsSync(path.join(tmpDir, 'forward', 'structures.lua'))).toBe(false);
		expect(fs.existsSync(path.join(tmpDir, 'reverse', 'structures.lua'))).toBe(false);
	});

	test('an earlier alias module cannot consume the canonical class header', () => {
		const writer = new GluaApiWriter(tmpDir);
		const aliasFile = path.join(tmpDir, 'aaa.lua');
		const ownerFile = path.join(tmpDir, 'panel.lua');

		writer.writePages([
			<any>{
				type: 'class',
				name: 'PANEL',
				address: 'PANEL_Hooks',
				parent: 'Panel',
				description: 'Alias hook surface.',
			},
			<any>{
				type: 'classfunc',
				name: 'AliasMethod',
				address: 'PANEL:AliasMethod',
				parent: 'PANEL',
				description: 'Method that remains in the alias module.',
				arguments: [],
				returns: [],
			},
		], aliasFile, 0);
		writer.writePages([<any>{
			type: 'panel',
			name: 'Panel',
			address: 'Panel',
			parent: 'BasePanel',
			description: 'Canonical panel.',
		}], ownerFile, 1);
		writer.writePages([<any>{
			type: 'struct',
			name: 'Panel',
			address: 'Structures/Panel',
			description: 'Panel fields.',
			fields: [{ name: 'Dock', type: 'number', description: 'Dock mode.' }],
		}], path.join(tmpDir, 'structures.lua'), 2);

		writer.writeToDisk();

		const aliasOutput = fs.readFileSync(aliasFile, 'utf8');
		const ownerOutput = fs.existsSync(ownerFile) ? fs.readFileSync(ownerFile, 'utf8') : '';
		expect(aliasOutput).toContain('function Panel:AliasMethod() end');
		expect(aliasOutput).not.toContain('---@class (partial) Panel');
		expect(aliasOutput).not.toContain('---@field Dock number');
		expect(ownerOutput).toContain('---@class (partial) Panel : BasePanel');
		expect(ownerOutput).toContain('---@field Dock number');
		expect((`${aliasOutput}\n${ownerOutput}`.match(/---@class \(partial\) Panel/g) ?? [])).toHaveLength(1);
	});

	test('alias metadata cannot make its canonical class inherit from itself', () => {
		const writer = new GluaApiWriter(tmpDir);
		const aliasFile = path.join(tmpDir, 'aaa.lua');
		const ownerFile = path.join(tmpDir, 'panel.lua');

		writer.addOverride('class.Panel', '---@class Panel\nPanel = Panel or {}\n');
		writer.writePages([<any>{
			type: 'class',
			name: 'PANEL',
			address: 'PANEL_Hooks',
			parent: 'Panel',
			description: 'Alias hook surface.',
		}], aliasFile, 0);
		writer.writePages([<any>{
			type: 'class',
			name: 'Panel',
			address: 'Panel',
			description: 'Canonical panel.',
		}], ownerFile, 1);

		writer.writeToDisk();

		const ownerOutput = fs.readFileSync(ownerFile, 'utf8');
		expect(ownerOutput).toContain('---@class Panel\n');
		expect(ownerOutput).not.toContain('---@class Panel : Panel');
	});
});
