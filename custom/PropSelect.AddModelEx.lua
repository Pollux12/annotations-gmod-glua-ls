---Adds a new model to the selection list.
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:AddModelEx
---@param value string The "value" for this model, which is used to set the ContextBase:SetConVar.
---@param model string Model path, **including** `models/` and `.mdl`.
---@param skin number The skin number for this model. It will **not** be set to the convar, use the value argument to track skin-model combos.
---@return SpawnIcon # The created model icon.
function PropSelect:AddModelEx(value, model, skin) end
