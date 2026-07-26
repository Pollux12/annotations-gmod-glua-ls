---Appends a float (number with decimals) to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteFloat
---@param float number The float to be sent.
---@[net_payload("write", "float")]
function net.WriteFloat(float) end
