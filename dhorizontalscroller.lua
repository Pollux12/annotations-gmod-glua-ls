---@meta

--- A very basic horizontal scrollable panel, similar to [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel).
---
--- Used internally in [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet).
---@class (partial) DHorizontalScroller : Panel
local DHorizontalScroller = {}

---Adds a panel to the [DHorizontalScroller](https://wiki.facepunch.com/gmod/DHorizontalScroller).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:AddPanel
---@param pnl Panel The panel to add. It will be automatically parented.
function DHorizontalScroller:AddPanel(pnl) end

---Returns the internal canvas panel where the content of [DHorizontalScroller](https://wiki.facepunch.com/gmod/DHorizontalScroller) are placed on.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:GetCanvas
---@return Panel # The DDragBase panel.
function DHorizontalScroller:GetCanvas() end

---Returns the overlap set by [DHorizontalScroller:SetOverlap](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetOverlap).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:GetOverlap
---@return number # The overlap.
function DHorizontalScroller:GetOverlap() end

---Returns whether this panel should show drop targets.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:GetShowDropTargets
---@return boolean #
function DHorizontalScroller:GetShowDropTargets() end

---Same as [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable).
--- TODO: Transclude or whatever to here?
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:MakeDroppable
---@param name string
function DHorizontalScroller:MakeDroppable(name) end

---Scrolls the [DHorizontalScroller](https://wiki.facepunch.com/gmod/DHorizontalScroller) to given child panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:ScrollToChild
---@param target Panel The target child panel. Must be a child of DHorizontalScroller:GetCanvas
function DHorizontalScroller:ScrollToChild(target) end

---Controls the spacing between elements of the horizontal scroller.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:SetOverlap
---@param overlap number Overlap in pixels. Positive numbers will make elements `overlap` each other, negative will add spacing.
function DHorizontalScroller:SetOverlap(overlap) end

---Sets the scroll amount, automatically clamping the value.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:SetScroll
---@param scroll number The new scroll amount
function DHorizontalScroller:SetScroll(scroll) end

---Sets whether this panel should show drop targets.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:SetShowDropTargets
---@param newState boolean
function DHorizontalScroller:SetShowDropTargets(newState) end

---Same as [DDragBase:SetUseLiveDrag](https://wiki.facepunch.com/gmod/DDragBase:SetUseLiveDrag)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:SetUseLiveDrag
---@param newState boolean
function DHorizontalScroller:SetUseLiveDrag(newState) end
