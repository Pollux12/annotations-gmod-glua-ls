---@meta

--- The weapons library allows you to access information about any scripted weapons loaded into the game, as well as register your own weapons.
weapons = {}

---Get a `copy` of weapon table by name. This function also inherits fields from the weapon's base class, unlike [weapons.GetStored](https://wiki.facepunch.com/gmod/weapons.GetStored) or [weapons.GetList](https://wiki.facepunch.com/gmod/weapons.GetList).
--- 	**NOTE**: This will only work on SWEP's, this means that this will not return anything for HL2/HL:S weapons.
---@realm shared
---@source https://wiki.facepunch.com/gmod/weapons.Get
---@param classname string Class name of weapon to retrieve
---@return table # The retrieved table or nil
function weapons.Get(classname) end

---Get a list of all the registered SWEPs. This does not include weapons added to spawnmenu manually.
--- 	**NOTE**: This function does not inherit fields from the weapon's base class, unlike [weapons.Get](https://wiki.facepunch.com/gmod/weapons.Get)
---@realm shared
---@source https://wiki.facepunch.com/gmod/weapons.GetList
---@return table # List of all the registered SWEPs
function weapons.GetList() end

---Gets the REAL weapon table, not a copy. The produced table does *not* inherit fields from the weapon's base class, unlike [weapons.Get](https://wiki.facepunch.com/gmod/weapons.Get).
---
--- **WARNING**: Modifying this table will modify what is stored by the weapons library. Take a copy or use [weapons.Get](https://wiki.facepunch.com/gmod/weapons.Get) to avoid this.
---@realm shared
---@source https://wiki.facepunch.com/gmod/weapons.GetStored
---@generic T : table
---@param weapon_class `T` Weapon class to retrieve weapon table of
---@return (definition) `T` # The weapon table
function weapons.GetStored(weapon_class) end

---Checks if name is based on base
---@realm shared
---@source https://wiki.facepunch.com/gmod/weapons.IsBasedOn
---@param name string Entity's class name to be checked
---@param base string Base class name to be checked
---@return boolean # Returns true if class name is based on base, else false.
function weapons.IsBasedOn(name, base) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called after all SWEPS have been loaded and runs [baseclass.Set](https://wiki.facepunch.com/gmod/baseclass.Set) on each one.
---
--- You can retrieve all the currently registered SWEPS with [weapons.GetList](https://wiki.facepunch.com/gmod/weapons.GetList).
---
--- **NOTE**: This is not called after a SWEP auto refresh, and thus the inherited baseclass functions retrieved with [baseclass.Get](https://wiki.facepunch.com/gmod/baseclass.Get) will not be updated
---@realm shared
---@source https://wiki.facepunch.com/gmod/weapons.OnLoaded
function weapons.OnLoaded() end

---Registers a Scripted Weapon (SWEP) class manually. When the engine spawns an entity, weapons registered with this function will be created if the class names match.
---
--- See also [scripted_ents.Register](https://wiki.facepunch.com/gmod/scripted_ents.Register) for Scripted Entities (SENTs)
---
--- Sub-tables provided in the first argument will not carry over their metatable, and will receive a BaseClass key if the table was merged with the base's. Userdata references, which includes Vectors, Angles, Entities, etc. will not be copied.
---@realm shared
---@source https://wiki.facepunch.com/gmod/weapons.Register
---@param ENT SWEP The SWEP table to register.
--- For the table's format and available options see the Structures/SWEP page.
---@param classname string Classname to assign to that swep
function weapons.Register(ENT, classname) end
