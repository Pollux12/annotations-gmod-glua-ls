---@meta

--- A simple menu bar.
---@class (partial) DMenuBar : DPanel
local DMenuBar = {}

---Creates a new menu panel on the menu bar.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:AddMenu
---@param label string The name (label) of the menu to create.
---@return (instance) DMenu # The created DMenu panel.
function DMenuBar:AddMenu(label) end

---Retrieves or creates a menu panel on the menu bar.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:AddOrGetMenu
---@param label string The name (label) of the menu to get or create.
---@return DMenu # The DMenu with the given label.
function DMenuBar:AddOrGetMenu(label) end

---Returns whether or not the background should be painted. Is the same as [DMenuBar:GetPaintBackground](https://wiki.facepunch.com/gmod/DMenuBar:GetPaintBackground)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:GetDrawBackground
---@return boolean # Should the background be painted
---@deprecated Use DMenuBar:GetPaintBackground instead.
function DMenuBar:GetDrawBackground() end

---Returns whether or not the panel is a menu. Used for closing menus when another panel is selected.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:GetIsMenu
---@return boolean # Is a menu
function DMenuBar:GetIsMenu() end

---Returns the currently opened menu, if any.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:GetOpenMenu
---@return DMenu? # The visible/open menu, or nil when none is open.
function DMenuBar:GetOpenMenu() end

---Returns whether or not the background should be painted. Is the same as [DMenuBar:GetDrawBackground](https://wiki.facepunch.com/gmod/DMenuBar:GetDrawBackground)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:GetPaintBackground
---@return boolean # Should the background be painted
function DMenuBar:GetPaintBackground() end

---Sets whether or not the background should be painted. Is the same as [DMenuBar:SetPaintBackground](https://wiki.facepunch.com/gmod/DMenuBar:SetPaintBackground)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:SetDrawBackground
---@param shouldPaint boolean Should the background be painted
---@deprecated Use DMenuBar:SetPaintBackground
function DMenuBar:SetDrawBackground(shouldPaint) end

---Sets whether or not the panel is part of a DMenu.
---
--- If this is set to `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the panel is clicked, and thus any open menus will remain open.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:SetIsMenu
---@param isMenu boolean Is this a menu
function DMenuBar:SetIsMenu(isMenu) end

---Sets whether or not the background should be painted. Is the same as [DMenuBar:SetDrawBackground](https://wiki.facepunch.com/gmod/DMenuBar:SetDrawBackground)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DMenuBar:SetPaintBackground
---@param shouldPaint boolean Should the background be painted
function DMenuBar:SetPaintBackground(shouldPaint) end
