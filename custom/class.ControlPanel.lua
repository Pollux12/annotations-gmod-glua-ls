--- Used by the context menu in sandbox.
---@class ControlPanel : DForm
local ControlPanel = {}

---Adds a [DLabel](https://wiki.facepunch.com/gmod/DLabel) to the ControlPanel as a helper text. Functionally equivalent to [DForm:Help](https://wiki.facepunch.com/gmod/DForm:Help).
---@realm client
---@param text string The text to display.
---@return DLabel # The created DLabel.
function ControlPanel:Label(text) end

---Creates the tool preset selector panel for this control panel.
---@realm client
---@param group string The presets group. Must be unique.
---@param cvarList table<string, any> The convar defaults used by the preset control.
---@return ControlPresets # The created ControlPresets panel.
function ControlPanel:ToolPresets(group, cvarList) end
