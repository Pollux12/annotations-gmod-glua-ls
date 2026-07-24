---@class DNumSlider : Panel
---@field Label DLabel The label panel for the slider.
---@field TextArea DTextEntry The text entry panel for the slider value.
---@field Slider DSlider The slider knob panel.
---@field Scratch DNumberScratch The number scratch panel attached to the label.
---@field Wang DNumberScratch Alias for Scratch; the DNumberScratch overlay on the label.
---@field m_fDefaultValue? number The default value used by ResetToDefaultValue (AccessorFunc-backed).
local DNumSlider = {}
