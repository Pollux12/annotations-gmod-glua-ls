---Registers a callback for a network message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.Receive
---@[call_arg("gmod.net_message", "receive")]
---@param messageName string The message name to hook to.
---@param callback fun(len: number, ply: Player) The function to be called if the specified message was received.
function net.Receive(messageName, callback) end
