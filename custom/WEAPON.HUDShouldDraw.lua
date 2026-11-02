---This hook determines which parts of the HUD to draw.
---@hook HUDShouldDraw
---@realm client
---@source https://wiki.facepunch.com/gmod/WEAPON:HUDShouldDraw
---@param element string The HUD element in question
---@return boolean # Return false to hide this HUD element
---@[self_call_type("GetOwner", "Player")]
function Weapon:HUDShouldDraw(element) end
