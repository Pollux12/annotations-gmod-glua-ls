---Appends a string to the current net message. The size of the written data is 8 bits for every ASCII character in the string + 8 bits for the null terminator.
---
--- The maximum allowed length of a single written string is **65532 characters**. (aka the limit of the net message itself)
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteString
---@param string string The string to be sent.
---
--- The input will be terminated at the first null byte if one is present. See net.WriteData if you wish to write binary data.
---@[net_payload("write", "string")]
function net.WriteString(string) end
