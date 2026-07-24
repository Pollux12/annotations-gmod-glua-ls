---@class gmod_tool : Weapon
local gmod_tool = {}

---Returns the tool object associated with the current or specified tool mode.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Weapon:GetToolObject
---@param tool? string The tool mode to retrieve. Defaults to the currently active tool mode.
---@return Tool|false # The Tool object for the given mode, or `false` if the mode has no tool object.
function gmod_tool:GetToolObject(tool) end
