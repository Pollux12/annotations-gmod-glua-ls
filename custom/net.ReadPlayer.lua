---Reads a player entity that was written with [net.WritePlayer](https://wiki.facepunch.com/gmod/net.WritePlayer) from the received net message.
---
--- You should always check if the specified entity exists as it may have been removed and therefore `NULL` if it is outside of the local players [PVS](https://developer.valvesoftware.com/wiki/PVS) or was already removed.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadPlayer
---@return Player # The player, or `Entity(0)` if no entity could be read.
---@[net_payload("read", "player")]
function net.ReadPlayer() end
