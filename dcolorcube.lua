---@meta

--- The DColorCube allows a user to select saturation and value but not hue. Uses HSV colors
---@class (partial) DColorCube : DSlider
local DColorCube = {}

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the base Color set by [DColorCube:SetBaseRGB](https://wiki.facepunch.com/gmod/DColorCube:SetBaseRGB).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:GetBaseRGB
---@return Color # A Color
function DColorCube:GetBaseRGB() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color cube's default color. By default, it is set to white. (255 255 255 RGB)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:GetDefaultColor
---@return Color # The default Color.
function DColorCube:GetDefaultColor() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the value set by [DColorCube:SetHue](https://wiki.facepunch.com/gmod/DColorCube:SetHue).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:GetHue
---@return number #
function DColorCube:GetHue() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color cube's current set color.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:GetRGB
---@return Color # The set color, uses Color.
function DColorCube:GetRGB() end

---Sets the color to whatever [DColorCube:GetDefaultColor](https://wiki.facepunch.com/gmod/DColorCube:GetDefaultColor) returns
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:ResetToDefaultValue
function DColorCube:ResetToDefaultValue() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the base color and the color used to draw the color cube panel itself.
---
--- **NOTE**: Calling this when using a color that isn't 100% saturated and valued ([Global.HSVToColor](https://wiki.facepunch.com/gmod/Global.HSVToColor) with saturation and value set to 1) causes the color cube to look inaccurate compared to the color that's returned by methods like [DColorCube:GetRGB](https://wiki.facepunch.com/gmod/DColorCube:GetRGB) and [DColorCube:OnUserChanged](https://wiki.facepunch.com/gmod/DColorCube:OnUserChanged). You should use [DColorCube:SetColor](https://wiki.facepunch.com/gmod/DColorCube:SetColor) instead
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:SetBaseRGB
---@param color Color The base color to set, uses Color.
function DColorCube:SetBaseRGB(color) end

---Sets the base color of the color cube and updates the slider position.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:SetColor
---@param color Color The color to set, uses Color.
function DColorCube:SetColor(color) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the color cube's default color. This value will be used to reset to on middle mouse click of the color cube's draggable slider.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:SetDefaultColor
---@param Color Color The new default Color.
function DColorCube:SetDefaultColor(Color) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that appears to do nothing and unused.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:SetHue
---@param hue number
function DColorCube:SetHue(hue) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- 	An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that used internally to set the real "output" color of the panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:SetRGB
---@param clr Color A Color
function DColorCube:SetRGB(clr) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the color cube RGB based on the given x and y position and returns its arguments. Similar to [DColorCube:UpdateColor](https://wiki.facepunch.com/gmod/DColorCube:UpdateColor).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:TranslateValues
---@param x? number The x position to sample color from/the percentage of saturation to remove from the color (ranges from 0.0 to 1.0).
---@param y? number The y position to sample color from/the percentage of brightness or value to remove from the color (ranges from 0.0 to 1.0).
---@return number # The given x position.
---@return number # The given y position.
function DColorCube:TranslateValues(x, y) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the color cube RGB based on the given x and y position. Similar to [DColorCube:TranslateValues](https://wiki.facepunch.com/gmod/DColorCube:TranslateValues).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorCube:UpdateColor
---@param x? number The x position to set color to/the percentage of saturation to remove from the color (ranges from 0.0 to 1.0).
---@param y? number The y position to set color to/the percentage of brightness or value to remove from the color (ranges from 0.0 to 1.0).
function DColorCube:UpdateColor(x, y) end
