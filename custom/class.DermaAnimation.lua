--- Animation object returned by Derma_Anim(). Drives a timed animation callback on a panel.
---@class DermaAnimation
---@field Name string The name assigned to this animation.
---@field Panel Panel The panel this animation belongs to.
---@field Func fun(panel: Panel, anim: DermaAnimation, delta: number, data: any) The animation callback.
---@field Data? any User data passed to the callback each tick.
---@field Running? boolean Whether the animation is currently running.
---@field Started? boolean Set true on the first tick; cleared after first call.
---@field Finished? boolean Set true on the final tick.
---@field Length number Total duration in seconds.
---@field StartTime? number SysTime() when the animation began.
---@field EndTime? number SysTime() when the animation will end.
local DermaAnimation = {}

function DermaAnimation:Run() end
---@param length number
---@param data? any
function DermaAnimation:Start(length, data) end
function DermaAnimation:Stop() end
---@return boolean
function DermaAnimation:Active() end
