---Creates Get/Set accessors for a vector or angle element NetworkVar.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:NetworkVarElement
---@callaction gmod.class kind=network_var_element type_arg=1 name_arg=4 fallback_name_arg=3 fallback_name_arg2=2
---@param type string The NetworkVar type.
---@param slot number The NetworkVar slot.
---@param element number The vector or angle element.
---@param name string Name of the variable, used for generated Get/Set accessors.
---@param extended? table Extra NetworkVar information.
function Entity:NetworkVarElement(type, slot, element, name, extended) end
