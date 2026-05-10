---Retrieves a networked string value at specified index on the entity that is set by [Entity:SetNetworkedString](https://wiki.facepunch.com/gmod/Entity:SetNetworkedString).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedString
---@generic T
---@overload fun(self: Entity, key: string): string # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return string|T # The retrieved value
---@deprecated You should use Entity:GetNWString instead.
function Entity:GetNetworkedString(key, fallback) end
