---@meta

--- A data view with rows and columns.
---@class (partial) DListView : DPanel
local DListView = {}

---Adds a column to the listview.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:AddColumn
---@param column string The name of the column to add.
---@param position? number At which position to insert the new column compared to the other columns. Set to 1 to add the new column before all other columns.
---
--- By default the column will be placed after all columns.
---@return Panel # The newly created DListView_Column.
function DListView:AddColumn(column, position) end

---Adds a line to the list view.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:AddLine
---@param ... any Values for a new row in the DListView, If several arguments are supplied, each argument will correspond to a respective column in the DListView.
---@return Panel # The newly created DListView_Line.
function DListView:AddLine(...) end

---Clears the current selection in the DListView.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:ClearSelection
function DListView:ClearSelection() end

---Gets the width of a column.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:ColumnWidth
---@param column number The column to get the width of.
---@return number # Width of the column.
function DListView:ColumnWidth(column) end

---Creates the lines and gets the height of the contents, in a DListView.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:DataLayout
---@return number # The height of the contents
function DListView:DataLayout() end

---Removes the scrollbar.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:DisableScrollbar
function DListView:DisableScrollbar() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal helper function called from the [PANEL:PerformLayout](https://wiki.facepunch.com/gmod/PANEL:PerformLayout) of [DListView](https://wiki.facepunch.com/gmod/DListView).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:FixColumnsLayout
function DListView:FixColumnsLayout() end

---Gets the canvas.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetCanvas
---@return Panel # The canvas.
function DListView:GetCanvas() end

---Returns the height of the data of the [DListView](https://wiki.facepunch.com/gmod/DListView).
---
--- See also [DListView:SetDataHeight](https://wiki.facepunch.com/gmod/DListView:SetDataHeight).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetDataHeight
---@return number # The height of the data of the DListView.
function DListView:GetDataHeight() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- See [DListView:SetDirty](https://wiki.facepunch.com/gmod/DListView:SetDirty).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetDirty
---@return boolean #
function DListView:GetDirty() end

---Returns the height of the header of the [DListView](https://wiki.facepunch.com/gmod/DListView).
---
--- See also [DListView:SetHeaderHeight](https://wiki.facepunch.com/gmod/DListView:SetHeaderHeight).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetHeaderHeight
---@return number # The height of the header of the DListView.
function DListView:GetHeaderHeight() end

---Returns whether the header line should be visible on not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetHideHeaders
---@return boolean # Whether the header line should be visible on not.
function DListView:GetHideHeaders() end

---Returns the height of [DListView:GetCanvas](https://wiki.facepunch.com/gmod/DListView:GetCanvas).
---
--- Intended to represent the height of all data lines.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetInnerTall
---@return number # The height of DListView:GetCanvas.
function DListView:GetInnerTall() end

---Gets the [DListView_Line](https://wiki.facepunch.com/gmod/DListView_Line) at the given index.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetLine
---@param id number The index of the line to get.
---@return Panel # The DListView_Line at the given index.
function DListView:GetLine(id) end

---Gets all of the lines added to the DListView.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetLines
---@return table # The lines added to the DListView.
function DListView:GetLines() end

---Returns whether multiple lines can be selected or not.
---
--- See [DListView:SetMultiSelect](https://wiki.facepunch.com/gmod/DListView:SetMultiSelect).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetMultiSelect
---@return boolean # Whether multiple lines can be selected or not.
function DListView:GetMultiSelect() end

---Gets all of the lines that are currently selected.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetSelected
---@return table # A table of DListView_Lines.
function DListView:GetSelected() end

---Gets the currently selected [DListView_Line](https://wiki.facepunch.com/gmod/DListView_Line) index.
---
--- If [DListView:SetMultiSelect](https://wiki.facepunch.com/gmod/DListView:SetMultiSelect) is set to true, only the first line of all selected lines will be returned. Use [DListView:GetSelected](https://wiki.facepunch.com/gmod/DListView:GetSelected) instead to get all of the selected lines.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetSelectedLine
---@return number # The index of the currently selected line.
---@return Panel # The currently selected DListView_Line.
function DListView:GetSelectedLine() end

---Returns whether sorting of columns by clicking their headers is allowed or not.
---
--- See also [DListView:SetSortable](https://wiki.facepunch.com/gmod/DListView:SetSortable).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetSortable
---@return boolean # Whether sorting of columns by clicking their headers is allowed or not
function DListView:GetSortable() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Converts LineID to SortedID
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetSortedID
---@param lineId number The DListView_Line:GetID of a line to look up
---@return number #
function DListView:GetSortedID(lineId) end

---**INTERNAL**: Use [DListView:OnRowSelected](https://wiki.facepunch.com/gmod/DListView:OnRowSelected) instead!
---
--- Called whenever a line is clicked.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:OnClickLine
---@param line Panel The selected line.
---@param isSelected boolean Boolean indicating whether the line is selected.
function DListView:OnClickLine(line, isSelected) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called from [DListView_Column](https://wiki.facepunch.com/gmod/DListView_Column).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:OnRequestResize
---@param column Panel The column which initialized the resize
---@param size number
function DListView:OnRequestResize(column, size) end

---Removes a line from the list view.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:RemoveLine
---@param line number Removes the given row, by row id (same number as DListView:GetLine).
function DListView:RemoveLine(line) end

---Selects the line at the first index of the DListView if one has been added.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SelectFirstItem
function DListView:SelectFirstItem() end

---Selects a line in the listview.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SelectItem
---@param Line Panel The line to select.
function DListView:SelectItem(Line) end

---Sets the height of all lines of the [DListView](https://wiki.facepunch.com/gmod/DListView) except for the header line.
---
--- See also [DListView:SetHeaderHeight](https://wiki.facepunch.com/gmod/DListView:SetHeaderHeight).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SetDataHeight
---@param height number The new height to set. Default value is 17.
function DListView:SetDataHeight(height) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to signify if the [DListView](https://wiki.facepunch.com/gmod/DListView) needs a rebuild.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SetDirty
---@param isDirty boolean
function DListView:SetDirty(isDirty) end

---Sets the height of the header line of the [DListView](https://wiki.facepunch.com/gmod/DListView).
---
--- See also [DListView:SetDataHeight](https://wiki.facepunch.com/gmod/DListView:SetDataHeight).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SetHeaderHeight
---@param height number The new height to set. Default value is 16.
function DListView:SetHeaderHeight(height) end

---Sets whether the header line should be visible on not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SetHideHeaders
---@param hide boolean Whether the header line should be visible on not.
function DListView:SetHideHeaders(hide) end

---Sets whether multiple lines can be selected by the user by using the Ctrl or Shift keys. When set to false, only one line can be selected.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SetMultiSelect
---@param allowMultiSelect boolean Whether multiple lines can be selected or not
function DListView:SetMultiSelect(allowMultiSelect) end

---Enables/disables the sorting of columns by clicking.
--- **NOTE**: This will only affect columns that are created after this function is called. Existing columns will be unaffected.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SetSortable
---@param isSortable boolean Whether sorting columns with clicking is allowed or not.
function DListView:SetSortable(isSortable) end

---Sorts the items in the specified column.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SortByColumn
---@param columnIndex number The index of the column that should be sorted.
---@param descending? boolean Whether the items should be sorted in descending order or not.
function DListView:SortByColumn(columnIndex, descending) end

---Sorts the list based on given columns.
---
--- All arguments are optional
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:SortByColumns
---@param column1? number
---@param descrending1? boolean
---@param column2? number
---@param descrending2? boolean
---@param column3? number
---@param descrending3? boolean
---@param column4? number
---@param descrending4? boolean
function DListView:SortByColumns(
	column1,
	descrending1,
	column2,
	descrending2,
	column3,
	descrending3,
	column4,
	descrending4
)
end
