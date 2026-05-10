---Retrieves a networked integer value at specified index on the entity that is set by [Entity:SetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:SetNetworkedInt).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt
---@generic T
---@overload fun(self: Entity, key: string): number # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return number|T # The retrieved value
---@deprecated You should use Entity:GetNWInt instead.
function Entity:GetNetworkedInt(key, fallback) end
