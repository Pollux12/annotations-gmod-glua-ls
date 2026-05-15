import fs from 'fs';
import os from 'os';
import path from 'path';
import { spawnSync } from 'child_process';

describe('cli-generate-lua', () => {
  test('ignores non-page JSON payloads such as plugin index metadata', () => {
    const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-generate-lua-'));
    const outputPath = path.join(tmpRoot, 'output');
    const pluginBundlesPath = path.join(tmpRoot, 'output-plugins');
    const pluginDir = path.join(outputPath, 'plugin');
    const hooksDir = path.join(outputPath, 'hooks');

    fs.mkdirSync(pluginDir, { recursive: true });
    fs.mkdirSync(hooksDir, { recursive: true });
    fs.writeFileSync(path.join(pluginDir, 'index.json'), JSON.stringify({ plugins: [] }, null, 2), 'utf8');
    fs.writeFileSync(path.join(hooksDir, 'pages.json'), JSON.stringify([], null, 2), 'utf8');

    try {
      const command = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      const result = spawnSync(
        `${command} run generate-lua -- --output "${outputPath}" --customOverrides ./custom`,
        [],
        {
          cwd: process.cwd(),
          encoding: 'utf8',
          shell: true,
        },
      );

      expect(result.status).toBe(0);
      expect(result.stderr).not.toContain('TypeError: pages.forEach is not a function');
      expect(fs.existsSync(path.join(pluginBundlesPath, 'darkrp', 'plugin.json'))).toBe(false);
    } finally {
      fs.rmSync(tmpRoot, { recursive: true, force: true });
    }
  });

  test('applies typed Entity networked getter overrides', () => {
    const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-generate-lua-'));
    const outputPath = path.join(tmpRoot, 'output');
    const entityDir = path.join(outputPath, 'entity');

    function writeEntityGetterPage(fileName: string, name: string, returnType: string, defaultValue: string) {
      fs.writeFileSync(
        path.join(entityDir, fileName),
        JSON.stringify([
          {
            type: 'classfunc',
            parent: 'Entity',
            name,
            address: `Entity:${name}`,
            description: 'Retrieves a networked value.',
            realm: 'shared',
            arguments: [{ args: [{ name: 'key', type: 'string' }, { name: 'fallback', type: 'any', default: defaultValue }] }],
            returns: [{ type: returnType }],
            url: `https://wiki.facepunch.com/gmod/Entity:${name}`,
          },
        ], null, 2),
        'utf8',
      );
    }

    fs.mkdirSync(entityDir, { recursive: true });
    writeEntityGetterPage('getnwentity.json', 'GetNWEntity', 'any', 'NULL');
    writeEntityGetterPage('getnwint.json', 'GetNWInt', 'any', '0');
    writeEntityGetterPage('getnetworkedentity.json', 'GetNetworkedEntity', 'Entity', 'NULL');

    try {
      const command = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      const result = spawnSync(
        `${command} run generate-lua -- --output "${outputPath}" --customOverrides ./custom`,
        [],
        {
          cwd: process.cwd(),
          encoding: 'utf8',
          shell: true,
        },
      );

      expect(result.status).toBe(0);
      const entityLua = fs.readFileSync(path.join(outputPath, 'entity.lua'), 'utf8');
      expect(entityLua).toContain('---@overload fun(self: Entity, key: string): Entity|NULL # The value associated with the key');
      expect(entityLua).toContain('---@overload fun(self: Entity, key: string): number # The value associated with the key');
      expect(entityLua).toContain('---@overload fun(self: Entity, key: string): Entity|NULL # The retrieved value');
      expect(entityLua).toContain('---@param fallback T The value to return if we failed to retrieve the value.');
      expect(entityLua).toContain('---@return Entity|T # The value associated with the key');
      expect(entityLua).toContain('---@return number|T # The value associated with the key');
      expect(entityLua).toContain('---@return Entity|T # The retrieved value');
      expect(entityLua).not.toContain('---@param fallback? Entity');
      expect(entityLua).not.toContain('---@param fallback? number');
      expect(entityLua).not.toContain('---@return any');
    } finally {
      fs.rmSync(tmpRoot, { recursive: true, force: true });
    }
  });
});
