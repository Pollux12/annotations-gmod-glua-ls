---Writes a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteMatrix
---@param matrix VMatrix The matrix to be sent.
---@[net_payload("write", "matrix")]
function net.WriteMatrix(matrix) end
