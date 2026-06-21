---Returns the owner of this tool.
--- At runtime this is always a valid player when the tool is active;
--- this override removes spurious nil-return diagnostics.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Tool:GetOwner
---@return Player # The player using the tool. Always valid when called from tool callbacks.
function Tool:GetOwner() end
