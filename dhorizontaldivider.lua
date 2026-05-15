---@meta

--- Creates an invisible vertical divider between two GUI elements.
---@class (partial) DHorizontalDivider : DPanel
local DHorizontalDivider = {}

---Returns the width of the horizontal divider bar, set by [DHorizontalDivider:SetDividerWidth](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetDividerWidth).
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetDividerWidth
---@return number # The width of the horizontal divider bar
function DHorizontalDivider:GetDividerWidth() end

---Returns whether or not the player is currently dragging the middle divider bar.
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetDragging
---@return boolean # Whether or not the player is currently dragging the middle divider bar.
function DHorizontalDivider:GetDragging() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the local X coordinate of where the player started dragging the thing
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetHoldPos
---@return number #
function DHorizontalDivider:GetHoldPos() end

---Returns the left side content of the [DHorizontalDivider](https://wiki.facepunch.com/gmod/DHorizontalDivider)
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeft
---@return Panel # The content on the left side
function DHorizontalDivider:GetLeft() end

---Returns the minimum width of the left side, set by [DHorizontalDivider:SetLeftMin](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftMin).
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeftMin
---@return number # The minimum width of the left side
function DHorizontalDivider:GetLeftMin() end

---Returns the current width of the left side, set by [DHorizontalDivider:SetLeftWidth](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftWidth) or by the user.
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeftWidth
---@return number # The current width of the left side
function DHorizontalDivider:GetLeftWidth() end

---Returns the middle content, set by [DHorizontalDivider:SetMiddle](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetMiddle).
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetMiddle
---@return Panel # The middle content
function DHorizontalDivider:GetMiddle() end

---Returns the right side content
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetRight
---@return Panel # The right side content
function DHorizontalDivider:GetRight() end

---Returns the minimum width of the right side, set by [DHorizontalDivider:SetRightMin](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetRightMin).
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:GetRightMin
---@return number # The minimum width of the right side
function DHorizontalDivider:GetRightMin() end

---Sets the width of the horizontal divider bar.
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetDividerWidth
---@param width number The width of the horizontal divider bar.
function DHorizontalDivider:SetDividerWidth(width) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether the player is dragging the divider or not
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetDragging
---@param dragonot boolean
function DHorizontalDivider:SetDragging(dragonot) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the local X coordinate of where the player started dragging the thing
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetHoldPos
---@param x number
function DHorizontalDivider:SetHoldPos(x) end

---Sets the left side content of the [DHorizontalDivider](https://wiki.facepunch.com/gmod/DHorizontalDivider).
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeft
---@param pnl Panel The panel to set as the left side
function DHorizontalDivider:SetLeft(pnl) end

---Sets the minimum width of the left side
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftMin
---@param minWidth number The minimum width of the left side
function DHorizontalDivider:SetLeftMin(minWidth) end

---Sets the current/starting width of the left side.
---
--- The width of the right side is automatically calculated by subtracting this from the total width of the [DHorizontalDivider](https://wiki.facepunch.com/gmod/DHorizontalDivider).
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftWidth
---@param width number The current/starting width of the left side
function DHorizontalDivider:SetLeftWidth(width) end

---Sets the middle content, over the draggable divider bar panel.
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetMiddle
---@param middle Panel The middle content
function DHorizontalDivider:SetMiddle(middle) end

---Sets the right side content
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetRight
---@param pnl Panel The right side content
function DHorizontalDivider:SetRight(pnl) end

---Sets the minimum width of the right side
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:SetRightMin
---@param minWidth number The minimum width of the right side
function DHorizontalDivider:SetRightMin(minWidth) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- TODO Document me
---@realm client
---@source https://wiki.facepunch.com/gmod/DHorizontalDivider:StartGrab
function DHorizontalDivider:StartGrab() end
