---Retrieves a networked vector value at specified index on the entity that is set by [Entity:SetNetworkedVector](https://wiki.facepunch.com/gmod/Entity:SetNetworkedVector).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedVector
---@generic T
---@overload fun(self: Entity, key: string): Vector # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Vector|T # The retrieved value
---@deprecated You should use Entity:GetNWVector instead.
function Entity:GetNetworkedVector(key, fallback) end
