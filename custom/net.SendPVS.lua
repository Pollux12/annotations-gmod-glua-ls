---Sends current net message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to all players in the [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") of the position, or, more simply said, sends the message to players that can potentially see this position.
---@realm server
---@source https://wiki.facepunch.com/gmod/net.SendPVS
---@[call_arg("gmod.net_payload", "target")]
---@param position Vector Position that must be in players' visibility set.
---@[net_send("client")]
function net.SendPVS(position) end
