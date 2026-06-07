---Calls a hook and returns the first non-nil value returned by hook listeners.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/hook.Call
---@[call_arg("gmod.hook", "emit")]
---@param eventName string The hook event to call.
---@param gamemodeTable? table The gamemode table to call the hook on.
---@param ... any Arguments to pass to the hook.
---@return any
function hook.Call(eventName, gamemodeTable, ...) end
