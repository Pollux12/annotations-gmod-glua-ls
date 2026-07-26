---Sends current net message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to all players that are in the same [Potentially Audible Set (PAS)](https://developer.valvesoftware.com/wiki/PAS) as the position, or simply said, it adds all players that can potentially hear sounds from this position.
---@realm server
---@source https://wiki.facepunch.com/gmod/net.SendPAS
---@[call_arg("gmod.net_payload", "target")]
---@param position Vector PAS position.
---@[net_send("client")]
function net.SendPAS(position) end
