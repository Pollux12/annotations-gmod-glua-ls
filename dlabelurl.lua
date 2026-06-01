---@meta

--- Underlined link label without a DoClick function. When a valid URL is set and the label is clicked, it will open a browser window and navigate to the address.
---
--- This panel uses [gui.OpenURL](https://wiki.facepunch.com/gmod/gui.OpenURL) internally and its restrictions apply.
---@class (partial) DLabelURL : URLLabel
local DLabelURL = {}

---Does absolutely nothing at all.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:GetAutoStretchVertical
---@return boolean # Does nothing.
function DLabelURL:GetAutoStretchVertical() end

---Gets the current text color of the [DLabelURL](https://wiki.facepunch.com/gmod/DLabelURL). Returns either [DLabelURL:GetTextColor](https://wiki.facepunch.com/gmod/DLabelURL:GetTextColor) or if that is unset -  [DLabelURL:GetTextStyleColor](https://wiki.facepunch.com/gmod/DLabelURL:GetTextStyleColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:GetColor
---@return Color # The current text Color.
function DLabelURL:GetColor() end

---Gets the current text color of the [DLabelURL](https://wiki.facepunch.com/gmod/DLabelURL) set by [DLabelURL:SetTextColor](https://wiki.facepunch.com/gmod/DLabelURL:SetTextColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:GetTextColor
---@return Color # The current text Color.
function DLabelURL:GetTextColor() end

---Returns the color set by [DLabelURL:SetTextStyleColor](https://wiki.facepunch.com/gmod/DLabelURL:SetTextStyleColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:GetTextStyleColor
---@return Color # The Color
function DLabelURL:GetTextStyleColor() end

---Does absolutely nothing at all.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:SetAutoStretchVertical
---@param draw boolean Does nothing.
function DLabelURL:SetAutoStretchVertical(draw) end

---Alias of [DLabelURL:SetTextColor](https://wiki.facepunch.com/gmod/DLabelURL:SetTextColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:SetColor
---@param col Color The Color to use.
function DLabelURL:SetColor(col) end

---Sets the text color of the [DLabelURL](https://wiki.facepunch.com/gmod/DLabelURL). Overrides [DLabelURL:SetTextStyleColor](https://wiki.facepunch.com/gmod/DLabelURL:SetTextStyleColor).
---
--- This should only be used immediately after it is created, and otherwise [Panel:SetFGColor](https://wiki.facepunch.com/gmod/Panel:SetFGColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:SetTextColor
---@param col Color The Color to use.
function DLabelURL:SetTextColor(col) end

---Sets the base text color of the [DLabelURL](https://wiki.facepunch.com/gmod/DLabelURL). This is overridden by [DLabelURL:SetTextColor](https://wiki.facepunch.com/gmod/DLabelURL:SetTextColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:SetTextStyleColor
---@param color Color The Color to set
function DLabelURL:SetTextStyleColor(color) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Used internally to set correct text color via [Panel:SetFGColor](https://wiki.facepunch.com/gmod/Panel:SetFGColor) and [DLabelURL:GetColor](https://wiki.facepunch.com/gmod/DLabelURL:GetColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabelURL:UpdateFGColor
function DLabelURL:UpdateFGColor() end
