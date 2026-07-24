---@class (partial) ControlPresets : Panel
---@field Label DLabel The visible preset group label, assigned by the control panel builder.
---@field DropDown DComboBox The preset selection dropdown.
---@field Button DImageButton The edit-preset button.
---@field AddButton DImageButton The quick-save button.
---@field Options table<string, any> Available preset option data.
---@field ConVars table<string, any> Console variables managed by this preset control.
local ControlPresets = {}
