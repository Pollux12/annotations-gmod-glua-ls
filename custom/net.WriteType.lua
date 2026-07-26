---**INTERNAL**: Used internally by [net.WriteTable](https://wiki.facepunch.com/gmod/net.WriteTable).
---
--- Appends any type of value to the current net message.
---
--- **NOTE**: An additional 8-bit unsigned integer indicating the type will automatically be written to the packet before the value, in order to facilitate reading with [net.ReadType](https://wiki.facepunch.com/gmod/net.ReadType). If you know the data type you are writing, use a function meant for that specific data type to reduce amount of data sent.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteType
---@param Data any The data to be sent.
---@[net_payload("write", "type")]
function net.WriteType(Data) end
