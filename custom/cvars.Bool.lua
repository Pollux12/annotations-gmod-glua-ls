---Retrieves console variable as a boolean.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/cvars.Bool
---@generic T
---@overload fun(cvar: string): boolean?
---@param cvar string Name of console variable.
---@param default T The value to return if the console variable does not exist.
---@return boolean|T # Retrieved value.
function cvars.Bool(cvar, default) end
