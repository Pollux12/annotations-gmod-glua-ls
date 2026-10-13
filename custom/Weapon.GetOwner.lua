---Returns the owner entity of this entity. A weapon is owned by the player or NPC that has it equipped.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetOwner
---@return Player|NPC|NULL # The player or NPC holding the weapon, or NULL while it is not equipped.
function Weapon:GetOwner() end
