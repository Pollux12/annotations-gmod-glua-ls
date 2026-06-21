---@meta

--- A "spawn icon" displays an image for the given model path.
--- It is mostly used in the Spawn Menu (Q).
--- It uses [ModelImage](https://wiki.facepunch.com/gmod/ModelImage) internally.
---@class (partial) SpawnIcon : DButton
local SpawnIcon = {}

---Returns the currently active [Sub Model IDs](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#submodels) for each Body Group of the spawn icon.
---
--- This is set by [SpawnIcon:SetBodyGroup](https://wiki.facepunch.com/gmod/SpawnIcon:SetBodyGroup).
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnIcon:GetBodyGroup
---@return string # The Body Groups of the spawnicon
function SpawnIcon:GetBodyGroup() end

---Returns the currently set model name. This is set by [SpawnIcon:SetModelName](https://wiki.facepunch.com/gmod/SpawnIcon:SetModelName).
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnIcon:GetModelName
---@return string # The model name
function SpawnIcon:GetModelName() end

---Returns the currently set skin of the spawnicon. This is set by [SpawnIcon:SetSkinID](https://wiki.facepunch.com/gmod/SpawnIcon:SetSkinID).
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnIcon:GetSkinID
---@return number # Current skin ID
function SpawnIcon:GetSkinID() end

---Called when right clicked on the SpawnIcon. It will not be called if there is a selection ([Panel:GetSelectionCanvas](https://wiki.facepunch.com/gmod/Panel:GetSelectionCanvas)), in which case [SANDBOX:SpawnlistOpenGenericMenu](https://wiki.facepunch.com/gmod/SANDBOX:SpawnlistOpenGenericMenu) is called.
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnIcon:OpenMenu
function SpawnIcon:OpenMenu() end

---**INTERNAL**: This is done automatically by SpawnIcon. You do not need to call this. Doing so may cause unforeseen consequences.
---
--- Sets the active [Sub Model ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#submodels) for the given [Body Group 		ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#id), so it can be retrieved with [SpawnIcon:GetBodyGroup](https://wiki.facepunch.com/gmod/SpawnIcon:GetBodyGroup).
---
--- Use [Panel:SetModel](https://wiki.facepunch.com/gmod/Panel:SetModel) instead.
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnIcon:SetBodyGroup
---@param bodyGroupId number The Body Group ID to set the active Sub Model ID for.
--- Body Group IDs start at `0`.
---@param activeSubModelId number The Sub Model ID to set as active.
--- Sub Model IDs start at `0`.
function SpawnIcon:SetBodyGroup(bodyGroupId, activeSubModelId) end

---**INTERNAL**: This is done automatically by SpawnIcon. You do not need to call this. Doing so may cause unforeseen consequences.
---
--- Sets the model name, so it can be retrieved with [SpawnIcon:GetModelName](https://wiki.facepunch.com/gmod/SpawnIcon:GetModelName). Use [Panel:SetModel](https://wiki.facepunch.com/gmod/Panel:SetModel) instead.
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnIcon:SetModelName
---@param mdl string The model name to set
function SpawnIcon:SetModelName(mdl) end

---**INTERNAL**: This is done automatically by SpawnIcon. You do not need to call this. Doing so may cause unforeseen consequences.
---
--- Sets the skin id of the spawn icon, so it can be retrieved with [SpawnIcon:GetSkinID](https://wiki.facepunch.com/gmod/SpawnIcon:GetSkinID). Use [Panel:SetModel](https://wiki.facepunch.com/gmod/Panel:SetModel) instead.
---@realm client
---@source https://wiki.facepunch.com/gmod/SpawnIcon:SetSkinID
---@param skin number Skin ID to set
function SpawnIcon:SetSkinID(skin) end
