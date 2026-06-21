---Returns the tool object associated with the current or specified tool mode.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Weapon:GetToolObject
---@param tool? string The tool mode to retrieve. Defaults to the currently active tool mode.
---@return Tool? # The Tool object for the given mode, or `nil`/`false` if the mode has no tool object.
function Weapon:GetToolObject(tool) end
