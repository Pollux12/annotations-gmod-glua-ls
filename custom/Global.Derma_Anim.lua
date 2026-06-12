---Runtime object returned by Derma_Anim.
---@realm client
---@realm menu
---@class DermaAnimation
---@field Name string
---@field Panel Panel
---@field Func fun(pnl: Panel, anim: DermaAnimation, delta: number, data: any)
---@field Running? boolean
---@field Started? boolean
---@field Finished? boolean
---@field Length? number
---@field StartTime? number
---@field EndTime? number
---@field Data? any
local DermaAnimation = {}

---Runs the animation's frame callback if the animation is active.
function DermaAnimation:Run() end

---Starts the animation.
---@param length number
---@param data? any
function DermaAnimation:Start(length, data) end

---Stops the animation.
function DermaAnimation:Stop() end

---Returns whether the animation is currently active.
---@return boolean?
function DermaAnimation:Active() end

---Creates a new derma animation.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.Derma_Anim
---@param name string Name of the animation to create.
---@param panel Panel Panel to run the animation on.
---@param func fun(pnl: Panel, anim: DermaAnimation, delta: number, data: any) Function to call to process the animation.
---@return DermaAnimation
function _G.Derma_Anim(name, panel, func) end
