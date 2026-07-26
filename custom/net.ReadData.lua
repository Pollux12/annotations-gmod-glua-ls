---Reads pure binary data from the message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadData
---@param length number The length of the data to be read, in **bytes**.
---@return string # The binary data read, or a string containing one character with a byte of `0` if no data could be read.
---@[net_payload("read", "data")]
function net.ReadData(length) end
