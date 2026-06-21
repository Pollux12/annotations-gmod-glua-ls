---@class DListView : DPanel
---@field Columns DListView_Column[]
---@field Lines DListView_Line[]
---@field Sorted DListView_Line[] Lines sorted by the current column/order.
---@field pnlCanvas Panel
---@field VBar? DVScrollBar
local DListView = {}
