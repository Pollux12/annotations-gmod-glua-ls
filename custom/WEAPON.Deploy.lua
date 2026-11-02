---Called when player has just switched to this weapon.
---@hook Deploy
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:Deploy
---@return boolean? # Return true to allow switching away from this weapon using `lastinv` command.
---@[self_call_valid("GetOwner")]
---@[self_call_type("GetOwner", "Player")]
function Weapon:Deploy() end
