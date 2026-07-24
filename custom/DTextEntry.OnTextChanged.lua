---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called internally when the text inside the [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) changes. This is an implementation of [TextEntry:OnTextChanged](https://wiki.facepunch.com/gmod/TextEntry:OnTextChanged)
---
--- You should not override this function. Use [DTextEntry:OnValueChange](https://wiki.facepunch.com/gmod/DTextEntry:OnValueChange) instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTextEntry:OnTextChanged
---@param noMenuRemoval? boolean Determines whether to remove the autocomplete menu (false) or not (true).
function DTextEntry:OnTextChanged(noMenuRemoval) end
