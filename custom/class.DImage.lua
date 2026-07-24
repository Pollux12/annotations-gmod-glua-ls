---@class (partial) DImage : DPanel
---@field m_Material IMaterial The material currently drawn by the image panel.
---@field m_Color Color The image color override.
---@field m_bKeepAspect boolean
---@field m_strMatName? string
---@field m_strMatNameFailsafe? string
---@field ImageName string
---@field ActualWidth number
---@field ActualHeight number
local DImage = {}
