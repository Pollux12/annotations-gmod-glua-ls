---Appends a [Color](https://wiki.facepunch.com/gmod/Color) to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteColor
---@param Color Color The Color you want to append to the net message.
---@param writeAlpha? boolean If we should write the alpha of the color or not.
---@[net_payload("write", "color")]
function net.WriteColor(Color, writeAlpha) end
