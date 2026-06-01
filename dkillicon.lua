---@meta

--- Uses the [killicon](https://wiki.facepunch.com/gmod/killicon) to persistently draw a killicon.
---@class (partial) DKillIcon : Panel
local DKillIcon = {}

---Gets the killicon being shown.
---@realm client
---@source https://wiki.facepunch.com/gmod/DKillIcon:GetName
---@return string # The name of the killicon currently being displayed.
function DKillIcon:GetName() end

---Sets the killicon to be displayed. You should call [Panel:SizeToContents](https://wiki.facepunch.com/gmod/Panel:SizeToContents) following this.
---
--- Killicons can be added with [killicon.Add](https://wiki.facepunch.com/gmod/killicon.Add) and [killicon.AddFont](https://wiki.facepunch.com/gmod/killicon.AddFont).
---@realm client
---@source https://wiki.facepunch.com/gmod/DKillIcon:SetName
---@param iconName string The name of the killicon to be displayed.
function DKillIcon:SetName(iconName) end
