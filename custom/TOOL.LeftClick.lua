---Called when the user left clicks with the tool.
---@hook LeftClick
---@realm shared
---@source https://wiki.facepunch.com/gmod/TOOL:LeftClick
---@param tr TraceResult A trace from user's eyes to wherever they aim at. See Structures/TraceResult
---@overload fun(self: Tool, tr: TraceResult, fromRight: boolean): boolean
---@return boolean # Return `true` to draw the tool gun beam and play fire animations, `false` otherwise.
function Tool:LeftClick(tr) end
