---@meta

--- Basic text input field.
---
--- See [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) for a more advanced version.
---@realm client
---@source https://wiki.facepunch.com/gmod/TextEntry
---@class (partial) TextEntry : Panel
local TextEntry = {}

---Called from engine whenever a valid character is typed while the text entry is focused.
---
--- Used internally for functionality of [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry)
---@hook OnKeyCodeTyped
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/TextEntry:OnKeyCodeTyped
---@param keyCode number They key code of the key pressed, see Enums/KEY.
---@return boolean # Whether you've handled the key press. Returning true prevents the default text entry behavior from occurring.
function TextEntry:OnKeyCodeTyped(keyCode) end

---Called when the text inside the [TextEntry](https://wiki.facepunch.com/gmod/TextEntry) changes.
---
--- You may be looking for [DTextEntry:OnValueChange](https://wiki.facepunch.com/gmod/DTextEntry:OnValueChange) instead.
---@hook OnTextChanged
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/TextEntry:OnTextChanged
function TextEntry:OnTextChanged() end
