---@meta

--- The panel used by Material & Lamp Sandbox tools for texture selection. Despite being only used in Sandbox, it is **not** exclusive to that gamemode.
---
--- See also [PropSelect](https://wiki.facepunch.com/gmod/PropSelect) for the prop selecting alternative.
---@class (partial) MatSelect : ContextBase
local MatSelect = {}

---Adds a new material to the selection list.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:AddMaterial
---@param label string Tooltip for the material, for when the player hovers over the material.
---@param path string Path to the material. Relative to `materials/` folder (do not include it), and do not include the `.vmt` extension.
function MatSelect:AddMaterial(label, path) end

---Adds a new material to the selection list, with some extra options.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:AddMaterialEx
---@param label string Tooltip for the material, for when the player hovers over the material.
---@param path string Path to the material. Relative to `materials/` folder (do not include it), and do not include the `.vmt` extension.
---@param value any Overrides the "value" of the material. This will be what MatSelect:OnSelect receives in the first argument. It also affects MatSelect:FindMaterialByValue.
---@param convars table A list of convar names (as keys) and their values to set when the user selects this material. ContextBase:SetConVar will be ignored.
function MatSelect:AddMaterialEx(label, path, value, convars) end

---Find a material and selects it, if it exists in this panel.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:FindAndSelectMaterial
---@param mat string The material to find and select within this MatSelect.
function MatSelect:FindAndSelectMaterial(mat) end

---Find a [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) panel based on the input material path.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:FindMaterialByValue
---@param mat string The material to find within this MatSelect.
---@return DImageButton # The found material, or nil.
function MatSelect:FindMaterialByValue(mat) end

---Returns whether the panel would set its own height to fit all materials within its height.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:GetAutoHeight
---@return boolean # `true` = auto size itself.
function MatSelect:GetAutoHeight() end

---**INTERNAL**: Use [MatSelect:FindAndSelectMaterial](https://wiki.facepunch.com/gmod/MatSelect:FindAndSelectMaterial) instead.
---
--- Selects a given material panel.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:SelectMaterial
---@param mat DImageButton The material to select, found by MatSelect:FindMaterialByValue
function MatSelect:SelectMaterial(mat) end

---Sets whether the panel should set its own height to fit all materials within its height.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:SetAutoHeight
---@param autoSize boolean If `true`, auto size itself.
function MatSelect:SetAutoHeight(autoSize) end

---Sets the height of a single material in pixels.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:SetItemHeight
---@param height number The height of the material, in pixels. Default is `128`.
function MatSelect:SetItemHeight(height) end

---Sets the width of a single material in pixels.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:SetItemWidth
---@param width number The width of the material, in pixels. Default is `128`.
function MatSelect:SetItemWidth(width) end

---Sets the target height of the panel, in number of rows.
---@realm client
---@source https://wiki.facepunch.com/gmod/MatSelect:SetNumRows
---@param rows number Amount of rows to target the height to. Default is `2`.
function MatSelect:SetNumRows(rows) end
