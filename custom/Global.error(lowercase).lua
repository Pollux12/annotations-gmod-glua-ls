---Throws a Lua error and breaks out of the current call stack.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.error(lowercase)
---@param message string # The error message to throw.
---@param errorLevel? number # The level to throw the error at.
---@return never
function _G.error(message, errorLevel) end
