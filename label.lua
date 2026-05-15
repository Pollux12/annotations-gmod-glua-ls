---@meta

---@class (partial) Label : Panel
local Label = {}

---Sets the font used to draw the label text.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Panel:SetFontInternal
---@param fontName string The font name.
function Label:SetFont(fontName) end

---Sets the label text color.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DLabel:SetTextColor
---@param color Color The text color.
function Label:SetTextColor(color) end
