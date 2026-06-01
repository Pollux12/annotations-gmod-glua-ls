---@meta

---@class DCheckBoxLabel : Panel
---@field Button DCheckBox
---@field Label DLabel
local DCheckBoxLabel = {}

---Gets the checked state of the checkbox. This calls the checkbox's [DCheckBox:GetChecked](https://wiki.facepunch.com/gmod/DCheckBox:GetChecked) function.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:GetChecked
---@return boolean # Whether the box is checked or not.
function DCheckBoxLabel:GetChecked() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that gets the indentation of the element on the X axis. See also [DCheckBoxLabel:SetIndent](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetIndent)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:GetIndent
---@return number # How much the content is moved to the right in pixels
function DCheckBoxLabel:GetIndent() end

---Sets the color of the [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel)'s text to the bright text color defined in the skin.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetBright
---@param bright boolean true makes the text bright.
function DCheckBoxLabel:SetBright(bright) end

---Sets the checked state of the checkbox. Does not call [DCheckBoxLabel:OnChange](https://wiki.facepunch.com/gmod/DCheckBoxLabel:OnChange) or [Panel:ConVarChanged](https://wiki.facepunch.com/gmod/Panel:ConVarChanged), unlike [DCheckBoxLabel:SetValue](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetValue).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetChecked
---@param checked boolean Whether the box should be checked or not.
function DCheckBoxLabel:SetChecked(checked) end

---Sets the console variable to be set when the checked state of the [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel) changes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetConVar
---@param convar string The name of the convar to set
function DCheckBoxLabel:SetConVar(convar) end

---Sets the text of the [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel) to be dark colored in accordance with the currently active Derma skin.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetDark
---@param darkify boolean True to be dark, false to be default
function DCheckBoxLabel:SetDark(darkify) end

---Sets the font of the text part of the [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetFont
---@param font string Font name
function DCheckBoxLabel:SetFont(font) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the indentation of the element on the X axis.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetIndent
---@param ident number How much in pixels to move the content to the right
function DCheckBoxLabel:SetIndent(ident) end

---Sets the text color for the [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetTextColor
---@param color Color The text color. Uses the Color.
function DCheckBoxLabel:SetTextColor(color) end

---Sets the checked state of the checkbox, and calls [DCheckBoxLabel:OnChange](https://wiki.facepunch.com/gmod/DCheckBoxLabel:OnChange) and the checkbox's [Panel:ConVarChanged](https://wiki.facepunch.com/gmod/Panel:ConVarChanged) methods.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetValue
---@param checked boolean Whether the box should be checked or not (1 or 0 can also be used).
function DCheckBoxLabel:SetValue(checked) end

---Sizes the panel to the size of the internal DLabel and DButton
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:SizeToContents
function DCheckBoxLabel:SizeToContents() end

---Toggles the checked state of the [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCheckBoxLabel:Toggle
function DCheckBoxLabel:Toggle() end
