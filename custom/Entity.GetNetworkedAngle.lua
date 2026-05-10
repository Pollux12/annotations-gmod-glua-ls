---Retrieves a networked angle value at specified index on the entity that is set by [Entity:SetNetworkedAngle](https://wiki.facepunch.com/gmod/Entity:SetNetworkedAngle).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedAngle
---@generic T
---@overload fun(self: Entity, key: string): Angle # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Angle|T # The retrieved value
---@deprecated You should use Entity:GetNWAngle instead.
function Entity:GetNetworkedAngle(key, fallback) end
