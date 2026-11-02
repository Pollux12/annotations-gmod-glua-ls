---Helper function for checking for no ammo.
---@hook CanPrimaryAttack
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:CanPrimaryAttack
---@return boolean # Can use primary attack
---@[not_engine_called]
---@[default_self_call("Reload")]
function Weapon:CanPrimaryAttack() end
