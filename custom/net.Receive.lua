---Registers a callback for a network message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.Receive
---@callaction gmod.system kind=net_receive name_arg=1 callback_arg=2
---@param messageName string The message name to hook to.
---@param callback fun(len: number, ply: Player) The function to be called if the specified message was received.
function net.Receive(messageName, callback) end
