---@class DPropertySheetSheet
---@field Tab DTab The created tab.
---@field Name string Name of the created tab.
---@field Panel Panel The contents panel of the tab.

---Adds a new tab.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPropertySheet:AddSheet
---@param name string Name of the tab
---@param pnl Panel Panel to be used as contents of the tab. This normally should be a DPanel
---@param icon? string Icon for the tab. This will ideally be a Silkicons, but any material name can be used.
---@param noStretchX? boolean Should DPropertySheet try to fill itself with given panel horizontally.
---@param noStretchY? boolean Should DPropertySheet try to fill itself with given panel vertically.
---@param tooltip? string Tooltip for the tab when user hovers over it with his cursor
---@return DPropertySheetSheet sheet The created sheet record.
function DPropertySheet:AddSheet(name, pnl, icon, noStretchX, noStretchY, tooltip) end
