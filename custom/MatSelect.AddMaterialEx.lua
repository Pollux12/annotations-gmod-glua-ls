---Adds a new material to the selection list, with some extra options.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:AddMaterialEx
---@param label string Tooltip for the material, for when the player hovers over the material.
---@param path string Path to the material. Relative to `materials/` folder (do not include it), and do not include the `.vmt` extension.
---@param value any Overrides the "value" of the material. This will be what MatSelect:OnSelect receives in the first argument. It also affects MatSelect:FindMaterialByValue.
---@param convars table A list of convar names (as keys) and their values to set when the user selects this material. ContextBase:SetConVar will be ignored.
---@return MatSelectMaterial # The created material button.
function MatSelect:AddMaterialEx(label, path, value, convars) end
