---Writes a chunk of binary data to the message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteData
---@param binaryData string The binary data to be sent.
---@param length? number The length of the binary data to be sent, in bytes.
---@[net_payload("write", "data")]
function net.WriteData(binaryData, length) end
