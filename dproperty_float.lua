---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Float control for the [DProperties](https://wiki.facepunch.com/gmod/DProperties) panel.
---@realm client
---@source https://wiki.facepunch.com/gmod/DProperty_Float
---@class (partial) DProperty_Float : DProperty_Generic
local DProperty_Float = {}

---Called to poll the amount of digits after the decimal point. This is used internally for [DProperty_Int](https://wiki.facepunch.com/gmod/DProperty_Int).
---@hook GetDecimals
---@realm client
---@source https://wiki.facepunch.com/gmod/DProperty_Float:GetDecimals
---@return table # The amount of digits after the decimal point.
function DProperty_Float:GetDecimals() end
