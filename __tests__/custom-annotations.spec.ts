import fs from 'fs';
import path from 'path';

describe('custom and plugin annotation smoke checks', () => {
  const customRoot = path.join(process.cwd(), 'custom');
  const outputRoot = path.join(process.cwd(), 'output');

  const readCustom = (file: string) => fs.readFileSync(path.join(customRoot, file), 'utf8');
  const readOutput = (file: string) => fs.readFileSync(path.join(outputRoot, file), 'utf8');

  const functionBlocks = (source: string, header: string) =>
    source.replace(/\r\n/g, '\n').split(/\n\n+/).filter((part) => part.includes(header));

  const leadingType = (text: string) => {
    let depth = 0;
    for (let i = 0; i < text.length; i++) {
      const char = text[i];
      if ('(<{['.includes(char)) depth++;
      else if (')>}]'.includes(char)) depth--;
      else if (/\s/.test(char) && depth === 0) return text.slice(0, i);
    }
    return text;
  };

  const signature = (block: string) =>
    block.replace(/\r\n/g, '\n').split('\n').flatMap((line) => {
      const param = line.match(/^---@param (\S+) (.*)$/);
      if (param) return [`param ${param[1]} ${leadingType(param[2])}`];
      const result = line.match(/^---@return (.*)$/);
      return result ? [`return ${leadingType(result[1])}`] : [];
    });

  test.each([
    ['bf_read', 'bf_read', 'ReadAngle'],
    ['bf_read', 'bf_read', 'ReadBool'],
    ['bf_read', 'bf_read', 'ReadChar'],
    ['bf_read', 'bf_read', 'ReadEntity'],
    ['bf_read', 'bf_read', 'ReadFloat'],
    ['bf_read', 'bf_read', 'ReadLong'],
    ['bf_read', 'bf_read', 'ReadShort'],
    ['bf_read', 'bf_read', 'ReadString'],
    ['bf_read', 'bf_read', 'ReadVector'],
    ['bf_read', 'bf_read', 'ReadVectorNormal'],
    ['file', 'File', 'Read'],
    ['file', 'File', 'ReadBool'],
    ['file', 'File', 'ReadByte'],
    ['file', 'File', 'ReadDouble'],
    ['file', 'File', 'ReadFloat'],
    ['file', 'File', 'ReadLine'],
    ['file', 'File', 'ReadLong'],
    ['file', 'File', 'ReadShort'],
    ['file', 'File', 'ReadUInt64'],
    ['file', 'File', 'ReadULong'],
    ['file', 'File', 'ReadUShort'],
    ['irestore', 'IRestore', 'ReadAngle'],
    ['irestore', 'IRestore', 'ReadBool'],
    ['irestore', 'IRestore', 'ReadEntity'],
    ['irestore', 'IRestore', 'ReadFloat'],
    ['irestore', 'IRestore', 'ReadInt'],
    ['irestore', 'IRestore', 'ReadString'],
    ['irestore', 'IRestore', 'ReadVector'],
    ['irestore', 'IRestore', 'StartBlock'],
    ['stack', 'Stack', 'Pop'],
    ['stack', 'Stack', 'PopMulti'],
    ['cnavarea', 'CNavArea', 'PopOpenList'],
    ['cnavarea', 'CNavArea', 'GetRandomPoint'],
  ])('fresh-result %s %s:%s is annotated with fresh_result', (file, cls, name) => {
    const custom = readCustom(`${cls}.${name}.lua`);
    expect(custom).toContain('---@[fresh_result]');
    expect(readOutput(`${file}.lua`)).toContain('---@[fresh_result]');
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

  test('constraint overrides set the signature their function is emitted with', () => {
    const output = readOutput('constraint.lua');
    for (const file of fs.readdirSync(customRoot).filter((name) => name.startsWith('constraint.'))) {
      const name = file.slice('constraint.'.length, -'.lua'.length);
      const blocks = functionBlocks(output, `function constraint.${name}(`);
      expect(blocks).toHaveLength(1);
      expect(signature(blocks[0])).toEqual(signature(readCustom(file)));
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

  test('list view lines expose their column cells', () => {
    const line = readOutput('dlistview_line.lua');
    expect(line).toContain('---@field Columns (DListViewLabel|Panel)[]');
  });

  test('sql queries report failure with false', () => {
    const sqlLua = readOutput('sql.lua');
    expect(sqlLua).toContain('---@return table|false|nil');
    expect(sqlLua).toContain('---@return table|false');
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
      const outputBlock = entityLua.match(new RegExp(`---@source https:\\/\\/wiki\\.facepunch\\.com\\/gmod\\/Entity:${getterName}[\\s\\S]*?function Entity:${getterName}\\(key, fallback\\) end`))?.[0];

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
    expect(defineSkin).toMatch(/---@\[call_arg\("gmod\.derma_skin", "table"\)\]\r?\n---@param skin /);
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

  test.each([
    ['Global.IsEntity.lua', 'isentity', 'Entity'],
    ['Global.ispanel.lua', 'ispanel', 'Panel'],
    ['Global.isvector.lua', 'isvector', 'Vector'],
    ['Global.isangle.lua', 'isangle', 'Angle'],
    ['Global.ismatrix.lua', 'ismatrix', 'VMatrix'],
  ])('runtime type test %s declares its exhaustive guard contract', (file, name, type) => {
    const custom = readCustom(file).replace(/\r\n/g, '\n');
    expect(custom.match(/^---@\[exhaustive_type_guard\]$/gm)).toHaveLength(1);
    expect(custom).toContain(`---@return TypeGuard<${type}>`);
    expect(custom).toContain(`---@[exhaustive_type_guard]\nfunction _G.${name}(var) end`);
    const block = readOutput('global.lua').replace(/\r\n/g, '\n').match(
      new RegExp(String.raw`---@source https://wiki\.facepunch\.com/gmod/Global\.${name}\n[\s\S]*?function _G\.${name}\(var\) end`),
    )?.[0];
    expect(block).toBeDefined();
    expect(block).toContain('---@[exhaustive_type_guard]');
  });

  test.each(['Global.IsColor.lua', 'Global.IsValid.lua'])(
    '%s does not declare an exhaustive runtime type test',
    (file) => {
      expect(readCustom(file)).not.toContain('---@[exhaustive_type_guard]');
    },
  );

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

  test('math.Min is declared as the shipped alias of math.min', () => {
    const mathLua = readOutput('math.lua').replace(/\r\n/g, '\n');
    expect(mathLua).toContain('function math.Min(x, ...) end');
    expect(mathLua).toContain('---@param x number');
    expect(mathLua).toContain('---@return number');
    expect(mathLua.match(/^function math\.Min\(/gm)).toHaveLength(1);
  });

  test('EntityCopyData carries the entity table fields the duplicator merges in', () => {
    const structuresLua = readOutput('structures.lua').replace(/\r\n/g, '\n');
    expect(structuresLua).toContain('---@field WorkshopID? number');
    expect(structuresLua).toContain('---@field [string] any');
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

  test('IsWeapon narrows the entity to a weapon', () => {
    const entityLua = readOutput('entity.lua').replace(/\r\n/g, '\n');
    expect(entityLua).toContain('---@return_cast self Weapon');
    expect(entityLua.match(/^function Entity:IsWeapon\(/gm)).toHaveLength(1);
  });

  test('weapons are equipped by a player or NPC', () => {
    const weaponLua = readOutput('weapon.lua').replace(/\r\n/g, '\n');
    expect(weaponLua).toContain('---@param NewOwner Player|NPC');
    expect(weaponLua.match(/^function Weapon:Equip\(/gm)).toHaveLength(1);
    expect(weaponLua).toContain('---@hook Equip');
  });

  test('GM hooks type player and menubar parameters', () => {
    const gmLua = readOutput('gm.lua').replace(/\r\n/g, '\n');
    expect(gmLua).toContain('function GM:OnPlayerHitGround(player, inWater, onFloater, speed) end');
    expect(gmLua).toContain('---@param player Player');
    expect(gmLua).toContain('function GM:PopulateMenuBar(menubar) end');
    expect(gmLua).toContain('---@param menubar DMenuBar');
  });

  test('SANDBOX spawnmenu hooks type pnlContent as SpawnmenuContentPanel', () => {
    const sandbox = readOutput('sandbox.lua').replace(/\r\n/g, '\n');
    for (const hook of ['PopulateContent', 'PopulateEntities', 'PopulateNPCs', 'PopulateVehicles', 'PopulateWeapons']) {
      expect(sandbox).toContain(`function SANDBOX:${hook}(pnlContent, tree, node) end`);
    }
    expect(sandbox).toContain('---@param pnlContent SpawnmenuContentPanel');
    expect(sandbox).toContain('---@param canvas DDragBase');
  });

  test('DFileBrowser and PropSelect type selection panels as SpawnIcon or DListView_Line', () => {
    const fileBrowser = readOutput('dfilebrowser.lua');
    const propSelect = readOutput('propselect.lua');
    expect(fileBrowser).toContain('---@param selectedPanel DListView_Line|SpawnIcon');
    expect(propSelect).toContain('---@param pnl SpawnIcon');
  });

  test('MatSelect classes and callbacks are typed', () => {
    const matselect = readOutput('matselect.lua');
    const classes = readOutput('custom_classes.lua');
    expect(matselect).toContain('---@field Controls MatSelectMaterial[]');
    expect(classes).toContain('---@class MatSelectMaterial : DImageButton');
    expect(classes).toContain('---@class MatSelectList : DPanelList');
    expect(matselect).toContain('function MatSelect:AddMaterial(label, path) end');
    expect(matselect).toContain('function MatSelect:AddMaterialEx(label, path, value, convars) end');
  });

  test('DListView events type the selected line as DListView_Line', () => {
    const listView = readOutput('dlistview.lua');
    for (const fn of ['DoDoubleClick', 'OnClickLine', 'OnRowRightClick', 'OnRowSelected', 'SelectItem', 'GetLine']) {
      expect(listView).toMatch(new RegExp(`function DListView:${fn}\\(`));
    }
    expect(listView).toContain('---@param line DListView_Line');
    expect(listView).toContain('---@param Line DListView_Line');
  });

  test('DTree_Node node insertion and dragging type the node parameter as DTree_Node', () => {
    const treeNode = readOutput('dtree_node.lua');
    expect(treeNode).toContain('function DTree_Node:Insert(node, nodeNextTo, before) end');
    expect(treeNode).toContain('function DTree_Node:InsertNode(node) end');
    expect(treeNode).toContain('function DTree_Node:InstallDraggable(node) end');
    expect(treeNode).toContain('---@param node DTree_Node');
  });

  test('DColorPalette button events type the clicked button as DColorButton', () => {
    const palette = readOutput('dcolorpalette.lua');
    for (const fn of ['OnRightClickButton', 'SaveColor', 'DoClick']) {
      expect(palette).toMatch(new RegExp(`function DColorPalette:${fn}\\(`));
    }
    expect(palette).toContain('---@param pnl DColorButton');
    expect(palette).toContain('---@param btn DColorButton');
  });

  test('VGUI controls and helpers declare typed parameters and returns', () => {
    expect(readOutput('dpropertysheet.lua')).toContain('function DPropertySheet:CloseTab(tab, removePanel) end');
    expect(readOutput('dpropertysheet.lua')).toContain('function DPropertySheet:OnActiveTabChanged(old, new) end');
    expect(readOutput('dhtmlcontrols.lua')).toContain('function DHTMLControls:SetHTML(dhtml) end');
    expect(readOutput('dmenu.lua')).toContain('function DMenu:OpenSubMenu(item, menu) end');
    expect(readOutput('dlistbox.lua')).toContain('function DListBox:AddItem(label) end');
    expect(readOutput('dproperty_float.lua')).toContain('---@return number');
    expect(readOutput('dform.lua')).toContain('---@return DNumSlider');
    expect(readOutput('dnumslider.lua')).toContain('function DNumSlider:SetValue(val) end');
    expect(readOutput('dnumslider.lua')).toContain('function DNumSlider:SetDefaultValue(default) end');
    expect(readOutput('dnumslider.lua')).toContain('function DNumSlider:GetDefaultValue() end');
    expect(readOutput('dbutton.lua')).toContain('---@param img? IMaterial|string');
    expect(readOutput('dimage.lua')).toContain('---@param mat IMaterial|string|nil');
    expect(readOutput('dimagebutton.lua')).toContain('---@param mat IMaterial|string|nil');
  });

  test('DProperties and CtrlColor classes are defined', () => {
    const properties = readOutput('dproperties.lua');
    const customClasses = readOutput('custom_classes.lua');
    expect(properties).toContain('---@class DProperties : Panel');
    expect(customClasses).toContain('---@class DPropertiesRow : Panel');
    expect(customClasses).toContain('---@class DPropertiesCategory : Panel');
    expect(customClasses).toContain('---@class CtrlColor : DPanel');
  });

  test('motionsensor, NextBot and HTML declare typed parameters and returns', () => {
    expect(readOutput('motionsensor.lua')).toContain('---@return true?');
    expect(readOutput('motionsensor.lua')).toContain('---@return table<number, Angle>');
    expect(readOutput('nextbot.lua')).toContain('---@param pos Vector');
    expect(readOutput('html.lua')).toContain('---@param msg string');
  });

  test('os.date, string.gsub, and RenderCaptureData retain structural types', () => {
    expect(readOutput('os.lua')).toContain('---@overload fun(format?: string, time?: number): string');
    expect(readOutput('os.lua')).toContain('---@return DateData');
    expect(readOutput('string.lua')).toContain('---@return string # replaceResult');
    expect(readOutput('string.lua')).toContain('---@return number # replaceCount');
    const structures = readOutput('structures.lua');
    expect(structures.match(/---@class \(partial\) RenderCaptureData\r?\n/g)).toHaveLength(1);
    expect(structures).toContain('---@field quality? number');
  });

  test('widget_base class and Player.GetPressedWidget return type', () => {
    expect(readOutput('player.lua')).toContain('---@return widget_base|NULL');
    expect(readOutput('custom_classes.lua')).toContain('---@class widget_base : Entity');
  });

  test('runtime extension constants and global tables are defined', () => {
    expect(readOutput('math.lua')).toContain('math.tau = 2 * math.pi');
    expect(readOutput('motionsensor.lua')).toContain('motionsensor.DebugBones = {}');
    expect(readOutput('global.lua')).toContain('DOF_Ents = {}');
    expect(readOutput('dragndrop.lua')).toContain('dragndrop.m_MouseLocalX = nil');
    expect(readOutput('workshopfilebase.lua')).toContain('---@class ws_dupe : WorkshopFileBase');
  });

  test('engine vehicles and NPCs extend the metatable the engine gives them', () => {
    const output = readOutput('custom_classes.lua').replace(/\r\n/g, '\n');
    for (const vehicle of ['prop_vehicle_jeep', 'prop_vehicle_airboat', 'prop_vehicle_jeep_old', 'prop_vehicle_prisoner_pod']) {
      expect(output).toContain(`---@class ${vehicle} : Vehicle`);
    }
    for (const npc of ['npc_manhack', 'npc_rollermine']) {
      expect(output).toContain(`---@class ${npc} : NPC`);
    }
  });

  test('WorkshopFileBase declarations are emitted into output', () => {
    const output = readOutput('global.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('function _G.WorkshopFileBase(namespace, requiredTags) end');
    expect(output).toContain('---@return (instance) WorkshopFileBase');
    expect(output.match(new RegExp('^function _G\\.WorkshopFileBase\\(', 'gm'))).toHaveLength(1);
  });

  test('WorkshopFileBase fetches take the filter as the string the base code compares', () => {
    const output = readOutput('workshopfilebase.lua').replace(/\r\n/g, '\n');
    expect(output.match(/^---@param filter\? string /gm)).toHaveLength(2);
    expect(output).not.toContain('---@param filter? number');
  });

  test('DImageButton.SetMaterial accepts IMaterial|string|nil', () => {
    const output = readOutput('dimagebutton.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@param mat IMaterial|string|nil');
    expect(output).toContain('function DImageButton:SetMaterial(mat) end');
    expect(output.match(new RegExp('^function DImageButton:SetMaterial\\(', 'gm'))).toHaveLength(1);
  });

  test('npc.lua retains custom fields', () => {
    const output = readOutput('npc.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@field NPCName? string');
    expect(output).toContain('---@source https://wiki.facepunch.com/gmod/NPC');
  });

  test('vehicle.lua retains custom fields', () => {
    const output = readOutput('vehicle.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@field VehicleName? string');
    expect(output).toContain('---@source https://wiki.facepunch.com/gmod/Vehicle');
  });

  test('matselect.lua retains custom fields', () => {
    const output = readOutput('matselect.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@field Controls MatSelectMaterial[]');
    expect(output).toContain('---@source https://wiki.facepunch.com/gmod/MatSelect');
  });

  test('sandbox.lua retains custom class hierarchy', () => {
    const output = readOutput('sandbox.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@class (partial) SANDBOX : GM');
  });

  test("sandbox's own GM methods are declared from its gamemode source", () => {
    const output = readOutput('sandbox.lua').replace(/\r\n/g, '\n');
    for (const declaration of [
      'function SANDBOX:AddHint(name, delay) end',
      'function SANDBOX:SuppressHint(name) end',
      'function SANDBOX:GetSpawnmenuTools(name) end',
      'function SANDBOX:AddSTOOL(category, itemname, text, command, controls, cpanelfunction) end',
      'function SANDBOX:LimitHit(name) end',
      'function SANDBOX:UnfrozeObjects(num) end',
      'function SANDBOX:SpawnMenuClosed() end',
    ]) {
      expect(output).toContain(declaration);
    }
    expect(output).toContain('---@hook SpawnMenuClosed');
    expect(output).toContain('---@hook LimitHit');
    expect(output).toContain('---@param cpanelfunction? fun(pnl: ControlPanel)');
  });

  test("a panel's convar update takes the numbers its shipped callers pass", () => {
    const output = readOutput('panel.lua').replace(/\r\n/g, '\n');
    const blocks = output.split(/\n\n+/).filter((part) => part.includes('function Panel:ConVarChanged('));
    expect(blocks).toHaveLength(1);
    expect(blocks[0]).toContain('---@param newValue string|number');
    expect(blocks[0]).toContain('function Panel:ConVarChanged(newValue) end');
  });

  test('base gamemode state fields are declared on GM from its source', () => {
    const output = readOutput('gm.lua').replace(/\r\n/g, '\n');
    for (const field of [
      '---@field PickupHistory table[]',
      '---@field PickupHistoryLast number',
      '---@field PickupHistoryTop number',
      '---@field PickupHistoryWide number',
      '---@field PickupHistoryCorner number',
      '---@field ShowScoreboard? boolean',
      '---@field TeamSelectFrame? DFrame',
      '---@field SpawnPoints? Entity[]',
      '---@field LastSpawnPoint? Entity|number',
      '---@field HasMasterSpawnPoints? boolean',
    ]) {
      expect(output).toContain(field);
    }
  });

  test("prop_effect's attached entity may be absent on the client", () => {
    const output = readOutput('custom_classes.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@field AttachedEntity? Entity');
  });

  test('DNumSlider.GetDefaultValue returns number|string|nil', () => {
    const output = readOutput('dnumslider.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@return number|string|nil');
    expect(output).toContain('function DNumSlider:GetDefaultValue() end');
    expect(output.match(new RegExp('^function DNumSlider:GetDefaultValue\\(', 'gm'))).toHaveLength(1);
  });

  test('Panel.GenerateExample types the sheet as the DPropertySheet the engine passes', () => {
    const output = readOutput('panel.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@param dpropertysheet DPropertySheet');
    expect(output).not.toContain('---@param dpropertysheet Panel');
    expect(output.match(new RegExp('^function Panel:GenerateExample\\(', 'gm'))).toHaveLength(1);
  });

  test("Panel.GenerateExample marks the class name parameter as the panel's own class", () => {
    const output = readOutput('panel.lua').replace(/\r\n/g, '\n');
    expect(output).toMatch(/---@\[call_arg\("gmod\.vgui_panel", "own_class"\)\]\n---@param class string /);
  });

  test('SKIN paint hooks take the control the engine paints them for', () => {
    const output = readOutput('custom_classes.lua').replace(/\r\n/g, '\n');
    const receivers: Record<string, string> = {
      PaintFrame: 'DFrame',
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
      PaintCategoryList: 'DCategoryList',
      PaintScrollBarGrip: 'DScrollBarGrip',
    };

    for (const [hook, receiver] of Object.entries(receivers)) {
      expect(output).toContain(`---@field ${hook} fun(self: SKIN, panel: ${receiver}, w: number, h: number)`);
    }

    expect(output).toContain('---@field PaintPanel fun(self: SKIN, panel: Panel, w: number, h: number)');
  });

  test('DComboBox.DropButton carries the back-reference the engine assigns', () => {
    const comboBox = readOutput('dcombobox.lua').replace(/\r\n/g, '\n');
    const classes = readOutput('custom_classes.lua').replace(/\r\n/g, '\n');
    expect(comboBox).toContain('---@field DropButton DComboBoxDropButton');
    expect(classes).toContain('---@class DComboBoxDropButton : DPanel');
    expect(classes).toContain('---@field ComboBox DComboBox');
  });

  test('SpawnIcon declares the Icon child created in Init', () => {
    const output = readOutput('spawnicon.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@field Icon ModelImage');
  });

  test('SpawnIcon ingests the internal resize menu contract', () => {
    const output = readOutput('spawnicon.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@param menu DMenu');
    expect(output).toContain('---@param callback fun(width: number, height: number)');
    expect(output).toContain('---@param label? string');
    expect(output).toContain('function SpawnIcon:InternalAddResizeMenu(menu, callback, label) end');
  });

  test('Entity.SetCreator accepts the engine nil and NULL domain', () => {
    const output = readOutput('entity.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@param ply Entity|NULL|nil');
    expect(output).toContain('function Entity:SetCreator(ply) end');
  });

  test.each([
    ['tool.lua', 'boolean', 'function Tool:GetClientBool('],
    ['dtree_node.lua', 'boolean', 'function DTree_Node:ShowIcons('],
    ['cnewparticleeffect.lua', 'number', 'function CNewParticleEffect:GetHighestControlPoint('],
    ['pathfollower.lua', 'PathSegment[]', 'function PathFollower:GetAllSegments('],
    ['pathfollower.lua', 'PathSegment?', 'function PathFollower:FirstSegment('],
    ['pathfollower.lua', 'PathSegment?', 'function PathFollower:LastSegment('],
    ['pathfollower.lua', 'PathSegment?', 'function PathFollower:GetCurrentGoal('],
    ['pathfollower.lua', 'PathSegment?', 'function PathFollower:NextSegment('],
    ['pathfollower.lua', 'PathSegment?', 'function PathFollower:PriorSegment('],
    ['utf8.lua', 'number|false', 'function utf8.len('],
  ])('%s return type matches its documented value: %s', (file, returnType, signature) => {
    const blocks = readOutput(file).replace(/\r\n/g, '\n').split(/\n\n+/).filter((part) => part.includes(signature));
    expect(blocks).toHaveLength(1);
    const escaped = returnType.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    expect(blocks[0]).toMatch(new RegExp(String.raw`^---@return ${escaped}(\s|$)`, 'm'));
  });

  test('Entity.DTVar returns data for supported types and may return nil for arbitrary strings', () => {
    const entity = readOutput('entity.lua').replace(/\r\n/g, '\n');
    const classes = readOutput('custom_classes.lua').replace(/\r\n/g, '\n');
    const blocks = entity.split(/\n\n+/).filter((part) => part.includes('function Entity:DTVar('));
    expect(blocks).toHaveLength(1);
    const dtvar = blocks[0];
    const supportedTypes = '"String"|"Bool"|"Float"|"Int"|"Vector"|"Angle"|"Entity"';
    for (const [type, args, nameIndex, result] of [
      [supportedTypes, 'name: string', 1, 'DTVarData'],
      [supportedTypes, 'slot: nil, name: string', 2, 'DTVarData'],
      [supportedTypes, 'slot: number, name: string', 2, 'DTVarData'],
      ['string', 'name: string', 1, 'DTVarData?'],
      ['string', 'slot: nil, name: string', 2, 'DTVarData?'],
    ]) {
      expect(dtvar).toContain(`---@[overload_call_arg(0, "gmod.network_var", "type")]\n---@[overload_call_arg(${nameIndex}, "gmod.network_var", "define_slot")]\n---@overload fun(type: ${type}, ${args}): ${result}\n`);
    }
    expect(dtvar).toContain('---@[call_arg("gmod.network_var", "type")]\n---@param type string ');
    expect(dtvar).toContain('---@param slot number ');
    expect(dtvar).toContain('---@[call_arg("gmod.network_var", "define_slot")]\n---@param name string ');
    expect(dtvar).toContain('---@return DTVarData? # The data table of the registered variable, or nil for an invalid type name.');
    expect(dtvar.match(/^---@overload /gm)).toHaveLength(5);
    const classBlocks = classes.split(/\n\n+/).filter((part) => part.includes('---@class DTVarData\n'));
    expect(classBlocks).toHaveLength(1);
    for (const field of ['index number', 'name string', 'typename string', 'element? string', 'SetFunc fun(', 'GetFunc fun(', 'Notify (']) {
      expect(classBlocks[0]).toContain(`---@field ${field}`);
    }
  });

  test('ents.Create only lists engine classes in its literal-class overload', () => {
    const output = readOutput('ents.lua').replace(/\r\n/g, '\n');
    const scriptedEntities = [
      'gmod_anchor', 'gmod_hands', 'gmod_cameraprop', 'gmod_wheel', 'gmod_winch_controller',
      'ragdoll_motion', 'widget_axis_arrow', 'widget_axis_disc', 'widget_bone', 'widget_bones',
    ];

    for (const name of scriptedEntities) {
      expect(output).not.toContain(`---| "${name}"`);
    }

    expect(output).toContain('---| "phys_constraint"');
    expect(output).toContain('---| "point_viewcontrol"');
    expect(output).toContain('---@overload fun(class: KnownEngineEntityClass): Entity|NULL');
    expect(output).toContain('---@return (instance) T|NULL # The created entity, or `NULL` if failed.');
  });

  test('Player.GetWeapon returns the weapon class it is asked for', () => {
    const output = readOutput('player.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@alias KnownEngineWeaponClass');
    for (const name of ['weapon_pistol', 'weapon_357', 'weapon_physgun', 'weapon_stunstick', 'weapon_bugbait']) {
      expect(output).toContain(`---| "${name}"`);
    }
    expect(output).not.toContain('---| "weapon_fists"');
    expect(output).toContain('---@overload fun(className: KnownEngineWeaponClass): Weapon|NULL');
    expect(output).toContain('---@generic T : Weapon');
    expect(output).toContain('---@param className `T` Class name of weapon');
    expect(output).toContain('---@return (instance) T|NULL');
    expect(output.match(new RegExp('^function Player:GetWeapon\\(', 'gm'))).toHaveLength(1);
  });

  test('util.GetPlayerTrace allows omitted direction for Players and requires it for NPCs', () => {
    const output = readOutput('util.lua').replace(/\r\n/g, '\n');
    const blocks = output.split(/\n\n+/).filter((part) => part.includes('function util.GetPlayerTrace('));
    expect(blocks).toHaveLength(1);
    expect(blocks[0]).toContain('---@realm shared');
    expect(blocks[0]).toContain('---@realm menu');
    expect(blocks[0]).toContain('---@overload fun(ply: Player, dir?: Vector): Trace\n');
    expect(blocks[0].match(/^---@overload /gm)).toHaveLength(1);
    expect(blocks[0]).toContain('---@param ply NPC');
    expect(blocks[0]).toContain('---@param dir Vector');
    expect(blocks[0]).not.toContain('---@param dir?');
    expect(blocks[0]).toContain('---@return Trace');
  });

  test('HullTrace is a Trace', () => {
    const output = readOutput('structures.lua').replace(/\r\n/g, '\n');
    expect(output).toContain('---@class HullTrace : Trace');
    expect(output).toContain('HullTrace.mins = nil');
    expect(output).toContain('HullTrace.maxs = nil');
  });

  test('os.time accepts the input shape of the Lua 5.1 contract', () => {
    const os = readOutput('os.lua').replace(/\r\n/g, '\n');
    const classes = readOutput('custom_classes.lua').replace(/\r\n/g, '\n');
    expect(os).toContain('---@param dateData? DateData|DateDataInput Table to generate the time from.');
    expect(os.match(new RegExp('^function os\\.time\\(', 'gm'))).toHaveLength(1);
    const inputBlocks = classes.split(/\n\n+/).filter((part) => part.includes('---@class DateDataInput'));
    expect(inputBlocks).toHaveLength(1);
    for (const field of ['year number', 'month number', 'day number', 'hour? number', 'min? number', 'sec? number', 'isdst? boolean']) {
      expect(inputBlocks[0]).toContain(`---@field ${field}`);
    }
  });

  test('Tool does not declare a StartGhostEntities the engine never defines', () => {
    const output = readOutput('tool.lua').replace(/\r\n/g, '\n');
    expect(output).not.toContain('StartGhostEntities');
    expect(output).toContain('function Tool:StartGhostEntity(ent) end');
  });

  test('undocumented menu functions the engine Lua calls are annotated for the menu realm', () => {
    const block = (output: string, name: string) => {
      const blocks = output.split(/\n\n+/).filter((part) => part.includes(`function ${name}(`));
      expect(blocks).toHaveLength(1);
      return blocks[0];
    };
    const setFavorite = block(readOutput('steamworks.lua').replace(/\r\n/g, '\n'), 'steamworks.SetFavorite');
    const serverAddress = block(readOutput('engine.lua').replace(/\r\n/g, '\n'), 'engine.CurrentServerAddress');
    expect(setFavorite).toContain('---@realm menu');
    expect(setFavorite).toContain('---@param workshopItemID string');
    expect(setFavorite).toContain('---@param favorite boolean');
    expect(serverAddress).toContain('---@realm menu');
    expect(serverAddress).toContain('---@return string?');
    expect(serverAddress).toContain('function engine.CurrentServerAddress() end');
  });

  test('engine weapon classes are declared as Weapon subclasses', () => {
    const classes = readOutput('custom_classes.lua').replace(/\r\n/g, '\n');
    for (const name of ['weapon_357', 'weapon_ar2', 'weapon_bugbait', 'weapon_crossbow', 'weapon_crowbar', 'weapon_frag', 'weapon_physcannon', 'weapon_physgun', 'weapon_pistol', 'weapon_rpg', 'weapon_shotgun', 'weapon_slam', 'weapon_smg1', 'weapon_stunstick']) {
      expect(classes).toContain(`---@class ${name} : Weapon`);
    }
  });

  test('weapon hooks state which classes their owner can be', () => {
    const weapon = readOutput('weapon.lua').replace(/\r\n/g, '\n');
    const hookBlock = (name: string) => {
      const blocks = weapon.split(/\n\n+/).filter((part) => part.includes(`function Weapon:${name}(`));
      expect(blocks).toHaveLength(1);
      return blocks[0];
    };
    for (const name of ['Think', 'Tick', 'Deploy', 'Reload', 'SecondaryAttack', 'DrawHUD', 'FreezeMovement', 'AdjustMouseSensitivity', 'CalcViewModelView', 'GetViewModelPosition', 'PreDrawViewModel', 'PostDrawViewModel', 'ViewModelDrawn', 'TranslateFOV', 'HUDShouldDraw', 'DoDrawCrosshair', 'DrawHUDBackground', 'CustomAmmoDisplay']) {
      const block = hookBlock(name);
      expect(block).toContain(`---@[self_call_type("GetOwner", "Player")]`);
      expect(block).not.toContain(`"NPC"`);
    }
    const primary = hookBlock('PrimaryAttack');
    expect(primary).toContain(`---@[self_call_type("GetOwner", "Player")]`);
    expect(primary).not.toContain(`"NPC"`);
    const npcPrimary = hookBlock('NPCShoot_Primary');
    expect(npcPrimary).toContain(`---@[self_call_type("GetOwner", "NPC", "server")]`);
    expect(npcPrimary).toContain(`---@[default_self_call("PrimaryAttack")]`);
    expect(hookBlock('Holster')).not.toContain('self_call_type');
    const npcSecondary = hookBlock('NPCShoot_Secondary');
    expect(npcSecondary).toContain(`---@[self_call_type("GetOwner", "NPC", "server")]`);
    expect(npcSecondary).toContain(`---@[not_engine_called]`);
    for (const [caller, callee] of [
      ['CanPrimaryAttack', 'Reload'],
      ['PrimaryAttack', 'CanPrimaryAttack'],
      ['PrimaryAttack', 'ShootBullet'],
      ['PrimaryAttack', 'TakePrimaryAmmo'],
      ['SecondaryAttack', 'CanSecondaryAttack'],
      ['SecondaryAttack', 'ShootBullet'],
      ['SecondaryAttack', 'TakeSecondaryAmmo'],
      ['NPCShoot_Secondary', 'SecondaryAttack'],
      ['ShootBullet', 'ShootEffects'],
      ['TakePrimaryAmmo', 'Ammo1'],
      ['TakeSecondaryAmmo', 'Ammo2'],
    ]) {
      expect(hookBlock(caller)).toContain(`---@[default_self_call("${callee}")]`);
    }
    for (const name of ['CanPrimaryAttack', 'CanSecondaryAttack', 'ShootBullet', 'ShootEffects', 'TakePrimaryAmmo', 'TakeSecondaryAmmo', 'Ammo1', 'Ammo2', 'DoShootEffect']) {
      expect(hookBlock(name)).toContain('---@[not_engine_called]');
    }
  });

  test('Lua implementations a scripted class replaces are marked replaceable once', () => {
    for (const [file, signature] of [
      ['weapon.lua', 'function Weapon:ShootBullet('],
      ['panel.lua', 'function Panel:OnDrop('],
      ['panel.lua', 'function Panel:ConVarChanged('],
    ]) {
      const output = readOutput(file).replace(/\r\n/g, '\n');
      const blocks = output.split(/\n\n+/).filter((part) => part.includes(signature));
      expect(blocks).toHaveLength(1);
      expect(blocks[0].split('---@[replaceable]\n')).toHaveLength(2);
    }
  });

  test('table.insert marks its list and its two-argument append value', () => {
    const output = readOutput('table.lua').replace(/\r\n/g, '\n');
    const blocks = output.split(/\n\n+/).filter((part) => part.includes('function table.insert('));
    expect(blocks).toHaveLength(1);
    expect(blocks[0]).toContain(`---@[overload_call_arg(1, "gmod.collection", "append_value")]`);
    expect(blocks[0]).toContain(`---@[call_arg("gmod.collection", "list")]`);
  });

  test('GWEN loads and control lookups carry the roles that type named controls', () => {
    const panel = readOutput('panel.lua').replace(/\r\n/g, '\n');
    const blocks = (signature: string) => panel.split(/\n\n+/).filter((part) => part.includes(signature));

    const load = blocks('function Panel:LoadGWENFile(');
    expect(load).toHaveLength(1);
    expect(load[0]).toMatch(/---@\[call_arg\("gmod\.gwen", "resource"\)\]\n---@param filename /);
    expect(load[0]).toMatch(/---@\[call_arg\("gmod\.gwen", "search_path"\)\]\n---@param path\? /);
    expect(load[0]).toContain(`---@[gwen_resource("resource/ui/DemoToVideo.gwen", "GwenDemoToVideo")]`);

    const find = blocks('function Panel:Find(');
    expect(find).toHaveLength(1);
    expect(find[0]).toMatch(/---@\[call_arg\("gmod\.gwen", "control_name"\)\]\n---@param panelName /);
    expect(find[0]).toContain('---@return Panel # foundPanel');
  });

  test('vetted Panel state methods preserve resource children', () => {
    const panel = readOutput('panel.lua');
    for (const name of ['Center', 'MakePopup', 'SetVisible', 'SetMouseInputEnabled', 'SetZPos', 'SetAlpha', 'SetCursor']) {
      const blocks = functionBlocks(panel, `function Panel:${name}(`);
      expect(blocks).toHaveLength(1);
      expect(blocks[0].match(/^---@\[keeps_children\]$/gm)).toHaveLength(1);
      expect(blocks[0]).toContain(`---@[keeps_children]\nfunction Panel:${name}(`);
      expect(signature(blocks[0])).toEqual(signature(readCustom(`Panel.${name}.lua`)));
    }
    for (const name of ['SetSize', 'SetPos', 'SetWide', 'SetTall', 'SetKeyboardInputEnabled', 'InvalidateLayout', 'SizeToContents', 'SetParent', 'Dock']) {
      const blocks = panel.split(/\n\n+/).filter((part) => part.includes(`function Panel:${name}(`));
      expect(blocks).toHaveLength(1);
      expect(blocks[0]).not.toContain('---@[keeps_children]');
    }
  });

  test('DFrame Center preserves resource children in its override slot', () => {
    const blocks = functionBlocks(readOutput('dframe.lua'), 'function DFrame:Center(');
    expect(blocks).toHaveLength(1);
    expect(blocks[0].match(/^---@\[keeps_children\]$/gm)).toHaveLength(1);
    expect(blocks[0]).toContain('---@[keeps_children]\nfunction DFrame:Center(');
  });

  test('the demo-to-video resource class names its controls with the types the resource creates', () => {
    const classes = readOutput('custom_classes.lua').replace(/\r\n/g, '\n');
    const demo = classes.split('---@class GwenDemoToVideo')[1]?.split(/\n\n|---@class /)[0];
    expect(demo).toBeDefined();
    for (const [name, type] of [
      ['btnStart', 'DButton'],
      ['inCodec', 'DComboBox'],
      ['inFPS', 'DTextEntry'],
      ['inDepthOfField', 'DComboBox'],
      ['inDOFBlurSize', 'DTextEntry'],
      ['inDrawHUD', 'DCheckBoxLabel'],
    ]) {
      expect(demo).toMatch(new RegExp(`^---@field ${name} ${type}$`, 'm'));
    }
    expect(demo!.match(/---@field /g)).toHaveLength(15);
  });

  test('panel animations retain the creating receiver in returns and callbacks', () => {
    const structures = readOutput('structures.lua');
    for (const annotation of [
      '---@class (partial) AnimationData<T: Panel>',
      '---@field Think fun(animData: table, tgtPanel: T, fraction: number)',
      '---@field OnEnd fun(animData: table, tgtPanel: T)',
      '---@field StartPos Vector',
    ]) {
      expect(structures).toContain(annotation);
    }
    const panels = readOutput('panel.lua');
    for (const name of ['NewAnimation', 'SizeTo', 'AlphaTo', 'ColorTo', 'MoveBy', 'MoveTo']) {
      const blocks = functionBlocks(panels, `function Panel:${name}(`);
      expect(blocks).toHaveLength(1);
      expect(signature(blocks[0])).toContain('param callback? fun(animData: table, targetPanel: self)');
      if (name === 'NewAnimation' || name === 'SizeTo') {
        expect(signature(blocks[0])).toContain('return AnimationData<self>');
      }
    }
  });

});
