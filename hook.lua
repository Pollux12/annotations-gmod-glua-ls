---@meta

--- The hook library allows you to add hooks called by the game engine, allowing multiple scripts to modify game function.
hook = {}

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

---Calls a hook and returns the first non-nil value returned by hook listeners.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/hook.Call
---@[call_arg("gmod.hook", "emit")]
---@param eventName string The hook event to call.
---@[call_arg("gmod.hook", "gamemode_table")]
---@param gamemodeTable? table The gamemode table to call the hook on.
---@param ... any Arguments to pass to the hook.
---@return any
function hook.Call(eventName, gamemodeTable, ...) end

---Returns a list of all the hooks registered with [hook.Add](https://wiki.facepunch.com/gmod/hook.Add).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/hook.GetTable
---@return table # A table of tables. See below for output example.
function hook.GetTable() end

---Removes a hook registered with hook.Add.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/hook.Remove
---@[call_arg("gmod.hook", "remove")]
---@param eventName string The hook event name to remove from.
---@param identifier any The unique identifier previously used with hook.Add.
function hook.Remove(eventName, identifier) end

---Calls a hook without explicitly passing a gamemode table.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/hook.Run
---@[call_arg("gmod.hook", "emit")]
---@param eventName string The hook event to call.
---@param ... any Arguments to pass to the hook.
---@return any
function hook.Run(eventName, ...) end
