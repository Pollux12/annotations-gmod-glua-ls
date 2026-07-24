---@class DPanelList : DPanel
---@field pnlCanvas DPanel
---@field Items Panel[]
---@field YOffset number
---@field m_fAnimTime number
---@field m_fAnimEase number
---@field m_iBuilds integer
---@field Horizontal boolean
---@field VBar? DVScrollBar
local DPanelList = {}

---Enables horizontal layout for child panels in this list.
---@realm client
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/vgui/dpanellist.lua
---@param horizontal boolean Whether child panels should be laid out horizontally.
function DPanelList:EnableHorizontal(horizontal) end
