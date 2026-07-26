---Reads a unsigned integer with 64 bits from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadUInt64
---@return string # The uint64 number.
---
--- Since Lua cannot store full 64-bit integers, this function returns a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).
---@[net_payload("read", "uint64")]
function net.ReadUInt64() end
