---Called internally by [DListView:OnClickLine](https://wiki.facepunch.com/gmod/DListView:OnClickLine) when a line is selected. This is the function you should override to define the behavior when a line is selected.
---@hook OnRowSelected
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:OnRowSelected
---@param rowIndex number The index of the row/line that the user clicked on.
---@param row DListView_Line The DListView_Line that the user clicked on.
function DListView:OnRowSelected(rowIndex, row) end
