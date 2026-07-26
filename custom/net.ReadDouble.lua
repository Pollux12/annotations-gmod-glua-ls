---Reads a double-precision number from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadDouble
---@return number # The double-precision number, or `0` if no number could be read.
---@[net_payload("read", "double")]
function net.ReadDouble() end
