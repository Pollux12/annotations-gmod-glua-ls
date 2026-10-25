---Returns the current goal data. Can return nil if the current goal is invalid, for example immediately after [PathFollower:Update](https://wiki.facepunch.com/gmod/PathFollower:Update).
---@realm server
---@source https://wiki.facepunch.com/gmod/PathFollower:GetCurrentGoal
---@return PathSegment? # The current goal path segment, or nil if invalid.
function PathFollower:GetCurrentGoal() end
