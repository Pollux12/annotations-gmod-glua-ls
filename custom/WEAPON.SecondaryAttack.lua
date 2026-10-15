---Called when the weapon is fired with secondary attack.
---@hook SecondaryAttack
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:SecondaryAttack
---@[self_call_valid("GetOwner")]
---@[self_call_type("GetOwner", "Player")]
---@[default_self_call("CanSecondaryAttack")]
---@[default_self_call("ShootBullet")]
---@[default_self_call("TakeSecondaryAmmo")]
function Weapon:SecondaryAttack() end
