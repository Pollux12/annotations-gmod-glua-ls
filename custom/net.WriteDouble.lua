---Appends a double-precision number to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteDouble
---@param double number The double to be sent
---@[net_payload("write", "double")]
function net.WriteDouble(double) end
