---Returns a new [Color](https://wiki.facepunch.com/gmod/Color) with the RGB components of the given [Color](https://wiki.facepunch.com/gmod/Color) and the alpha value specified.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.ColorAlpha
---@param color Color The Color from which to take RGB values. This color will not be modified.
---@param alpha number The new alpha value, a number between 0 and 255. Values above 255 will be clamped.
---@return Color # The new Color with the modified alpha value
function _G.ColorAlpha(color, alpha) end
