---Reads a [null-terminated string](https://en.wikipedia.org/wiki/Null-terminated_string) from the net stream. The size of the string is 8 bits plus 8 bits for every ASCII character in the string.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadString
---@return string # The read string, or a string with `0` length if no string could be read.
---@[net_payload("read", "string")]
function net.ReadString() end
