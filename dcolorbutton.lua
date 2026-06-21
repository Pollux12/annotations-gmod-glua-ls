---@meta

--- Colorful buttons. Used internally by [DColorPalette](https://wiki.facepunch.com/gmod/DColorPalette).
---@class (partial) DColorButton : DLabel
local DColorButton = {}

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color of the button
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorButton:GetColor
---@return Color # The Color of the button
function DColorButton:GetColor() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns value set by [DColorButton:SetDrawBorder](https://wiki.facepunch.com/gmod/DColorButton:SetDrawBorder). See that page for more info.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorButton:GetDrawBorder
---@return boolean # Value set by DColorButton:SetDrawBorder.
function DColorButton:GetDrawBorder() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the unique ID set by [DColorButton:SetID](https://wiki.facepunch.com/gmod/DColorButton:SetID).
---
--- Used internally by [DColorPalette](https://wiki.facepunch.com/gmod/DColorPalette)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorButton:GetID
---@return number # The unique ID of the button
function DColorButton:GetID() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that is an alias of [Panel:IsSelected](https://wiki.facepunch.com/gmod/Panel:IsSelected).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorButton:GetSelected
---@return boolean #
function DColorButton:GetSelected() end

---Returns whether the [DColorButton](https://wiki.facepunch.com/gmod/DColorButton) is currently being pressed (the user is holding it down).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorButton:IsDown
---@return boolean #
function DColorButton:IsDown() end

---Sets the color of the [DColorButton](https://wiki.facepunch.com/gmod/DColorButton).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorButton:SetColor
---@param color Color A Color to set the color as
---@param noTooltip? boolean If true, the tooltip will not be reset to display the selected color.
function DColorButton:SetColor(color, noTooltip) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that does absolutely nothing at all. Default value is automatically set to true.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorButton:SetDrawBorder
---@param draw boolean Does nothing.
function DColorButton:SetDrawBorder(draw) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that is used internally by [DColorPalette](https://wiki.facepunch.com/gmod/DColorPalette) to detect which button is which.
---
--- 	Pairs with [DColorButton:GetID](https://wiki.facepunch.com/gmod/DColorButton:GetID)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorButton:SetID
---@param id number A unique ID to give this button
function DColorButton:SetID(id) end
