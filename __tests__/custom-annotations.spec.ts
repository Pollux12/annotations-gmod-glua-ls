import fs from 'fs';
import path from 'path';

describe('custom and plugin annotation smoke checks', () => {
  const customRoot = path.join(process.cwd(), 'custom');
  const outputRoot = path.join(process.cwd(), 'output');

  const readCustom = (file: string) => fs.readFileSync(path.join(customRoot, file), 'utf8');
  const readOutput = (file: string) => fs.readFileSync(path.join(outputRoot, file), 'utf8');

  test.each([
  [
    "bf_read",
    "bf_read",
    "ReadAngle",
    "---Reads and returns an angle object from the bitstream.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadAngle\n---@return Angle # The read angle\nfunction bf_read:ReadAngle() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadBool",
    "---Reads 1 bit and returns a bool representing the bit.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadBool\n---@return boolean # bit\nfunction bf_read:ReadBool() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadChar",
    "---Reads a signed char and returns a number from -127 to 127 representing the ascii value of that char.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadChar\n---@return number # asciiVal\nfunction bf_read:ReadChar() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadEntity",
    "---Reads a short representing an entity index and returns the matching entity handle.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadEntity\n---@return Entity # ent\nfunction bf_read:ReadEntity() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadFloat",
    "---Reads a 4 byte float from the bitstream and returns it.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadFloat\n---@return number # float\nfunction bf_read:ReadFloat() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadLong",
    "---Reads a 4 byte long from the bitstream and returns it.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadLong\n---@return number # int\nfunction bf_read:ReadLong() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadShort",
    "---Reads a 2 byte short from the bitstream and returns it.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadShort\n---@return number # short\nfunction bf_read:ReadShort() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadString",
    "---Reads a null terminated string from the bitstream.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadString\n---@return string # str\nfunction bf_read:ReadString() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadVector",
    "---Reads a special encoded vector from the bitstream and returns it, this function is not suitable to send normals.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadVector\n---@return Vector # vec\nfunction bf_read:ReadVector() end\n"
  ],
  [
    "bf_read",
    "bf_read",
    "ReadVectorNormal",
    "---Reads a special encoded vector normal from the bitstream and returns it, this function is not suitable to send vectors that represent a position.\n---@realm client\n---@source https://wiki.facepunch.com/gmod/bf_read:ReadVectorNormal\n---@return Vector # normal\nfunction bf_read:ReadVectorNormal() end\n"
  ],
  [
    "file",
    "File",
    "Read",
    "---Reads the specified amount of chars and returns them as a binary string.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:Read\n---@param length? number Reads the specified amount of chars. If not set, will read the entire file.\n---@return string # The read data.\nfunction File:Read(length) end\n"
  ],
  [
    "file",
    "File",
    "ReadBool",
    "---Reads one byte of the file and returns whether that byte was not 0.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadBool\n---@return boolean # val\nfunction File:ReadBool() end\n"
  ],
  [
    "file",
    "File",
    "ReadByte",
    "---Reads one unsigned 8-bit integer from the file.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadByte\n---@return number # The unsigned 8-bit integer from the file.\nfunction File:ReadByte() end\n"
  ],
  [
    "file",
    "File",
    "ReadDouble",
    "---Reads an 8-byte little-endian IEEE-754 floating point double from the file.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadDouble\n---@return number # The double-precision floating point value read from the file.\nfunction File:ReadDouble() end\n"
  ],
  [
    "file",
    "File",
    "ReadFloat",
    "---Reads an IEEE 754 little-endian 4-byte float from the file.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadFloat\n---@return number # The read value\nfunction File:ReadFloat() end\n"
  ],
  [
    "file",
    "File",
    "ReadLine",
    "---Returns the contents of the file from the current position up until the end of the current line.\n---\n--- **NOTE**: This function will look specifically for `Line Feed` characters `\\n` and will **completely ignore `Carriage Return` characters** `\\r`.\n---\n--- It will also stop at a `\\0` or `NULL` character, but will add a new line instead.\n---\n--- This function will not return more than 8192 characters. The return value will include the `\\n` character.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadLine\n---@return string # The string of data from the read line.\nfunction File:ReadLine() end\n"
  ],
  [
    "file",
    "File",
    "ReadLong",
    "---Reads a signed little-endian 32-bit integer from the file.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadLong\n---@return number # A signed 32-bit integer\nfunction File:ReadLong() end\n"
  ],
  [
    "file",
    "File",
    "ReadShort",
    "---Reads a signed little-endian 16-bit integer from the file.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadShort\n---@return number # int16\nfunction File:ReadShort() end\n"
  ],
  [
    "file",
    "File",
    "ReadUInt64",
    "---Reads an unsigned 64-bit integer from the file.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadUInt64\n---@return string # An unsigned 64-bit integer.\n--- Since Lua cannot store full 64-bit integers, this function returns a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).\nfunction File:ReadUInt64() end\n"
  ],
  [
    "file",
    "File",
    "ReadULong",
    "---Reads an unsigned little-endian 32-bit integer from the file.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadULong\n---@return number # An unsigned 32-bit integer\nfunction File:ReadULong() end\n"
  ],
  [
    "file",
    "File",
    "ReadUShort",
    "---Reads an unsigned little-endian 16-bit integer from the file.\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/File:ReadUShort\n---@return number # The 16-bit integer\nfunction File:ReadUShort() end\n"
  ],
  [
    "irestore",
    "IRestore",
    "ReadAngle",
    "---Reads next bytes from the restore object as an [Angle](https://wiki.facepunch.com/gmod/Angle).\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/IRestore:ReadAngle\n---@return Angle # The angle that has been read\nfunction IRestore:ReadAngle() end\n"
  ],
  [
    "irestore",
    "IRestore",
    "ReadBool",
    "---Reads next bytes from the restore object as a [boolean](https://wiki.facepunch.com/gmod/boolean).\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/IRestore:ReadBool\n---@return boolean # The boolean that has been read\nfunction IRestore:ReadBool() end\n"
  ],
  [
    "irestore",
    "IRestore",
    "ReadEntity",
    "---Reads next bytes from the restore object as an [Entity](https://wiki.facepunch.com/gmod/Entity).\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/IRestore:ReadEntity\n---@return Entity # The entity that has been read.\nfunction IRestore:ReadEntity() end\n"
  ],
  [
    "irestore",
    "IRestore",
    "ReadFloat",
    "---Reads next bytes from the restore object as a floating point [number](https://wiki.facepunch.com/gmod/number).\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/IRestore:ReadFloat\n---@return number # The read floating point number.\nfunction IRestore:ReadFloat() end\n"
  ],
  [
    "irestore",
    "IRestore",
    "ReadInt",
    "---Reads next bytes from the restore object as an integer [number](https://wiki.facepunch.com/gmod/number).\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/IRestore:ReadInt\n---@return number # The read integer number.\nfunction IRestore:ReadInt() end\n"
  ],
  [
    "irestore",
    "IRestore",
    "ReadString",
    "---Reads next bytes from the restore object as a [string](https://wiki.facepunch.com/gmod/string).\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/IRestore:ReadString\n---@return string # The read string.\nfunction IRestore:ReadString() end\n"
  ],
  [
    "irestore",
    "IRestore",
    "ReadVector",
    "---Reads next bytes from the restore object as a [Vector](https://wiki.facepunch.com/gmod/Vector).\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/IRestore:ReadVector\n---@return Vector # The read vector.\nfunction IRestore:ReadVector() end\n"
  ],
  [
    "irestore",
    "IRestore",
    "StartBlock",
    "---Loads next block of data to be read inside current block. Blocks **must** be ended with [IRestore:EndBlock](https://wiki.facepunch.com/gmod/IRestore:EndBlock).\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/IRestore:StartBlock\n---@return string # The name of the next data block to be read.\nfunction IRestore:StartBlock() end\n"
  ],
  [
    "stack",
    "Stack",
    "Pop",
    "---Pop an item from the stack\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/Stack:Pop\n---@param amount? number Amount of items you want to pop.\n---@return any # Latest popped item.\nfunction Stack:Pop(amount) end\n"
  ],
  [
    "stack",
    "Stack",
    "PopMulti",
    "---Pop an item from the stack\n---@realm shared\n---@realm menu\n---@source https://wiki.facepunch.com/gmod/Stack:PopMulti\n---@param amount? number Amount of items you want to pop.\n---@return table # The Popped Items.\nfunction Stack:PopMulti(amount) end\n"
  ],
  [
    "cnavarea",
    "CNavArea",
    "PopOpenList",
    "---Removes a CNavArea from the Open List with the lowest cost to traverse to from the starting node, and returns it.\n---\n--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).\n---\n--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.\n---@realm server\n---@source https://wiki.facepunch.com/gmod/CNavArea:PopOpenList\n---@return CNavArea # The CNavArea from the Open List with the lowest cost to traverse to from the starting node.\nfunction CNavArea:PopOpenList() end\n"
  ],
[
  "cnavarea",
  "CNavArea",
  "GetRandomPoint",
  "---Returns a random point on the nav area.\n---@realm server\n---@source https://wiki.facepunch.com/gmod/CNavArea:GetRandomPoint\n---@return Vector # The random point on the nav area.\nfunction CNavArea:GetRandomPoint() end\n"
]
])('fresh-result %s %s:%s preserves its wiki declaration', (file, cls, name, baseline) => {
    const custom = readCustom(`${cls}.${name}.lua`).replace(/\r\n/g, '\n');
    expect(custom).toContain('---@[fresh_result]\n');
    expect(custom.replace('---@[fresh_result]\n', '')).toBe(baseline);
    expect(readOutput(`${file}.lua`).replace(/\r\n/g, '\n')).toContain(custom.trim());
  });

  test('constraint entities expose copied metadata with source-backed types', () => {
    const classes = readOutput('custom_classes.lua');
    const entity = classes.split('---@class ConstraintEntity : Entity')[1]?.split('local ConstraintEntity')[0];
    expect(entity).toBeDefined();
    for (const field of [
      'Type? string', 'Ent1 Entity', 'Ent2? Entity', 'Ent4? Entity',
      'Bone1? number', 'Bone2? number', 'Bone4? number', 'Bone? number',
      'Ang? Angle', 'LPos1? Vector', 'LocalAxis? Vector', 'WPos3? Vector',
      'forcelimit? number', 'nocollide? boolean|number', 'length? number',
      'stretchonly? boolean|number', 'pl? Player', 'color? Color',
      'toggle? boolean|number', 'is_on? boolean', 'Length2? number',
    ]) {
      expect(entity).toContain(`---@field ${field}`);
    }
    expect(entity).toContain('---@source garrysmod/lua/includes/modules/constraint.lua');
  });

  test.each([
    ['Weld', ['ConstraintEntity|false']],
    ['Elastic', ['ConstraintEntity|false|nil', 'Entity?']],
    ['Keepupright', ['ConstraintEntity|false|nil']],
    ['Motor', ['ConstraintEntity|false', 'ConstraintEntity?']],
    ['Pulley', ['ConstraintEntity|false', 'Entity?', 'Entity?', 'Entity?']],
    ['Muscle', ['ConstraintEntity|false', 'Entity?', 'gmod_winch_controller?', 'ConstraintEntity?']],
  ])('constraint.%s retains all return positions and failure types', (name, types) => {
    const output = readOutput('constraint.lua').replace(/\r\n/g, '\n');
    const block = output.split(/\n\n+/).find((part) => part.includes(`function constraint.${name}(`));
    expect(block).toBeDefined();
    expect(Array.from(block?.matchAll(/^---@return (\S+)/gm) ?? [], (match) => match[1])).toEqual(types);
  });

  test('constraint overrides retain descriptions, parameters and wiki metadata', () => {
    const output = readOutput('constraint.lua').replace(/\r\n/g, '\n');
    for (const file of fs.readdirSync(customRoot).filter((name) => name.startsWith('constraint.'))) {
      expect(output).toContain(readCustom(file).replace(/\r\n/g, '\n').trim());
    }
    for (const line of [
      '---Creates a weld constraint.',
      '---@realm server',
      '---@source https://wiki.facepunch.com/gmod/constraint.Weld',
      '---@param deleteEnt1OnBreak? boolean|number If true, when `ent2` is removed, `ent1` will also be removed.',
      '---@return ConstraintEntity|false # The created constraint entity, or false if the constraint failed. ([phys_constraint](https://developer.valvesoftware.com/wiki/Phys_constraint))',
      '--- It consists of 3 rope segments, 2 of which have variable length, visually connected by a 3rd. Reducing length of one end will increase the length of the other end.',
      '--- Will be a `keyframe_rope` if you are roping to the same bone on the same entity. Will return `false` if the constraint could not be created.',
      '---@return Entity? # The third rope segment. ([keyframe_rope](https://developer.valvesoftware.com/wiki/Keyframe_rope)) Will return `nil` if the constraint or this rope segment could not be created.',
    ]) {
      expect(output).toContain(line);
    }
  });

  test('entity target setters accept nil to clear their targets', () => {
    expect(readOutput('entity.lua')).toContain('---@param ground Entity?');
    expect(readOutput('player.lua')).toContain('---@param entity Entity? Entity to spectate, or nil to clear the target.');
  });

  test('sound scripts can omit the default channel and sound level', () => {
    const structures = readOutput('structures.lua').replace(/\r\n/g, '\n');
    expect(structures).toContain('---@type CHAN?\nSoundData.channel = CHAN_AUTO');
    expect(structures).toContain('---@type SNDLVL?\nSoundData.level = SNDLVL_NORM');
  });

  test('bullet callbacks can return nothing without losing the bullet fields', () => {
    const structures = readOutput('structures.lua');
    expect(structures).toContain('---@field Callback? fun(attacker: Entity, tr: table, dmgInfo: CTakeDamageInfo):(ret0: table?)');
    expect(structures.match(/^---@class \(partial\) Bullet$/gm)).toHaveLength(1);
    for (const field of ['Attacker', 'Inflictor', 'Damage', 'Force', 'Distance', 'HullSize', 'Num', 'Tracer', 'AmmoType', 'TracerName', 'Dir', 'Spread', 'Src', 'IgnoreEntity']) {
      expect(structures).toMatch(new RegExp(`^---@field ${field}[? ]`, 'm'));
    }
  });

  test('Derma classes expose their source-backed header, columns and active tab', () => {
    expect(readOutput('dlistview_column.lua')).toContain('---@field Header DButton');
    expect(readOutput('dlistview.lua')).toContain('---@field Columns DListView_Column[]');
    expect(readOutput('dpropertysheet.lua')).toContain('---@field m_pActiveTab? DTab');
  });

  test('draw text accepts values converted by tostring', () => {
    const structures = readOutput('structures.lua');
    const textData = structures.split('---@class (partial) TextData')[1]?.split('---@class')[0];
    expect(textData).toContain('---@field text? any');
  });

  test('cvars.Bool preserves the fallback type and permits an omitted fallback', () => {
    const cvars = readOutput('cvars.lua');
    const bool = cvars.split('---@source https://wiki.facepunch.com/gmod/cvars.Bool')[1]?.split('function cvars.Bool')[0];
    expect(bool).toContain('---@generic T');
    expect(bool).toContain('---@overload fun(cvar: string): boolean?');
    expect(bool).toContain('---@param default T');
    expect(bool).toContain('---@return boolean|T');
  });

  test('math.Max compatibility alias preserves the lowercase math.max override', () => {
    const math = readOutput('math.lua');
    expect(math.match(/^function math\.max\(\.\.\.\) end$/gm)).toHaveLength(1);
    expect(math.match(/^function math\.Max\(x, \.\.\.\) end$/gm)).toHaveLength(1);
  });

  test('PaintOver hooks can return nothing and retain hook metadata', () => {
    const panel = readOutput('panel.lua');
    const paintOver = panel.split('---@hook PaintOver')[1]?.split('function Panel:PaintOver')[0];
    expect(paintOver).toContain('---@return boolean?');
    expect(paintOver).toContain('---@param width number');
    expect(paintOver).toContain('---@param height number');
  });

  test('base weapons expose player and NPC activity translation tables', () => {
    const weaponBase = readOutput('custom_classes.lua').split('---@class weapon_base : Weapon')[1]?.split('local weapon_base')[0];
    expect(weaponBase).toContain('---@field ActivityTranslate table<integer, integer>');
    expect(weaponBase).toContain('---@field ActivityTranslateAI table<integer, integer>');
  });

  test('SetNWEntity accepts the nil value used to clear a networked entity', () => {
    const entity = readOutput('entity.lua');
    const setNWEntity = entity.split('---@source https://wiki.facepunch.com/gmod/Entity:SetNWEntity')[1]?.split('function Entity:SetNWEntity')[0];
    expect(setNWEntity).toContain('---@param key string');
    expect(setNWEntity).toContain('---@param value Entity?');
  });

  test('list view lines expose their column cells and keep the wiki description', () => {
    const line = readOutput('dlistview_line.lua');
    expect(line).toContain('---@field Columns (DListViewLabel|Panel)[]');
    expect(line).toContain('A panel used by [DListView](https://wiki.facepunch.com/gmod/DListView)');
  });

  test('sql queries report failure with false and keep their documentation', () => {
    const sqlLua = readOutput('sql.lua');
    expect(sqlLua).toContain('---@return table|false|nil # `false` is returned if there is an error');
    expect(sqlLua).toContain('---@return table|false # `false` is returned if there is an error (See sql.LastError)');
    expect(sqlLua).toContain('Performs a query on the local SQLite database, returns a table as result set');
    expect(sqlLua).toContain('Large INTEGER values');
  });

  test('darkrp plugin annotation files exist and are scoped', () => {
    const darkrpLua = path.join(process.cwd(), 'plugin', 'darkrp', 'annotations', 'darkrp.lua');
    const camiLua = path.join(process.cwd(), 'plugin', 'cami', 'annotations', 'cami.lua');

    expect(fs.existsSync(darkrpLua)).toBe(true);
    expect(fs.existsSync(camiLua)).toBe(true);

    const darkrpContent = fs.readFileSync(darkrpLua, 'utf8');
    const camiContent = fs.readFileSync(camiLua, 'utf8');

    expect(darkrpContent).toContain('---@meta');
    expect(darkrpContent).toMatch(/DarkRP/);
    expect(camiContent).toContain('---@meta');
    expect(camiContent).toMatch(/CAMI/);
  });

  test('GM annotations include runtime-populated structure fields', () => {
    const gmLua = readOutput('gm.lua');

    for (const field of ['FolderName', 'Folder', 'ThisClass', 'BaseClass']) {
      expect(gmLua).toContain(`---@field ${field} `);
    }
  });

  test('sandbox overrides preserve their realm-specific declarations', () => {
    const gmLua = readOutput('gm.lua').replace(/\r\n/g, '\n');
    const globalLua = readOutput('global.lua').replace(/\r\n/g, '\n');

    expect(gmLua).toContain('---@realm client\n---@source sandbox/gamemode/cl_notice.lua\n---@param str string\n---@param type integer\n---@param length number\nfunction GM:AddNotify(str, type, length) end');
    expect(globalLua).toContain('---@realm server\n---@source sandbox/gamemode/commands.lua\n---@param prop Entity\nfunction _G.FixInvalidPhysicsObject(prop) end');
  });

  test('networked getter overrides keep generic fallback defaults encoded', () => {
    const entityLua = readOutput('entity.lua');
    const getterFiles = fs
      .readdirSync(customRoot)
      .filter((file) => /^Entity\.Get(?:NW|NW2|Networked|Networked2).*\.(?:lua)$/.test(file));

    expect(getterFiles.length).toBeGreaterThan(0);

    for (const file of getterFiles) {
      const custom = readCustom(file);
      const getterName = file.match(/^Entity\.(.+)\.lua$/)?.[1];
      const fallbackLine = custom
        .split(/\r?\n/)
        .find((line) => line.startsWith('---@param fallback? T'));
      const outputBlock = entityLua.match(new RegExp(`---@source https://wiki\\.facepunch\\.com/gmod/Entity:${getterName}[\\s\\S]*?function Entity:${getterName}\\(key, fallback\\) end`))?.[0];

      expect(getterName).toBeDefined();
      expect(fallbackLine).toBeDefined();
      expect(outputBlock).toBeDefined();
      expect(fallbackLine).toMatch(/^---@param fallback\? T=/);
      expect(fallbackLine).not.toMatch(/Defaults to/);
      expect(entityLua).toContain(fallbackLine);
      expect(outputBlock).not.toContain('---@return any');
    }

    expect(entityLua).not.toMatch(/---@param fallback\? (?:Entity|number|string|boolean|Vector|Angle)\b/);
    expect(entityLua).not.toMatch(/---@param fallback\? T .*Defaults to/);
  });

  test('unsupported menu-only custom overrides stay absent', () => {
    const removedFiles = [
      'steamworks.SetFavorite.lua',
    ];

    for (const file of removedFiles) {
      expect(fs.existsSync(path.join(customRoot, file))).toBe(false);
    }

    const workshopFileBaseOutput = readOutput('workshopfilebase.lua');
    expect(workshopFileBaseOutput).not.toContain('DupeWorkshopFileBase');
    expect(workshopFileBaseOutput).not.toContain('function WorkshopFileBase:Arm');
    expect(workshopFileBaseOutput).not.toContain('function WorkshopFileBase:DownloadAndArm');
  });

  test('global aliases and key wrapper annotations remain available', () => {
    const globals = readCustom('_globals.lua');
    const generatedVgui = readOutput('vgui.lua');
    const generatedEnums = readOutput('enums.lua');
    const generatedList = readOutput('list.lua');

    expect(globals).toContain('---@alias GPlayer Player');
    expect(globals).toContain('---@class NULL : Entity');
    expect(globals).toContain('---@alias EntityOrNULL Entity|NULL');
    expect(globals).toContain('---@type NULL');
    expect(generatedVgui).toContain('---@[call_arg("gmod.load", "include")]');
    expect(generatedVgui).toContain('---@[call_arg("gmod.vgui_panel", "register_file")]');
    expect(generatedEnums).toContain('RENDERGROUP_NONE = 5');
    expect(generatedList).toContain('---@overload fun(identifier: "SkeletonConvertor", key: string, item: SkeletonConvertor)');
  });

  test('global IsValid uses an object-wide validity guard', () => {
    const globalLua = readOutput('global.lua');
    const isValidBlock = globalLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/Global\.IsValid[\s\S]*?function _G\.IsValid\(object\) end/,
    )?.[0];

    expect(isValidBlock).toBeDefined();
    expect(isValidBlock).toContain('---@param object any The table or object to be validated.');
    expect(isValidBlock).toContain('---@return TypeGuard<any> isValid # True if the object is valid.');
    expect(isValidBlock).toContain('---@return_cast object -NULL');
    expect(isValidBlock).toContain('---@[valid_guard]');
    expect(isValidBlock).not.toContain('TypeGuard<Entity>');
    expect(isValidBlock).not.toContain('---@param ent');
    expect(isValidBlock).not.toContain('function _G.IsValid(ent)');
  });

  test('source-backed Lua helper overrides expose optional/internal arguments accurately', () => {
    const stringLua = readOutput('string.lua');
    const tableLua = readOutput('table.lua');
    const formattedTimeBlock = stringLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/string\.FormattedTime[\s\S]*?function string\.FormattedTime\(seconds, format\) end/,
    )?.[0];
    const tableCopyBlock = tableLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/table\.Copy[\s\S]*?function table\.Copy\(originalTable, lookupTable\) end/,
    )?.[0];

    expect(formattedTimeBlock).toBeDefined();
    expect(formattedTimeBlock).toContain('---@overload fun(seconds?: number): FormattedTime');
    expect(formattedTimeBlock).toContain('---@overload fun(seconds: number?, format: nil): FormattedTime');
    expect(formattedTimeBlock).toContain('---@param seconds? number Number of seconds to format.');
    expect(formattedTimeBlock).toContain('---@param format string The format string.');
    expect(formattedTimeBlock).toContain('---@return string #');
    expect(formattedTimeBlock).not.toContain('---@param float');
    expect(formattedTimeBlock).not.toContain('function string.FormattedTime(float, format)');

    expect(tableCopyBlock).toBeDefined();
    expect(tableCopyBlock).toContain('---@param lookupTable? table<any, any> Table used internally to preserve cyclic references.');
    expect(tableCopyBlock).toContain('---@overload fun(originalTable: nil, lookupTable?: table<any, any>): nil');
    expect(tableCopyBlock).toContain('---@param originalTable T The table to be copied.');
    expect(tableCopyBlock).toContain('---@return T # A deep copy of the original table');
    expect(tableCopyBlock).toContain('function table.Copy(originalTable, lookupTable) end');
  });

  test('custom structure overrides replace their scraped definitions', () => {
    const structures = readOutput('structures.lua');
    const overriddenStructures = [
      'EntityCopyData',
      'HTTPRequest',
      'MatProxyData',
      'PropertyAdd',
      'ServerQueryData',
      'TextData',
      'TextureData',
      'VideoData',
      'ViewData',
    ];

    for (const name of overriddenStructures) {
      expect(structures.match(new RegExp(`^---@class \\(partial\\) ${name}$`, 'gm'))).toHaveLength(1);
    }
  });

  test('derma.DefineSkin accepts partial skin tables', () => {
    const defineSkin = readCustom('derma.DefineSkin.lua');

    expect(defineSkin).toContain(
      '---@param skin Partial<SKIN> Table containing skin overrides. Missing values inherit from the Default skin.',
    );
  });

  test('source-backed VGUI lookup and creation overrides expose nil failure paths', () => {
    const vguiLua = readOutput('vgui.lua');
    const createBlock = vguiLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/vgui\.Create[\s\S]*?function vgui\.Create\(classname, parent, name\) end/,
    )?.[0];
    const createFromTableBlock = vguiLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/vgui\.CreateFromTable[\s\S]*?function vgui\.CreateFromTable\(metatable, parent, name\) end/,
    )?.[0];
    const getControlTableBlock = vguiLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/vgui\.GetControlTable[\s\S]*?function vgui\.GetControlTable\(Panelname\) end/,
    )?.[0];

    expect(createBlock).toBeDefined();
    expect(createBlock).toContain('---@overload fun(classname: string, parent?: Panel, name?: string): Panel?');
    expect(createBlock).toContain('---@return (instance) T?');

    expect(createFromTableBlock).toBeDefined();
    expect(createFromTableBlock).toContain('---@param metatable T? Your PANEL table.');
    expect(createFromTableBlock).toContain('---@return (instance) T?');

    expect(getControlTableBlock).toBeDefined();
    expect(getControlTableBlock).toContain('---@return (definition) `T`?');
  });

  test('base Lua VGUI and tool overrides preserve concrete runtime types', () => {
    const dtreeLua = readOutput('dtree.lua');
    const dtreeNodeLua = readOutput('dtree_node.lua');
    const panelLua = readOutput('panel.lua');
    const dformLua = readOutput('dform.lua');
    const dpanelListLua = readOutput('dpanellist.lua');
    const toolLua = readOutput('tool.lua');
    const weaponLua = readOutput('weapon.lua');

    const dtreeAddNode = dtreeLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/DTree:AddNode[\s\S]*?function DTree:AddNode\(name, icon\) end/,
    )?.[0];
    const nodeAddNode = dtreeNodeLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/DTree_Node:AddNode[\s\S]*?function DTree_Node:AddNode\(name, icon\) end/,
    )?.[0];
    const dtreeOnNodeSelected = dtreeLua.match(
      /---@hook OnNodeSelected[\s\S]*?function DTree:OnNodeSelected\(node\) end/,
    )?.[0];
    const nodeOnNodeSelected = dtreeNodeLua.match(
      /---@hook OnNodeSelected[\s\S]*?function DTree_Node:OnNodeSelected\(node\) end/,
    )?.[0];
    const textEntry = dformLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/DForm:TextEntry[\s\S]*?function DForm:TextEntry\(label, convar\) end/,
    )?.[0];
    const sortByMember = dpanelListLua.match(
      /---@source https:\/\/github\.com\/Facepunch\/garrysmod\/blob\/master\/garrysmod\/lua\/vgui\/dpanellist\.lua#L403[\s\S]*?function DPanelList:SortByMember\(key, desc\) end/,
    )?.[0];
    const getSwep = toolLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/Tool:GetSWEP[\s\S]*?function Tool:GetSWEP\(\) end/,
    )?.[0];
    const getWeapon = toolLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/Tool:GetWeapon[\s\S]*?function Tool:GetWeapon\(\) end/,
    )?.[0];
    const checkLimit = weaponLua.match(
      /---@source https:\/\/github\.com\/Facepunch\/garrysmod\/blob\/master\/garrysmod\/gamemodes\/sandbox\/entities\/weapons\/gmod_tool\/shared\.lua#L69[\s\S]*?function gmod_tool:CheckLimit\(limitName\) end/,
    )?.[0];

    expect(dtreeAddNode).toContain('---@return DTree_Node');
    expect(nodeAddNode).toContain('---@return DTree_Node');
    expect(dtreeOnNodeSelected).toBeDefined();
    expect(dtreeOnNodeSelected).toContain('---@realm client');
    expect(dtreeOnNodeSelected).toContain('---@realm menu');
    expect(dtreeOnNodeSelected).toContain('---@source https://wiki.facepunch.com/gmod/DTree:OnNodeSelected');
    expect(dtreeOnNodeSelected).toContain('---@param node DTree_Node The node that was selected.');
    expect(nodeOnNodeSelected).toBeDefined();
    expect(nodeOnNodeSelected).toContain('---@source https://wiki.facepunch.com/gmod/DTree_Node:OnNodeSelected');
    expect(nodeOnNodeSelected).toContain('function DTree_Node:OnNodeSelected(node) end');
    expect(nodeOnNodeSelected).toContain('---@realm client');
    expect(nodeOnNodeSelected).toContain('---@realm menu');
    expect(nodeOnNodeSelected).toContain('---@param node DTree_Node');
    expect(panelLua).not.toContain('Panel.propPanel');
    expect(textEntry).toContain('---@return DTextEntry');
    expect(textEntry).toContain('---@return DLabel');
    expect(textEntry!.indexOf('---@return DTextEntry')).toBeLessThan(
      textEntry!.indexOf('---@return DLabel'),
    );
    expect(sortByMember).toBeDefined();
    expect(sortByMember).toContain('---@param key any');
    expect(sortByMember).toContain('---@param desc? boolean');
    expect(getSwep).toContain('---@return gmod_tool');
    expect(getWeapon).toContain('---@return gmod_tool');
    expect(checkLimit).toContain('---@param limitName string');
    expect(checkLimit).toContain('---@return boolean');
  });

  test('DermaAnimation class fragment matches the Lua runtime state shape', () => {
    const customClasses = readOutput('custom_classes.lua');
    const dermaAnimationBlock = customClasses.match(
      /---@class DermaAnimation[\s\S]*?function DermaAnimation:Active\(\) end/,
    )?.[0];

    expect(dermaAnimationBlock).toBeDefined();
    expect(dermaAnimationBlock).toContain('---@field Length? number');
    expect(dermaAnimationBlock).toContain('---@return boolean?');
    expect(dermaAnimationBlock).not.toContain('---@field Length number');
    expect(dermaAnimationBlock).not.toContain('---@return boolean\nfunction DermaAnimation:Active() end');
  });

  test('DPropertySheet overrides expose source-backed absent tab and invalid-panel paths', () => {
    const propertySheetLua = readOutput('dpropertysheet.lua');
    const addSheetBlock = propertySheetLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/DPropertySheet:AddSheet[\s\S]*?function DPropertySheet:AddSheet\(name, pnl, icon, noStretchX, noStretchY, tooltip\) end/,
    )?.[0];
    const getActiveTabBlock = propertySheetLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/DPropertySheet:GetActiveTab[\s\S]*?function DPropertySheet:GetActiveTab\(\) end/,
    )?.[0];

    expect(addSheetBlock).toBeDefined();
    expect(addSheetBlock).toContain('---@return DPropertySheetSheet? sheet');

    expect(getActiveTabBlock).toBeDefined();
    expect(getActiveTabBlock).toContain('---@return DTab?');
  });

  test('source-backed registry lookup overrides expose missing-entry nil results', () => {
    const controlPanelLua = readOutput('controlpanel.lua');
    const gamemodeLua = readOutput('gamemode.lua');
    const scriptedEntsLua = readOutput('scripted_ents.lua');
    const weaponsLua = readOutput('weapons.lua');
    const controlPanelGetBlock = controlPanelLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/controlpanel\.Get[\s\S]*?function controlpanel\.Get\(name\) end/,
    )?.[0];
    const gamemodeGetBlock = gamemodeLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/gamemode\.Get[\s\S]*?function gamemode\.Get\(name\) end/,
    )?.[0];
    const scriptedEntsGetBlock = scriptedEntsLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/scripted_ents\.Get[\s\S]*?function scripted_ents\.Get\(classname\) end/,
    )?.[0];
    const weaponsGetStoredBlock = weaponsLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/weapons\.GetStored[\s\S]*?function weapons\.GetStored\(weapon_class\) end/,
    )?.[0];

    expect(controlPanelGetBlock).toBeDefined();
    expect(controlPanelGetBlock).toContain('---@return ControlPanel?');

    expect(gamemodeGetBlock).toBeDefined();
    expect(gamemodeGetBlock).toContain('---@return (definition) `T`?');

    expect(scriptedEntsGetBlock).toBeDefined();
    expect(scriptedEntsGetBlock).toContain('---@return (definition) `T`?');

    expect(weaponsGetStoredBlock).toBeDefined();
    expect(weaponsGetStoredBlock).toContain('---@return (definition) `T`?');
  });

  test('base registries expose their runtime call shapes', () => {
    const duplicatorLua = readOutput('duplicator.lua');

    expect(duplicatorLua).toContain(
      '---@type table<string, fun(ply: Player, ent: Entity, data: any)>',
    );
    expect(duplicatorLua).toContain('duplicator.EntityModifiers = {}');
  });

  test('Lua error accepts arbitrary error objects', () => {
    const globalLua = readOutput('global.lua');
    const errorBlock = globalLua.match(
      /---@source https:\/\/wiki\.facepunch\.com\/gmod\/Global\.error\(lowercase\)[\s\S]*?function _G\.error\(message, errorLevel\) end/,
    )?.[0];

    expect(errorBlock).toBeDefined();
    expect(errorBlock).toContain('---@param message any # The error object to throw.');
    expect(errorBlock).toContain('---@return never');
  });

  test('entity predicate overrides keep lowercase and legacy pages separate', () => {
    const isEntityOverride = readCustom('Global.IsEntity.lua');
    const legacyIsEntityOverride = readCustom('Global.IsEntity.legacy..lua');

    expect(isEntityOverride).toContain('---@source https://wiki.facepunch.com/gmod/Global.isentity');
    expect(isEntityOverride).toContain('---@return TypeGuard<Entity> isEntity');
    expect(isEntityOverride).toContain('function _G.isentity(var) end');
    expect(isEntityOverride).not.toContain('Global.IsEntity');

    expect(legacyIsEntityOverride).toContain('---@source https://wiki.facepunch.com/gmod/Global.IsEntity(legacy)');
    expect(legacyIsEntityOverride).toContain('---@deprecated Use the function Global.isentity instead.');
    expect(legacyIsEntityOverride).toContain('function _G.IsEntity(var) end');
    expect(legacyIsEntityOverride).not.toContain('function _G.isentity');
  });

  test('sorted-pairs overrides expose typed generic-for values', () => {
    const sortedPairs = readCustom('Global.SortedPairs.lua');
    const sortedPairsByValue = readCustom('Global.SortedPairsByValue.lua');
    const sortedPairsByMemberValue = readCustom('Global.SortedPairsByMemberValue.lua');
    const randomPairs = readCustom('Global.RandomPairs.lua');

    expect(sortedPairs).toContain('---@generic K, V');
    expect(sortedPairs).toContain('---@return fun(tbl: any, key: K?): K, V # Iterator function');
    expect(sortedPairs).not.toContain('---@return table #');

    expect(sortedPairsByValue).toContain('---@generic K, V');
    expect(sortedPairsByValue).toContain('---@return fun(state: table): K, V # Iterator function');
    expect(sortedPairsByValue).toContain('---@return table # Internal iterator state, not the source table.');

    expect(sortedPairsByMemberValue).toContain('---@generic K, V');
    expect(sortedPairsByMemberValue).toContain('---@return fun(state: table): K, V # Iterator function');
    expect(sortedPairsByMemberValue).toContain('---@return table # Internal iterator state, not the source table.');

    expect(randomPairs).toContain('---@generic K, V');
    expect(randomPairs).toContain('---@return fun(state: table): K, V # Iterator function');
    expect(randomPairs).toContain('---@return table # Internal iterator state, not the source table.');
  });

  test("Entity.SetGroundEntity.lua preserves its baseline documentation", () => {
    const output = readOutput("entity.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("function Entity:SetGroundEntity(ground) end");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), anchor);
    for (const line of [
      "---Sets the ground the entity is standing on.",
      "---@realm shared",
      "---@source https://wiki.facepunch.com/gmod/Entity:SetGroundEntity",
      "---@param ground Entity? The ground entity, or nil to clear it."
]) {
      expect(block).toContain(line);
    }
  });

  test("Player.SpectateEntity.lua preserves its baseline documentation", () => {
    const output = readOutput("player.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("function Player:SpectateEntity(entity) end");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), anchor);
    for (const line of [
      "---Makes the player spectate the entity.",
      "---",
      "--- To get the applied spectated entity, use [Player:GetObserverTarget](https://wiki.facepunch.com/gmod/Player:GetObserverTarget).",
      "---@realm server",
      "---@source https://wiki.facepunch.com/gmod/Player:SpectateEntity",
      "---@param entity Entity? Entity to spectate, or nil to clear the target."
]) {
      expect(block).toContain(line);
    }
  });

  test("SoundData.lua preserves its baseline documentation", () => {
    const output = readOutput("structures.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("---@class SoundData");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), output.indexOf('SoundData.pitchend = 100', anchor));
    for (const line of [
      "---@realm shared",
      "---@source https://wiki.facepunch.com/gmod/Structures/SoundData",
      "---Path to the sound file to be used in this sound effect, relative to `sound/` directory (so exclude the `sound/` part).",
      "---",
      "--- Can be a table of sound files, in which case the sound will be chosen randomly every time from the provided list.",
      "---",
      "--- Each sound path can be prepended with a special character for special effects. You can learn more about this [here](https://developer.valvesoftware.com/wiki/Soundscripts#Sound_Characters).",
      "---The name of the soundscript, to be referenced by in functions such as Entity:EmitSound.",
      "---The sound channel to play in. See Enums/CHAN",
      "---The soundlevel of the sound in dB. See Enums/SNDLVL. This will affect how far the sound can be heard.",
      "---The volume of the sound as a decimal between `0` and `1`. Can be a table of two numbers, a minimum and a maximum value.",
      "---",
      "--- **Warning:** Volume of `0` will act as volume of `1`",
      "---The pitch of the sound. Can be a table of two numbers, a minimum and a maximum value.",
      "---@deprecated Use pitch instead.",
      "---The initial pitch.",
      "--- Use pitch instead.",
      "---@deprecated Use pitch instead.",
      "---The pitch end.",
      "--- Use pitch instead."
]) {
      expect(block).toContain(line);
    }
  });

  test("Bullet.lua preserves its baseline documentation", () => {
    const output = readOutput("structures.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("---@class (partial) Bullet");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), output.indexOf('\n\n', anchor));
    for (const line of [
      "--- Tables used for bullets see [Entity:FireBullets](https://wiki.facepunch.com/gmod/Entity:FireBullets) and [GM:EntityFireBullets](https://wiki.facepunch.com/gmod/GM:EntityFireBullets).",
      "---@realm shared",
      "---@source https://wiki.facepunch.com/gmod/Structures/Bullet",
      "---The entity that should be reported as attacker. (eg. a player)",
      "---",
      "--- By default this would be set to the entity Entity:FireBullets is called on.",
      "---",
      "--- Default: `self`",
      "---The entity that should be reported as inflictor eg. a weapon or something similar.",
      "---",
      "--- Also defines CTakeDamageInfo:GetWeapon for Weapon.",
      "---",
      "--- Default: `NULL`",
      "---Function to be called **after** the bullet was fired but **before** the damage is applied (the callback is called even if no damage is applied).",
      "---",
      "--- Function argument(s):",
      "--- * Entity `attacker` -",
      "--- * table `tr` - See Structures/TraceResult",
      "--- * CTakeDamageInfo `dmgInfo` -",
      "---",
      "--- Function return value(s):",
      "--- * table `undefined` -",
      "--- The return value can be a table with following keys:",
      "--- * boolean effects - `false` to not do any of the effects.",
      "--- * boolean damage - `false` to not do any damage.",
      "---",
      "--- Default: `nil`",
      "---The damage dealt by the bullet.",
      "---",
      "--- If set to `0`, it means the damage should be calculated from the ammo type's ConVars if  the ammo type has `AMMO_INTERPRET_PLRDAMAGE_AS_DAMAGE_TO_PLAYER` flag set.",
      "--- See Structures/AmmoData.",
      "---",
      "--- Default: `1`",
      "---The force of the bullets.",
      "---",
      "--- Default: `1`",
      "---Maximum distance the bullet can travel.",
      "---",
      "--- Default: `56756`",
      "---The hull size of the bullet",
      "---",
      "--- Default: `0`",
      "---The amount of bullets to fire.",
      "---",
      "--- Default: `1`",
      "---Show tracer for every x bullets.",
      "---",
      "--- Default: `1`",
      "---The ammunition name.",
      "---",
      "--- Default: `<empty string>`",
      "---The tracer name. You can find a list of default effects Default_Effects.",
      "---",
      "--- Default: `nil`",
      "---The fire direction.",
      "---",
      "--- Default: `Vector( 0, 0, 0 )`",
      "---The spread, only x and y are needed.",
      "---",
      "--- Default: `Vector( 0, 0, 0 )`",
      "---The position to fire the bullets from.",
      "---",
      "--- Default: `Vector( 0, 0, 0 )`",
      "---The entity that the bullet will ignore when it will be shot.",
      "---",
      "--- Default: `NULL`",
      "---@field Attacker Entity=self",
      "---@field Inflictor Entity=NULL",
      "---@field Callback? fun(attacker: Entity, tr: table, dmgInfo: CTakeDamageInfo):(ret0: table?)",
      "---@field Damage number=1",
      "---@field Force number=1",
      "---@field Distance number=56756",
      "---@field HullSize number=0",
      "---@field Num number=1",
      "---@field Tracer number=1",
      "---@field AmmoType string=\"\"",
      "---@field TracerName? string",
      "---@field Dir Vector=Vector( 0, 0, 0 )",
      "---@field Spread Vector=Vector( 0, 0, 0 )",
      "---@field Src Vector=Vector( 0, 0, 0 )",
      "---@field IgnoreEntity Entity=NULL"
]) {
      expect(block).toContain(line);
    }
  });

  test("class.DListView_Column.lua preserves its baseline documentation", () => {
    const output = readOutput("dlistview_column.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("---@class DListView_Column : Panel");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), output.indexOf('\n\n', anchor));
    for (const line of [
      "--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.",
      "---",
      "--- A single column, used by [DListView](https://wiki.facepunch.com/gmod/DListView).",
      "---@realm client",
      "---@realm menu",
      "---@source https://wiki.facepunch.com/gmod/DListView_Column"
]) {
      expect(block).toContain(line);
    }
  });

  test("class.DPropertySheet.lua preserves its baseline documentation", () => {
    const output = readOutput("dpropertysheet.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("---@class DPropertySheet : Panel");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), output.indexOf('\n\n', anchor));
    for (const line of [
      "--- A tab oriented control where you can create multiple tabs with items within. Used mainly for organization.",
      "---@realm client",
      "---@realm menu",
      "---@source https://wiki.facepunch.com/gmod/DPropertySheet",
      "--- A tab oriented control where you can create multiple tabs with items within. Used mainly for organization.",
      "---@field tabScroller DHorizontalScroller The internal horizontal scroller that manages tab positioning.",
      "---@field animFade DermaAnimation The fade animation used when switching tabs, created in Init via Derma_Anim.",
      "---@field Items DPropertySheetSheet[] The list of tabs added to this sheet."
]) {
      expect(block).toContain(line);
    }
  });

  test("TextData.lua preserves its baseline documentation", () => {
    const output = readOutput("structures.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("---@class (partial) TextData");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), output.indexOf('\n\n', anchor));
    for (const line of [
      "--- Override: make `text` and `pos` optional so that incrementally-built",
      "--- TextData tables (e.g. in gmod_tool SWEP DrawHUD) do not produce",
      "--- missing-fields / param-type-mismatch diagnostics.",
      "--- The real draw.Text / draw.TextShadow functions do require these values",
      "--- to be set before calling, but they are set on the same local table",
      "--- before each call, not at construction time.",
      "---Text to be drawn.",
      "---This holds the X and Y coordinates. Key value 1 is x, key value 2 is y.",
      "---@field text? any",
      "---@field pos? table"
]) {
      expect(block).toContain(line);
    }
  });

  test("cvars.Bool.lua preserves its baseline documentation", () => {
    const output = readOutput("cvars.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("function cvars.Bool(cvar, default) end");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), anchor);
    for (const line of [
      "---Retrieves console variable as a boolean.",
      "---@realm shared",
      "---@realm menu",
      "---@source https://wiki.facepunch.com/gmod/cvars.Bool",
      "---@param cvar string Name of console variable.",
      "---@param default T The value to return if the console variable does not exist.",
      "---@return boolean|T # Retrieved value."
]) {
      expect(block).toContain(line);
    }
  });

  test("math.max.lua preserves its baseline documentation", () => {
    const output = readOutput("math.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("function math.max(...) end");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), anchor);
    for (const line of [
      "---Returns the largest value of all arguments.",
      "---@realm shared",
      "---@realm menu",
      "---@source https://wiki.facepunch.com/gmod/math.max",
      "---@param ... number Numbers to get the largest from.",
      "---@return number # The largest number."
]) {
      expect(block).toContain(line);
    }
  });

  test("PANEL.PaintOver.lua preserves its baseline documentation", () => {
    const output = readOutput("panel.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("function Panel:PaintOver(width, height) end");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), anchor);
    for (const line of [
      "---Called whenever the panel and all its children were drawn, return true to override the default drawing.",
      "---",
      "--- This is useful to draw content over the panel without having to overwrite it's [PANEL:Paint](https://wiki.facepunch.com/gmod/PANEL:Paint) hook, for example as an indicator that a panel is selected in [PropSelect](https://wiki.facepunch.com/gmod/PropSelect)",
      "---@hook PaintOver",
      "---@realm client",
      "---@realm menu",
      "---@source https://wiki.facepunch.com/gmod/PANEL:PaintOver",
      "---@param width number The panels current width.",
      "---@param height number The panels current height.",
      "---@return boolean? # Should we disable default PaintOver rendering? This is useful in case with Derma panels that use Derma hooks."
]) {
      expect(block).toContain(line);
    }
  });

  test("Entity.SetNWEntity.lua preserves its baseline documentation", () => {
    const output = readOutput("entity.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("function Entity:SetNWEntity(key, value) end");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), anchor);
    for (const line of [
      "---Sets a networked entity value on the entity.",
      "---",
      "--- The value can then be accessed with [Entity:GetNWEntity](https://wiki.facepunch.com/gmod/Entity:GetNWEntity) both from client and server.",
      "--- **WARNING**: There's a 4096 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Entity](https://wiki.facepunch.com/gmod/Entity:SetNW2Entity). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)",
      "---",
      "--- **NOTE**: Running this function clientside will only set it for the client it is called on.",
      "---@realm shared",
      "---@source https://wiki.facepunch.com/gmod/Entity:SetNWEntity",
      "---@param key string The key to associate the value with",
      "---@param value Entity? The value to set, or nil to clear it."
]) {
      expect(block).toContain(line);
    }
  });

  test('math.Min is declared as the shipped alias of math.min', () => {
    const mathLua = readOutput('math.lua').replace(/\r\n/g, '\n');

    expect(mathLua).toContain(
      '---@source garrysmod/lua/includes/extensions/math.lua\n---@param x number\n---@param ... number\n---@return number\nfunction math.Min(x, ...) end',
    );
    expect(mathLua.match(/^function math\.Min\(/gm)).toHaveLength(1);
  });

  test('EntityCopyData carries the entity table fields the duplicator merges in', () => {
    const structuresLua = readOutput('structures.lua').replace(/\r\n/g, '\n');

    expect(structuresLua).toContain(
      "---@field WorkshopID? number Deprecated, always 0. See Entity:GetWorkshopID.\n---@field [string] any Fields from the entity's own table, which duplicator.CopyEntTable merges into the copy.",
    );
  });

  test('derma.SkinList holds the registered skins by name', () => {
    const dermaLua = readOutput('derma.lua').replace(/\r\n/g, '\n');

    expect(dermaLua).toContain('---@type table<string, SKIN>\nderma.SkinList = {}');
  });

  test('scripted entities and weapons keep their deprecated self aliases', () => {
    const entityLua = readOutput('entity.lua').replace(/\r\n/g, '\n');
    const weaponLua = readOutput('weapon.lua').replace(/\r\n/g, '\n');

    expect(entityLua).toContain(
      '---@class ENTITY : Entity\n---@field Entity self Deprecated alias for the entity itself; use `self` instead.\nENTITY = Entity',
    );
    expect(weaponLua).toContain(
      '---@class WEAPON : Weapon\n---@field Entity self Deprecated alias for the weapon itself; use `self` instead.\n---@field Weapon self Deprecated alias for the weapon itself; use `self` instead.\nWEAPON = Weapon',
    );
  });

  test('IsWeapon narrows the entity to a weapon and keeps its documentation', () => {
    const entityLua = readOutput('entity.lua').replace(/\r\n/g, '\n');

    expect(entityLua).toContain(
      '---Checks if the entity is a weapon or not.\n---@realm shared\n---@source https://wiki.facepunch.com/gmod/Entity:IsWeapon\n---@return boolean # Whether the entity is a weapon\n---@return_cast self Weapon\nfunction Entity:IsWeapon() end',
    );
    expect(entityLua.match(/^function Entity:IsWeapon\(/gm)).toHaveLength(1);
  });

  test('weapons are equipped by a player or NPC', () => {
    const weaponLua = readOutput('weapon.lua').replace(/\r\n/g, '\n');

    expect(weaponLua).toContain(
      '---@param NewOwner Player|NPC The one who picked the weapon up. Can be Player or NPC.\nfunction Weapon:Equip(NewOwner) end',
    );
    expect(weaponLua.match(/^function Weapon:Equip\(/gm)).toHaveLength(1);
    expect(weaponLua).toContain('---Called when a player or NPC has picked the weapon up.\n---@hook Equip');
  });

  test("GM.OnPlayerHitGround.lua types the landing player and preserves its documentation", () => {
    const output = readOutput("gm.lua").replace(/\r\n/g, '\n');
    const anchor = output.indexOf("function GM:OnPlayerHitGround(player, inWater, onFloater, speed) end");
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), anchor);
    for (const line of [
      "---Called when a player makes contact with the ground after a jump or a fall.",
      "---@hook OnPlayerHitGround",
      "---@realm shared",
      "---@source https://wiki.facepunch.com/gmod/GM:OnPlayerHitGround",
      "---@param player Player Player",
      "---@param inWater boolean Did the player land in water?",
      "---@param onFloater boolean Did the player land on an object floating in the water?",
      "---@param speed number The speed at which the player hit the ground",
      "---@return boolean # Return true to suppress default action"
]) {
      expect(block).toContain(line);
    }
  });

  test("GM.PopulateMenuBar.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("gm.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when it's time to populate the context menu menu bar at the top.");
    expect(output).toContain("---@hook PopulateMenuBar");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/GM:PopulateMenuBar");
    expect(output).toContain("---@param menubar DMenuBar The DMenuBar itself.");
    expect(output).toContain("function GM:PopulateMenuBar(menubar) end");
    expect(output.match(new RegExp("^function GM:PopulateMenuBar\\(", 'gm'))).toHaveLength(1);
  });

  test("SANDBOX.PopulateContent.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called by the spawnmenu when the content tab is generated");
    expect(output).toContain("--- \t**WARNING**: Creating an error in this Hook will result in a completely broken Content Tab");
    expect(output).toContain("---@hook PopulateContent");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateContent");
    expect(output).toContain("---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel");
    expect(output).toContain("---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel");
    expect(output).toContain("---@param node DTree_Node The old Spawnlists");
    expect(output).toContain("function SANDBOX:PopulateContent(pnlContent, tree, node) end");
    expect(output.match(new RegExp("^function SANDBOX:PopulateContent\\(", 'gm'))).toHaveLength(1);
  });

  test("class.SANDBOX.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class (partial) SANDBOX : GM");
    expect(output).toContain("local SANDBOX = {}");
  });

  test("SANDBOX.PopulateEntities.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called by the spawnmenu when the Entities tab is generated");
    expect(output).toContain("--- \t**WARNING**: Creating an error in this Hook will result in a completely broken Entites Tab");
    expect(output).toContain("---@hook PopulateEntities");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateEntities");
    expect(output).toContain("---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel");
    expect(output).toContain("---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel");
    expect(output).toContain("---@param node DTree_Node The old Spawnlists");
    expect(output).toContain("function SANDBOX:PopulateEntities(pnlContent, tree, node) end");
    expect(output.match(new RegExp("^function SANDBOX:PopulateEntities\\(", 'gm'))).toHaveLength(1);
  });

  test("SANDBOX.PopulateNPCs.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called by the spawnmenu when the NPCs tab is generated");
    expect(output).toContain("--- \t**WARNING**: Creating an error in this Hook will result in a completely broken NPCs Tab");
    expect(output).toContain("---@hook PopulateNPCs");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateNPCs");
    expect(output).toContain("---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel");
    expect(output).toContain("---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel");
    expect(output).toContain("---@param node DTree_Node The old Spawnlists");
    expect(output).toContain("function SANDBOX:PopulateNPCs(pnlContent, tree, node) end");
    expect(output.match(new RegExp("^function SANDBOX:PopulateNPCs\\(", 'gm'))).toHaveLength(1);
  });

  test("SANDBOX.PopulateVehicles.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called by the spawnmenu when the Vehicles tab is generated");
    expect(output).toContain("--- \t**WARNING**: Creating an error in this Hook will result in a completely broken vehicles Tab");
    expect(output).toContain("---@hook PopulateVehicles");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateVehicles");
    expect(output).toContain("---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel");
    expect(output).toContain("---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel");
    expect(output).toContain("---@param node DTree_Node The old Spawnlists");
    expect(output).toContain("function SANDBOX:PopulateVehicles(pnlContent, tree, node) end");
    expect(output.match(new RegExp("^function SANDBOX:PopulateVehicles\\(", 'gm'))).toHaveLength(1);
  });

  test("SANDBOX.PopulateWeapons.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called by the spawnmenu when the Weapons tab is generated");
    expect(output).toContain("--- \t**WARNING**: Creating an error in this Hook will result in a completely broken Weapons Tab");
    expect(output).toContain("---@hook PopulateWeapons");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateWeapons");
    expect(output).toContain("---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel");
    expect(output).toContain("---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel");
    expect(output).toContain("---@param node DTree_Node The old Spawnlists");
    expect(output).toContain("function SANDBOX:PopulateWeapons(pnlContent, tree, node) end");
    expect(output.match(new RegExp("^function SANDBOX:PopulateWeapons\\(", 'gm'))).toHaveLength(1);
  });

  test("SANDBOX.SpawnlistOpenGenericMenu.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---**INTERNAL**: Use [SANDBOX:SpawnmenuIconMenuOpen](https://wiki.facepunch.com/gmod/SANDBOX:SpawnmenuIconMenuOpen) if you wish to add new options to spawnmenu icon right click menus.");
    expect(output).toContain("---");
    expect(output).toContain("--- Called when there's one or more items selected in the spawnmenu by the player, to open the multi selection right click menu ([DMenu](https://wiki.facepunch.com/gmod/DMenu))");
    expect(output).toContain("---@hook SpawnlistOpenGenericMenu");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/SANDBOX:SpawnlistOpenGenericMenu");
    expect(output).toContain("---@param canvas DDragBase The canvas that has the selection. (Panel:GetSelectionCanvas)");
    expect(output).toContain("function SANDBOX:SpawnlistOpenGenericMenu(canvas) end");
    expect(output.match(new RegExp("^function SANDBOX:SpawnlistOpenGenericMenu\\(", 'gm'))).toHaveLength(1);
  });

  test("DFileBrowser.OnSelect.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dfilebrowser.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when a file is selected.");
    expect(output).toContain("---@hook OnSelect");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DFileBrowser:OnSelect");
    expect(output).toContain("---@param filePath string The path to the file that was selected.");
    expect(output).toContain("---@param selectedPanel DListView_Line|SpawnIcon The panel that was clicked to select this file.This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser:SetModels.");
    expect(output).toContain("function DFileBrowser:OnSelect(filePath, selectedPanel) end");
    expect(output.match(new RegExp("^function DFileBrowser:OnSelect\\(", 'gm'))).toHaveLength(1);
  });

  test("DFileBrowser.OnDoubleClick.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dfilebrowser.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when a file is double-clicked.");
    expect(output).toContain("---");
    expect(output).toContain("--- **NOTE**: Double-clicking a file or icon will trigger **both** this and [DFileBrowser:OnSelect](https://wiki.facepunch.com/gmod/DFileBrowser:OnSelect).");
    expect(output).toContain("---@hook OnDoubleClick");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DFileBrowser:OnDoubleClick");
    expect(output).toContain("---@param filePath string The path to the file that was double-clicked.");
    expect(output).toContain("---@param selectedPanel DListView_Line|SpawnIcon The panel that was double-clicked to select this file.This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser:SetModels.");
    expect(output).toContain("function DFileBrowser:OnDoubleClick(filePath, selectedPanel) end");
    expect(output.match(new RegExp("^function DFileBrowser:OnDoubleClick\\(", 'gm'))).toHaveLength(1);
  });

  test("PropSelect.OnSelect.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("propselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when the player selects a model.");
    expect(output).toContain("---@hook OnSelect");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/PropSelect:OnSelect");
    expect(output).toContain("---@param model string Path of the selected model, or its \"value\".");
    expect(output).toContain("---@param pnl SpawnIcon The Spawnicon that was clicked.");
    expect(output).toContain("function PropSelect:OnSelect(model, pnl) end");
    expect(output.match(new RegExp("^function PropSelect:OnSelect\\(", 'gm'))).toHaveLength(1);
  });

  test("class.MatSelect.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("matselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class (partial) MatSelect : ContextBase");
    expect(output).toContain("---@field List MatSelectList The panel list containing the material buttons.");
    expect(output).toContain("---@field Controls MatSelectMaterial[]");
    expect(output).toContain("local MatSelect = {}");
  });

  test("class.MatSelectMaterial.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class MatSelectMaterial : DImageButton");
    expect(output).toContain("---@field Value any");
    expect(output).toContain("---@field ConVars? table");
    expect(output).toContain("---@field AutoSize boolean");
    expect(output).toContain("local MatSelectMaterial = {}");
  });

  test("MatSelect.AddMaterial.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("matselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Adds a new material to the selection list.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/MatSelect:AddMaterial");
    expect(output).toContain("---@param label string Tooltip for the material, for when the player hovers over the material.");
    expect(output).toContain("---@param path string Path to the material. Relative to `materials/` folder (do not include it), and do not include the `.vmt` extension.");
    expect(output).toContain("---@return MatSelectMaterial # The created material button.");
    expect(output).toContain("function MatSelect:AddMaterial(label, path) end");
    expect(output.match(new RegExp("^function MatSelect:AddMaterial\\(", 'gm'))).toHaveLength(1);
  });

  test("MatSelect.AddMaterialEx.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("matselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Adds a new material to the selection list, with some extra options.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/MatSelect:AddMaterialEx");
    expect(output).toContain("---@param label string Tooltip for the material, for when the player hovers over the material.");
    expect(output).toContain("---@param path string Path to the material. Relative to `materials/` folder (do not include it), and do not include the `.vmt` extension.");
    expect(output).toContain("---@param value any Overrides the \"value\" of the material. This will be what MatSelect:OnSelect receives in the first argument. It also affects MatSelect:FindMaterialByValue.");
    expect(output).toContain("---@param convars table A list of convar names (as keys) and their values to set when the user selects this material. ContextBase:SetConVar will be ignored.");
    expect(output).toContain("---@return MatSelectMaterial # The created material button.");
    expect(output).toContain("function MatSelect:AddMaterialEx(label, path, value, convars) end");
    expect(output.match(new RegExp("^function MatSelect:AddMaterialEx\\(", 'gm'))).toHaveLength(1);
  });

  test("MatSelect.FindMaterialByValue.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("matselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Find a [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) panel based on the input material path.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/MatSelect:FindMaterialByValue");
    expect(output).toContain("---@param mat string The material to find within this MatSelect.");
    expect(output).toContain("---@return MatSelectMaterial? # The found material, or nil.");
    expect(output).toContain("function MatSelect:FindMaterialByValue(mat) end");
    expect(output.match(new RegExp("^function MatSelect:FindMaterialByValue\\(", 'gm'))).toHaveLength(1);
  });

  test("MatSelect.SelectMaterial.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("matselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---**INTERNAL**: Use [MatSelect:FindAndSelectMaterial](https://wiki.facepunch.com/gmod/MatSelect:FindAndSelectMaterial) instead.");
    expect(output).toContain("---");
    expect(output).toContain("--- Selects a given material panel.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/MatSelect:SelectMaterial");
    expect(output).toContain("---@param mat MatSelectMaterial The material to select, found by MatSelect:FindMaterialByValue");
    expect(output).toContain("function MatSelect:SelectMaterial(mat) end");
    expect(output.match(new RegExp("^function MatSelect:SelectMaterial\\(", 'gm'))).toHaveLength(1);
  });

  test("MatSelect.OnRightClick.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("matselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when the player right clicks a material.");
    expect(output).toContain("---");
    expect(output).toContain("--- By default, this opens a menu that lets the player copy the material path.");
    expect(output).toContain("---@hook OnRightClick");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/MatSelect:OnRightClick");
    expect(output).toContain("---@param pnl MatSelectMaterial The DImageButton that was clicked.");
    expect(output).toContain("function MatSelect:OnRightClick(pnl) end");
    expect(output.match(new RegExp("^function MatSelect:OnRightClick\\(", 'gm'))).toHaveLength(1);
  });

  test("MatSelect.OnSelect.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("matselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when the player selects a material.");
    expect(output).toContain("---@hook OnSelect");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/MatSelect:OnSelect");
    expect(output).toContain("---@param material any Material path of the selected material, not including any file extension.");
    expect(output).toContain("---@param pnl MatSelectMaterial The DImageButton that was clicked.");
    expect(output).toContain("function MatSelect:OnSelect(material, pnl) end");
    expect(output.match(new RegExp("^function MatSelect:OnSelect\\(", 'gm'))).toHaveLength(1);
  });

  test("class.MatSelectList.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class MatSelectList : DPanelList");
    expect(output).toContain("---@field Items MatSelectMaterial[]");
    expect(output).toContain("local MatSelectList = {}");
  });

  test("DListView.DoDoubleClick.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dlistview.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when a line in the DListView is double clicked.");
    expect(output).toContain("---@hook DoDoubleClick");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DListView:DoDoubleClick");
    expect(output).toContain("---@param lineID number The line number of the double clicked line.");
    expect(output).toContain("---@param line DListView_Line The double clicked DListView_Line.");
    expect(output).toContain("function DListView:DoDoubleClick(lineID, line) end");
    expect(output.match(new RegExp("^function DListView:DoDoubleClick\\(", 'gm'))).toHaveLength(1);
  });

  test("DListView.OnClickLine.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dlistview.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called whenever a line is clicked.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DListView:OnClickLine");
    expect(output).toContain("---@param line DListView_Line The selected line.");
    expect(output).toContain("---@param isSelected? boolean Boolean indicating whether the line is selected.");
    expect(output).toContain("function DListView:OnClickLine(line, isSelected) end");
    expect(output.match(new RegExp("^function DListView:OnClickLine\\(", 'gm'))).toHaveLength(1);
  });

  test("DListView.OnRowRightClick.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dlistview.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when a row is right-clicked");
    expect(output).toContain("---@hook OnRowRightClick");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DListView:OnRowRightClick");
    expect(output).toContain("---@param lineID number The line ID of the right clicked line");
    expect(output).toContain("---@param line DListView_Line The line panel itself, a DListView_Line.");
    expect(output).toContain("function DListView:OnRowRightClick(lineID, line) end");
    expect(output.match(new RegExp("^function DListView:OnRowRightClick\\(", 'gm'))).toHaveLength(1);
  });

  test("DListView.OnRowSelected.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dlistview.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called internally by [DListView:OnClickLine](https://wiki.facepunch.com/gmod/DListView:OnClickLine) when a line is selected. This is the function you should override to define the behavior when a line is selected.");
    expect(output).toContain("---@hook OnRowSelected");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DListView:OnRowSelected");
    expect(output).toContain("---@param rowIndex number The index of the row/line that the user clicked on.");
    expect(output).toContain("---@param row DListView_Line The DListView_Line that the user clicked on.");
    expect(output).toContain("function DListView:OnRowSelected(rowIndex, row) end");
    expect(output.match(new RegExp("^function DListView:OnRowSelected\\(", 'gm'))).toHaveLength(1);
  });

  test("DTree_Node.InsertNode.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dtree_node.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.");
    expect(output).toContain("---");
    expect(output).toContain("--- Inserts an existing node as a \"child\" or a sub-node of this node.");
    expect(output).toContain("--- Used internally by the drag'n'drop functionality.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DTree_Node:InsertNode");
    expect(output).toContain("---@param node DTree_Node Has to be DTree_Node");
    expect(output).toContain("function DTree_Node:InsertNode(node) end");
    expect(output.match(new RegExp("^function DTree_Node:InsertNode\\(", 'gm'))).toHaveLength(1);
  });

  test("PropSelect.OnRightClick.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("propselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when the player right clicks a model.");
    expect(output).toContain("---");
    expect(output).toContain("--- By default, this opens a menu that lets the player copy the model path.");
    expect(output).toContain("---@hook OnRightClick");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/PropSelect:OnRightClick");
    expect(output).toContain("---@param pnl SpawnIcon The Spawnicon that was clicked.");
    expect(output).toContain("function PropSelect:OnRightClick(pnl) end");
    expect(output.match(new RegExp("^function PropSelect:OnRightClick\\(", 'gm'))).toHaveLength(1);
  });

  test("DPropertySheet.CloseTab.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dpropertysheet.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Removes tab and/or panel from the parent DPropertySheet.");
    expect(output).toContain("--- **NOTE**: In case you close the active tab, it will be reset to the last item available in the list.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DPropertySheet:CloseTab");
    expect(output).toContain("---@param tab DTab The DTab of the sheet from DPropertySheet.");
    expect(output).toContain("---");
    expect(output).toContain("--- See DPropertySheet:GetItems.");
    expect(output).toContain("---@param removePanel boolean Set to true to remove the associated panel object as well.");
    expect(output).toContain("---@return Panel # The panel of the tab.");
    expect(output).toContain("function DPropertySheet:CloseTab(tab, removePanel) end");
    expect(output.match(new RegExp("^function DPropertySheet:CloseTab\\(", 'gm'))).toHaveLength(1);
  });

  test("DHTMLControls.SetHTML.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dhtmlcontrols.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Sets the [DHTML](https://wiki.facepunch.com/gmod/DHTML) element to control with these [DHTMLControls](https://wiki.facepunch.com/gmod/DHTMLControls).");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DHTMLControls:SetHTML");
    expect(output).toContain("---@param dhtml HTML The HTML panel");
    expect(output).toContain("function DHTMLControls:SetHTML(dhtml) end");
    expect(output.match(new RegExp("^function DHTMLControls:SetHTML\\(", 'gm'))).toHaveLength(1);
  });

  test("DColorPalette.OnRightClickButton.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dcolorpalette.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when a palette button has been pressed. For Override");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DColorPalette:OnRightClickButton");
    expect(output).toContain("---@param pnl DColorButton The DColorButton that was pressed.");
    expect(output).toContain("function DColorPalette:OnRightClickButton(pnl) end");
    expect(output.match(new RegExp("^function DColorPalette:OnRightClickButton\\(", 'gm'))).toHaveLength(1);
  });

  test("DColorPalette.SaveColor.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dcolorpalette.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Saves the color of given button across sessions.  ");
    expect(output).toContain("--- The color is saved as a panel cookie, see [Panel:SetCookie](https://wiki.facepunch.com/gmod/Panel:SetCookie) and [Panel:SetCookieName](https://wiki.facepunch.com/gmod/Panel:SetCookieName).");
    expect(output).toContain("--- It is expected that the amount of colors per palette ([Panel:SetCookieName](https://wiki.facepunch.com/gmod/Panel:SetCookieName)) is the same every time.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DColorPalette:SaveColor");
    expect(output).toContain("---@param btn DColorButton The button to save the color of. Used to get the ID of the button.");
    expect(output).toContain("---@param clr Color The color to save to this button's index");
    expect(output).toContain("function DColorPalette:SaveColor(btn, clr) end");
    expect(output.match(new RegExp("^function DColorPalette:SaveColor\\(", 'gm'))).toHaveLength(1);
  });

  test("DColorPalette.DoClick.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dcolorpalette.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Basically the same functionality as [DColorPalette:OnValueChanged](https://wiki.facepunch.com/gmod/DColorPalette:OnValueChanged), you should use that instead!");
    expect(output).toContain("---");
    expect(output).toContain("--- For Override");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DColorPalette:DoClick");
    expect(output).toContain("---@param clr Color The new color via the Color");
    expect(output).toContain("---@param btn DColorButton The DColorButton that was pressed.");
    expect(output).toContain("function DColorPalette:DoClick(clr, btn) end");
    expect(output.match(new RegExp("^function DColorPalette:DoClick\\(", 'gm'))).toHaveLength(1);
  });

  test("DMenu.OpenSubMenu.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dmenu.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Closes any active sub menus, and opens a new one.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DMenu:OpenSubMenu");
    expect(output).toContain("---@param item DMenuOption The DMenuOption to open the submenu at");
    expect(output).toContain("---@param menu? DMenu The submenu to open. If set to nil, the function just closes existing submenus.");
    expect(output).toContain("function DMenu:OpenSubMenu(item, menu) end");
    expect(output.match(new RegExp("^function DMenu:OpenSubMenu\\(", 'gm'))).toHaveLength(1);
  });

  test("DListView.SelectItem.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dlistview.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Selects a line in the listview.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DListView:SelectItem");
    expect(output).toContain("---@param Line DListView_Line The line to select.");
    expect(output).toContain("function DListView:SelectItem(Line) end");
    expect(output.match(new RegExp("^function DListView:SelectItem\\(", 'gm'))).toHaveLength(1);
  });

  test("DListBox.AddItem.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dlistbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Adds a labelled item to the list box.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source garrysmod/lua/vgui/dlistbox.lua");
    expect(output).toContain("---@param label string");
    expect(output).toContain("---@return DListBoxItem");
    expect(output).toContain("function DListBox:AddItem(label) end");
    expect(output.match(new RegExp("^function DListBox:AddItem\\(", 'gm'))).toHaveLength(1);
  });

  test("DListBox.OnSelect.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dlistbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when a list box item is selected.");
    expect(output).toContain("---@hook OnSelect");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source garrysmod/lua/vgui/dlistbox.lua");
    expect(output).toContain("---@param item DListBoxItem");
    expect(output).toContain("function DListBox:OnSelect(item) end");
    expect(output.match(new RegExp("^function DListBox:OnSelect\\(", 'gm'))).toHaveLength(1);
  });

  test("DProperty_Float.GetDecimals.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dproperty_float.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called to poll the amount of digits after the decimal point. This is used internally for [DProperty_Int](https://wiki.facepunch.com/gmod/DProperty_Int).");
    expect(output).toContain("---@hook GetDecimals");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DProperty_Float:GetDecimals");
    expect(output).toContain("---@return number # The amount of digits after the decimal point.");
    expect(output).toContain("function DProperty_Float:GetDecimals() end");
    expect(output.match(new RegExp("^function DProperty_Float:GetDecimals\\(", 'gm'))).toHaveLength(1);
  });

  test("PropSelect.AddModelEx.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("propselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Adds a new model to the selection list.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/PropSelect:AddModelEx");
    expect(output).toContain("---@param value string The \"value\" for this model, which is used to set the ContextBase:SetConVar.");
    expect(output).toContain("---@param model string Model path, **including** `models/` and `.mdl`.");
    expect(output).toContain("---@param skin number The skin number for this model. It will **not** be set to the convar, use the value argument to track skin-model combos.");
    expect(output).toContain("---@return SpawnIcon # The created model icon.");
    expect(output).toContain("function PropSelect:AddModelEx(value, model, skin) end");
    expect(output.match(new RegExp("^function PropSelect:AddModelEx\\(", 'gm'))).toHaveLength(1);
  });

  test("motionsensor.ProcessAngle.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("motionsensor.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.");
    expect(output).toContain("---  Used internally by [motionsensor.ProcessAnglesTable](https://wiki.facepunch.com/gmod/motionsensor.ProcessAnglesTable). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using_The_Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect_developing).");
    expect(output).toContain("---@realm shared");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/motionsensor.ProcessAngle");
    expect(output).toContain("---@param translator table ");
    expect(output).toContain("---@param sensor table<number, Vector> ");
    expect(output).toContain("---@param pos table<number, Vector> ");
    expect(output).toContain("---@param ang table<number, Angle> ");
    expect(output).toContain("---@param special_vectors table ");
    expect(output).toContain("---@param boneid number ");
    expect(output).toContain("---@param v table ");
    expect(output).toContain("---@return true? # Return nil on failure");
    expect(output).toContain("function motionsensor.ProcessAngle(translator, sensor, pos, ang, special_vectors, boneid, v) end");
    expect(output.match(new RegExp("^function motionsensor\\.ProcessAngle\\(", 'gm'))).toHaveLength(1);
  });

  test("motionsensor.ProcessAnglesTable.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("motionsensor.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.");
    expect(output).toContain("---  Used internally by [motionsensor.BuildSkeleton](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using_The_Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect_developing).");
    expect(output).toContain("---@realm shared");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/motionsensor.ProcessAnglesTable");
    expect(output).toContain("---@param translator table ");
    expect(output).toContain("---@param sensor table<number, Vector> ");
    expect(output).toContain("---@param pos table<number, Vector> ");
    expect(output).toContain("---@param rotation Angle ");
    expect(output).toContain("---@return table<number, Angle> # Ang. If `!translator.AnglesTable` then `return {}`");
    expect(output).toContain("function motionsensor.ProcessAnglesTable(translator, sensor, pos, rotation) end");
    expect(output.match(new RegExp("^function motionsensor\\.ProcessAnglesTable\\(", 'gm'))).toHaveLength(1);
  });

  test("NextBot.MoveToPos.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("nextbot.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---To be called in the behaviour coroutine only! Will yield until the bot has reached the goal or is stuck");
    expect(output).toContain("---@realm server");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/NextBot:MoveToPos");
    expect(output).toContain("---@param pos Vector The position we want to get to");
    expect(output).toContain("---@param options? table A table containing a bunch of tweakable options.");
    expect(output).toContain("--- * number lookahead - Minimum look ahead distance.");
    expect(output).toContain("--- * number tolerance - How close we must be to the goal before it can be considered complete.");
    expect(output).toContain("--- * boolean draw - Draw the path. Only visible on listen servers and single player.");
    expect(output).toContain("--- * number maxage - Maximum age of the path before it times out.");
    expect(output).toContain("--- * number repath - Rebuilds the path after this number of seconds.");
    expect(output).toContain("---@return string # Either `\"failed\"`, `\"stuck\"`, `\"timeout\"` or `\"ok\"` - depending on how the NPC got on");
    expect(output).toContain("function NextBot:MoveToPos(pos, options) end");
    expect(output.match(new RegExp("^function NextBot:MoveToPos\\(", 'gm'))).toHaveLength(1);
  });

  test("HTML.ConsoleMessage.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("html.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when the page inside the [HTML](https://wiki.facepunch.com/gmod/HTML) window runs the `console.log` javascript function.");
    expect(output).toContain("---");
    expect(output).toContain("--- On the x86-64 beta, it's called for all built-in `console.*` javascript functions.");
    expect(output).toContain("---");
    expect(output).toContain("--- Overwriting this function in any way will disable default behavior of printing the message to the in-game console.");
    expect(output).toContain("---@hook ConsoleMessage");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/HTML:ConsoleMessage");
    expect(output).toContain("---@param msg string The message to be logged (or Lua code to be executed; see above).");
    expect(output).toContain("---@param file? string The message source file, if any.");
    expect(output).toContain("---@param lineNr? number The line number in the file the message was output from.");
    expect(output).toContain("---@param severity? string The severity of the message. Possible values are:");
    expect(output).toContain("--- * \"log\"");
    expect(output).toContain("--- * \"warn\"");
    expect(output).toContain("--- * \"error\"");
    expect(output).toContain("--- * \"debug\"");
    expect(output).toContain("function HTML:ConsoleMessage(msg, file, lineNr, severity) end");
    expect(output.match(new RegExp("^function HTML:ConsoleMessage\\(", 'gm'))).toHaveLength(1);
  });

  test("DPropertySheet.OnActiveTabChanged.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dpropertysheet.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Called when a player switches the tabs.");
    expect(output).toContain("---");
    expect(output).toContain("--- Source code states that this is meant to be overridden.");
    expect(output).toContain("---@hook OnActiveTabChanged");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DPropertySheet:OnActiveTabChanged");
    expect(output).toContain("---@param old DTab? The previously active DTab");
    expect(output).toContain("---@param new DTab? The newly active DTab");
    expect(output).toContain("function DPropertySheet:OnActiveTabChanged(old, new) end");
    expect(output.match(new RegExp("^function DPropertySheet:OnActiveTabChanged\\(", 'gm'))).toHaveLength(1);
  });

  test("Global.PositionSpawnIcon.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("global.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Moves the given model to the given position and calculates appropriate camera parameters for rendering the model to an icon.");
    expect(output).toContain("---");
    expect(output).toContain("--- The output table interacts nicely with [Panel:RebuildSpawnIconEx](https://wiki.facepunch.com/gmod/Panel:RebuildSpawnIconEx) with a few key renames.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/Global.PositionSpawnIcon");
    expect(output).toContain("---@param model Entity Model that is being rendered to the spawn icon");
    expect(output).toContain("---@param position Vector Position that the model is being rendered at");
    expect(output).toContain("---@param noAngles? boolean If true the function won't reset the angles to 0 for the model.");
    expect(output).toContain("---@return table # Table of information of the view which can be used for rendering");
    expect(output).toContain("function _G.PositionSpawnIcon(model, position, noAngles) end");
    expect(output.match(new RegExp("^function _G\\.PositionSpawnIcon\\(", 'gm'))).toHaveLength(1);
  });

  test("DForm.NumSlider.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dform.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Adds a [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider) onto the [DForm](https://wiki.facepunch.com/gmod/DForm)");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DForm:NumSlider");
    expect(output).toContain("---@param label string A short label for the slider.");
    expect(output).toContain("---@param convar string? The [console variable](https://wiki.facepunch.com/gmod/ConVars) to change when the slider is changed");
    expect(output).toContain("---@param min number The minimum value of the slider");
    expect(output).toContain("---@param max number The maximum value of the slider");
    expect(output).toContain("---@param decimals? number The number of decimals to allow for the slider value.");
    expect(output).toContain("---@return DNumSlider # The created DNumSlider.");
    expect(output).toContain("function DForm:NumSlider(label, convar, min, max, decimals) end");
    expect(output.match(new RegExp("^function DForm:NumSlider\\(", 'gm'))).toHaveLength(1);
  });

  test("UGCPublishWindow.DoPublish.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("ugcpublishwindow.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Publishes the Item or throws an error if the Title or Tags are invalid");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:DoPublish");
    expect(output).toContain("function UGCPublishWindow:DoPublish() end");
    expect(output.match(new RegExp("^function UGCPublishWindow:DoPublish\\(", 'gm'))).toHaveLength(1);
  });

  test("class.CtrlColor.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class CtrlColor : DPanel");
    expect(output).toContain("---@field Mixer DColorMixer The embedded color mixer panel.");
    expect(output).toContain("local CtrlColor = {}");
    expect(output).toContain("---Sets the label of the embedded color mixer.");
    expect(output).toContain("---@param text? string Set to non empty string to show the label and its text.");
    expect(output).toContain("function CtrlColor:SetLabel(text) end");
    expect(output).toContain("---Sets the ConVar the red channel of the embedded color mixer sets.");
    expect(output).toContain("---@param convar string The ConVar name for the red channel of the color.");
    expect(output).toContain("function CtrlColor:SetConVarR(convar) end");
    expect(output).toContain("---Sets the ConVar the green channel of the embedded color mixer sets.");
    expect(output).toContain("---@param convar string The ConVar name for the green channel of the color.");
    expect(output).toContain("function CtrlColor:SetConVarG(convar) end");
    expect(output).toContain("---Sets the ConVar the blue channel of the embedded color mixer sets.");
    expect(output).toContain("---@param convar string The ConVar name for the blue channel of the color.");
    expect(output).toContain("function CtrlColor:SetConVarB(convar) end");
    expect(output).toContain("---Sets the ConVar the alpha channel of the embedded color mixer sets.");
    expect(output).toContain("---@param convar string? The ConVar name for the alpha channel of the color.");
    expect(output).toContain("function CtrlColor:SetConVarA(convar) end");
    expect(output).toContain("---The ConVar the red channel of the embedded color mixer sets.");
    expect(output).toContain("---@return string # The ConVar name for the red channel of the color.");
    expect(output).toContain("function CtrlColor:GetConVarR() end");
    expect(output).toContain("---The ConVar the green channel of the embedded color mixer sets.");
    expect(output).toContain("---@return string # The ConVar name for the green channel of the color.");
    expect(output).toContain("function CtrlColor:GetConVarG() end");
    expect(output).toContain("---The ConVar the blue channel of the embedded color mixer sets.");
    expect(output).toContain("---@return string # The ConVar name for the blue channel of the color.");
    expect(output).toContain("function CtrlColor:GetConVarB() end");
    expect(output).toContain("---The ConVar the alpha channel of the embedded color mixer sets.");
    expect(output).toContain("---@return string # The ConVar name for the alpha channel of the color.");
    expect(output).toContain("function CtrlColor:GetConVarA() end");
    expect(output.match(new RegExp("^function CtrlColor:SetLabel\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function CtrlColor:SetConVarR\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function CtrlColor:SetConVarG\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function CtrlColor:SetConVarB\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function CtrlColor:SetConVarA\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function CtrlColor:GetConVarR\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function CtrlColor:GetConVarG\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function CtrlColor:GetConVarB\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function CtrlColor:GetConVarA\\(", 'gm'))).toHaveLength(1);
  });

  test("DNumSlider.SetValue.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dnumslider.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Sets the value of the [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider).");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DNumSlider:SetValue");
    expect(output).toContain("---@param val number|string The value to set.");
    expect(output).toContain("function DNumSlider:SetValue(val) end");
    expect(output.match(new RegExp("^function DNumSlider:SetValue\\(", 'gm'))).toHaveLength(1);
  });

  test("DNumSlider.SetDefaultValue.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dnumslider.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Sets the default value of the slider, to be used by [DNumSlider:ResetToDefaultValue](https://wiki.facepunch.com/gmod/DNumSlider:ResetToDefaultValue) or by middle mouse clicking the draggable knob of the slider.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DNumSlider:SetDefaultValue");
    expect(output).toContain("---@param default number|string The new default value of the slider to set");
    expect(output).toContain("function DNumSlider:SetDefaultValue(default) end");
    expect(output.match(new RegExp("^function DNumSlider:SetDefaultValue\\(", 'gm'))).toHaveLength(1);
  });

  test("DButton.SetMaterial.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dbutton.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Sets an image to be displayed as the button's background.");
    expect(output).toContain("---");
    expect(output).toContain("--- See [DButton:SetImage](https://wiki.facepunch.com/gmod/DButton:SetImage) for equivalent function that uses file paths instead. Also see [DImageButton](https://wiki.facepunch.com/gmod/DImageButton).");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DButton:SetMaterial");
    expect(output).toContain("---@param img? IMaterial|string The material to use. If this is nil, the image background is removed.");
    expect(output).toContain("function DButton:SetMaterial(img) end");
    expect(output.match(new RegExp("^function DButton:SetMaterial\\(", 'gm'))).toHaveLength(1);
  });

  test("DImage.SetMaterial.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dimage.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Sets a [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) directly as an image.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DImage:SetMaterial");
    expect(output).toContain("---@param mat IMaterial|string|nil The material to set");
    expect(output).toContain("function DImage:SetMaterial(mat) end");
    expect(output.match(new RegExp("^function DImage:SetMaterial\\(", 'gm'))).toHaveLength(1);
  });

  test("os.date.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("os.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---");
    expect(output).toContain("--- Returns a string or a table containing date and time, formatted according");
    expect(output).toContain("--- to the given string `format`.");
    expect(output).toContain("---");
    expect(output).toContain("--- If the `time` argument is present, this is the time to be formatted (see");
    expect(output).toContain("--- the `os.time` function for a description of this value). Otherwise,");
    expect(output).toContain("--- `date` formats the current time.");
    expect(output).toContain("---");
    expect(output).toContain("--- If `format` starts with '`!`', then the date is formatted in Coordinated");
    expect(output).toContain("--- Universal Time. After this optional character, if `format` is the string");
    expect(output).toContain("--- \"`*t`\", then `date` returns a [Structures/DateData](https://wiki.facepunch.com/gmod/Structures/DateData) table with:");
    expect(output).toContain("---");
    expect(output).toContain("--- **`year`** (four digits)");
    expect(output).toContain("--- **`month`** (1–12)");
    expect(output).toContain("--- **`day`** (1-31)");
    expect(output).toContain("--- **`hour`** (0-23)");
    expect(output).toContain("--- **`min`** (0-59)");
    expect(output).toContain("--- **`sec`** (0-61), due to leap seconds");
    expect(output).toContain("--- **`wday`** (weekday, 1–7, Sunday is 1)");
    expect(output).toContain("--- **`yday`** (day of the year, 1–366)");
    expect(output).toContain("---");
    expect(output).toContain("--- If `format` is not \"`*t`\", then `date` returns the date as a string,");
    expect(output).toContain("---");
    expect(output).toContain("--- When called without arguments, `date` returns a reasonable date and time");
    expect(output).toContain("--- representation that depends on the host system and on the current locale.");
    expect(output).toContain("---@overload fun(format: \"*t\", time?: number): DateData");
    expect(output).toContain("---@overload fun(format: \"!*t\", time?: number): DateData");
    expect(output).toContain("---@overload fun(format?: string, time?: number): string");
    expect(output).toContain("---@param format \"*t\"|\"!*t\" # The format string. If `*t` or `!*t`, returns a [Structures/DateData](https://wiki.facepunch.com/gmod/Structures/DateData) table instead.");
    expect(output).toContain("---@param time? number # Time to use for the format.");
    expect(output).toContain("---@return DateData # Formatted date string, or a [Structures/DateData](https://wiki.facepunch.com/gmod/Structures/DateData) table if format is `*t` or `!*t`.");
    expect(output).toContain("function os.date(format, time) end");
    expect(output.match(new RegExp("^function os\\.date\\(", 'gm'))).toHaveLength(1);
  });

  test("string.FormattedTime.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("string.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Formats the supplied number of seconds to the specified format.");
    expect(output).toContain("---");
    expect(output).toContain("---When no format is supplied, this returns a FormattedTime table instead.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@realm server");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/string.FormattedTime");
    expect(output).toContain("---@overload fun(seconds?: number): FormattedTime");
    expect(output).toContain("---@overload fun(seconds: number?, format: nil): FormattedTime");
    expect(output).toContain("---@param seconds? number Number of seconds to format.");
    expect(output).toContain("---@param format string The format string. If this is omitted, a FormattedTime table is returned instead.");
    expect(output).toContain("---@return string # The formatted time string, or a FormattedTime table when no format is supplied.");
    expect(output).toContain("function string.FormattedTime(seconds, format) end");
    expect(output.match(new RegExp("^function string\\.FormattedTime\\(", 'gm'))).toHaveLength(1);
  });

  test("string.gsub.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("string.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---This functions main purpose is to replace certain character sequences in a string using [Patterns](https://wiki.facepunch.com/gmod/Patterns).");
    expect(output).toContain("---@realm shared");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/string.gsub");
    expect(output).toContain("---@param string string String which should be modified.");
    expect(output).toContain("---@param pattern string The pattern that defines what should be matched and eventually be replaced.");
    expect(output).toContain("---@param replacement string|table|fun(...: string): string|number|nil|false In case of a string the matched sequence will be replaced with it.");
    expect(output).toContain("---");
    expect(output).toContain("--- In case of a table, the matched sequence will be used as key and the table will tested for the key, if a value exists it will be used as replacement.");
    expect(output).toContain("---");
    expect(output).toContain("--- In case of a function all matches will be passed as parameters to the function, the return value(s) of the function will then be used as replacement.");
    expect(output).toContain("---@param maxReplaces? number Maximum number of replacements to be made.");
    expect(output).toContain("---@return string # replaceResult");
    expect(output).toContain("---@return number # replaceCount");
    expect(output).toContain("function string.gsub(string, pattern, replacement, maxReplaces) end");
    expect(output.match(new RegExp("^function string\\.gsub\\(", 'gm'))).toHaveLength(1);
  });

  test("Structures.RenderCaptureData.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("structures.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("--- Used for [render.Capture](https://wiki.facepunch.com/gmod/render.Capture).");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/Structures/RenderCaptureData");
    expect(output).toContain("---@class (partial) RenderCaptureData");
    expect(output).toContain("---Format of the capture. Valid formats are:");
    expect(output).toContain("--- * `jpeg` or `jpg`");
    expect(output).toContain("--- * `png`");
    expect(output).toContain("---");
    expect(output).toContain("--- As of version 2026.06.19:");
    expect(output).toContain("--- * `rgba`, `rgb` and `bgra` - Raw image data in given byte order.");
    expect(output).toContain("--- Expected data size is `ImgWidth * ImgHeight * 4` (`ImgWidth * ImgHeight * 3` for `rgb`)");
    expect(output).toContain("--- Each 4 (or 3 for `rgb`) bytes  is one pixel, top to bottom left to right.");
    expect(output).toContain("---@field format string");
    expect(output).toContain("---X coordinate of the capture origin");
    expect(output).toContain("---@field x number");
    expect(output).toContain("---Y coordinate of the capture origin");
    expect(output).toContain("---@field y number");
    expect(output).toContain("---Width of the capture");
    expect(output).toContain("---@field w number");
    expect(output).toContain("---Height of the capture");
    expect(output).toContain("---@field h number");
    expect(output).toContain("---The quality of the capture. Affects jpeg only.");
    expect(output).toContain("---@field quality? number");
    expect(output).toContain("---Set to false to capture an image with alpha channel set to fully opaque. Affects any format with alpha channel support, so not `jpg`.");
    expect(output).toContain("---");
    expect(output).toContain("--- Default: `true`");
    expect(output).toContain("---@field alpha boolean=true");
    expect(output).toContain("local RenderCaptureData = {}");
  });

  test("DProperties.CreateRow.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dproperties.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Creates a row in the properties panel.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DProperties:CreateRow");
    expect(output).toContain("---@param category string The category to list this row under");
    expect(output).toContain("---@param name string The label of this row");
    expect(output).toContain("---@return DPropertiesRow # An internal Row panel. It has 2 methods of interest:");
    expect(output).toContain("--- * `Setup`( string type, table vars )");
    expect(output).toContain("---   * Call to set up the panel as one of the `DProperty_` panels. `vars` parameter is directly fed into the created `DProperty_` panels' `Setup` function.");
    expect(output).toContain("--- * `SetValue`( [any](https://wiki.facepunch.com/gmod/any) value )");
    expect(output).toContain("---   * Call to set the value on the created `DProperty_` panel.");
    expect(output).toContain("function DProperties:CreateRow(category, name) end");
    expect(output.match(new RegExp("^function DProperties:CreateRow\\(", 'gm'))).toHaveLength(1);
  });

  test("DProperties.GetCategory.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dproperties.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.");
    expect(output).toContain("---");
    expect(output).toContain("--- Returns (or creates) a category of properties.");
    expect(output).toContain("---");
    expect(output).toContain("--- See [DProperties:CreateRow](https://wiki.facepunch.com/gmod/DProperties:CreateRow) for adding actual properties.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DProperties:GetCategory");
    expect(output).toContain("---@param name string Name of the category");
    expect(output).toContain("---@param create? boolean Create a new category if it doesn't exist.");
    expect(output).toContain("---@return DPropertiesCategory? # An internal panel.");
    expect(output).toContain("---@overload fun(self: DProperties, name: string, create: true): DPropertiesCategory");
    expect(output).toContain("function DProperties:GetCategory(name, create) end");
    expect(output.match(new RegExp("^function DProperties:GetCategory\\(", 'gm'))).toHaveLength(1);
  });

  test("class.DPropertiesRow.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class DPropertiesRow : Panel");
    expect(output).toContain("---@field Label DLabel");
    expect(output).toContain("---@field Container Panel");
    expect(output).toContain("---@field Inner? DProperty_Generic");
    expect(output).toContain("local DPropertiesRow = {}");
    expect(output).toContain("---@source garrysmod/lua/vgui/dproperties.lua");
    expect(output).toContain("---@param rowType string");
    expect(output).toContain("---@param vars? table");
    expect(output).toContain("function DPropertiesRow:Setup(rowType, vars) end");
    expect(output).toContain("---@source garrysmod/lua/vgui/dproperties.lua");
    expect(output).toContain("---@param value any");
    expect(output).toContain("function DPropertiesRow:SetValue(value) end");
    expect(output.match(new RegExp("^function DPropertiesRow:Setup\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function DPropertiesRow:SetValue\\(", 'gm'))).toHaveLength(1);
  });

  test("class.DPropertiesCategory.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class DPropertiesCategory : Panel");
    expect(output).toContain("---@field Rows table<string, DPropertiesRow>");
    expect(output).toContain("local DPropertiesCategory = {}");
    expect(output).toContain("---@source garrysmod/lua/vgui/dproperties.lua");
    expect(output).toContain("---@overload fun(self: DPropertiesCategory, name: string, create: true): DPropertiesRow");
    expect(output).toContain("---@param name string");
    expect(output).toContain("---@param create? boolean");
    expect(output).toContain("---@return DPropertiesRow?");
    expect(output).toContain("function DPropertiesCategory:GetRow(name, create) end");
    expect(output.match(new RegExp("^function DPropertiesCategory:GetRow\\(", 'gm'))).toHaveLength(1);
  });

  test("Player.GetPressedWidget.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("player.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Returns the widget entity the player is using.");
    expect(output).toContain("---");
    expect(output).toContain("--- Having a pressed widget stops the player from firing their weapon to allow input to be passed onto the widget.");
    expect(output).toContain("---@realm shared");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/Player:GetPressedWidget");
    expect(output).toContain("---@return widget_base|NULL # The pressed widget.");
    expect(output).toContain("function Player:GetPressedWidget() end");
    expect(output.match(new RegExp("^function Player:GetPressedWidget\\(", 'gm'))).toHaveLength(1);
  });

  test("class.widget_base.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class widget_base : Entity");
    expect(output).toContain("local widget_base = {}");
    expect(output).toContain("---@source garrysmod/lua/entities/widget_base.lua");
    expect(output).toContain("---@param player Player");
    expect(output).toContain("---@param button number");
    expect(output).toContain("---@param movement CMoveData");
    expect(output).toContain("function widget_base:OnRelease(player, button, movement) end");
    expect(output).toContain("---@source garrysmod/lua/entities/widget_base.lua");
    expect(output).toContain("---@param player Player");
    expect(output).toContain("---@param movement CMoveData");
    expect(output).toContain("function widget_base:PressedThinkInternal(player, movement) end");
    expect(output).toContain("---@source garrysmod/lua/entities/widget_base.lua");
    expect(output).toContain("---@param entity Entity");
    expect(output).toContain("---@return boolean");
    expect(output).toContain("function widget_base:PressedShouldDraw(entity) end");
    expect(output.match(new RegExp("^function widget_base:OnRelease\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function widget_base:PressedThinkInternal\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function widget_base:PressedShouldDraw\\(", 'gm'))).toHaveLength(1);
  });

  test("math.tau.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("math.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@source garrysmod/lua/includes/extensions/math.lua");
    expect(output).toContain("---@type number");
    expect(output).toContain("math.tau = 2 * math.pi");
  });

  test("motionsensor.DebugBones.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("motionsensor.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@source garrysmod/lua/includes/extensions/motionsensor.lua");
    expect(output).toContain("---@type number[][]");
    expect(output).toContain("motionsensor.DebugBones = {}");
  });

  test("Global.DOF_Ents.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("global.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@source garrysmod/lua/postprocess/dof.lua");
    expect(output).toContain("---@type Entity[]");
    expect(output).toContain("DOF_Ents = {}");
  });

  test("class.NPC.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("npc.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class (partial) NPC : Entity");
    expect(output).toContain("---@field NPCName? string");
    expect(output).toContain("local NPC = {}");
  });

  test("class.Vehicle.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("vehicle.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class (partial) Vehicle : Entity");
    expect(output).toContain("---@field VehicleName? string");
    expect(output).toContain("local Vehicle = {}");
  });

  test("dragndrop.state.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dragndrop.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Current local mouse X position tracked by dragndrop while dispatching receivers.");
    expect(output).toContain("---@type number");
    expect(output).toContain("dragndrop.m_MouseLocalX = nil");
    expect(output).toContain("---Current local mouse Y position tracked by dragndrop while dispatching receivers.");
    expect(output).toContain("---@type number");
    expect(output).toContain("dragndrop.m_MouseLocalY = nil");
    expect(output).toContain("---@source garrysmod/lua/includes/extensions/client/panel/dragdrop.lua");
    expect(output).toContain("---@type { Name: string, Func: fun(receiver: Panel, panels: Panel[], drop: boolean, command: any, x: number, y: number) }?");
    expect(output).toContain("dragndrop.m_ReceiverSlot = nil");
  });

  test("WorkshopFileBase.FetchLocal.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("workshopfilebase.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Fetches local files for the workshop helper's namespace.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source garrysmod/lua/includes/util/workshop_files.lua");
    expect(output).toContain("---@param offset number");
    expect(output).toContain("---@param perpage number");
    expect(output).toContain("function WorkshopFileBase:FetchLocal(offset, perpage) end");
    expect(output.match(new RegExp("^function WorkshopFileBase:FetchLocal\\(", 'gm'))).toHaveLength(1);
  });

  test("WorkshopFileBase.FinishPublish.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("workshopfilebase.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Publishes a file through the namespace's workshop handler.");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source garrysmod/lua/menu/menu_save.lua");
    expect(output).toContain("---@param filename string");
    expect(output).toContain("---@param imagename string");
    expect(output).toContain("---@param name string");
    expect(output).toContain("---@param description string");
    expect(output).toContain("---@param chosenTag string");
    expect(output).toContain("---@param other table");
    expect(output).toContain("---@return string? error");
    expect(output).toContain("function WorkshopFileBase:FinishPublish(filename, imagename, name, description, chosenTag, other) end");
    expect(output.match(new RegExp("^function WorkshopFileBase:FinishPublish\\(", 'gm'))).toHaveLength(1);
  });

  test("workshopfilebase.dupes.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("workshopfilebase.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class ws_dupe : WorkshopFileBase");
    expect(output).toContain("---Sandbox dupes workshop helper used by the menu HTML bridge.");
    expect(output).toContain("ws_dupe = {}");
    expect(output).toContain("---Downloads and arms a subscribed dupe from the workshop.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L52");
    expect(output).toContain("---@param wsid string|number The workshop item ID.");
    expect(output).toContain("function ws_dupe:DownloadAndArm(wsid) end");
    expect(output).toContain("---Arms a local dupe file for placement.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L46");
    expect(output).toContain("---@param filename string The dupe file path.");
    expect(output).toContain("function ws_dupe:Arm(filename) end");
    expect(output.match(new RegExp("^function ws_dupe:DownloadAndArm\\(", 'gm'))).toHaveLength(1);
    expect(output.match(new RegExp("^function ws_dupe:Arm\\(", 'gm'))).toHaveLength(1);
  });

  test("DTree_Node.Insert.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dtree_node.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Inserts a sub-node into this node before or after the given node.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DTree_Node:Insert");
    expect(output).toContain("---@param node DTree_Node The DTree_Node to insert.");
    expect(output).toContain("---@param nodeNextTo DTree_Node The node to insert the node above before or after.");
    expect(output).toContain("---@param before boolean true to insert before, false to insert after.");
    expect(output).toContain("function DTree_Node:Insert(node, nodeNextTo, before) end");
    expect(output.match(new RegExp("^function DTree_Node:Insert\\(", 'gm'))).toHaveLength(1);
  });

  test("DTree_Node.InstallDraggable.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dtree_node.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.");
    expect(output).toContain("---");
    expect(output).toContain("--- Called automatically internally.");
    expect(output).toContain("---");
    expect(output).toContain("--- Makes the target node compatible with this node's drag'n'drop.");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DTree_Node:InstallDraggable");
    expect(output).toContain("---@param node DTree_Node The DTree_Node.");
    expect(output).toContain("function DTree_Node:InstallDraggable(node) end");
    expect(output.match(new RegExp("^function DTree_Node:InstallDraggable\\(", 'gm'))).toHaveLength(1);
  });

  test("engine vehicles and NPCs extend the metatable the engine gives them", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    for (const vehicle of ["prop_vehicle_jeep", "prop_vehicle_airboat", "prop_vehicle_jeep_old", "prop_vehicle_prisoner_pod"]) {
      expect(output).toContain(`---@class ${vehicle} : Vehicle`);
    }
    for (const npc of ["npc_manhack", "npc_rollermine"]) {
      expect(output).toContain(`---@class ${npc} : NPC`);
    }
  });

  test("WorkshopFileBase retains namespace extension tables and wiki documentation", () => {
    const output = readOutput("global.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.");
    expect(output).toContain("--- Returns a new WorkshopFileBase element");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/Global.WorkshopFileBase");
    expect(output).toContain("---@param namespace string Namespace for the file base");
    expect(output).toContain("---@param requiredTags table Tags required for a Workshop submission to be interacted with by the filebase");
    expect(output).toContain("---@return (instance) WorkshopFileBase # WorkshopFileBase element");
    expect(output).toContain("function _G.WorkshopFileBase(namespace, requiredTags) end");
    expect(output.match(new RegExp("^function _G\\.WorkshopFileBase\\(", 'gm'))).toHaveLength(1);
  });

  test("WorkshopFileBase fetches take the filter as the string the base code compares", () => {
    const output = readOutput("workshopfilebase.lua").replace(/\r\n/g, '\n');
    expect(output.match(/^---@param filter\? string /gm)).toHaveLength(2);
    expect(output).not.toContain("---@param filter? number");
  });

  test("DImageButton.SetMaterial.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dimagebutton.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Sets a [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) directly as an image. Equivalent of [DImage:SetMaterial](https://wiki.facepunch.com/gmod/DImage:SetMaterial).");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DImageButton:SetMaterial");
    expect(output).toContain("---@param mat IMaterial|string|nil The material to set");
    expect(output).toContain("function DImageButton:SetMaterial(mat) end");
    expect(output.match(new RegExp("^function DImageButton:SetMaterial\\(", 'gm'))).toHaveLength(1);
  });

  test("npc.lua retains wiki class documentation with custom fields", () => {
    const output = readOutput("npc.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@field NPCName? string");
    expect(output).toContain("--- This is a list of all methods only available for NPCs. It is also possible to call [Entity](https://wiki.facepunch.com/gmod/Entity) functions on NPCs.");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/NPC");
  });

  test("vehicle.lua retains wiki class documentation with custom fields", () => {
    const output = readOutput("vehicle.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@field VehicleName? string");
    expect(output).toContain("--- This is a list of all methods only available for vehicles. It is also possible to call [Entity](https://wiki.facepunch.com/gmod/Entity) functions on vehicles.");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/Vehicle");
  });

  test("matselect.lua retains wiki class documentation with custom fields", () => {
    const output = readOutput("matselect.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@field Controls MatSelectMaterial[]");
    expect(output).toContain("--- The panel used by Material & Lamp Sandbox tools for texture selection. Despite being only used in Sandbox, it is **not** exclusive to that gamemode.");
    expect(output).toContain("--- See also [PropSelect](https://wiki.facepunch.com/gmod/PropSelect) for the prop selecting alternative.");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/MatSelect");
  });

  test("sandbox.lua retains wiki class documentation with custom fields", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class (partial) SANDBOX : GM");
    expect(output).toContain("--- This is a list of hooks that are only available in Sandbox or Sandbox derived gamemodes.");
    expect(output).toContain("--- **NOTE**: This function or feature is only available in the Sandbox gamemode and its [derivatives](https://wiki.facepunch.com/gmod/Global.DeriveGamemode).");
  });

  test("sandbox's own GM methods are declared from its gamemode source", () => {
    const output = readOutput("sandbox.lua").replace(/\r\n/g, '\n');
    for (const declaration of [
      "function SANDBOX:AddHint(name, delay) end",
      "function SANDBOX:SuppressHint(name) end",
      "function SANDBOX:GetSpawnmenuTools(name) end",
      "function SANDBOX:AddSTOOL(category, itemname, text, command, controls, cpanelfunction) end",
      "function SANDBOX:LimitHit(name) end",
      "function SANDBOX:UnfrozeObjects(num) end",
      "function SANDBOX:SpawnMenuClosed() end",
    ]) {
      expect(output).toContain(declaration);
    }
    expect(output).toContain("---@hook SpawnMenuClosed");
    expect(output).toContain("---@hook LimitHit");
    expect(output).toContain("---@param cpanelfunction? fun(pnl: ControlPanel)");
  });

  test("a panel's convar update takes the numbers its shipped callers pass", () => {
    const output = readOutput("panel.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@param newValue string|number The new value to set the associated console variable to, run through `tostring`.\nfunction Panel:ConVarChanged(newValue) end");
  });

  test("base gamemode state fields are declared on GM from its source", () => {
    const output = readOutput("gm.lua").replace(/\r\n/g, '\n');
    for (const field of [
      "---@field PickupHistory table[]",
      "---@field PickupHistoryLast number",
      "---@field PickupHistoryTop number",
      "---@field PickupHistoryWide number",
      "---@field PickupHistoryCorner number",
      "---@field ShowScoreboard? boolean",
      "---@field TeamSelectFrame? DFrame",
      "---@field SpawnPoints? Entity[]",
      "---@field LastSpawnPoint? Entity|number",
      "---@field HasMasterSpawnPoints? boolean",
    ]) {
      expect(output).toContain(field);
    }
  });

  test("prop_effect's attached entity may be absent on the client", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@field AttachedEntity? Entity");
  });

  test("DNumSlider.GetDefaultValue.lua preserves its documentation and corrected contract", () => {
    const output = readOutput("dnumslider.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---Returns the default value of the slider, if one was set by [DNumSlider:SetDefaultValue](https://wiki.facepunch.com/gmod/DNumSlider:SetDefaultValue)");
    expect(output).toContain("---@realm client");
    expect(output).toContain("---@realm menu");
    expect(output).toContain("---@source https://wiki.facepunch.com/gmod/DNumSlider:GetDefaultValue");
    expect(output).toContain("---@return number|string|nil # The default value of the slider");
    expect(output).toContain("function DNumSlider:GetDefaultValue() end");
    expect(output.match(new RegExp("^function DNumSlider:GetDefaultValue\\(", 'gm'))).toHaveLength(1);
  });

  test("Panel.GenerateExample types the sheet as the DPropertySheet the engine passes", () => {
    const output = readOutput("panel.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@param dpropertysheet DPropertySheet A DPropertySheet to add your example to. See examples below.");
    expect(output).not.toContain("---@param dpropertysheet Panel");
    expect(output.match(new RegExp("^function Panel:GenerateExample\\(", 'gm'))).toHaveLength(1);
  });

  test("SKIN paint hooks take the control the engine paints them for", () => {
    const output = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    const receivers: Record<string, string> = {
      PaintCheckBox: 'DCheckBox',
      PaintRadioButton: 'DCheckBox',
      PaintExpandButton: 'DExpandButton',
      PaintMenu: 'DMenu',
      PaintMenuOption: 'DMenuOption',
      PaintPropertySheet: 'DPropertySheet',
      PaintTab: 'DTab',
      PaintActiveTab: 'DTab',
      PaintComboBox: 'DComboBox',
      PaintComboDownArrow: 'DComboBoxDropButton',
      PaintNumSlider: 'DSlider',
      PaintProgress: 'DProgress',
      PaintCollapsibleCategory: 'DCollapsibleCategory',
      PaintCategoryList: 'DCategoryList|DForm',
    };

    for (const [hook, receiver] of Object.entries(receivers)) {
      expect(output).toContain(`---@field ${hook} fun(self: SKIN, panel: ${receiver}, w: number, h: number)`);
    }

    expect(output).toContain("---@field PaintPanel fun(self: SKIN, panel: Panel, w: number, h: number)");
  });

  test("DComboBox.DropButton carries the back-reference the engine assigns", () => {
    const comboBox = readOutput("dcombobox.lua").replace(/\r\n/g, '\n');
    const classes = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    expect(comboBox).toContain("---@field DropButton DComboBoxDropButton");
    expect(classes).toContain("---@class DComboBoxDropButton : DPanel");
    expect(classes).toContain("---@field ComboBox DComboBox");
  });

  test("SpawnIcon declares the Icon child created in Init", () => {
    const output = readOutput("spawnicon.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@field Icon ModelImage");
  });

  test("ents.Create only lists engine classes in its literal-class overload", () => {
    const output = readOutput("ents.lua").replace(/\r\n/g, '\n');
    const scriptedEntities = [
      'gmod_anchor', 'gmod_hands', 'gmod_cameraprop', 'gmod_wheel', 'gmod_winch_controller',
      'ragdoll_motion', 'widget_axis_arrow', 'widget_axis_disc', 'widget_bone', 'widget_bones',
    ];

    for (const name of scriptedEntities) {
      expect(output).not.toContain(`---| "${name}"`);
    }

    expect(output).toContain('---| "phys_constraint"');
    expect(output).toContain('---| "point_viewcontrol"');
    expect(output).toContain("---@overload fun(class: KnownEngineEntityClass): Entity|NULL");
    expect(output).toContain("---@return (instance) T|NULL # The created entity, or `NULL` if failed.");
  });

  test("Player.GetWeapon returns the weapon class it is asked for", () => {
    const output = readOutput("player.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@alias KnownEngineWeaponClass");
    for (const name of ['weapon_pistol', 'weapon_357', 'weapon_physgun', 'weapon_stunstick', 'weapon_bugbait']) {
      expect(output).toContain(`---| "${name}"`);
    }
    expect(output).not.toContain('---| "weapon_fists"');
    expect(output).toContain("---@overload fun(className: KnownEngineWeaponClass): Weapon|NULL");
    expect(output).toContain("---@generic T : Weapon");
    expect(output).toContain("---@param className `T` Class name of weapon");
    expect(output).toContain("---@return (instance) T|NULL # The weapon for the specified class, or NULL ENTITY if the player does not have this weapon.");
    expect(output.match(new RegExp("^function Player:GetWeapon\\(", 'gm'))).toHaveLength(1);
  });

  test("HullTrace is a Trace", () => {
    const output = readOutput("structures.lua").replace(/\r\n/g, '\n');
    expect(output).toContain("---@class HullTrace : Trace");
    expect(output).toContain("HullTrace.mins = nil");
    expect(output).toContain("HullTrace.maxs = nil");
  });

  test("engine weapon classes are declared as Weapon subclasses", () => {
    const classes = readOutput("custom_classes.lua").replace(/\r\n/g, '\n');
    for (const name of ['weapon_357', 'weapon_ar2', 'weapon_bugbait', 'weapon_crossbow', 'weapon_crowbar', 'weapon_frag', 'weapon_physcannon', 'weapon_physgun', 'weapon_pistol', 'weapon_rpg', 'weapon_shotgun', 'weapon_slam', 'weapon_smg1', 'weapon_stunstick']) {
      expect(classes).toContain(`---@class ${name} : Weapon`);
    }
  });


});
