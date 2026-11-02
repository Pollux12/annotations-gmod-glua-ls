---Queues the named hint to be shown after a delay, once per session.
---@realm client
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/cl_hints.lua#L42
---@param name string The hint name, used to look up the `Hint_<name>` phrase.
---@param delay number Seconds to wait before showing the hint.
function SANDBOX:AddHint(name, delay) end
