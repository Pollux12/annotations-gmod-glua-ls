---@meta

---@class DPanelList : DPanel
---@field Items Panel[]
---@field VBar DVScrollBar
local DPanelList = {}

---Adds a existing panel to the end of [DPanelList](https://wiki.facepunch.com/gmod/DPanelList).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:AddItem
---@param pnl Panel Panel to be used as element of list
---@param state? string If set to "ownline", the item will take its own entire line.
function DPanelList:AddItem(pnl, state) end

---Removes all items.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:CleanList
function DPanelList:CleanList() end

---Hides all child panels, and optionally deletes them.
---@realm client
---@source https://wiki.facepunch.com/gmod/DPanelList:Clear
---@param remove boolean Whether to actually delete the panels, not just hide them.
function DPanelList:Clear(remove) end

---Enables/creates the vertical scroll bar so that the panel list can be scrolled through.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:EnableVerticalScrollbar
function DPanelList:EnableVerticalScrollbar() end

---Returns all panels has added by [DPanelList:AddItem](https://wiki.facepunch.com/gmod/DPanelList:AddItem)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:GetItems
---@return table # A table of panels used as items of DPanelList.
function DPanelList:GetItems() end

---Returns offset of list items from the panel borders set by [DPanelList:SetPadding](https://wiki.facepunch.com/gmod/DPanelList:SetPadding)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:GetPadding
---@return number # Offset from panel borders
function DPanelList:GetPadding() end

---Returns distance between list items set by [DPanelList:SetSpacing](https://wiki.facepunch.com/gmod/DPanelList:SetSpacing)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:GetSpacing
---@return number # Distance between panels
function DPanelList:GetSpacing() end

---Insert given panel at the top of the list.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:InsertAtTop
---@param insert Panel The panel to insert
---@param strLineState string If set to "ownline", no other panels will be placed to the left or right of the panel we are inserting
function DPanelList:InsertAtTop(insert, strLineState) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to rebuild the child panel positions.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:Rebuild
function DPanelList:Rebuild() end

---Sets the [DPanelList](https://wiki.facepunch.com/gmod/DPanelList) to size its height to its contents. This is set to false by default.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:SetAutoSize
---@param shouldSizeToContents boolean Whether to size to the height of the DPanelList contents.
function DPanelList:SetAutoSize(shouldSizeToContents) end

---Sets the offset of the lists items from the panel borders
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:SetPadding
---@param Offset number Offset from panel borders
function DPanelList:SetPadding(Offset) end

---Sets distance between list items
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPanelList:SetSpacing
---@param Distance number Distance between panels
function DPanelList:SetSpacing(Distance) end
