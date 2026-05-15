---@meta

--- DIconLayout is what replaced [DPanelList](https://wiki.facepunch.com/gmod/DPanelList) in Garry's Mod 13.
--- DPanelList still exists in GMod but is deprecated and does not support the new GWEN skin.
---
--- [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout) is used to make a list of panels.
--- Unlike DPanelList, DIconLayout does not automatically add a scroll bar - the example below shows you how you can do this.
---@class (partial) DIconLayout : DDragBase
local DIconLayout = {}

---Creates a replica of the DIconLayout it is called on.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:Copy
---@return Panel # The replica.
function DIconLayout:Copy() end

---Copies the contents (Child elements) of another [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout) to itself.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:CopyContents
---@param from Panel DIconLayout to copy from.
function DIconLayout:CopyContents(from) end

---Returns the size of the border.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:GetBorder
---@return number #
function DIconLayout:GetBorder() end

---Returns the direction that it will be layed out, using the DOCK enumerations.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:GetLayoutDir
---@return number # Layout direction.
function DIconLayout:GetLayoutDir() end

---Returns the distance between two 'icons' on the X axis.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:GetSpaceX
---@return number # Distance between two 'icons' on the X axis.
function DIconLayout:GetSpaceX() end

---Returns distance between two "Icons" on the Y axis.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:GetSpaceY
---@return number # distance between two "Icons" on the Y axis.
function DIconLayout:GetSpaceY() end

---Returns whether the icon layout will stretch its height to fit all the children.
---
--- See also [DIconLayout:GetStretchWidth](https://wiki.facepunch.com/gmod/DIconLayout:GetStretchWidth)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:GetStretchHeight
---@return boolean #
function DIconLayout:GetStretchHeight() end

---Returns whether the icon layout will stretch its width to fit all the children.
---
--- See also [DIconLayout:GetStretchHeight](https://wiki.facepunch.com/gmod/DIconLayout:GetStretchHeight)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:GetStretchWidth
---@return boolean #
function DIconLayout:GetStretchWidth() end

---Resets layout vars before calling [Panel:InvalidateLayout](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout). This is called when children are added or removed, and must be called when the spacing, border or layout direction is changed.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:Layout
function DIconLayout:Layout() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to layout the child elements if the [DIconLayout:SetLayoutDir](https://wiki.facepunch.com/gmod/DIconLayout:SetLayoutDir) is set to LEFT (See [Enums/DOCK](https://wiki.facepunch.com/gmod/Enums/DOCK)).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:LayoutIcons_LEFT
function DIconLayout:LayoutIcons_LEFT() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to layout the child elements if the [DIconLayout:SetLayoutDir](https://wiki.facepunch.com/gmod/DIconLayout:SetLayoutDir) is set to TOP (See [Enums/DOCK](https://wiki.facepunch.com/gmod/Enums/DOCK)).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:LayoutIcons_TOP
function DIconLayout:LayoutIcons_TOP() end

---Sets the internal border (padding) within the DIconLayout. This will not change its size, only the positioning of children. You must call [DIconLayout:Layout](https://wiki.facepunch.com/gmod/DIconLayout:Layout) in order for the changes to take effect.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:SetBorder
---@param width number The border (padding) inside the DIconLayout.
function DIconLayout:SetBorder(width) end

---Sets the direction that it will be layed out, using the [Enums/DOCK](https://wiki.facepunch.com/gmod/Enums/DOCK).
---
--- Currently only TOP and LEFT are supported.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:SetLayoutDir
---@param direction number Enums/DOCK
function DIconLayout:SetLayoutDir(direction) end

---Sets the horizontal (x) spacing between children within the DIconLayout. You must call [DIconLayout:Layout](https://wiki.facepunch.com/gmod/DIconLayout:Layout) in order for the changes to take effect.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:SetSpaceX
---@param xSpacing number The width of the gap between child objects.
function DIconLayout:SetSpaceX(xSpacing) end

---Sets the vertical (y) spacing between children within the DIconLayout. You must call [DIconLayout:Layout](https://wiki.facepunch.com/gmod/DIconLayout:Layout) in order for the changes to take effect.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:SetSpaceY
---@param ySpacing number The vertical gap between rows in the DIconLayout.
function DIconLayout:SetSpaceY(ySpacing) end

---If set to true, the icon layout will stretch its height to fit all the children.
---
--- See also [DIconLayout:SetStretchWidth](https://wiki.facepunch.com/gmod/DIconLayout:SetStretchWidth)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:SetStretchHeight
---@param do_stretch boolean
function DIconLayout:SetStretchHeight(do_stretch) end

---If set to true, the icon layout will stretch its width to fit all the children.
---
--- See also [DIconLayout:SetStretchHeight](https://wiki.facepunch.com/gmod/DIconLayout:SetStretchHeight)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconLayout:SetStretchWidth
---@param stretchW boolean
function DIconLayout:SetStretchWidth(stretchW) end
