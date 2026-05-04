---Called when weapon tries to holster.
---@hook Holster
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:Holster
---@param weapon? Weapon The weapon we are trying switch to.
---@return boolean # Return true to allow weapon to holster.
---
--- This will not have an effect if weapon was switched away from using Player:SetActiveWeapon
function Weapon:Holster(weapon) end
