---@meta

--- The default SpawnmenuContentPanel
--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnmenuContentPanel
---@class (partial) SpawnmenuContentPanel : DPanel
---@field SelectedPanel? Panel The currently selected content panel.
---@field HorizontalDivider DHorizontalDivider The panel splitter used to host the selected content panel.
---@field ContentNavBar ContentSidebar The navigation sidebar for spawn menu content.
---@field OldSpawnlists table? Previous spawnlists passed to content population hooks.
local SpawnmenuContentPanel = {}

---Changes the Spawnmenu category to search in
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:CallPopulateHook
---@param hookname string The Hook name
function SpawnmenuContentPanel:CallPopulateHook(hookname) end

---Allows the modification of the ContentSidebar
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:EnableModify
function SpawnmenuContentPanel:EnableModify() end

---Changes the Spawnmenu category to search in
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:EnableSearch
---@param category string The category
---@param hookname string The Hook name
function SpawnmenuContentPanel:EnableSearch(category, hookname) end

---Switches the current panel with the given panel
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:SwitchPanel
---@param panel Panel Panel to switch to
function SpawnmenuContentPanel:SwitchPanel(panel) end
