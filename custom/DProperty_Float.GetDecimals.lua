---Called to poll the amount of digits after the decimal point. This is used internally for [DProperty_Int](https://wiki.facepunch.com/gmod/DProperty_Int).
---@hook GetDecimals
---@realm client
---@source https://wiki.facepunch.com/gmod/DProperty_Float:GetDecimals
---@return number # The amount of digits after the decimal point.
function DProperty_Float:GetDecimals() end
