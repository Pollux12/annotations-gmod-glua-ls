---Reads a normal vector from the net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadNormal
---@return Vector # The normalized vector ( length = `1` ), or `Vector( 0, 0, 1 )` if no normal could be read.
---@[net_payload("read", "normal")]
function net.ReadNormal() end
