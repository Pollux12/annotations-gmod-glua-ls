---@class DTree_Node : DPanel
---@field Label DTree_Node_Button
---@field Expander DExpandButton
---@field Icon DImage
---@field animSlide table
---@field fLastClick number
---@field m_pRoot? DTree
---@field m_pParentNode? DTree|DTree_Node
---@field ChildNodes? DListLayout
local DTree_Node = {}
