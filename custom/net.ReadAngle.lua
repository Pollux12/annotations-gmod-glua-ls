---Reads an angle from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadAngle
---@return Angle # The read angle, or `Angle( 0, 0, 0 )` if no angle could be read
---@[net_payload("read", "angle")]
function net.ReadAngle() end
