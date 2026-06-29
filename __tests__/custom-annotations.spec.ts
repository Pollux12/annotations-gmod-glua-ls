import fs from 'fs';
import path from 'path';

describe('custom and plugin annotation smoke checks', () => {
  const customRoot = path.join(process.cwd(), 'custom');
  const outputRoot = path.join(process.cwd(), 'output');

  const readCustom = (file: string) => fs.readFileSync(path.join(customRoot, file), 'utf8');
  const readOutput = (file: string) => fs.readFileSync(path.join(outputRoot, file), 'utf8');

  const significantOverrideLines = (content: string) =>
    content
      .split(/\r?\n/)
      .map((line) => line.trimEnd())
      .filter((line) => line.startsWith('---@') || /^function\s+/.test(line))
      .filter((line) => !line.startsWith('---@meta') && !line.startsWith('---@source'));

  const expectCustomLinesInOutput = (customFile: string, outputFile: string) => {
    const customLines = significantOverrideLines(readCustom(customFile));
    const output = readOutput(outputFile);

    expect(customLines.length).toBeGreaterThan(0);
    for (const line of customLines) {
      expect(output).toContain(line);
    }
  };

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

  test('custom overrides propagate their annotation surface to generated output', () => {
    const directOutputs: Array<[string, string]> = [
      ['class.ContentSidebar.lua', 'contentsidebar.lua'],
      ['class.ContextBase.lua', 'contextbase.lua'],
      ['class.DColorCube.lua', 'dcolorcube.lua'],
      ['class.DFrame.lua', 'dframe.lua'],
      ['class.DHTMLControls.lua', 'dhtmlcontrols.lua'],
      ['class.DImage.lua', 'dimage.lua'],
      ['class.DImageButton.lua', 'dimagebutton.lua'],
      ['class.DListView.lua', 'dlistview.lua'],
      ['class.DMenu.lua', 'dmenu.lua'],
      ['class.DMenuBar.lua', 'dmenubar.lua'],
      ['class.DMenuOption.lua', 'dmenuoption.lua'],
      ['class.EFFECT.lua', 'effect.lua'],
      ['DDragBase.DropAction_Copy.lua', 'ddragbase.lua'],
      ['DDragBase.DropAction_Normal.lua', 'ddragbase.lua'],
      ['DDragBase.DropAction_Simple.lua', 'ddragbase.lua'],
      ['DFileBrowser.SetOpen.lua', 'dfilebrowser.lua'],
      ['DImage.SetMatName.lua', 'dimage.lua'],
      ['DMenu.SetOpenSubMenu.lua', 'dmenu.lua'],
      ['DPanelList.Clear.lua', 'dpanellist.lua'],
      ['Panel.PerformLayout.lua', 'panel.lua'],
      ['TOOL.BuildCPanel.lua', 'tool.lua'],
      ['TOOL.Deploy.lua', 'tool.lua'],
      ['TOOL.Holster.lua', 'tool.lua'],
      ['class.Weapon.lua', 'weapon.lua'],
      ['Weapon.GetToolObject.lua', 'weapon.lua'],
      ['constraint.Elastic.lua', 'constraint.lua'],
      ['constraint.Weld.lua', 'constraint.lua'],
      ['ContentHeader.OpenMenu.lua', 'contentheader.lua'],
      ['Global.collectgarbage.lua', 'global.lua'],
      ['Weapon.GetToolObject.lua', 'weapon.lua'],
      ['workshopfilebase.FillFileInfo.lua', 'workshopfilebase.lua'],
    ];

    for (const [customFile, outputFile] of directOutputs) {
      expectCustomLinesInOutput(customFile, outputFile);
    }
  });

  test('custom class fragments are included in the generated custom class bundle', () => {
    const customClasses = readOutput('custom_classes.lua');
    const classFiles = [
      'class.EngineEntities.lua',
      'class.EnginePanels.lua',
      'class.SKIN.lua',
      'class.SkeletonConvertor.lua',
      'class.base_ai.lua',
      'class.base_gmodentity.lua',
      'class.env_fire.lua',
      'class.prop_dynamic_override.lua',
      'class.prop_ragdoll.lua',
      'class.prop_vehicle_prisoner_pod.lua',
    ];

    for (const customFile of classFiles) {
      for (const line of significantOverrideLines(readCustom(customFile))) {
        expect(customClasses).toContain(line);
      }
    }
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

  test('menu-only custom overrides stay absent', () => {
    const removedFiles = [
      'UGCPublishWindow.DoPublish.lua',
      'Global.IsHostingGame.lua',
      'steamworks.SetFavorite.lua',
      'workshopfilebase.dupes.lua',
    ];

    for (const file of removedFiles) {
      expect(fs.existsSync(path.join(customRoot, file))).toBe(false);
    }

    const workshopFileBaseOutput = readOutput('workshopfilebase.lua');
    expect(workshopFileBaseOutput).not.toContain('DupeWorkshopFileBase');
    expect(workshopFileBaseOutput).not.toContain('ws_dupe');
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
});
