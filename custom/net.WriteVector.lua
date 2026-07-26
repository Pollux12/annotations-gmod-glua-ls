---Appends a vector to the current net message.
--- Vectors sent by this function are compressed, which may result in precision loss. XYZ components greater than `16384` or less than `-16384` are irrecoverably altered (most significant bits are trimmed) and precision after the decimal point is 1 digit (5 bits).
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteVector
---@param vector Vector The vector to be sent.
---@[net_payload("write", "vector")]
function net.WriteVector(vector) end
