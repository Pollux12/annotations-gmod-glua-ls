---Gets the REAL weapon table, not a copy. The produced table does *not* inherit fields from the weapon's base class, unlike [weapons.Get](https://wiki.facepunch.com/gmod/weapons.Get).
---
--- **WARNING**: Modifying this table will modify what is stored by the weapons library. Take a copy or use [weapons.Get](https://wiki.facepunch.com/gmod/weapons.Get) to avoid this.
---@realm shared
---@source https://wiki.facepunch.com/gmod/weapons.GetStored
---@generic T : table
---@param weapon_class `T` Weapon class to retrieve weapon table of
---@return (definition) `T`? # The weapon table, or nil if no weapon is registered with that class name.
function weapons.GetStored(weapon_class) end
