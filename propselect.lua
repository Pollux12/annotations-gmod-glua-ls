---@meta

--- Used in Sandbox tools to allow the player to select models out of a list. Despite being only used in Sandbox, it is **not** exclusive to that gamemode.
---
--- See also [MatSelect](https://wiki.facepunch.com/gmod/MatSelect) for the material selecting alternative.
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect
---@class (partial) PropSelect : ContextBase
local PropSelect = {}

---Adds a new model to the selection list.
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:AddModel
---@param model string Model path, **including** `models/` and `.mdl`.
---@param convars? table A list of convar names (as keys) and their values to set when the user selects this model. May be nil or non-table (validated internally).
function PropSelect:AddModel(model, convars) end

---Adds a new model to the selection list.
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:AddModelEx
---@param value string The "value" for this model, which is used to set the ContextBase:SetConVar.
---@param model string Model path, **including** `models/` and `.mdl`.
---@param skin number The skin number for this model. It will **not** be set to the convar, use the value argument to track skin-model combos.
function PropSelect:AddModelEx(value, model, skin) end

---Find and select a [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon) panel based on the input model path.
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:FindAndSelectButton
---@param mdl string The model to find and select within this PropSelect.
function PropSelect:FindAndSelectButton(mdl) end

---Find a [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon) panel based on the input model path.
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:FindModelByValue
---@param mdl string The model to find within this PropSelect.
---@return SpawnIcon # The found spawnicon, or `nil`.
function PropSelect:FindModelByValue(mdl) end

---Called when the player right clicks a model.
---
--- By default, this opens a menu that lets the player copy the model path.
---@hook OnRightClick
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:OnRightClick
---@param pnl Panel The Spawnicon that was clicked.
function PropSelect:OnRightClick(pnl) end

---Called when the player selects a model.
---@hook OnSelect
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:OnSelect
---@param pnl Panel The Spawnicon that was clicked.
---@param model string Path of the selected model, or its "value".
function PropSelect:OnSelect(pnl, model) end

---**INTERNAL**: Use [PropSelect:FindAndSelectButton](https://wiki.facepunch.com/gmod/PropSelect:FindAndSelectButton) instead.
---
--- Selects a given spawnicon panel.
---@hook SelectModel
---@realm client
---@source https://wiki.facepunch.com/gmod/PropSelect:SelectModel
---@param icon SpawnIcon The spawnicon to select, retrieved via PropSelect:FindModelByValue.
function PropSelect:SelectModel(icon) end
