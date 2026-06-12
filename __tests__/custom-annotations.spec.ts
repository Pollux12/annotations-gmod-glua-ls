import fs from 'fs';
import path from 'path';

describe('custom and plugin annotation smoke checks', () => {
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

  test('new custom class overrides and global alias are present', () => {
    const customRoot = path.join(process.cwd(), 'custom');
    const globals = fs.readFileSync(path.join(customRoot, '_globals.lua'), 'utf8');
    const dCheckBoxLabel = fs.readFileSync(path.join(customRoot, 'class.DCheckBoxLabel.lua'), 'utf8');
    const dHtmlControls = fs.readFileSync(path.join(customRoot, 'class.DHTMLControls.lua'), 'utf8');
    const dPanelList = fs.readFileSync(path.join(customRoot, 'class.DPanelList.lua'), 'utf8');
    const httpRequest = fs.readFileSync(path.join(customRoot, 'HTTPRequest.lua'), 'utf8');
    const globalHttp = fs.readFileSync(path.join(customRoot, 'Global.HTTP.lua'), 'utf8');
    const entsCreate = fs.readFileSync(path.join(customRoot, 'ents.Create.lua'), 'utf8');
    const vehicleGetDriver = fs.readFileSync(path.join(customRoot, 'Vehicle.GetDriver.lua'), 'utf8');
    const getNWEntity = fs.readFileSync(path.join(customRoot, 'Entity.GetNWEntity.lua'), 'utf8');
    const getNW2Entity = fs.readFileSync(path.join(customRoot, 'Entity.GetNW2Entity.lua'), 'utf8');
    const getNetworkedEntity = fs.readFileSync(path.join(customRoot, 'Entity.GetNetworkedEntity.lua'), 'utf8');
    const getNetworked2Entity = fs.readFileSync(path.join(customRoot, 'Entity.GetNetworked2Entity.lua'), 'utf8');
    const dPropertySheetAddSheet = fs.readFileSync(path.join(customRoot, 'DPropertySheet.AddSheet.lua'), 'utf8');
    const ctrlColor = fs.readFileSync(path.join(customRoot, 'class.CtrlColor.lua'), 'utf8');
    const controlPanelAddControl = fs.readFileSync(path.join(customRoot, 'ControlPanel.AddControl.lua'), 'utf8');
    const entityCopyData = fs.readFileSync(path.join(customRoot, 'EntityCopyData.lua'), 'utf8');
    const duplicatorCreateEntityFromTable = fs.readFileSync(path.join(customRoot, 'duplicator.CreateEntityFromTable.lua'), 'utf8');
    const osDate = fs.readFileSync(path.join(customRoot, 'os.date.lua'), 'utf8');
    const tableCopy = fs.readFileSync(path.join(customRoot, 'table.Copy.lua'), 'utf8');
    const contentContainer = fs.readFileSync(path.join(customRoot, 'class.ContentContainer.lua'), 'utf8');
    const propVehiclePrisonerPod = fs.readFileSync(path.join(customRoot, 'class.prop_vehicle_prisoner_pod.lua'), 'utf8');
    const propRagdoll = fs.readFileSync(path.join(customRoot, 'class.prop_ragdoll.lua'), 'utf8');
    const propDynamicOverride = fs.readFileSync(path.join(customRoot, 'class.prop_dynamic_override.lua'), 'utf8');
    const envFire = fs.readFileSync(path.join(customRoot, 'class.env_fire.lua'), 'utf8');
    const matProxyData = fs.readFileSync(path.join(customRoot, 'MatProxyData.lua'), 'utf8');
    const iMaterialSetTexture = fs.readFileSync(path.join(customRoot, 'IMaterial.SetTexture.lua'), 'utf8');
    const vguiRegisterFile = fs.readFileSync(path.join(customRoot, 'vgui.RegisterFile.lua'), 'utf8');
    const viewData = fs.readFileSync(path.join(customRoot, 'ViewData.lua'), 'utf8');
    const generatedVgui = fs.readFileSync(path.join(process.cwd(), 'output', 'vgui.lua'), 'utf8');
    const generatedStructures = fs.readFileSync(path.join(process.cwd(), 'output', 'structures.lua'), 'utf8');

    expect(globals).toMatch(/---@alias GPlayer Player/);
    expect(globals).toMatch(/---@class NULL : Entity/);
    expect(globals).toMatch(/---@alias EntityOrNULL Entity\|NULL/);
    expect(globals).toMatch(/---@type NULL/);

    expect(dCheckBoxLabel).toMatch(/---@class DCheckBoxLabel : Panel/);
    expect(dCheckBoxLabel).toMatch(/---@field Button DCheckBox/);
    expect(dCheckBoxLabel).toMatch(/---@field Label DLabel/);

    expect(dHtmlControls).toMatch(/---@class DHTMLControls : Panel/);
    expect(dHtmlControls).toMatch(/---@field AddressBar DTextEntry/);

    expect(dPanelList).toMatch(/---@class DPanelList : DPanel/);
    expect(dPanelList).toMatch(/---@field Items Panel\[]/);

    expect(httpRequest).toMatch(/---@alias HTTPRequestMethodWithParameters/);
    expect(httpRequest).toMatch(/---@class \(exact\) HTTPRequestWithParameters : HTTPRequest/);
    expect(httpRequest).toMatch(/---@class \(exact\) HTTPRequestWithoutParameters : HTTPRequest/);
    expect(httpRequest).toMatch(/---@field method\? string/);
    expect(httpRequest).toMatch(/---@field parameters\? HTTPRequestParameters/);
    expect(httpRequest).toMatch(/---@field parameters nil/);
    expect(globalHttp).toMatch(/---@overload fun\(parameters: HTTPRequestWithParameters\): boolean/);
    expect(globalHttp).toMatch(/---@param parameters HTTPRequest The request parameters/);

    expect(entsCreate).toMatch(/---@return \(instance\) T\|NULL/);
    expect(vehicleGetDriver).toMatch(/---@return Player\|NULL driver/);
    expect(getNWEntity).toMatch(/---@overload fun\(self: Entity, key: string\): Entity\|NULL/);
    expect(getNW2Entity).toMatch(/---@overload fun\(self: Entity, key: string\): Entity\|NULL/);
    expect(getNetworkedEntity).toMatch(/---@overload fun\(self: Entity, key: string\): Entity\|NULL/);
    expect(getNetworked2Entity).toMatch(/---@overload fun\(self: Entity, key: string\): Entity\|NULL/);

    expect(dPropertySheetAddSheet).toMatch(/---@class DPropertySheetSheet/);
    expect(dPropertySheetAddSheet).toMatch(/---@field Tab DTab/);
    expect(dPropertySheetAddSheet).toMatch(/---@return DPropertySheetSheet/);
    expect(ctrlColor).toMatch(/---@class CtrlColor : Panel/);
    expect(ctrlColor).toMatch(/---@field Mixer DColorMixer/);
    expect(controlPanelAddControl).toMatch(/---@overload fun\(self: ControlPanel, type: "color", controlinfo: table\): CtrlColor/);
    expect(controlPanelAddControl).toMatch(/---@return Panel/);

    expect(entityCopyData).toMatch(/---@class \(partial\) EntityCopyData/);
    expect(entityCopyData).toMatch(/---@field Class string/);
    expect(entityCopyData).toMatch(/---@field Pos\? Vector/);
    expect(entityCopyData).toMatch(/---@field Angle\? Angle/);
    expect(entityCopyData).toMatch(/---@field Name\? string/);
    expect(entityCopyData).toMatch(/---@field PhysicsObjects\? table/);
    expect(duplicatorCreateEntityFromTable).toMatch(/---@param entTable EntityCopyData/);

    expect(osDate).toMatch(/---@param format\? string/);
    expect(tableCopy).toMatch(/---@generic T : table/);
    expect(tableCopy).toMatch(/---@param originalTable T/);
    expect(tableCopy).toMatch(/---@return T/);

    expect(contentContainer).toMatch(/---@class ContentContainer : DIconLayout/);
    expect(contentContainer).toMatch(/function ContentContainer:SetTriggerSpawnlistChange\(trigger\) end/);

    expect(propVehiclePrisonerPod).toMatch(/---@class prop_vehicle_prisoner_pod : Vehicle/);
    expect(propRagdoll).toMatch(/---@class prop_ragdoll : Entity/);
    expect(propDynamicOverride).toMatch(/---@class prop_dynamic_override : Entity/);
    expect(envFire).toMatch(/---@class env_fire : Entity/);

    expect(matProxyData).toMatch(/---@field init\? fun\(self: MatProxyData, mat: IMaterial, values: table\)/);
    expect(matProxyData).toMatch(/---@field bind fun\(self: MatProxyData, mat: IMaterial, ent: Entity\)/);
    expect(iMaterialSetTexture).toMatch(/---@param texture ITexture\|string/);
    expect(vguiRegisterFile).toMatch(/---@\[call_arg\("gmod\.load", "include"\)\]/);
    expect(vguiRegisterFile).toMatch(/---@\[call_arg\("gmod\.vgui_panel", "register_file"\)\]/);
    expect(generatedVgui).toMatch(/---@\[call_arg\("gmod\.load", "include"\)\]/);
    expect(generatedVgui).toMatch(/---@\[call_arg\("gmod\.vgui_panel", "register_file"\)\]/);
    expect(viewData).toMatch(/---@field origin\? Vector/);
    expect(viewData).toMatch(/---@field angles\? Angle/);
    expect(viewData).toMatch(/---@field offcenter\? table/);
    expect(generatedStructures).toMatch(/---@field origin\? Vector/);
    expect(generatedStructures).toMatch(/---@field angles\? Angle/);
    expect(generatedStructures).toMatch(/---@field offcenter\? table/);
  });

  test('iterator overrides expose typed generic-for values', () => {
    const customRoot = path.join(process.cwd(), 'custom');
    const playerIterator = fs.readFileSync(path.join(customRoot, 'player.Iterator.lua'), 'utf8');
    const entsIterator = fs.readFileSync(path.join(customRoot, 'ents.Iterator.lua'), 'utf8');

    expect(playerIterator).toMatch(/---@return fun\(tbl: any, prev: integer\?\): integer, Player # The iterator function\./);
    expect(playerIterator).toMatch(/---@return Player\[] # Table of all existing Player/);
    expect(playerIterator).toMatch(/---@return integer # The origin index \(0\)\./);

    expect(entsIterator).toMatch(/---@return fun\(tbl: any, prev: integer\?\): integer, Entity # The iterator function\./);
    expect(entsIterator).toMatch(/---@return Entity\[] # Table of all existing Entity/);
    expect(entsIterator).toMatch(/---@return integer # The origin index \(0\)\./);
  });

});
