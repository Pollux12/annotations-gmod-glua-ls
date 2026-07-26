---Appends a boolean to the current net message. Alias of [net.WriteBit](https://wiki.facepunch.com/gmod/net.WriteBit).
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteBool
---@param boolean boolean Boolean value to write.
---@[net_payload("write", "bool")]
function net.WriteBool(boolean) end
