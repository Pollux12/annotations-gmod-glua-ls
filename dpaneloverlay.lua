---@meta

--- Adds curved corners.
---@class (partial) DPanelOverlay : DPanel
local DPanelOverlay = {}

---Returns the border color of the [DPanelOverlay](https://wiki.facepunch.com/gmod/DPanelOverlay) set by [DPanelOverlay:SetColor](https://wiki.facepunch.com/gmod/DPanelOverlay:SetColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelOverlay:GetColor
---@return Color # The set color. Uses Color.
function DPanelOverlay:GetColor() end

---Returns the type of the [DPanelOverlay](https://wiki.facepunch.com/gmod/DPanelOverlay) set by [DPanelOverlay:SetType](https://wiki.facepunch.com/gmod/DPanelOverlay:SetType).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelOverlay:GetType
---@return number # The set type.
function DPanelOverlay:GetType() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Used internally by the panel for type 3.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelOverlay:PaintDifferentColours
---@param cola table
---@param colb table
---@param colc table
---@param cold table
---@param size number
function DPanelOverlay:PaintDifferentColours(cola, colb, colc, cold, size) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Used internally by the panel for types 1 and 2.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelOverlay:PaintInnerCorners
---@param size number
function DPanelOverlay:PaintInnerCorners(size) end

---Sets the border color of the [DPanelOverlay](https://wiki.facepunch.com/gmod/DPanelOverlay).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelOverlay:SetColor
---@param color Color The color to set. Uses Color.
function DPanelOverlay:SetColor(color) end

---Sets the type of the [DPanelOverlay](https://wiki.facepunch.com/gmod/DPanelOverlay).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelOverlay:SetType
---@param type number The type to set.
---
--- Possible value are:
--- * 1 - 8px corners of given color
--- * 2 - 4px corners of given type
--- * 3 - 2 top? corners of hardcoded color, 2 other corners of given color
function DPanelOverlay:SetType(type) end
