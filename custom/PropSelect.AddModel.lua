---Adds a new model to the selection list.
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:AddModel
---@param model string Model path, **including** `models/` and `.mdl`.
---@param convars? table A list of convar names (as keys) and their values to set when the user selects this model. May be nil or non-table (validated internally).
function PropSelect:AddModel(model, convars) end
