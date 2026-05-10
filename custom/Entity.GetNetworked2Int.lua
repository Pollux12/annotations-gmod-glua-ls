---Retrieves a networked integer value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Int
---@generic T
---@overload fun(self: Entity, key: string): number # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return number|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Int instead.
function Entity:GetNetworked2Int(key, fallback) end