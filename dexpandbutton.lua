---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- The little "+" button used by [DProperties](https://wiki.facepunch.com/gmod/DProperties) and [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node).
---@class (partial) DExpandButton : DButton
local DExpandButton = {}

---Returns whether this DExpandButton is expanded or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DExpandButton:GetExpanded
---@return boolean # True if expanded, false otherwise
function DExpandButton:GetExpanded() end

---Sets whether this DExpandButton should be expanded or not. Only changes appearance.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DExpandButton:SetExpanded
---@param expanded boolean True to expand ( visually will show a "-" )
function DExpandButton:SetExpanded(expanded) end
