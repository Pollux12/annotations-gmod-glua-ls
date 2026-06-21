---@meta

--- A bar to select the opacity (alpha level) of a color.
---@class (partial) DAlphaBar : DPanel
local DAlphaBar = {}

---Returns the base color of the alpha bar. This is the color for which the alpha channel is being modified. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DAlphaBar:GetBarColor
---@return Color # The current base Color.
function DAlphaBar:GetBarColor() end

---Returns the alpha value of the alpha bar. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DAlphaBar:GetValue
---@return number # The current alpha value.
function DAlphaBar:GetValue() end

---Sets the base color of the alpha bar. This is the color for which the alpha channel is being modified. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DAlphaBar:SetBarColor
---@param clr Color The new Color to set. See Global.Color.
function DAlphaBar:SetBarColor(clr) end

---Sets the alpha value or the alpha bar. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DAlphaBar:SetValue
---@param alpha number The new alpha value to set
function DAlphaBar:SetValue(alpha) end
