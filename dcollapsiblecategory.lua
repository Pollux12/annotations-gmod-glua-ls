---@meta

--- The collapsible category allows you to create numerous sections of controls, and have the ability to contract/expand them.
---
--- Consider using [DCategoryList](https://wiki.facepunch.com/gmod/DCategoryList) if you plan on using more than 1 of these.
---@class (partial) DCollapsibleCategory : Panel
local DCollapsibleCategory = {}

---Adds a new text button to the collapsible category, like the tool menu in Spawnmenu.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:Add
---@param name string The name of the button
---@return Panel # The DButton
function DCollapsibleCategory:Add(name) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function that handles the open/close animations.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:AnimSlide
---@param anim table
---@param delta number
---@param data table
function DCollapsibleCategory:AnimSlide(anim, delta, data) end

---Forces the category to open or collapse
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:DoExpansion
---@param expand boolean True to open, false to collapse
function DCollapsibleCategory:DoExpansion(expand) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the expand/collapse animation time set by [DCollapsibleCategory:SetAnimTime](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetAnimTime).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetAnimTime
---@return number # The animation time in seconds
function DCollapsibleCategory:GetAnimTime() end

---Returns whether or not the panel background is being drawn. Alias of [DCollapsibleCategory:GetPaintBackground](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPaintBackground).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetDrawBackground
---@return boolean # True if the panel background is drawn, false otherwise.
---@deprecated You should use DCollapsibleCategory:GetPaintBackground instead.
function DCollapsibleCategory:GetDrawBackground() end

---Returns whether the DCollapsibleCategory is expanded or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetExpanded
---@return boolean # If expanded it will return true.
function DCollapsibleCategory:GetExpanded() end

---Returns the header height of the [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory).
---
--- See also [DCollapsibleCategory:SetHeaderHeight](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetHeaderHeight).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetHeaderHeight
---@return number # The current height of the header.
function DCollapsibleCategory:GetHeaderHeight() end

---If set, the [DCategoryList](https://wiki.facepunch.com/gmod/DCategoryList) that created this panel.
---
--- See also [DCollapsibleCategory:SetList](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetList).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetList
---@return Panel # The DCategoryList that created us.
function DCollapsibleCategory:GetList() end

---Doesn't actually do anything.
---
--- Returns the number set by [DCollapsibleCategory:SetPadding](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPadding).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPadding
---@return number #
function DCollapsibleCategory:GetPadding() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns whether or not the background should be painted.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPaintBackground
---@return boolean # If the background is painted or not
function DCollapsibleCategory:GetPaintBackground() end

---Returns whatever was set by [DCollapsibleCategory:SetStartHeight](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetStartHeight)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetStartHeight
---@return number #
function DCollapsibleCategory:GetStartHeight() end

---Sets the time in seconds it takes to expand the DCollapsibleCategory
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetAnimTime
---@param time number The time in seconds it takes to expand
function DCollapsibleCategory:SetAnimTime(time) end

---Sets the contents of the DCollapsibleCategory.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetContents
---@param pnl Panel The panel, containing the contents for the DCollapsibleCategory, mostly an DScrollPanel
function DCollapsibleCategory:SetContents(pnl) end

---Sets whether or not to draw the panel background. Alias of [DCollapsibleCategory:SetPaintBackground](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPaintBackground).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetDrawBackground
---@param draw boolean True to show the panel's background, false to hide it.
---@deprecated You should use DCollapsibleCategory:SetPaintBackground instead.
function DCollapsibleCategory:SetDrawBackground(draw) end

---Sets whether the [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory) is expanded or not upon opening the container.
---
--- You should use [DCollapsibleCategory:Toggle](https://wiki.facepunch.com/gmod/DCollapsibleCategory:Toggle) or [DCollapsibleCategory:DoExpansion](https://wiki.facepunch.com/gmod/DCollapsibleCategory:DoExpansion) instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetExpanded
---@param expanded? boolean Whether it shall be expanded or not by default
function DCollapsibleCategory:SetExpanded(expanded) end

---Sets the header height of the [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory).
---
--- See also [DCollapsibleCategory:GetHeaderHeight](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetHeaderHeight).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetHeaderHeight
---@param height number The new height to set. Default height is 20.
function DCollapsibleCategory:SetHeaderHeight(height) end

---Sets the name of the DCollapsibleCategory.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetLabel
---@param label string The label/name of the DCollapsibleCategory.
function DCollapsibleCategory:SetLabel(label) end

---Used internally by [DCategoryList](https://wiki.facepunch.com/gmod/DCategoryList) when it creates a [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory) during [DCategoryList:Add](https://wiki.facepunch.com/gmod/DCategoryList:Add).
---
--- If set, [Panel:UnselectAll](https://wiki.facepunch.com/gmod/Panel:UnselectAll) will be called on the list, instead of calling it on the category panel itself when a category is clicked.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetList
---@param pnl Panel The Panel:UnselectAll that is the "parent" of this panel.
function DCollapsibleCategory:SetList(pnl) end

---Doesn't actually do anything.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPadding
---@param padding number
function DCollapsibleCategory:SetPadding(padding) end

---Sets whether or not the background should be painted.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPaintBackground
---@param paint boolean
function DCollapsibleCategory:SetPaintBackground(paint) end

---Does nothing.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetStartHeight
---@param height number
function DCollapsibleCategory:SetStartHeight(height) end

---Toggles the expanded state of the [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory).
---
--- See [DCollapsibleCategory:GetExpanded](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetExpanded) for a function to retrieve the expanded state.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:Toggle
function DCollapsibleCategory:Toggle() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to update the "AltLine" property on all "child" panels.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DCollapsibleCategory:UpdateAltLines
function DCollapsibleCategory:UpdateAltLines() end
