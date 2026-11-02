---@class widget_base : Entity
local widget_base = {}

---@source garrysmod/lua/entities/widget_base.lua
---@param player Player
---@param button number
---@param movement CMoveData
function widget_base:OnRelease(player, button, movement) end

---@source garrysmod/lua/entities/widget_base.lua
---@param player Player
---@param movement CMoveData
function widget_base:PressedThinkInternal(player, movement) end

---@source garrysmod/lua/entities/widget_base.lua
---@param entity Entity
---@return boolean
function widget_base:PressedShouldDraw(entity) end
