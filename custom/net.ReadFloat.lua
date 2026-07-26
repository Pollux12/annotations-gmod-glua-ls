---Reads a floating point number from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadFloat
---@return number # The floating point number, or `0` if no number could be read.
---@[net_payload("read", "float")]
function net.ReadFloat() end
