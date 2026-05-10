---Retrieves a networked boolean value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Bool
---@generic T
---@overload fun(self: Entity, key: string): boolean # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return boolean|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Bool instead.
function Entity:GetNetworked2Bool(key, fallback) end