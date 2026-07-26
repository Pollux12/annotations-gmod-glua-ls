---Defines a new skin so that it is usable by Derma.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.DefineSkin
---@[call_arg("gmod.derma_skin", "define")]
---@param name string Name of the skin.
---@param description string Description of the skin.
---@param skin Partial<SKIN> Table containing skin overrides. Missing values inherit from the Default skin.
function derma.DefineSkin(name, description, skin) end
