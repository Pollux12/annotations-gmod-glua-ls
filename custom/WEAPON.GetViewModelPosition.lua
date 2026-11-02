---This hook allows you to adjust view model position and angles.
---@hook GetViewModelPosition
---@realm client
---@source https://wiki.facepunch.com/gmod/WEAPON:GetViewModelPosition
---@param EyePos Vector Current position
---@param EyeAng Angle Current angle
---@return Vector # New position
---@return Angle # New angle
---@[self_call_type("GetOwner", "Player")]
function Weapon:GetViewModelPosition(EyePos, EyeAng) end
