---@class DPanelSelect : DPanelList
---@field SelectedPanel? Panel
---@field OldSelectedPaintOver? function
local DPanelSelect = {}

---Adds a selectable panel to the panel select list.
---@realm client
---@param panel Panel The panel to add.
---@param convars? table<string, any> ConVar values associated with the panel.
function DPanelSelect:AddPanel(panel, convars) end

---Selects a panel and applies its associated ConVar values.
---@realm client
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/vgui/dpanelselect.lua
---@param panel Panel The panel to select.
function DPanelSelect:SelectPanel(panel) end
