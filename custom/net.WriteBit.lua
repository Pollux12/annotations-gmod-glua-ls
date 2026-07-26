---Appends a boolean (as `1` or `0`) to the current net message.
---
--- Please note that the bit is written here from a [boolean](https://wiki.facepunch.com/gmod/boolean) (`true/false`) but [net.ReadBit](https://wiki.facepunch.com/gmod/net.ReadBit) returns a number.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteBit
---@param boolean boolean Bit status (false = `0`, true = `1`).
---@[net_payload("write", "bit")]
function net.WriteBit(boolean) end
