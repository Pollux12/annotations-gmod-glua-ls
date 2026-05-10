---Retrieves a networked boolean value at specified index on the entity that is set by [Entity:SetNetworkedBool](https://wiki.facepunch.com/gmod/Entity:SetNetworkedBool).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedBool
---@generic T
---@overload fun(self: Entity, key: string): boolean # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return boolean|T # The retrieved value
---@deprecated You should use Entity:GetNWBool instead.
function Entity:GetNetworkedBool(key, fallback) end
