---Registers a given table as a metatable. It can then be accessed by other code/addons via [Global.FindMetaTable](https://wiki.facepunch.com/gmod/Global.FindMetaTable).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.RegisterMetaTable
---@param metaName string The new metatable name. Cannot override existing types.
---@[adds_field("MetaID", "integer")]
---@[adds_field("MetaName", "string")]
---@param metaTable table The new metatable table. It will be given a `MetaID` and `MetaName` fields.
function _G.RegisterMetaTable(metaName, metaTable) end
