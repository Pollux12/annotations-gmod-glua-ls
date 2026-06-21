---@class ContentContainer : DScrollPanel
---@field IconList DTileLayout The tile layout panel that holds content icons, created in Init.
---@field m_pControllerPanel? Panel The controller panel (AccessorFunc-backed).
---@field m_strCategoryName? string The category name for this content container (AccessorFunc-backed).
---@field m_bTriggerSpawnlistChange boolean Whether modifications trigger the SpawnlistContentChanged hook (AccessorFunc-backed).
local ContentContainer = {}

---@param trigger boolean
function ContentContainer:SetTriggerSpawnlistChange(trigger) end
