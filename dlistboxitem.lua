---@meta

---
---@deprecated Used Internally by DListBox.
---@class (partial) DListBoxItem : DLabel
local DListBoxItem = {}

---Returns the parent "mother" of this **DListBoxItem** set by [DListBoxItem:SetMother](https://wiki.facepunch.com/gmod/DListBoxItem:SetMother).
---@realm client
---@source https://wiki.facepunch.com/gmod/DListBoxItem:GetMother
---@return Panel # The "mother" DListBox.
function DListBoxItem:GetMother() end

---Selects this item.
---@realm client
---@source https://wiki.facepunch.com/gmod/DListBoxItem:Select
---@param onlyMe boolean Whether to deselect other items.
function DListBoxItem:Select(onlyMe) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the "mother" (parent) panel for this item. Done internally by [DListBox:AddItem](https://wiki.facepunch.com/gmod/DListBox:AddItem)
---@realm client
---@source https://wiki.facepunch.com/gmod/DListBoxItem:SetMother
---@param parent Panel The "mother" panel to set.
function DListBoxItem:SetMother(parent) end
