---Notifies the local player that they hit the named sandbox limit. The server calls it through Player:LimitHit.
---@realm client
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/cl_init.lua#L32
---@param name string The sandbox limit category, such as `props`.
function SANDBOX:LimitHit(name) end
