---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal subpanel that represents an option used by [DMenu](https://wiki.facepunch.com/gmod/DMenu).
---@class (partial) DMenuOption : DButton
local DMenuOption = {}

---Creates a sub [DMenu](https://wiki.facepunch.com/gmod/DMenu) and returns it. Has no duplicate call protection.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:AddSubMenu
---@return Panel # The created DMenu to add options to.
function DMenuOption:AddSubMenu() end

---Returns the checked state of [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:GetChecked
---@return boolean # Are we checked or not
function DMenuOption:GetChecked() end

---Returns whether the [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption) is a checkbox option or a normal button option.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:GetIsCheckable
---@return boolean #
function DMenuOption:GetIsCheckable() end

---Returns which [DMenu](https://wiki.facepunch.com/gmod/DMenu) this option belongs.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:GetMenu
---@return Panel # A DMenu to which this panel belongs.
function DMenuOption:GetMenu() end

---Returns whether this [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption) should act like a radio button, set by [DMenuOption:SetRadio](https://wiki.facepunch.com/gmod/DMenuOption:SetRadio).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:GetRadio
---@return boolean # `true` to set as a radio button.
function DMenuOption:GetRadio() end

---Called whenever the [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption)'s checked state changes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:OnChecked
---@param checked boolean The new checked state
function DMenuOption:OnChecked(checked) end

---Sets the checked state of the [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption).
---
--- Invokes [DMenuOption:OnChecked](https://wiki.facepunch.com/gmod/DMenuOption:OnChecked).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:SetChecked
---@param checked boolean `true` to set as checked.
function DMenuOption:SetChecked(checked) end

---Sets whether the [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption) is a checkbox option or a normal button option.
---
--- Enables automatic [DMenuOption:GetChecked](https://wiki.facepunch.com/gmod/DMenuOption:GetChecked) toggling with left/right clicks.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:SetIsCheckable
---@param checkable boolean Whether the menu option should allow the player to toggle itself.
function DMenuOption:SetIsCheckable(checkable) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Used to set the [DMenu](https://wiki.facepunch.com/gmod/DMenu) for this option.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:SetMenu
---@param pnl Panel The DMenu for this option.
function DMenuOption:SetMenu(pnl) end

---Sets whether this [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption) should act like a radio button.
---
--- Checking a radio button automatically unchecks all adjacent radio buttons.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:SetRadio
---@param checked boolean `true` to set as a radio button.
function DMenuOption:SetRadio(checked) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally by [DMenuOption:AddSubMenu](https://wiki.facepunch.com/gmod/DMenuOption:AddSubMenu) to create the submenu arrow and assign the created submenu to be opened when this option is hovered.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:SetSubMenu
---@param menu Panel The sub DMenu this option belongs to.
function DMenuOption:SetSubMenu(menu) end

---Toggles the checked state of [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption). Does not respect [DMenuOption:GetIsCheckable](https://wiki.facepunch.com/gmod/DMenuOption:GetIsCheckable).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuOption:ToggleCheck
function DMenuOption:ToggleCheck() end
