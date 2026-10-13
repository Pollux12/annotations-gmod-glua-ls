---Reads an unsigned 64-bit integer from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadUInt64
---@return string # An unsigned 64-bit integer.
--- Since Lua cannot store full 64-bit integers, this function returns a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).
---@[fresh_result]
function File:ReadUInt64() end
