---Retrieves a networked float value at specified index on the entity that is set by [Entity:SetNetworkedEntity](https://wiki.facepunch.com/gmod/Entity:SetNetworkedEntity).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedEntity
---@generic T
---@overload fun(self: Entity, key: string): Entity|NULL # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Entity|T # The retrieved value
---@deprecated You should use Entity:GetNWEntity instead.
function Entity:GetNetworkedEntity(key, fallback) end
