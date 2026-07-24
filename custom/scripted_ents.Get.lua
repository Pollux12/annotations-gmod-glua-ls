---Returns a copy of the ENT table for a class, including functions defined by the base class.
--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/scripted_ents.Get
---@generic T : table
---@param classname `T` The classname of the ENT table to return, can be an alias
---@return (definition) `T`? # entTable, or nil if no scripted entity is registered with that class name.
function scripted_ents.Get(classname) end
