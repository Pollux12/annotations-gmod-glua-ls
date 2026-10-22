---Returns the number of UTF-8 sequences in the given string between positions startPos and endPos (both inclusive). If it finds any invalid UTF-8 byte sequence, returns false as well as the position of the first invalid byte.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/utf8.len
---@param string string The string to calculate the length of.
---@param startPos? number The starting position to get the length from.
---@param endPos? number The ending position to get the length from.
---@return number|false # The number of UTF-8 characters in the string. If there are invalid bytes, this will be false.
---@return number? # The position of the first invalid byte. If there were no invalid bytes, this will be nil.
function utf8.len(string, startPos, endPos) end
