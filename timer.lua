---@meta

--- The timer library is a very useful set of functions which allow you to run a function periodically or after a given delay.
timer = {}

---Adjusts a previously created ([timer.Create](https://wiki.facepunch.com/gmod/timer.Create)) timer with the given identifier.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Adjust
---@param identifier any Identifier of the timer to adjust.
---@param delay number The delay interval in seconds. **Must be specified.**
---@param repetitions? number Repetitions. Use `0` for infinite or `nil` to keep previous value.
---@param func? function The new function. Use `nil` to keep previous value.
---@return boolean # `true` if succeeded.
function timer.Adjust(identifier, delay, repetitions, func) end

---This function does nothing.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Check
---@deprecated If you want to check if whether or not a timer exists, use timer.Exists.
function timer.Check() end

---Creates a new named timer.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Create
---@[call_arg("gmod.timer", "define")]
---@param identifier string Identifier of the timer to create.
---@param delay number The delay interval in seconds.
---@param repetitions number The number of times to repeat the timer. Use `0` for infinite repetitions.
---@[call_arg("gmod.timer", "callback")]
---@param func function Function called when timer has finished the countdown.
function timer.Create(identifier, delay, repetitions, func) end

---Stops and destroys the given timer. Alias of [timer.Remove](https://wiki.facepunch.com/gmod/timer.Remove).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Destroy
---@param identifier string Identifier of the timer to destroy.
---@deprecated You should be using timer.Remove instead.
function timer.Destroy(identifier) end

---Returns whenever the given timer exists or not.
---
--- For debugging purposes you can use the following commands:
--- * `lua_dumptimers_cl`
--- * `lua_dumptimers_sv`
--- * `lua_dumptimers_menu`
---
--- These will list all active timers in each realm.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Exists
---@param identifier string Identifier of the timer.
---@return boolean # Returns true if the timer exists, false if it doesn't
function timer.Exists(identifier) end

---Returns whenever the given timer is paused or not. ([timer.Pause](https://wiki.facepunch.com/gmod/timer.Pause))
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.IsPaused
---@param identifier string Identifier of the timer. (timer.Create)
---@return boolean # Returns true if the timer is paused, false if it isn't, `nil` if it doesn't exist.
function timer.IsPaused(identifier) end

---Pauses the given timer.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Pause
---@param identifier any Identifier of the timer.
function timer.Pause(identifier) end

---Stops and removes a timer created by [timer.Create](https://wiki.facepunch.com/gmod/timer.Create).
--- **WARNING**: The timers are removed in the next frame! Keep this in mind when storing identifiers in variables.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Remove
---@param identifier string Identifier of the timer to remove.
function timer.Remove(identifier) end

---Returns amount of repetitions/executions left before the timer destroys itself.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.RepsLeft
---@param identifier any Identifier of the timer.
---@return number # The amount of executions left.
function timer.RepsLeft(identifier) end

---Creates a simple one-shot timer.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Simple
---@param delay number Delay in seconds.
---@[call_arg("gmod.timer", "simple")]
---@param func function Function called when timer has finished the countdown.
function timer.Simple(delay, func) end

---Restarts the given timer.
---
--- **WARNING**: Timers won't advance while the client is timing out from the server.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Start
---@param identifier any Identifier of the timer.
function timer.Start(identifier) end

---Stops the given timer and rewinds it.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Stop
---@param identifier any Identifier of the timer.
function timer.Stop(identifier) end

---Returns amount of time left (in seconds) before the timer executes its function.
---
--- **NOTE**: If the timer is paused, the amount will be negative.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.TimeLeft
---@param identifier any Identifier of the timer.
---@return number # The amount of time left (in seconds).
function timer.TimeLeft(identifier) end

---Runs either [timer.Pause](https://wiki.facepunch.com/gmod/timer.Pause) or [timer.UnPause](https://wiki.facepunch.com/gmod/timer.UnPause) based on the timer's current status.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Toggle
---@param identifier any Identifier of the timer.
function timer.Toggle(identifier) end

---Unpauses the timer.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.UnPause
---@param identifier any Identifier of the timer.
function timer.UnPause(identifier) end
