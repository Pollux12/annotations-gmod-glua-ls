---@class DListView : DPanel
---@field Columns DListView_Column[]
---@field Lines DListView_Line[]
---@field Sorted table<integer, DListView_Line?> Lines sorted by the current column/order.
---@field pnlCanvas Panel
---@field VBar? DVScrollBar
local DListView = {}
