---@meta

--- The **DColorCombo** allows the user to choose color, without alpha,
--- using [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer) or [DColorPalette](https://wiki.facepunch.com/gmod/DColorPalette) in a tabbed view.
---@class (partial) DColorCombo : DPropertySheet
local DColorCombo = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called internally to create panels necessary for this panel to work.
---@realm client
---@source https://wiki.facepunch.com/gmod/DColorCombo:BuildControls
function DColorCombo:BuildControls() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color of the [DColorCombo](https://wiki.facepunch.com/gmod/DColorCombo).
---@realm client
---@source https://wiki.facepunch.com/gmod/DColorCombo:GetColor
---@return Color # A Color
function DColorCombo:GetColor() end

---Returns true if the panel is currently being edited
---
--- More of a internal method, it technically should only ever work (i.e. return true) inside [DColorCombo:OnValueChanged](https://wiki.facepunch.com/gmod/DColorCombo:OnValueChanged).
---@realm client
---@source https://wiki.facepunch.com/gmod/DColorCombo:IsEditing
---@return boolean #
function DColorCombo:IsEditing() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color of this panel. See also [DColorCombo:GetColor](https://wiki.facepunch.com/gmod/DColorCombo:GetColor)
---@realm client
---@source https://wiki.facepunch.com/gmod/DColorCombo:SetColor
---@param clr Color A Color.
function DColorCombo:SetColor(clr) end
