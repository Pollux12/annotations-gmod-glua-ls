---Sets the string or panel held in the specified column of a [DListView_Line](https://wiki.facepunch.com/gmod/DListView_Line) panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:SetColumnText
---@param column number The number of the column to write the value to, starts with 1.
---@param value string|Panel Column text, or a panel to parent into the column.
---@return DLabel? label The DLabel in which the text was set when `value` is a string.
function DListView_Line:SetColumnText(column, value) end
