---Registers a function (or "callback") with the [Hook](https://wiki.facepunch.com/gmod/Hook) system so that it will be called automatically whenever a specific event (or "hook") occurs.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/hook.Add
---@[call_arg("gmod.hook", "add")]
---@param eventName string The event to hook on to. This can be any GM_Hooks hook, gameevent after using gameevent.Listen, or custom hook run with hook.Call or hook.Run.
---@param identifier any The unique identifier, usually a string. This can be used elsewhere in the code to replace or remove the hook. The identifier **should** be unique so that you do not accidentally override some other mods hook, unless that's what you are trying to do.
---@[call_arg("gmod.hook", "callback")]
---@param func function The function to be called, arguments given to it depend on the identifier used.
function hook.Add(eventName, identifier, func) end
