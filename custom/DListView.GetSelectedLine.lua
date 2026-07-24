---Gets the currently selected DListView_Line index.
---
--- If [DListView:SetMultiSelect](https://wiki.facepunch.com/gmod/DListView:SetMultiSelect) is set to true, only the first line of all selected lines will be returned. Use [DListView:GetSelected](https://wiki.facepunch.com/gmod/DListView:GetSelected) instead to get all of the selected lines.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView:GetSelectedLine
---@return number # The index of the currently selected line.
---@return DListView_Line # The currently selected DListView_Line.
function DListView:GetSelectedLine() end
