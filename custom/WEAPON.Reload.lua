---Called when the player reloads the weapon.
---@hook Reload
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:Reload
---@[self_call_valid("GetOwner")]
---@[self_call_type("GetOwner", "Player")]
function Weapon:Reload() end
