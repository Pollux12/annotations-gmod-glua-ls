---@meta

--- The scripted_ents library allows you to access information about any scripted entities loaded into the game, as well as register your own entities.
scripted_ents = {}

---Defines an alias string that can be used to refer to another classname
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.Alias
---@param alias string A new string which can be used to refer to another classname
---@param classname string The classname the alias should refer to
function scripted_ents.Alias(alias, classname) end

---Returns a copy of the ENT table for a class, including functions defined by the base class.
--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/scripted_ents.Get
---@generic T : table
---@param classname `T` The classname of the ENT table to return, can be an alias
---@return (definition) `T` # entTable
function scripted_ents.Get(classname) end

---Returns a copy of the list of all ENT tables registered
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.GetList
---@return table<string, table> # A table of all SENTs where the key is the classname and the value is a table where:
--- * table **t** — The Structures/ENT table associated with the entity
--- * boolean **isBaseType** — Unused. Always `true`
--- * string **Base** — The entity base
--- * string **type** — The entity type
function scripted_ents.GetList() end

---Retrieves a member of entity's table.
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.GetMember
---@generic T : table, K
---@param classname `T` Entity's class name
---@param name std.ConstTpl<K> Name of member to retrieve
---@return std.RawGet<T, K> # The member or nil if failed
function scripted_ents.GetMember(classname, name) end

---Returns a list of all ENT tables which contain ENT.Spawnable
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.GetSpawnable
---@return table # A table of Structures/ENTs
function scripted_ents.GetSpawnable() end

---Returns the actual ENT table for a class. Modifying functions/variables in this table will change newly spawned entities
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.GetStored
---@param classname string The classname of the ENT table to return
---@return table # entTable
function scripted_ents.GetStored(classname) end

---Returns the 'type' of a class, this will one of the following: 'anim', 'ai', 'brush', 'point'.
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.GetType
---@param classname string The classname to check
---@return string # type
function scripted_ents.GetType(classname) end

---Checks if name is based on base
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.IsBasedOn
---@param name string Entity's class name to be checked
---@param base string Base class name to be checked
---@return boolean # Returns true if class name is based on base, else false.
function scripted_ents.IsBasedOn(name, base) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called after all ENTS have been loaded and runs [baseclass.Set](https://wiki.facepunch.com/gmod/baseclass.Set) on each one.
---
--- You can retrieve all the currently registered ENTS with [scripted_ents.GetList](https://wiki.facepunch.com/gmod/scripted_ents.GetList).
---
--- **NOTE**: This is not called after an ENT auto refresh, and thus the inherited baseclass functions retrieved with [baseclass.Get](https://wiki.facepunch.com/gmod/baseclass.Get) will not be updated
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.OnLoaded
function scripted_ents.OnLoaded() end

---Registers an ENT table with a classname. Reregistering an existing classname will automatically update the functions of all existing entities of that class.
---
---The input is a registration table. Garry's Mod fills and inherits fields such as `ClassName`, `BaseClass`, and base-provided `Type` later during scripted entity registration and lookup.
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.Register
---@param ENT table The ENT table to register.
---@param classname string The classname to register.
function scripted_ents.Register(ENT, classname) end
