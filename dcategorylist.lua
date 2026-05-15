---@meta

--- A host for multiple [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory) panels.
--- As the name suggests, each one of them can be collapsed or expanded on demand by the user.
---@class (partial) DCategoryList : DScrollPanel
local DCategoryList = {}

---Adds a [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory) to the list.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCategoryList:Add
---@param categoryName string The name of the category to add.
---@return Panel # The created DCollapsibleCategory
function DCategoryList:Add(categoryName) end

---Adds an element to the list.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCategoryList:AddItem
---@param element Panel VGUI element to add to the list.
function DCategoryList:AddItem(element) end

---Calls [Panel:UnselectAll](https://wiki.facepunch.com/gmod/Panel:UnselectAll) on all child elements, if they have it.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCategoryList:UnselectAll
function DCategoryList:UnselectAll() end
