---Called when the weapon is fired with primary attack.
---@hook PrimaryAttack
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:PrimaryAttack
---@[self_call_valid("GetOwner")]
---@[self_call_type("GetOwner", "Player")]
---@[default_self_call("CanPrimaryAttack")]
---@[default_self_call("ShootBullet")]
---@[default_self_call("TakePrimaryAmmo")]
function Weapon:PrimaryAttack() end
