---@meta

--- A base panel for things like [DModelSelect](https://wiki.facepunch.com/gmod/DModelSelect).
--- Basically, a list of panels that can be selected.
--- Selected panel can be retrieved and has visual indication of being selected.
---@realm client
---@source https://wiki.facepunch.com/gmod/DPanelSelect
---@deprecated This is derived from the deprecated DPanelList.
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

---Adds a panel to be selectable.
---@hook AddPanel
---@realm client
---@source https://wiki.facepunch.com/gmod/DPanelSelect:AddPanel
---@param pnl Panel The panel to add.
---@param conVars? table ConVars to set when this panel is selected. Keys are the cvar name, value is the value for that cvar.
function DPanelSelect:AddPanel(pnl, conVars) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally by [DPanelSelect:AddPanel](https://wiki.facepunch.com/gmod/DPanelSelect:AddPanel) to select the best default selected panel based on player's convars.
---@hook FindBestActive
---@realm client
---@source https://wiki.facepunch.com/gmod/DPanelSelect:FindBestActive
function DPanelSelect:FindBestActive() end

---Called when the selected panel changes.
---@hook OnActivePanelChanged
---@realm client
---@source https://wiki.facepunch.com/gmod/DPanelSelect:OnActivePanelChanged
---@param oldPnl Panel Old selected panel.
---@param newPnl Panel New selected panel.
function DPanelSelect:OnActivePanelChanged(oldPnl, newPnl) end

---Selects a given panel.
---@hook SelectPanel
---@realm client
---@source https://wiki.facepunch.com/gmod/DPanelSelect:SelectPanel
---@param pnl Panel Panel to select. It should've been added previously via DPanelSelect:AddPanel.
function DPanelSelect:SelectPanel(pnl) end
