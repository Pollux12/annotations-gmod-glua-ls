---@class Weapon : Entity
local Weapon = {}
---@class WEAPON : Weapon
WEAPON = Weapon

---@alias WeaponAmmoTable { ClipSize: number, DefaultClip: number, Automatic: boolean, Ammo: string }

--- Display name of the weapon, shown on the HUD and in the spawn menu.
---@field PrintName string
--- Author of the weapon, displayed in the spawn menu.
---@field Author string
--- Contact information for the author, shown in the spawn menu.
---@field Contact string
--- Short description of the weapon's purpose, shown in the spawn menu.
---@field Purpose string
--- Instructions for using the weapon, shown in the spawn menu.
---@field Instructions string
--- Field of view for the view model. Default `62`.
---@field ViewModelFOV number
--- Whether to flip the view model. Default `false`.
---@field ViewModelFlip boolean
--- Path to the view model. Default `"models/weapons/v_pistol.mdl"`.
---@field ViewModel string
--- Path to the world model. Default `"models/weapons/w_357.mdl"`.
---@field WorldModel string
--- Whether the weapon can be spawned by players from the spawn menu. Default `false`.
---@field Spawnable boolean
--- Whether only admins can spawn this weapon from the spawn menu. Default `false`.
---@field AdminOnly boolean
--- Primary fire ammo configuration.
---@field Primary WeaponAmmoTable
--- Secondary fire ammo configuration.
---@field Secondary WeaponAmmoTable

---Returns the owner of this weapon.
---
--- Weapons can be owned by players, NPCs, other entities, or NULL while dropped,
--- initializing, or being removed.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetOwner
---@return Entity|Player|NPC|NULL # The entity currently owning this weapon.
function Weapon:GetOwner() end
