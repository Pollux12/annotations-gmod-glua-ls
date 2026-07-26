---Sends the current message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to all except the player or players specified.
---@realm server
---@source https://wiki.facepunch.com/gmod/net.SendOmit
---@overload fun(plys: Player[])
---@[call_arg("gmod.net_payload", "target")]
---@param ply Player The player to **NOT** send the message to.
---@[net_send("client")]
function net.SendOmit(ply) end
