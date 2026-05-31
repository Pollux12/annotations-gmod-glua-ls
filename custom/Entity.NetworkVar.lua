---Creates a network variable and generated Get/Set accessors for the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:NetworkVar
---@callaction gmod.class kind=network_var type_arg=1 name_arg=3 fallback_name_arg=2
---@param type string The NetworkVar type.
---@param slot number The NetworkVar slot.
---@param name string Name of the variable, used for generated Get/Set accessors.
---@param extended? table Extra NetworkVar information.
function Entity:NetworkVar(type, slot, name, extended) end
