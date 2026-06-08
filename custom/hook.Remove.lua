---Removes a hook registered with hook.Add.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/hook.Remove
---@[call_arg("gmod.hook", "remove")]
---@param eventName string The hook event name to remove from.
---@param identifier any The unique identifier previously used with hook.Add.
function hook.Remove(eventName, identifier) end
