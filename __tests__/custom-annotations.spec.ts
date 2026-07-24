import fs from 'fs';
import path from 'path';

describe('custom and plugin annotation smoke checks', () => {
  const customRoot = path.join(process.cwd(), 'custom');
  const outputRoot = path.join(process.cwd(), 'output');

  const readCustom = (file: string) => fs.readFileSync(path.join(customRoot, file), 'utf8');
  const readOutput = (file: string) => fs.readFileSync(path.join(outputRoot, file), 'utf8');
  const generatedLua = () =>
    (fs.readdirSync(outputRoot, { recursive: true }) as string[])
      .filter((file) => file.endsWith('.lua'))
      .map((file) => fs.readFileSync(path.join(outputRoot, file), 'utf8'))
      .join('\n');

  const significantOverrideLines = (content: string) =>
    content
      .split(/\r?\n/)
      .map((line) => line.trimEnd())
      .filter((line) => line.startsWith('---@') || /^function\s+/.test(line))
      .filter((line) => !line.startsWith('---@meta') && !line.startsWith('---@source'));

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

  test('custom override declarations are included in generated output', () => {
    const output = generatedLua();
    const customFiles = fs.readdirSync(customRoot).filter((file) => file.endsWith('.lua'));

    expect(customFiles.length).toBeGreaterThan(0);

    for (const customFile of customFiles) {
      for (const line of significantOverrideLines(readCustom(customFile))) {
        expect(output).toContain(line);
      }
    }
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
});
