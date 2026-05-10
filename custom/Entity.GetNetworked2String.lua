---Retrieves a networked string value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2String
---@generic T
---@overload fun(self: Entity, key: string): string # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return string|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2String instead.
function Entity:GetNetworked2String(key, fallback) end