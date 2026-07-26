---Reads a bit from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadBit
---@return number # `0` or `1`, or `0` if the bit could not be read.
---@[net_payload("read", "bit")]
function net.ReadBit() end
