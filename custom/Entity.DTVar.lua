---Adds a datatable variable accessor on an entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:DTVar
---@overload fun(type: string, name: string)
---@overload fun(type: string, slot: nil, name: string)
---@param type string The type of the DTVar being set up.
---@param slot number The DTVar slot. Can be omitted to use the next available slot.
---@param name string Name by which you will refer to the DTVar.
function Entity:DTVar(type, slot, name) end
