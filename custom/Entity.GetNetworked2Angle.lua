---Retrieves a networked angle value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Angle
---@generic T
---@overload fun(self: Entity, key: string): Angle # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Angle|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Angle instead.
function Entity:GetNetworked2Angle(key, fallback) end