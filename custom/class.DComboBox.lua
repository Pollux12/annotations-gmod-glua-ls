---@class DComboBox : DButton
---@field DropButton DPanel
---@field Choices table<integer, string>
---@field Data table<integer, any>
---@field ChoiceIcons table<integer, string>
---@field Spacers table<integer, boolean>
---@field selected? integer
---@field Menu? DMenu
---@field m_strConVarValue? string
local DComboBox = {}
