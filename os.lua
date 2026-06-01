---@meta

--- The os library is a standard Lua library originally intended to allow Lua access to various features of the Operating System it's running on, however many of the features and functions have been removed in Garry's Mod due to security issues. It's only used in Garry's Mod for date & time operations.
os = {}

---Returns the approximate cpu time the application ran.
--- See also [Global.SysTime](https://wiki.facepunch.com/gmod/Global.SysTime)
--- **NOTE**: This function has different precision on Linux (1/100).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/os.clock
---@return number # runtime
function os.clock() end

---
--- Returns a string or a table containing date and time, formatted according
--- to the given string `format`.
---
--- If the `time` argument is present, this is the time to be formatted (see
--- the `os.time` function for a description of this value). Otherwise,
--- `date` formats the current time.
---
--- If `format` starts with '`!`', then the date is formatted in Coordinated
--- Universal Time. After this optional character, if `format` is the string
--- "`*t`", then `date` returns a [Structures/DateData](https://wiki.facepunch.com/gmod/Structures/DateData) table with:
---
--- **`year`** (four digits)
--- **`month`** (1–12)
--- **`day`** (1-31)
--- **`hour`** (0-23)
--- **`min`** (0-59)
--- **`sec`** (0-61), due to leap seconds
--- **`wday`** (weekday, 1–7, Sunday is 1)
--- **`yday`** (day of the year, 1–366)
---
--- If `format` is not "`*t`", then `date` returns the date as a string,
---
--- When called without arguments, `date` returns a reasonable date and time
--- representation that depends on the host system and on the current locale.
---@overload fun(fmt:"*t", time?: number):DateData
---@overload fun(fmt:"!*t", time?: number):DateData
---@param format? string # The format string. If `*t` or `!*t`, returns a [Structures/DateData](https://wiki.facepunch.com/gmod/Structures/DateData) table instead.
---@param time? number # Time to use for the format.
---@return string # Formatted date string, or a [Structures/DateData](https://wiki.facepunch.com/gmod/Structures/DateData) table if format is `*t` or `!*t`.
function os.date(format, time) end

---Subtracts the second from the first value and rounds the result.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/os.difftime
---@param timeA number The first value.
---@param timeB number The value to subtract.
---@return number # diffTime
function os.difftime(timeA, timeB) end

---Returns the system time in seconds past the unix epoch. If a table is supplied, the function attempts to build a system time with the specified table members.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/os.time
---@param dateData? DateData Table to generate the time from. This table's data is interpreted as being in the local timezone. See Structures/DateData
---@return number # Seconds passed since Unix epoch
function os.time(dateData) end
