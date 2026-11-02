---@class DPropertiesCategory : Panel
---@field Rows table<string, DPropertiesRow>
local DPropertiesCategory = {}

---@source garrysmod/lua/vgui/dproperties.lua
---@overload fun(self: DPropertiesCategory, name: string, create: true): DPropertiesRow
---@param name string
---@param create? boolean
---@return DPropertiesRow?
function DPropertiesCategory:GetRow(name, create) end
