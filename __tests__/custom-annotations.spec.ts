import fs from 'fs';
import path from 'path';

describe('custom and plugin annotation smoke checks', () => {
  const customRoot = path.join(process.cwd(), 'custom');
  const outputRoot = path.join(process.cwd(), 'output');

  const readCustom = (file: string) => fs.readFileSync(path.join(customRoot, file), 'utf8');
  const readOutput = (file: string) => fs.readFileSync(path.join(outputRoot, file), 'utf8');

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

  test('cami plugin declares the library as shipped, with optional callbacks and sources', () => {
    const camiLua = fs
      .readFileSync(path.join(process.cwd(), 'plugin', 'cami', 'annotations', 'cami.lua'), 'utf8')
      .replace(/\r\n/g, '\n');

    for (const fn of [
      'RegisterUsergroup(usergroup, source)',
      'UnregisterUsergroup(usergroupName, source)',
      'GetUsergroups()',
      'GetUsergroup(usergroupName)',
      'UsergroupInherits(usergroupName, potentialAncestor)',
      'InheritanceRoot(usergroupName)',
      'RegisterPrivilege(privilege)',
      'UnregisterPrivilege(privilegeName)',
      'GetPrivileges()',
      'GetPrivilege(privilegeName)',
      'PlayerHasAccess(actorPly, privilegeName, callback, targetPly, extraInfoTbl)',
      'GetPlayersWithAccess(privilegeName, callback, targetPly, extraInfoTbl)',
      'SteamIDHasAccess(actorSteam, privilegeName, callback, targetSteam, extraInfoTbl)',
      'SignalUserGroupChanged(ply, old, new, source)',
      'SignalSteamIDUserGroupChanged(steamId, old, new, source)',
    ]) {
      expect(camiLua).toContain(`function CAMI.${fn} end`);
    }
    expect(camiLua).toContain(
      '---@param callback? fun(hasAccess: boolean, reason: string?) Callback to receive the answer, or nil for synchronous.\n',
    );
    expect(camiLua).toContain('---@return CAMIPrivilege? # Returns nil when the privilege does not exist.\n');
    expect(camiLua.match(/^---@param source\? any /gm)).toHaveLength(4);
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
      'UGCPublishWindow.DoPublish.lua',
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
    expect(formattedTimeBlock).toContain('---@overload fun(seconds: number): FormattedTime');
    expect(formattedTimeBlock).toContain('---@overload fun(seconds: number, format: nil): FormattedTime');
    expect(formattedTimeBlock).toContain('---@param seconds? number Number of seconds to format.');
    expect(formattedTimeBlock).toContain('---@param format? string The format string.');
    expect(formattedTimeBlock).toContain('---@return string|FormattedTime');
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

  test('weapons are owned by the player or NPC that equips them', () => {
    const weaponLua = readOutput('weapon.lua').replace(/\r\n/g, '\n');

    expect(weaponLua).toContain(
      '---@return Player|NPC|NULL # The player or NPC holding the weapon, or NULL while it is not equipped.\nfunction Weapon:GetOwner() end',
    );
    expect(weaponLua).toContain(
      '---@param NewOwner Player|NPC The one who picked the weapon up. Can be Player or NPC.\nfunction Weapon:Equip(NewOwner) end',
    );
    expect(weaponLua.match(/^function Weapon:Equip\(/gm)).toHaveLength(1);
    expect(weaponLua).toContain('---Called when a player or NPC has picked the weapon up.\n---@hook Equip');
  });

  test('DispatchTraceAttack accepts the start and end positions shipped gamemodes pass', () => {
    const output = readOutput('entity.lua').replace(/\r\n/g, '\n');
    const anchor = output.indexOf('function Entity:DispatchTraceAttack(damageInfo, traceRes, dir) end');
    expect(anchor).toBeGreaterThanOrEqual(0);
    const block = output.slice(output.lastIndexOf('\n\n', anchor), anchor);
    for (const line of [
      '---Performs a trace attack towards the entity this function is called on, as if an invisible bullet is shot towards it. Visually identical to [Entity:TakeDamageInfo](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo).',
      '---@source https://wiki.facepunch.com/gmod/Entity:DispatchTraceAttack',
      '---@param damageInfo CTakeDamageInfo The damage to apply.',
      '---@param traceRes TraceResult Trace result to use to deal damage. See Structures/TraceResult',
      '---@param dir? Vector Direction of the attack.',
      '---@overload fun(self: Entity, damageInfo: CTakeDamageInfo, startPos: Vector, endPos: Vector)',
    ]) {
      expect(block).toContain(line);
    }
    expect(output.match(/^function Entity:DispatchTraceAttack\(/gm)).toHaveLength(1);
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

});
