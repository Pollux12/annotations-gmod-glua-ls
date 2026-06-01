---@meta

--- A really simple grid layout panel.
---
--- **NOTE**: This panel will set its size automatically based on set column count.
--- This makes it play badly with [Panel:Dock](https://wiki.facepunch.com/gmod/Panel:Dock) and cause a [PANEL:PerformLayout](https://wiki.facepunch.com/gmod/PANEL:PerformLayout) call every frame.
---@class (partial) DGrid : Panel
local DGrid = {}

---Adds a new item to the grid.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:AddItem
---@param item Panel The item to add. It will be forced visible and parented to the DGrid.
function DGrid:AddItem(item) end

---Returns the number of columns of this [DGrid](https://wiki.facepunch.com/gmod/DGrid). Set by [DGrid:SetCols](https://wiki.facepunch.com/gmod/DGrid:SetCols).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:GetCols
---@return number # The number of columns of this DGrid
function DGrid:GetCols() end

---Returns the width of each column of the [DGrid](https://wiki.facepunch.com/gmod/DGrid), which is set by [DGrid:SetColWide](https://wiki.facepunch.com/gmod/DGrid:SetColWide).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:GetColWide
---@return number # The width of each column
function DGrid:GetColWide() end

---Returns a list of panels in the grid.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:GetItems
---@return table # A list of Panels.
function DGrid:GetItems() end

---Returns the height of each row of the [DGrid](https://wiki.facepunch.com/gmod/DGrid), which is set by [DGrid:SetRowHeight](https://wiki.facepunch.com/gmod/DGrid:SetRowHeight).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:GetRowHeight
---@return number # The height of each row
function DGrid:GetRowHeight() end

---Removes given panel from the [DGrid:GetItems](https://wiki.facepunch.com/gmod/DGrid:GetItems).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:RemoveItem
---@param item Panel Item to remove from the grid
---@param bDontDelete? boolean If set to true, the actual panel will not be removed via Panel:Remove.
function DGrid:RemoveItem(item, bDontDelete) end

---Sets the number of columns this panel should have.
---
--- The [DGrid](https://wiki.facepunch.com/gmod/DGrid) will resize its width to match this value.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:SetCols
---@param cols number The desired number of columns
function DGrid:SetCols(cols) end

---Sets the width of each column.
---
--- The cell panels (grid items) will not be resized or centered.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:SetColWide
---@param colWidth number The width of each column.
function DGrid:SetColWide(colWidth) end

---Sets the height of each row.
---
--- The cell panels (grid items) will not be resized or centered.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:SetRowHeight
---@param rowHeight number The height of each row
function DGrid:SetRowHeight(rowHeight) end

---Sorts the items in the grid. Does not visually update the grid, use [Panel:InvalidateLayout](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout) for that.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DGrid:SortByMember
---@param key string A key in the panel from DGrid:GetItems. The key's value must be numeric.
---@param desc? boolean True for descending order, false for ascending.
function DGrid:SortByMember(key, desc) end
