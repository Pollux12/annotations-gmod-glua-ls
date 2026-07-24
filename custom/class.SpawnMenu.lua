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

---@class ToolMenu : Panel
local ToolMenu = {}

---Adds an option to the tool menu panel.
---@realm client
---@param tab string The tool tab name.
---@param category string The tool category.
---@param class string The tool class/name.
---@param name string The display name.
---@param cmd string The console command.
---@param config string|nil The config name.
---@param cpanel fun(panel: ControlPanel)|nil Callback used to populate the control panel.
---@param data table|nil Additional tool menu option data.
function ToolMenu:AddToolMenuOption(tab, category, class, name, cmd, config, cpanel, data) end
