---Reads a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) from the received net message.
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadMatrix
---@return VMatrix # The matrix, or an empty matrix if no matrix could be read.
---@[net_payload("read", "matrix")]
function net.ReadMatrix() end
