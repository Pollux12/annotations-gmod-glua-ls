---This function takes a numeric indexed table and return all the members as a vararg. If specified, it will start at the given index and end at end index.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.unpack
---@generic T, Start: integer, End: integer
---@param tbl T # The table to generate the vararg from.
---@param startIndex? std.ConstTpl<Start> # Which index to start from. Optional.
---@param endIndex? std.ConstTpl<End> # Which index to end at. Optional, even if you set StartIndex.
---@return std.Unpack<T, Start, End> # Output values
function _G.unpack(tbl, startIndex, endIndex) end