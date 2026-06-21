---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- A panel used by [DListView](https://wiki.facepunch.com/gmod/DListView)
---@class (partial) DListView_Line : Panel
local DListView_Line = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by [DListView:DataLayout](https://wiki.facepunch.com/gmod/DListView:DataLayout)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:DataLayout
---@param pnl DListView The list view.
function DListView_Line:DataLayout(pnl) end

---Returns whether this line is odd or even in the list. This is internally used (and set) to change the looks of every other line.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:GetAltLine
---@return boolean # Whether this line is 'alternative'.
function DListView_Line:GetAltLine() end

---Gets the string held in the specified column of a [DListView_Line](https://wiki.facepunch.com/gmod/DListView_Line) panel.
---
--- This is the same thing as doing [DListView_Line:GetValue](https://wiki.facepunch.com/gmod/Panel:GetValue)( column_number ).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:GetColumnText
---@param column number The number of the column to retrieve the text from, starts with 1.
---@return string # The contents of the specified column.
function DListView_Line:GetColumnText(column) end

---Returns the ID of this line, set automatically in [DListView:AddLine](https://wiki.facepunch.com/gmod/DListView:AddLine).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:GetID
---@return number # The ID of this line.
function DListView_Line:GetID() end

---Returns the parent [DListView](https://wiki.facepunch.com/gmod/DListView) of this line.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:GetListView
---@return DListView # The parent DListView of this line.
function DListView_Line:GetListView() end

---Returns the data stored on given cell of this line.
---
--- 	Used in the [DListView:SortByColumn](https://wiki.facepunch.com/gmod/DListView:SortByColumn) function in case you want to sort with something else than the text.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:GetSortValue
---@param column number The number of the column to write the text from, starts with 1.
---@return any # The data that is set for given column of this line, if any.
function DListView_Line:GetSortValue(column) end

---Alias of [DListView_Line:GetColumnText](https://wiki.facepunch.com/gmod/DListView_Line:GetColumnText). Overrides [Panel:GetValue](https://wiki.facepunch.com/gmod/Panel:GetValue).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:GetValue
---@param column number The number of the column to retrieve the text from, starts with 1.
---@return string # The contents of the specified column.
function DListView_Line:GetValue(column) end

---Returns whether this line is selected.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:IsLineSelected
---@return boolean # Whether this line is selected.
function DListView_Line:IsLineSelected() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether this line is odd or even in the list. This is internally used (and set automatically) to change the looks of every other line.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:SetAltLine
---@param alt boolean Whether this line is 'alternative'.
function DListView_Line:SetAltLine(alt) end

---Sets the string held in the specified column of a [DListView_Line](https://wiki.facepunch.com/gmod/DListView_Line) panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:SetColumnText
---@param column number The number of the column to write the text from, starts with 1.
---@param value string Column text you want to set
---@return DLabel # The DLabel in which the text was set.
function DListView_Line:SetColumnText(column, value) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the ID of this line, used internally by [DListView:AddLine](https://wiki.facepunch.com/gmod/DListView:AddLine).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:SetID
---@param id number The ID for this line.
function DListView_Line:SetID(id) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the parent [DListView](https://wiki.facepunch.com/gmod/DListView) for this line. Used internally by [DListView:AddLine](https://wiki.facepunch.com/gmod/DListView:AddLine).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:SetListView
---@param pnl DListView The new parent DListView for this line.
function DListView_Line:SetListView(pnl) end

---Sets whether this line is selected or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:SetSelected
---@param selected boolean Whether this line is selected.
function DListView_Line:SetSelected(selected) end

---Allows you to store data per column.
---
--- 	Used in the [DListView:SortByColumn](https://wiki.facepunch.com/gmod/DListView:SortByColumn) function in case you want to sort with something else than the text.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:SetSortValue
---@param column number The number of the column to write the text from, starts with 1.
---@param data any Data for given column on the line you wish to set.
function DListView_Line:SetSortValue(column, data) end

---Alias of [DListView_Line:SetColumnText](https://wiki.facepunch.com/gmod/DListView_Line:SetColumnText).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DListView_Line:SetValue
---@param column number The number of the column to write the text from, starts with 1.
---@param value string Column text you want to set
---@return DLabel # The DLabel in which the text was set.
function DListView_Line:SetValue(column, value) end
