---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This element is created within and only used in the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet) file. These can be elements are stored items are stored in the `Items` subtable of the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab
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
---@return DPropertySheet # The property sheet owning this tab.
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

---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTab:SetPropertySheet
---@param pnl DPropertySheet The DPropertySheet to set for this tab.
function DTab:SetPropertySheet(pnl) end

---@param label string The label shown for the tab.
---@param pnl DPropertySheet The parent sheet to attach this tab to.
---@param contents Panel The tab contents panel.
---@param icon string The icon path.
function DTab:Setup(label, pnl, contents, icon) end
