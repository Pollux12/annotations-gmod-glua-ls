---Sets the environment for a function or a stack level. Can be used to sandbox code.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.setfenv
---@[call_arg("gmod.environment", "target")]
---@param location function|integer The function to set the environment for, or a number representing stack level.
---@[call_arg("gmod.environment", "environment")]
---@param environment table Table to be used as the the environment.
---@return function? # The function passed, otherwise nil.
function _G.setfenv(location, environment) end
