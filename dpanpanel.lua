---@meta

--- A panel similar to [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel), but that allows the player to pan around, for example a zoomed in image within a small window.
---@class (partial) DPanPanel : DPanel
local DPanPanel = {}

---Parents the passed panel to the [DPanPanel:GetCanvas](https://wiki.facepunch.com/gmod/DPanPanel:GetCanvas).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanPanel:AddItem
---@param pnl Panel The panel to add.
function DPanPanel:AddItem(pnl) end

---The internal canvas panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanPanel:GetCanvas
---@return Panel # The canvas panel.
function DPanPanel:GetCanvas() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally, called from [DPanPanel:ScrollToChild](https://wiki.facepunch.com/gmod/DPanPanel:ScrollToChild).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanPanel:OnScroll
---@param x number
---@param y number
function DPanPanel:OnScroll(x, y) end

---Scroll to a specific child panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanPanel:ScrollToChild
---@param pnl Panel The panel to scroll to.
function DPanPanel:ScrollToChild(pnl) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanPanel:SetCanvas
---@param pnl Panel The canvas panel.
function DPanPanel:SetCanvas(pnl) end
