---@meta

--- A panel that fades its contents in and out once, like a notification.
---@class (partial) DNotify : Panel
local DNotify = {}

---Adds a panel to the notification
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:AddItem
---@param pnl Panel The panel to add
---@param lifeLength? number If set, overrides DNotify:SetLife for when the given panel should be removed.
function DNotify:AddItem(pnl, lifeLength) end

---Returns the current alignment of this notification panel. Set by [DNotify:SetAlignment](https://wiki.facepunch.com/gmod/DNotify:SetAlignment).
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:GetAlignment
---@return number # The numpad alignment
function DNotify:GetAlignment() end

---Returns all the items added with [DNotify:AddItem](https://wiki.facepunch.com/gmod/DNotify:AddItem).
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:GetItems
---@return table # A table of Panels.
function DNotify:GetItems() end

---Returns the display time in seconds of the DNotify. This is set with
--- [DNotify:SetLife](https://wiki.facepunch.com/gmod/DNotify:SetLife).
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:GetLife
---@return number # The display time in seconds.
function DNotify:GetLife() end

---Returns the spacing between items set by [DNotify:SetSpacing](https://wiki.facepunch.com/gmod/DNotify:SetSpacing).
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:GetSpacing
---@return number #
function DNotify:GetSpacing() end

---Sets the alignment of the child panels in the notification
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:SetAlignment
---@param alignment number It's the Numpad alignment, 6 is right, 9 is top left, etc.
function DNotify:SetAlignment(alignment) end

---Sets the display time in seconds for the DNotify.
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:SetLife
---@param time number The time in seconds.
function DNotify:SetLife(time) end

---Sets the spacing between child elements of the notification panel.
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:SetSpacing
---@param spacing number
function DNotify:SetSpacing(spacing) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Used internally to position and fade in/out its [DNotify:GetItems](https://wiki.facepunch.com/gmod/DNotify:GetItems).
---@realm client
---@source https://wiki.facepunch.com/gmod/DNotify:Shuffle
function DNotify:Shuffle() end
