--- The content half of the spawn menu, holding every tab registered with
--- [spawnmenu.AddCreationTab](https://wiki.facepunch.com/gmod/spawnmenu.AddCreationTab).
---@source garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu.lua
---@class CreationMenu : DPropertySheet
---@field CreationTabs table<string, CreationMenuTab> The created tabs, keyed by tab name.
local CreationMenu = {}

---@class CreationMenuTab : DPropertySheetSheet
---@field ContentPanel? Panel The panel built by the tab's populate function. Only set once the tab has been populated.

---Returns a single creation tab by name.
---@realm client
---@param id string The tab name, as passed to spawnmenu.AddCreationTab.
---@return CreationMenuTab? # The tab, or `nil` if no tab with that name exists.
function CreationMenu:GetCreationTab(id) end

---Returns every creation tab on this menu.
---@realm client
---@return table<string, CreationMenuTab> # The created tabs, keyed by tab name.
function CreationMenu:GetCreationTabs() end

---Creates a tab for every creation tab registered with spawnmenu.AddCreationTab.
---@realm client
function CreationMenu:Populate() end
