---Reads a [Color](https://wiki.facepunch.com/gmod/Color) from the current net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadColor
---@param hasAlpha? boolean If the color has alpha written or not. **Must match what was given to net.WriteColor.**
---@return Color # The Color read from the current net message, or `Color( 0, 0, 0, 0 )` if the color could not be read.
---@[net_payload("read", "color")]
function net.ReadColor(hasAlpha) end
