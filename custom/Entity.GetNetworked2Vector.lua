---Retrieves a networked vector value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Vector
---@generic T
---@overload fun(self: Entity, key: string): Vector # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Vector|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Vector instead.
function Entity:GetNetworked2Vector(key, fallback) end