---@class Weapon : Entity
local Weapon = {}
---@class WEAPON : Weapon
WEAPON = Weapon

---Returns the owner of this weapon, narrowed to [Player](https://wiki.facepunch.com/gmod/Player).
---
--- Weapons are owned by players (or sometimes NPCs); for SWEP code `self:GetOwner()`
--- is the wielding player in the vast majority of cases. This narrows the base
--- [Entity:GetOwner](https://wiki.facepunch.com/gmod/Entity:GetOwner) return so
--- shared `Player` methods (e.g. `KeyDown`) resolve correctly in weapon code.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetOwner
---@return Player # The player who owns this weapon.
function Weapon:GetOwner() end
