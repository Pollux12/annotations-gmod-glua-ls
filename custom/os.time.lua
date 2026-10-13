---Returns the system time in seconds past the unix epoch. If a table is supplied, the function attempts to build a system time with the specified table members.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/os.time
---@param dateData? DateInput|DateData Table to generate the time from. This table's data is interpreted as being in the local timezone. See Structures/DateData
---@return number # Seconds passed since Unix epoch
function os.time(dateData) end
