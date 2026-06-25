---@class (partial) SpawnmenuContentPanel : DPanel
---@field SelectedPanel? Panel The currently selected content panel.
---@field HorizontalDivider DHorizontalDivider The panel splitter used to host the selected content panel.
---@field ContentNavBar ContentSidebar The navigation sidebar for spawn menu content.
---@field OldSpawnlists table? Previous spawnlists passed to content population hooks.
local SpawnmenuContentPanel = {}
