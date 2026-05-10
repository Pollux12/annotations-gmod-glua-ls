---Retrieves a networked vector value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWVector
---@generic T
---@overload fun(self: Entity, key: string): Vector # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Vector|T # The value associated with the key
function Entity:GetNWVector(key, fallback) end