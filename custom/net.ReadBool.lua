---Reads a boolean from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadBool
---@return boolean # `true` or `false`, or `false` if the bool could not be read.
---@[net_payload("read", "bool")]
function net.ReadBool() end
