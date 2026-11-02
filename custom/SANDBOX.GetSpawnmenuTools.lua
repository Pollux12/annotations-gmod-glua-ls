---Returns the tool menu tab with the given name.
---@deprecated Use spawnmenu.GetToolMenu instead.
---@realm client
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/cl_spawnmenu.lua#L64
---@param name string The internal name of the tool tab.
---@return table # The categories and items of the tab, as spawnmenu.GetToolMenu returns.
function SANDBOX:GetSpawnmenuTools(name) end
