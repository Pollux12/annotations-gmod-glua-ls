---Reads a vector from the received net message. Vectors sent by this function are **compressed**, which may result in precision loss. See [net.WriteVector](https://wiki.facepunch.com/gmod/net.WriteVector) for more information.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadVector
---@return Vector # The read vector, or `Vector( 0, 0, 0 )` if no vector could be read.
---@[net_payload("read", "vector")]
function net.ReadVector() end
