---Creates a new named timer.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/timer.Create
---@callaction gmod.system kind=timer_create name_arg=1 callback_arg=4
---@param identifier string Identifier of the timer to create.
---@param delay number The delay interval in seconds.
---@param repetitions number The number of times to repeat the timer. Use `0` for infinite repetitions.
---@param func function Function called when timer has finished the countdown.
function timer.Create(identifier, delay, repetitions, func) end
