---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This element is created within and only used in the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet) file. These can be elements are stored items are stored in the `Items` subtable of the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet)
---@class (partial) DTab : DButton
local DTab = {}

---Returns the panel that the tab represents.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab:GetPanel
---@return Panel # Panel added to the sheet using DPropertySheet:AddSheet.
function DTab:GetPanel() end

---The [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet) this tab belongs to.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab:GetPropertySheet
---@return Panel # The DPropertySheet this tab belongs to.
function DTab:GetPropertySheet() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the target height of this tab. Used internally by [DTab](https://wiki.facepunch.com/gmod/DTab)'s [PANEL:ApplySchemeSettings](https://wiki.facepunch.com/gmod/PANEL:ApplySchemeSettings).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab:GetTabHeight
---@return number # Either 20, or 28 if DTab:IsActive.
function DTab:GetTabHeight() end

---Returns whether the tab is the currently selected tab of the associated [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab:IsActive
---@return boolean # Currently selected tab.
function DTab:IsActive() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [DTab:Setup](https://wiki.facepunch.com/gmod/DTab:Setup).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab:SetPanel
---@param pnl Panel The contents of this tab.
function DTab:SetPanel(pnl) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [DTab:Setup](https://wiki.facepunch.com/gmod/DTab:Setup).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab:SetPropertySheet
---@param pnl Panel The DPropertySheet to set for this tab.
function DTab:SetPropertySheet(pnl) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [DPropertySheet:AddSheet](https://wiki.facepunch.com/gmod/DPropertySheet:AddSheet).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab:Setup
---@param label string Label of the tab
---@param sheet Panel The DPropertySheet this tab belongs to.
---@param pnl Panel Panel to be used as contents of the tab. This normally should be a DPanel.
---@param icon? string Icon for the tab. This will typically be a Silkicons, but any material name can be used.
function DTab:Setup(label, sheet, pnl, icon) end
