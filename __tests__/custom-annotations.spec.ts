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
    const dMenuAddPanel = fs.readFileSync(path.join(customRoot, 'DMenu.AddPanel.lua'), 'utf8');
    const dCheckBoxSetValue = fs.readFileSync(path.join(customRoot, 'DCheckBox.SetValue.lua'), 'utf8');
    const dCheckBoxSetChecked = fs.readFileSync(path.join(customRoot, 'DCheckBox.SetChecked.lua'), 'utf8');
    const dCheckBoxLabelSetValue = fs.readFileSync(path.join(customRoot, 'DCheckBoxLabel.SetValue.lua'), 'utf8');
    const dCheckBoxLabelSetChecked = fs.readFileSync(path.join(customRoot, 'DCheckBoxLabel.SetChecked.lua'), 'utf8');
    const dFileBrowserSetOpen = fs.readFileSync(path.join(customRoot, 'DFileBrowser.SetOpen.lua'), 'utf8');
    const dPropertyGenericValueChanged = fs.readFileSync(path.join(customRoot, 'DProperty_Generic.ValueChanged.lua'), 'utf8');
    const dSliderSetNotches = fs.readFileSync(path.join(customRoot, 'DSlider.SetNotches.lua'), 'utf8');
    const panelAdd = fs.readFileSync(path.join(customRoot, 'Panel.Add.lua'), 'utf8');
    const panelSetSelectionCanvas = fs.readFileSync(path.join(customRoot, 'Panel.SetSelectionCanvas.lua'), 'utf8');
    const panelGetCookie = fs.readFileSync(path.join(customRoot, 'Panel.GetCookie.lua'), 'utf8');
    const panelGetCookieNumber = fs.readFileSync(path.join(customRoot, 'Panel.GetCookieNumber.lua'), 'utf8');
    const panelSetCookie = fs.readFileSync(path.join(customRoot, 'Panel.SetCookie.lua'), 'utf8');
    const cookieSet = fs.readFileSync(path.join(customRoot, 'cookie.Set.lua'), 'utf8');
    const propertyAdd = fs.readFileSync(path.join(customRoot, 'PropertyAdd.lua'), 'utf8');
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
    const renderClearRenderTarget = fs.readFileSync(path.join(customRoot, 'render.ClearRenderTarget.lua'), 'utf8');
    const vguiRegisterFile = fs.readFileSync(path.join(customRoot, 'vgui.RegisterFile.lua'), 'utf8');
    const viewData = fs.readFileSync(path.join(customRoot, 'ViewData.lua'), 'utf8');
    const engineEntities = fs.readFileSync(path.join(customRoot, 'class.EngineEntities.lua'), 'utf8');
    const enginePanels = fs.readFileSync(path.join(customRoot, 'class.EnginePanels.lua'), 'utf8');
    const generatedCustomClasses = fs.readFileSync(path.join(process.cwd(), 'output', 'custom_classes.lua'), 'utf8');
    const generatedDPropertyGeneric = fs.readFileSync(path.join(process.cwd(), 'output', 'dproperty_generic.lua'), 'utf8');
    const generatedDSlider = fs.readFileSync(path.join(process.cwd(), 'output', 'dslider.lua'), 'utf8');
    const generatedPanel = fs.readFileSync(path.join(process.cwd(), 'output', 'panel.lua'), 'utf8');
    const generatedVgui = fs.readFileSync(path.join(process.cwd(), 'output', 'vgui.lua'), 'utf8');
    const generatedRender = fs.readFileSync(path.join(process.cwd(), 'output', 'render.lua'), 'utf8');
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
    expect(dMenuAddPanel).toMatch(/---@param pnl T The panel that you want to add\./);
    expect(dCheckBoxSetValue).toMatch(/---@param checked any/);
    expect(dCheckBoxSetChecked).toMatch(/---@param checked any/);
    expect(dCheckBoxLabelSetValue).toMatch(/---@param checked any/);
    expect(dCheckBoxLabelSetChecked).toMatch(/---@param checked any/);
    expect(dFileBrowserSetOpen).toMatch(/---@param open any/);
    expect(dFileBrowserSetOpen).toMatch(/---@param useAnim\? boolean/);
    expect(dPropertyGenericValueChanged).toMatch(/---@param force\? boolean/);
    expect(generatedDPropertyGeneric).toMatch(/---@param force\? boolean/);
    expect(dSliderSetNotches).toMatch(/---@param notches\? number/);
    expect(generatedDSlider).toMatch(/---@param notches\? number/);
    expect(panelAdd).toMatch(/---@overload fun\(self: Panel, className: `T`, parent: Panel\): T/);
    expect(panelSetSelectionCanvas).toMatch(/---@param set boolean\|Panel/);
    expect(generatedPanel).toMatch(/---@overload fun\(self: Panel, className: `T`, parent: Panel\): T/);
    expect(generatedPanel).toMatch(/---@param set boolean\|Panel/);
    expect(panelGetCookie).toMatch(/---@param default\? string/);
    expect(panelGetCookie).toMatch(/---@return string\|nil/);
    expect(panelGetCookieNumber).toMatch(/---@param default\? number/);
    expect(panelGetCookieNumber).toMatch(/---@return number\|nil/);
    expect(panelSetCookie).toMatch(/---@param value\? string\|number\|boolean/);
    expect(cookieSet).toMatch(/---@param value\? string\|number\|boolean/);
    expect(propertyAdd).toMatch(/---@field Filter fun\(self: PropertyAddRuntime, ent: Entity, player: Player\):\(check: boolean\)/);
    expect(propertyAdd).toMatch(/---@class \(partial\) PropertyAddRuntime : PropertyAdd/);
    expect(propertyAdd).toMatch(/---@field \[string\] any/);
    expect(propertyAdd).toMatch(/---@field MsgStart fun\(self: PropertyAddRuntime\)/);
    expect(propertyAdd).toMatch(/---@field MsgEnd fun\(self: PropertyAddRuntime\)/);
    expect(generatedStructures).toMatch(/---@field Filter fun\(self: PropertyAddRuntime, ent: Entity, player: Player\):\(check: boolean\)/);
    expect(generatedStructures).toMatch(/---@class \(partial\) PropertyAddRuntime : PropertyAdd/);
    expect(generatedStructures).toMatch(/---@field \[string\] any/);
    expect(generatedStructures).toMatch(/---@field MsgStart fun\(self: PropertyAddRuntime\)/);
    expect(generatedStructures).toMatch(/---@field MsgEnd fun\(self: PropertyAddRuntime\)/);

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
    expect(renderClearRenderTarget).toMatch(/---@param color Color/);
    expect(generatedRender).toMatch(/---@param color Color The color\./);
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
    expect(engineEntities).toMatch(/---@class phys_constraintsystem : Entity/);
    expect(engineEntities).toMatch(/---@class gmod_winch_controller : Entity/);
    expect(engineEntities).toMatch(/---@class hunter_flechette : Entity/);
    expect(enginePanels).toMatch(/---@class \(partial\) Chromium : HTML/);
    expect(enginePanels).toMatch(/---@class \(partial\) ModelImage : Panel/);
    expect(enginePanels).toMatch(/---@class \(partial\) URLLabel : Label/);
    expect(generatedCustomClasses).toMatch(/---@class phys_constraintsystem : Entity/);
    expect(generatedCustomClasses).toMatch(/---@class gmod_winch_controller : Entity/);
    expect(generatedCustomClasses).toMatch(/---@class hunter_flechette : Entity/);
    expect(generatedCustomClasses).toMatch(/---@class \(partial\) Chromium : HTML/);
    expect(generatedCustomClasses).toMatch(/---@class \(partial\) ModelImage : Panel/);
    expect(generatedCustomClasses).toMatch(/---@class \(partial\) URLLabel : Label/);
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
