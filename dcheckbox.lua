---@meta

--- The DCheckBox is a checkbox. It allows you to get a boolean value from the user (true/false - yes/no)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBox
---@class (partial) DCheckBox : DButton
local DCheckBox = {}

---Calls [DCheckBox:Toggle](https://wiki.facepunch.com/gmod/DCheckBox:Toggle)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBox:DoClick
function DCheckBox:DoClick() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that gets the checked state of the checkbox.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBox:GetChecked
---@return boolean # Whether the box is checked or not.
function DCheckBox:GetChecked() end

---Returns whether the state of the checkbox is being edited. This means whether the user is currently clicking (mouse-down) on the checkbox, and applies to both the left and right mouse buttons.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBox:IsEditing
---@return boolean # Whether the checkbox is being clicked.
function DCheckBox:IsEditing() end

---Called when the "checked" state is changed. This is for Overriding
---@hook OnChange
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBox:OnChange
---@param bVal boolean Whether the CheckBox is checked or not.
function DCheckBox:OnChange(bVal) end

---Sets the checked state of the checkbox.
---
--- This is backed by AccessorFunc with FORCE_BOOL, so the input is coerced with tobool before storage.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBox:SetChecked
---@param checked any Value to coerce into the checked state.
function DCheckBox:SetChecked(checked) end

---Sets the checked state of the checkbox, and calls the checkbox's DCheckBox:OnChange and Panel:ConVarChanged methods.
---
--- The value is coerced with tobool before the checked state is stored.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBox:SetValue
---@param checked any Value to coerce into the checked state.
function DCheckBox:SetValue(checked) end

---Toggles the checked state of the checkbox, and calls the checkbox's [DCheckBox:OnChange](https://wiki.facepunch.com/gmod/DCheckBox:OnChange) and [Panel:ConVarChanged](https://wiki.facepunch.com/gmod/Panel:ConVarChanged) methods. [DCheckBox:DoClick](https://wiki.facepunch.com/gmod/DCheckBox:DoClick) is an alias of this function.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBox:Toggle
function DCheckBox:Toggle() end
