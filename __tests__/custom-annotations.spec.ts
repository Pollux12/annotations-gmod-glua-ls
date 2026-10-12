import fs from 'fs';
import path from 'path';

describe('custom and plugin annotation smoke checks', () => {
  const customRoot = path.join(process.cwd(), 'custom');
  const outputRoot = path.join(process.cwd(), 'output');

  const readCustom = (file: string) => fs.readFileSync(path.join(customRoot, file), 'utf8');
  const readOutput = (file: string) => fs.readFileSync(path.join(outputRoot, file), 'utf8');

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

});
