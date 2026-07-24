---@class DNotify : Panel
---@field Items table<integer, Panel|false> The list of active notification panels.
---@field Spacing number Spacing between notification items (AccessorFunc-backed).
---@field Alignment integer Alignment of notification items within the panel (AccessorFunc-backed).
---@field m_fLifeLength number Default lifetime in seconds for new items (AccessorFunc-backed via SetLife/GetLife).
local DNotify = {}
