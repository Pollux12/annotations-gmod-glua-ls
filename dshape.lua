---@meta

--- Draw a shape on a derma panel. Only one kind of shape, a rectangle, is available for use.
---@class (partial) DShape : DPanel
local DShape = {}

---Returns the current type of shape this panel is set to display.
---
--- See [DShape:SetBorderColor](https://wiki.facepunch.com/gmod/DShape:SetBorderColor).
---@realm client
---@source https://wiki.facepunch.com/gmod/DShape:GetBorderColor
---@return Color # The border Color
function DShape:GetBorderColor() end

---Returns the color set to display the shape with.
---@realm client
---@source https://wiki.facepunch.com/gmod/DShape:GetColor
---@return Color # The shape Color
function DShape:GetColor() end

---Returns the current type of shape this panel is set to display.
---
--- See [DShape:SetType](https://wiki.facepunch.com/gmod/DShape:SetType).
---@realm client
---@source https://wiki.facepunch.com/gmod/DShape:GetType
---@return string # Current shape type.
function DShape:GetType() end

---Sets the border color of the shape.
---
--- Currently does nothing.
---@realm client
---@source https://wiki.facepunch.com/gmod/DShape:SetBorderColor
---@param clr Color The desired border color. See Color
function DShape:SetBorderColor(clr) end

---Sets the color to display the shape with.
---@realm client
---@source https://wiki.facepunch.com/gmod/DShape:SetColor
---@param clr Color The Color
function DShape:SetColor(clr) end

---Sets the shape to be drawn.
---@realm client
---@source https://wiki.facepunch.com/gmod/DShape:SetType
---@param type string The render type of the DShape. Only rectangles (`Rect`) work currently. If you don't define a type immediately, the PANEL:Paint method will generate errors until you do.
function DShape:SetType(type) end
