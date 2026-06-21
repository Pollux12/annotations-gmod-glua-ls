---@meta

--- A simple list box with optional multi-select.
--- As this is deprecated, it is recommended that you use [DListView](https://wiki.facepunch.com/gmod/DListView), which contains the same functionality with multi-column options.
---@deprecated Derived from the deprecated DPanelList.
---@class (partial) DListBox : DPanelList
local DListBox = {}

---Returns whether the list box can select multiple items.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListBox:GetMultiple
---@return boolean # Whether the list box can select multiple items.
function DListBox:GetMultiple() end

---Returns selected items.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListBox:GetSelectedItems
---@return table # The selected items. A list of DListBoxItem.
function DListBox:GetSelectedItems() end

---Returns selected item values.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListBox:GetSelectedValues
---@return table # The selected item values. A list of Panel:GetValue of each selected DListBoxItem.
function DListBox:GetSelectedValues() end

---Select a [DListBoxItem](https://wiki.facepunch.com/gmod/DListBoxItem) based on its value.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListBox:SelectByName
---@param val string Panel:GetValue of a DListBoxItem to select.
function DListBox:SelectByName(val) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to select a specific panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListBox:SelectItem
---@param item Panel DListBox to select.
---@param onlyme boolean Whether to deselect other selected items.
function DListBox:SelectItem(item, onlyme) end

---Sets whether the list box can select multiple items.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListBox:SetMultiple
---@param multiple boolean Whether the list box can select multiple items.
function DListBox:SetMultiple(multiple) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets selected items.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListBox:SetSelectedItems
---@param items table The items to select. A list of DListBoxItem.
function DListBox:SetSelectedItems(items) end
