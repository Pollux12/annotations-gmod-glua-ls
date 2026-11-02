---Allows to change players field of view while player holds the weapon.
---
--- **NOTE**: This hook must be defined shared and return same value on both to properly affect Area Portals.
---@hook TranslateFOV
---@realm shared
---@source https://wiki.facepunch.com/gmod/WEAPON:TranslateFOV
---@param fov number The current/default FOV.
---@return number # The target FOV.
---@[self_call_type("GetOwner", "Player")]
function Weapon:TranslateFOV(fov) end
