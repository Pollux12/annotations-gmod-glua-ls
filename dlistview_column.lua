---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- A single column, used by [DListView](https://wiki.facepunch.com/gmod/DListView).
---@class (partial) DListView_Column : Panel
local DListView_Column = {}

---Gets the index used for this column.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:GetColumnID
---@return number # The column index of the DListView_Column.
function DListView_Column:GetColumnID() end

---Returns whether the column is sorted in descending order or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:GetDescending
---@return boolean # Whether the column is sorted in descending order or not.
function DListView_Column:GetDescending() end

---Returns the fixed width of this column.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:GetFixedWidth
---@return number # The fixed width.
function DListView_Column:GetFixedWidth() end

---Returns the maximum width set with [DListView_Column:SetMaxWidth](https://wiki.facepunch.com/gmod/DListView_Column:SetMaxWidth).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:GetMaxWidth
---@return number # The maximum width
function DListView_Column:GetMaxWidth() end

---Returns the minimum width set with [DListView_Column:SetMinWidth](https://wiki.facepunch.com/gmod/DListView_Column:SetMinWidth).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:GetMinWidth
---@return number # The minimum width
function DListView_Column:GetMinWidth() end

---Returns the text alignment for the column
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:GetTextAlign
---@return number # The direction of the content, based on the number pad. See DListView_Column:SetTextAlign.
function DListView_Column:GetTextAlign() end

---Resizes the column, additionally adjusting the size of the column to the right, if any.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:ResizeColumn
---@param size number The amount to add to the current column's width.
---
--- Positive values will make it wider, and negative values will make it thinner.
function DListView_Column:ResizeColumn(size) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Sets the index used for this column.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:SetColumnID
---@param index number The column index of the DListView_Column.
function DListView_Column:SetColumnID(index) end

---Sets whether the column is sorted in descending order or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:SetDescending
---@param desc boolean Whether the column is sorted in descending order or not.
function DListView_Column:SetDescending(desc) end

---Sets the fixed width of the column.
--- **NOTE**: Internally this will set [SetMinWidth](https://wiki.facepunch.com/gmod/DListView_Column:SetMinWidth) and [SetMaxWidth](https://wiki.facepunch.com/gmod/DListView_Column:SetMaxWidth) to the value provided
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:SetFixedWidth
---@param width number The number value which will determine a fixed width.
function DListView_Column:SetFixedWidth(width) end

---Sets the maximum width of a column.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:SetMaxWidth
---@param width number The number value which will determine a maximum width.
function DListView_Column:SetMaxWidth(width) end

---Sets the minimum width of a column.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:SetMinWidth
---@param width number The number value which will determine a minimum width.
function DListView_Column:SetMinWidth(width) end

---Sets the text in the column's header.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:SetName
---@param name string The new name that the column's header will use.
function DListView_Column:SetName(name) end

---Sets the text alignment for the column
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:SetTextAlign
---@param alignment number The direction of the content, based on the number pad.
--[[

|   |   |   |
| --- | --- | --- |
| 7: **top-left** | 8: **top-center**	| 9: **top-right** |
| 4: **middle-left** | 5: **center** | 6: **middle-right** |
| 1: **bottom-left** | 2: **bottom-center** | 3: **bottom-right** |
--]]
function DListView_Column:SetTextAlign(alignment) end

---Sets the width of the panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Column:SetWidth
---@param width number The number value which will determine panel width.
function DListView_Column:SetWidth(width) end
