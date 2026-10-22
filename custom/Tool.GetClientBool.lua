---Attempts to grab a clientside tool [ConVar](https://wiki.facepunch.com/gmod/ConVar) value as a [boolean](https://wiki.facepunch.com/gmod/boolean).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Tool:GetClientBool
---@param name string Name of the ConVar to retrieve. The function will automatically add the `mytoolfilename_` part to it.
---@param default? boolean The default value to return in case the lookup fails.
---@return boolean # The value of the requested ConVar. It will be true if the value if the convar is not 0, just like ConVar:GetBool
function Tool:GetClientBool(name, default) end
