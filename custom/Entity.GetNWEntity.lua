---Retrieves a networked entity value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWEntity
---@generic T
---@overload fun(self: Entity, key: string): Entity|NULL # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Entity|T # The value associated with the key
function Entity:GetNWEntity(key, fallback) end
