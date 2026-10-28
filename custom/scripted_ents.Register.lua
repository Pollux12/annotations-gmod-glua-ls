---Registers an ENT table with a classname. Reregistering an existing classname will automatically update the functions of all existing entities of that class.
---
---The input is a registration table. Garry's Mod fills and inherits fields such as `ClassName`, `BaseClass`, and base-provided `Type` later during scripted entity registration and lookup.
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.Register
---@[call_arg("gmod.scripted_class", "entity_table")]
---@param ENT table The ENT table to register.
---@[call_arg("gmod.scripted_class", "define")]
---@param classname string The classname to register.
function scripted_ents.Register(ENT, classname) end
