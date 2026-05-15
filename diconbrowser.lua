---@meta

--- Simply a [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout) which automatically displays all of the [Silkicons](https://wiki.facepunch.com/gmod/silkicons).
--- Used as a way to get the user to select an icon.
---@class (partial) DIconBrowser : DScrollPanel
local DIconBrowser = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Automatically called to fill the browser with icons. Will not work if [DIconBrowser:SetManual](https://wiki.facepunch.com/gmod/DIconBrowser:SetManual) is set to true.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:Fill
function DIconBrowser:Fill() end

---A simple unused search feature, hides all icons that do not contain given text in their file path.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:FilterByText
---@param text string The text to search for
function DIconBrowser:FilterByText(text) end

---Returns whether or not the browser should fill itself with icons.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:GetManual
---@return boolean #
function DIconBrowser:GetManual() end

---Returns the currently selected icon's file path.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:GetSelectedIcon
---@return string # The currently selected icon's file path.
function DIconBrowser:GetSelectedIcon() end

---Called when the selected icon was changed. Use [DIconBrowser:GetSelectedIcon](https://wiki.facepunch.com/gmod/DIconBrowser:GetSelectedIcon) to get the selected icon's filepath.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:OnChange
function DIconBrowser:OnChange() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Use [DIconBrowser:OnChange](https://wiki.facepunch.com/gmod/DIconBrowser:OnChange) instead
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:OnChangeInternal
function DIconBrowser:OnChangeInternal() end

---Scrolls the browser to the selected icon
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:ScrollToSelected
function DIconBrowser:ScrollToSelected() end

---Selects an icon from file path
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:SelectIcon
---@param icon string The file path of the icon to select. Do not include the "materials/" part.
function DIconBrowser:SelectIcon(icon) end

---Sets whether or not the browser should automatically fill itself with icons.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:SetManual
---@param manual boolean
function DIconBrowser:SetManual(manual) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Set the currently selected file path. Do not use. Use [DIconBrowser:SelectIcon](https://wiki.facepunch.com/gmod/DIconBrowser:SelectIcon) instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DIconBrowser:SetSelectedIcon
---@param str string
function DIconBrowser:SetSelectedIcon(str) end
