---@class SpawnMenu : EditablePanel
---@field HorizontalDivider DHorizontalDivider The central horizontal divider panel.
---@field ToolMenu ToolMenu The right-side tool menu panel.
---@field CreateMenu CreationMenu The left-side creation/content menu panel.
---@field ToolToggle DImageButton The button that toggles the tool menu visibility.
---@field m_bHangOpen boolean Whether the spawn menu stays open (hang-open mode).
---@field CustomizableSpawnlistNode? DTree_Node Injected reference to the customizable spawnlist node (optional).
---@field SearchPropPanel? ContentContainer Injected reference to the search results content panel (optional).
---@field StartupTool? Panel The tool item panel to select and activate on first open (set by toolpanel.lua).
local SpawnMenu = {}
