---Reads an entity from the received net message. You should always check if the specified entity exists as it may have been removed and therefore `NULL` if it is outside of the players [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") or was already removed.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadEntity
---@return Entity # The entity, or `nil` if no entity could be read.
---@[net_payload("read", "entity")]
function net.ReadEntity() end
