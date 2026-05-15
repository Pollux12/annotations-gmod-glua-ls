---@meta

--- A simple rectangular box, commonly used for parenting other elements to. Pretty much all elements are based on this.
---@class (partial) DPanel : Panel
local DPanel = {}

---Returns the panel's background color.
---
--- **NOTE**: By default this returns **nil** even though the default background color is white
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:GetBackgroundColor
---@return Color # Color of the panel's background.
function DPanel:GetBackgroundColor() end

---Returns whether or not the panel is disabled.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:GetDisabled
---@return boolean # `true` if the panel is disabled (mouse input disabled and background alpha set to 75), `false` if its enabled (mouse input enabled and background alpha set to 255).
---@deprecated Use Panel:IsEnabled.
function DPanel:GetDisabled() end

---Returns whether or not the panel background is being drawn. Alias of [DPanel:GetPaintBackground](https://wiki.facepunch.com/gmod/DPanel:GetPaintBackground).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:GetDrawBackground
---@return boolean # True if the panel background is drawn, false otherwise.
---@deprecated You should use DPanel:GetPaintBackground instead.
function DPanel:GetDrawBackground() end

---Used internally by [DMenu](https://wiki.facepunch.com/gmod/DMenu).
---
--- Returns whether the frame is part of a derma menu or not.
---
--- If this is `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the frame is clicked, and thus any open menus will remain open.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:GetIsMenu
---@return boolean # Whether this panel is a Menu Component
function DPanel:GetIsMenu() end

---Returns whether or not the panel background is being drawn.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:GetPaintBackground
---@return boolean # True if the panel background is drawn, false otherwise.
function DPanel:GetPaintBackground() end

---Does nothing. Returns value set by [DPanel:SetTabbingDisabled](https://wiki.facepunch.com/gmod/DPanel:SetTabbingDisabled).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:GetTabbingDisabled
---@return boolean #
function DPanel:GetTabbingDisabled() end

---Sets the background color of the panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:SetBackgroundColor
---@param color Color The background Color.
function DPanel:SetBackgroundColor(color) end

---Sets whether or not to disable the panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:SetDisabled
---@param disabled boolean True to disable the panel (mouse input disabled and background alpha set to 75), false to enable it (mouse input enabled and background alpha set to 255).
---@deprecated Use Panel:SetEnabled instead.
function DPanel:SetDisabled(disabled) end

---Sets whether or not to draw the panel background. Alias of [DPanel:SetPaintBackground](https://wiki.facepunch.com/gmod/DPanel:SetPaintBackground).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:SetDrawBackground
---@param draw boolean True to show the panel's background, false to hide it.
---@deprecated You should use DPanel:SetPaintBackground instead.
function DPanel:SetDrawBackground(draw) end

---Used internally by [DMenu](https://wiki.facepunch.com/gmod/DMenu).
---
--- Sets whether the frame is part of a derma menu or not.
---
--- If this is set to `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the frame is clicked, and thus any open menus will remain open.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:SetIsMenu
---@param isMenu boolean Whether this pane is a Menu Component
function DPanel:SetIsMenu(isMenu) end

---Sets whether or not to paint/draw the panel background.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:SetPaintBackground
---@param paint boolean True to show the panel's background, false to hide it.
function DPanel:SetPaintBackground(paint) end

---Does nothing.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:SetTabbingDisabled
---@param draw boolean
function DPanel:SetTabbingDisabled(draw) end

---Does nothing.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanel:UpdateColours
function DPanel:UpdateColours() end
