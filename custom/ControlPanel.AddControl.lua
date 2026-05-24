---Adds a control to the control panel.
---@realm client
---@source https://wiki.facepunch.com/gmod/ControlPanel:AddControl
---@overload fun(self: ControlPanel, type: "color", controlinfo: table): CtrlColor
---@param type string The control type to add.
---@param controlinfo table Each control takes their own table structure.
---@return Panel control The created control.
---@deprecated It is recommended to use DForm's members instead.
function ControlPanel:AddControl(type, controlinfo) end

