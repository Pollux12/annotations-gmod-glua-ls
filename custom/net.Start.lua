---Begins a new net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.Start
---@callaction gmod.system kind=net_start name_arg=1
---@param messageName string The name of the message to send.
---@param unreliable? boolean If set to `true`, the message is not guaranteed to reach its destination.
---@return boolean # `true` if the message has been started.
function net.Start(messageName, unreliable) end
