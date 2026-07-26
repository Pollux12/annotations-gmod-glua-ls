---Appends a player entity to the current net message using its [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex). This saves a small amount of network bandwidth over [net.WriteEntity](https://wiki.facepunch.com/gmod/net.WriteEntity).
---
--- See [net.ReadPlayer](https://wiki.facepunch.com/gmod/net.ReadPlayer) for the function to read the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WritePlayer
---@param ply Player The player to be sent.
---@[net_payload("write", "player")]
function net.WritePlayer(ply) end
