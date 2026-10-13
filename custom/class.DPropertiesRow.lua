---@class DPropertiesRow : Panel
---@field Label DLabel
---@field Container Panel
---@field Inner? DProperty_Generic
local DPropertiesRow = {}

---@source garrysmod/lua/vgui/dproperties.lua
---@param rowType string
---@param vars? table
function DPropertiesRow:Setup(rowType, vars) end

---@source garrysmod/lua/vgui/dproperties.lua
---@param value any
function DPropertiesRow:SetValue(value) end
