---@meta

--- DNumberWang is a VGUI element that allows you to input a numeric value using up and down arrows or direct entry.
---@class (partial) DNumberWang : DTextEntry
local DNumberWang = {}

---Returns the amount of decimal places allowed in the number selector, set by [DNumberWang:SetDecimals](https://wiki.facepunch.com/gmod/DNumberWang:SetDecimals)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:GetDecimals
---@return number # The amount of decimal places allowed in the number selector.
function DNumberWang:GetDecimals() end

---Returns whatever is set by [DNumberWang:SetFloatValue](https://wiki.facepunch.com/gmod/DNumberWang:SetFloatValue) or 0.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:GetFloatValue
---@return number #
function DNumberWang:GetFloatValue() end

---Returns a fraction representing the current number selector value to number selector min/max range ratio. If argument `val` is supplied, that number will be computed instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:GetFraction
---@param val number The fraction numerator.
function DNumberWang:GetFraction(val) end

---Returns interval at which the up and down buttons change the current value.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:GetInterval
---@return number # The current interval.
function DNumberWang:GetInterval() end

---Returns the maximum numeric value allowed by the number selector.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:GetMax
---@return number # The maximum value.
function DNumberWang:GetMax() end

---Returns the minimum numeric value allowed by the number selector.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:GetMin
---@return number # The minimum number.
function DNumberWang:GetMin() end

---This function returns the panel it is used on.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:GetTextArea
---@return Panel # self
function DNumberWang:GetTextArea() end

---Returns the numeric value inside the number selector.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:GetValue
---@return number # The numeric value.
function DNumberWang:GetValue() end

---Hides the number selector arrows.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:HideWang
function DNumberWang:HideWang() end

---Sets the amount of decimal places allowed in the number selector.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:SetDecimals
---@param num number The amount of decimal places.
function DNumberWang:SetDecimals(num) end

---Appears to do nothing.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:SetFloatValue
---@param val number
function DNumberWang:SetFloatValue(val) end

---Sets the value of the number selector based on the given fraction number.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:SetFraction
---@param val number The fraction of the number selector's range.
function DNumberWang:SetFraction(val) end

---Sets interval at which the up and down buttons change the current value.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:SetInterval
---@param min number The new interval.
function DNumberWang:SetInterval(min) end

---Sets the maximum numeric value allowed by the number selector.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:SetMax
---@param max number The maximum value.
function DNumberWang:SetMax(max) end

---Sets the minimum numeric value allowed by the number selector.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:SetMin
---@param min number The minimum value.
function DNumberWang:SetMin(min) end

---Sets the minimum and maximum value allowed by the number selector.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:SetMinMax
---@param min number The minimum value.
---@param max number The maximum value.
function DNumberWang:SetMinMax(min, max) end

---Sets the value of the [DNumberWang](https://wiki.facepunch.com/gmod/DNumberWang) and triggers [DNumberWang:OnValueChanged](https://wiki.facepunch.com/gmod/DNumberWang:OnValueChanged)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DNumberWang:SetValue
---@param val number The value to set.
function DNumberWang:SetValue(val) end
