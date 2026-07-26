---Writes a normalized/direction vector ( Vector with length of 1 ) to the net message.
---
--- This function uses less bandwidth compared to [net.WriteVector](https://wiki.facepunch.com/gmod/net.WriteVector) and will not send vectors with length of > 1 properly.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteNormal
---@param normal Vector The normalized/direction vector to be send.
---@[net_payload("write", "normal")]
function net.WriteNormal(normal) end
