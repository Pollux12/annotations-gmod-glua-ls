---Called to adjust player mouse sensitivity while this weapon is active.
---@hook AdjustMouseSensitivity
---@realm client
---@source https://wiki.facepunch.com/gmod/WEAPON:AdjustMouseSensitivity
---@return number? sensitivityMultiplier # Return a multiplier to override sensitivity.
---@[self_call_valid("GetOwner")]
function Weapon:AdjustMouseSensitivity() end
