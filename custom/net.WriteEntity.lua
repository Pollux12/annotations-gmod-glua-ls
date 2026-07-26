---Appends an entity to the current net message using its [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex).
---
--- See [net.ReadEntity](https://wiki.facepunch.com/gmod/net.ReadEntity) for the function to read the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteEntity
---@param entity Entity The entity to be sent.
---@[net_payload("write", "entity")]
function net.WriteEntity(entity) end
