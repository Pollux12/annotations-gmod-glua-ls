---Calls a hook without explicitly passing a gamemode table.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/hook.Run
---@[call_arg("gmod.hook", "emit")]
---@param eventName string The hook event to call.
---@param ... any Arguments to pass to the hook.
---@return any
function hook.Run(eventName, ...) end
