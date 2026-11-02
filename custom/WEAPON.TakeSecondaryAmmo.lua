---A convenience function to remove secondary ammo from clip.
---@hook TakeSecondaryAmmo
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:TakeSecondaryAmmo
---@param amount number How much of secondary ammo to remove
---@[not_engine_called]
---@[default_self_call("Ammo2")]
function Weapon:TakeSecondaryAmmo(amount) end
