---Sends the current net message to the specified player(s)
---@realm server
---@source https://wiki.facepunch.com/gmod/net.Send
---@overload fun(plys: Player[])
---@overload fun(filter: CRecipientFilter)
---@[call_arg("gmod.net_payload", "target")]
---@param ply Player The player to send the message to.
---@[net_send("client")]
function net.Send(ply) end
