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
        `${command} run generate-lua -- --output "${outputPath}" --custom-overrides ./custom`,
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

  test('uses runtime-generic debug.getmetatable annotation override', () => {
    const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-generate-lua-debug-getmetatable-'));
    const outputPath = path.join(tmpRoot, 'output');
    const customOverridesPath = path.join(tmpRoot, 'custom');
    const debugDir = path.join(outputPath, 'debug');

    fs.mkdirSync(debugDir, { recursive: true });
    fs.mkdirSync(customOverridesPath, { recursive: true });

    fs.copyFileSync(
      path.join(process.cwd(), 'custom', 'debug.getmetatable.lua'),
      path.join(customOverridesPath, 'debug.getmetatable.lua'),
    );

    const pagesPath = path.join(debugDir, 'getmetatable.json');
    fs.writeFileSync(
      pagesPath,
      JSON.stringify([
        {
          type: 'libraryfunc',
          parent: 'debug',
          name: 'getmetatable',
          address: 'debug.getmetatable',
          description: 'Returns the metatable of the specified value.',
          realm: 'shared',
          url: 'https://wiki.facepunch.com/gmod/debug.getmetatable',
          arguments: [
            {
              args: [
                {
                  name: 'object',
                  type: 'any',
                },
              ],
            },
          ],
          returns: [
            {
              type: 'any',
            },
          ],
        },
      ], null, 2),
      'utf8',
    );

    try {
      const command = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      const result = spawnSync(
        `${command} run generate-lua -- --output "${outputPath}" --custom-overrides "${customOverridesPath}"`,
        [],
        {
          cwd: process.cwd(),
          encoding: 'utf8',
          shell: true,
        },
      );

      expect(result.status).toBe(0);
      const debugLua = fs.readFileSync(path.join(outputPath, 'debug.lua'), 'utf8');
      expect(debugLua).toContain('---@generic T');
      expect(debugLua).toContain('---@param object T The value to get the metatable of.');
      expect(debugLua).toContain('---@return (definition) T # The metatable of the value.');
      expect(debugLua).not.toContain('`T`');
      expect(debugLua).not.toContain('---@generic T : table');
    } finally {
      fs.rmSync(tmpRoot, { recursive: true, force: true });
    }
  });

  test('emits custom function overrides for missing wiki pages', () => {
    const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-generate-lua-missing-overrides-'));
    const outputPath = path.join(tmpRoot, 'output');
    const customOverridesPath = path.join(tmpRoot, 'custom');
    const steamworksDir = path.join(outputPath, 'steamworks');

    fs.mkdirSync(steamworksDir, { recursive: true });
    fs.mkdirSync(customOverridesPath, { recursive: true });

    fs.writeFileSync(
      path.join(steamworksDir, 'library.json'),
      JSON.stringify(
        [
          {
            type: 'library',
            address: 'steamworks',
            name: 'steamworks',
            description: 'Steamworks related functions.',
            realm: 'shared',
            url: 'https://wiki.facepunch.com/gmod/steamworks',
          },
        ],
        null,
        2,
      ),
      'utf8',
    );

    fs.writeFileSync(
      path.join(customOverridesPath, 'steamworks.GetDownloadedItems.lua'),
      [
        '---Returns a list of downloaded UGC item IDs.',
        '---@return string[]',
        'function steamworks.GetDownloadedItems() end',
        '',
      ].join('\n'),
      'utf8',
    );

    fs.writeFileSync(
      path.join(customOverridesPath, 'steamworks.FileUserInfo.lua'),
      [
        '---Retrieves local file/user data for a Steam Workshop addon.',
        '---@param workshopItemID string',
        '---@param callback fun(info: SteamworksFileUserInfo)',
        'function steamworks.FileUserInfo(workshopItemID, callback) end',
        '',
      ].join('\n'),
      'utf8',
    );

    try {
      const command = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      const result = spawnSync(
        `${command} run generate-lua -- --output "${outputPath}" --custom-overrides "${customOverridesPath}"`,
        [],
        {
          cwd: process.cwd(),
          encoding: 'utf8',
          shell: true,
        },
      );

      expect(result.status).toBe(0);
      const steamworksLua = fs.readFileSync(path.join(outputPath, 'steamworks.lua'), 'utf8');
      expect(steamworksLua).toContain('function steamworks.GetDownloadedItems() end');
      expect(steamworksLua).toContain('function steamworks.FileUserInfo(workshopItemID, callback) end');
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
    writeEntityGetterPage('getnwbool.json', 'GetNWBool', 'any', 'false');
    writeEntityGetterPage('getnwstring.json', 'GetNWString', 'any', '""');
    writeEntityGetterPage('getnwvector.json', 'GetNWVector', 'any', 'Vector(0,0,0)');
    writeEntityGetterPage('getnwangle.json', 'GetNWAngle', 'any', 'Angle(0,0,0)');

    try {
      const command = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      const result = spawnSync(
        `${command} run generate-lua -- --output "${outputPath}" --custom-overrides ./custom`,
        [],
        {
          cwd: process.cwd(),
          encoding: 'utf8',
          shell: true,
        },
      );

      expect(result.status).toBe(0);
      const entityLua = fs.readFileSync(path.join(outputPath, 'entity.lua'), 'utf8');
      const expectedGetters = [
        { name: 'GetNWEntity', overload: 'Entity|NULL', fallback: 'NULL', returns: 'Entity|T' },
        { name: 'GetNWInt', overload: 'number', fallback: '0', returns: 'number|T' },
        { name: 'GetNetworkedEntity', overload: 'Entity|NULL', fallback: 'NULL', returns: 'Entity|T' },
        { name: 'GetNWBool', overload: 'boolean', fallback: 'false', returns: 'boolean|T' },
        { name: 'GetNWString', overload: 'string', fallback: '""', returns: 'string|T' },
        { name: 'GetNWVector', overload: 'Vector', fallback: 'Vector( 0, 0, 0 )', returns: 'Vector|T' },
        { name: 'GetNWAngle', overload: 'Angle', fallback: 'Angle( 0, 0, 0 )', returns: 'Angle|T' },
      ];

      for (const getter of expectedGetters) {
        const block = entityLua.match(new RegExp(`---@source https://wiki\\.facepunch\\.com/gmod/Entity:${getter.name}[\\s\\S]*?function Entity:${getter.name}\\(key, fallback\\) end`))?.[0];
        expect(block).toBeDefined();
        expect(block).toContain(`---@overload fun(self: Entity, key: string): ${getter.overload}`);
        expect(block).toContain(`---@param fallback? T=${getter.fallback}`);
        expect(block).toContain(`---@return ${getter.returns}`);
      }

      expect(entityLua).not.toContain('---@param fallback? Entity');
      expect(entityLua).not.toContain('---@param fallback? number');
      expect(entityLua).not.toMatch(/---@param fallback\? T .*Defaults to/);
      expect(entityLua).not.toContain('---@return any');
    } finally {
      fs.rmSync(tmpRoot, { recursive: true, force: true });
    }
  });

  test('applies custom overrides by default when --custom-overrides is not specified', () => {
    const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-generate-lua-defaults-'));
    const outputPath = path.join(tmpRoot, 'output');
    const vectorDir = path.join(outputPath, 'vector');

    fs.mkdirSync(vectorDir, { recursive: true });
    fs.writeFileSync(
      path.join(vectorDir, 'pages.json'),
      JSON.stringify([
        {
          type: 'class',
          address: 'Vector',
          name: 'Vector',
          description: 'A 3D vector.',
          realm: 'shared',
          url: 'https://wiki.facepunch.com/gmod/Vector',
          parent: '',
        },
      ], null, 2),
      'utf8',
    );

    try {
      const command = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      const result = spawnSync(
        `${command} run generate-lua -- --output "${outputPath}"`,
        [],
        {
          cwd: process.cwd(),
          encoding: 'utf8',
          shell: true,
        },
      );

      expect(result.status).toBe(0);
      const vectorLua = fs.readFileSync(path.join(outputPath, 'vector.lua'), 'utf8');
      // These lines come from custom/class.Vector.lua overrides
      expect(vectorLua).toContain('---@field x number');
      expect(vectorLua).toContain('---@field y number');
      expect(vectorLua).toContain('---@field z number');
      expect(vectorLua).toContain('---@operator add(Vector): Vector');
    } finally {
      fs.rmSync(tmpRoot, { recursive: true, force: true });
    }
  });

  test('--raw-wiki skips applying custom overrides', () => {
    const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-generate-lua-rawwiki-'));
    const outputPath = path.join(tmpRoot, 'output');
    const vectorDir = path.join(outputPath, 'vector');

    fs.mkdirSync(vectorDir, { recursive: true });
    fs.writeFileSync(
      path.join(vectorDir, 'pages.json'),
      JSON.stringify([
        {
          type: 'class',
          address: 'Vector',
          name: 'Vector',
          description: 'A 3D vector.',
          realm: 'shared',
          url: 'https://wiki.facepunch.com/gmod/Vector',
          parent: '',
        },
      ], null, 2),
      'utf8',
    );

    try {
      const command = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      const result = spawnSync(
        `${command} run generate-lua -- --output "${outputPath}" --raw-wiki`,
        [],
        {
          cwd: process.cwd(),
          encoding: 'utf8',
          shell: true,
        },
      );

      expect(result.status).toBe(0);
      const vectorLua = fs.readFileSync(path.join(outputPath, 'vector.lua'), 'utf8');
      // With --raw-wiki, custom overrides are skipped so @field/@operator from custom/class.Vector.lua should NOT appear
      expect(vectorLua).not.toContain('---@field x number');
      expect(vectorLua).not.toContain('---@operator add(Vector): Vector');
    } finally {
      fs.rmSync(tmpRoot, { recursive: true, force: true });
    }
  });

  test('--no-wipe-lua preserves existing Lua files', () => {
    const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-generate-lua-nowipe-'));
    const outputPath = path.join(tmpRoot, 'output');
    const vectorDir = path.join(outputPath, 'vector');

    fs.mkdirSync(vectorDir, { recursive: true });
    fs.writeFileSync(
      path.join(vectorDir, 'pages.json'),
      JSON.stringify([], null, 2),
      'utf8',
    );

    // Write a sentinel file that should survive when wipe is disabled
    const sentinelFile = path.join(outputPath, 'sentinel.lua');
    fs.writeFileSync(sentinelFile, '-- sentinel', 'utf8');

    try {
      const command = process.platform === 'win32' ? 'npm.cmd' : 'npm';
      const result = spawnSync(
        `${command} run generate-lua -- --output "${outputPath}" --no-wipe-lua --raw-wiki`,
        [],
        {
          cwd: process.cwd(),
          encoding: 'utf8',
          shell: true,
        },
      );

      expect(result.status).toBe(0);
      expect(fs.existsSync(sentinelFile)).toBe(true);
      expect(fs.readFileSync(sentinelFile, 'utf8')).toBe('-- sentinel');
    } finally {
      fs.rmSync(tmpRoot, { recursive: true, force: true });
    }
  });
});
