---Gets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) with the specified name.
---
--- **NOTE**: This function uses [Global.GetConVar_Internal](https://wiki.facepunch.com/gmod/Global.GetConVar_Internal) internally, but caches the result in Lua for quicker lookups.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.GetConVar
---@param name string Name of the ConVar to get
---@return ConVar? # The ConVar object, or nil if no such ConVar was found.
function _G.GetConVar( name ) end
