---Checks whether the tool gun's owner can create another object of the given limit type.
---@realm shared
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/entities/weapons/gmod_tool/shared.lua#L69
---@param limitName string The sandbox limit name to check.
---@return boolean # Whether another object can be created.
function gmod_tool:CheckLimit(limitName) end

---Returns the player currently using this sandbox tool weapon.
---@realm shared
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/entities/weapons/gmod_tool/shared.lua
---@return Player|NULL # The tool user, or NULL while unowned.
function gmod_tool:GetOwner() end
