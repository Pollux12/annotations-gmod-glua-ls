---A convenience function to remove primary ammo from clip.
---@hook TakePrimaryAmmo
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:TakePrimaryAmmo
---@param amount number Amount of primary ammo to remove
---@[not_engine_called]
---@[default_self_call("Ammo1")]
function Weapon:TakePrimaryAmmo(amount) end
