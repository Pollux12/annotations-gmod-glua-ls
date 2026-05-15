---@meta

---@class DScrollPanel : DPanel
---@field pnlCanvas Panel The canvas panel that contains all child elements. Accessible via [DScrollPanel:GetCanvas](https://wiki.facepunch.com/gmod/DScrollPanel:GetCanvas).
---@field VBar DVScrollBar The vertical scroll bar.
local DScrollPanel = {}

---Parents the passed panel to the DScrollPanel's canvas.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:AddItem
---@param pnl Panel The panel to add.
function DScrollPanel:AddItem(pnl) end

---Returns the canvas ( The panel all child panels are parented to ) of the DScrollPanel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:GetCanvas
---@return Panel # The canvas
function DScrollPanel:GetCanvas() end

---Gets the [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel)s padding, set by [DScrollPanel:SetPadding](https://wiki.facepunch.com/gmod/DScrollPanel:SetPadding).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:GetPadding
---@return number # DScrollPanels padding
function DScrollPanel:GetPadding() end

---Returns the vertical scroll bar of the panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:GetVBar
---@return DVScrollBar # The DVScrollBar.
function DScrollPanel:GetVBar() end

---Return the width of the DScrollPanel's canvas.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:InnerWidth
---@return number # The width of the DScrollPanel's canvas
function DScrollPanel:InnerWidth() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to rebuild the panel's children positioning. You should use [Panel:InvalidateLayout](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout) instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:PerformLayoutInternal
function DScrollPanel:PerformLayoutInternal() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to rebuild the panel's children positioning. You should use [Panel:InvalidateLayout](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout) instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:Rebuild
function DScrollPanel:Rebuild() end

---Scrolls to the given child
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:ScrollToChild
---@param panel Panel The panel to scroll to, must be a child of the DScrollPanel.
function DScrollPanel:ScrollToChild(panel) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the canvas of the DScrollPanel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:SetCanvas
---@param canvas Panel The new canvas
function DScrollPanel:SetCanvas(canvas) end

---Sets the DScrollPanel's padding. This function appears to be unused.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DScrollPanel:SetPadding
---@param padding number The padding of the DScrollPanel.
function DScrollPanel:SetPadding(padding) end
