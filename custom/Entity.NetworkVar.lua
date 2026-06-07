---Creates a network variable and generated Get/Set accessors for the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:NetworkVar
---@[call_arg("gmod.network_var", "type")]
---@param type string The NetworkVar type.
---@param slot number The NetworkVar slot.
---@[call_arg("gmod.network_var", "define")]
---@param name string Name of the variable, used for generated Get/Set accessors.
---@param extended? table Extra NetworkVar information.
function Entity:NetworkVar(type, slot, name, extended) end
