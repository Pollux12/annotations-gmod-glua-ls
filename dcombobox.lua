---@meta

--- A field with multiple selectable values.
---@class (partial) DComboBox : DButton
local DComboBox = {}

---Adds a choice to the combo box.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:AddChoice
---@param value string The text show to the user.
---@param data? any The data accompanying this string. If left empty, the value argument is used instead.
---
--- Can be accessed with the second argument of DComboBox:GetSelected, DComboBox:GetOptionData and as an argument of DComboBox:OnSelect.
---@param select? boolean Should this be the default selected text show to the user or not.
---@param icon? string Adds an icon for this choice.
---@return number # The index of the new option.
function DComboBox:AddChoice(value, data, select, icon) end

---Adds a spacer below the currently last item in the drop down. Recommended to use with [DComboBox:SetSortItems](https://wiki.facepunch.com/gmod/DComboBox:SetSortItems) set to `false`.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:AddSpacer
function DComboBox:AddSpacer() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Ran every frame to update the value of this panel to the value of the associated convar. See [Panel:SetConvar](https://wiki.facepunch.com/gmod/Panel:SetConvar).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:CheckConVarChanges
function DComboBox:CheckConVarChanges() end

---Selects a combo box option by its index and changes the text displayed at the top of the combo box.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:ChooseOption
---@param value string The text to display at the top of the combo box.
---@param index number The option index.
function DComboBox:ChooseOption(value, index) end

---Selects an option within a combo box based on its table index.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:ChooseOptionID
---@param index number Selects the option with given index.
function DComboBox:ChooseOptionID(index) end

---Clears the combo box's text value, choices, and data values.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:Clear
function DComboBox:Clear() end

---Closes the combo box menu. Called when the combo box is clicked while open.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:CloseMenu
function DComboBox:CloseMenu() end

---Returns an option's data based on the given index.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:GetOptionData
---@param index number The option index.
---@return any # The option's data value.
function DComboBox:GetOptionData(index) end

---Returns an option's text based on the given index.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:GetOptionText
---@param index number The option index.
---@return string # The option's text value.
function DComboBox:GetOptionText(index) end

---Returns an option's text based on the given data.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:GetOptionTextByData
---@param data string The data to look up the name of.
---
--- If given a number and no matching data was found, the function will test given data against each Global.tonumber'd data entry.
---@return string # The option's text value.
---
--- If no matching data was found, the data itself will be returned. If multiple identical data entries exist, the first instance will be returned.
function DComboBox:GetOptionTextByData(data) end

---Returns the currently selected option's text and data
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:GetSelected
---@return string # The option's text value.
---@return any # The option's stored data.
function DComboBox:GetSelected() end

---Returns the index (ID) of the currently selected option.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:GetSelectedID
---@return number # The ID of the currently selected option.
function DComboBox:GetSelectedID() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns an whether the items in the dropdown will be alphabetically sorted or not.
---
--- See [DComboBox:SetSortItems](https://wiki.facepunch.com/gmod/DComboBox:SetSortItems).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:GetSortItems
---@return boolean # True if enabled, false otherwise.
function DComboBox:GetSortItems() end

---Returns whether or not the combo box's menu is opened.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:IsMenuOpen
---@return boolean # True if the menu is open, false otherwise.
function DComboBox:IsMenuOpen() end

---Opens the combo box drop down menu. Called when the combo box is clicked.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:OpenMenu
function DComboBox:OpenMenu() end

---Removes a choice added with [DComboBox:AddChoice](https://wiki.facepunch.com/gmod/DComboBox:AddChoice)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:RemoveChoice
---@param index number The index of the option to remove.
---@return string # The text of the removed option.
---@return any # The data of the removed option that was provided.
function DComboBox:RemoveChoice(index) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets whether or not the items should be sorted alphabetically in the dropdown menu of the [DComboBox](https://wiki.facepunch.com/gmod/DComboBox). If set to false, items will appear in the order they were added by [DComboBox:AddChoice](https://wiki.facepunch.com/gmod/DComboBox:AddChoice) calls.
---
--- This is enabled by default.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:SetSortItems
---@param sort boolean true to enable, false to disable
function DComboBox:SetSortItems(sort) end

---Sets the text shown in the combo box when the menu is not collapsed.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DComboBox:SetValue
---@param value string The text in the DComboBox.
function DComboBox:SetValue(value) end
