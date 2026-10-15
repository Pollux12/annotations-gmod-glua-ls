---This hook allows you to freeze players screen.
--- **NOTE**: Player will still be able to move or shoot
---@hook FreezeMovement
---@realm client
---@source https://wiki.facepunch.com/gmod/WEAPON:FreezeMovement
---@return boolean # Return true to freeze moving the view
---@[self_call_type("GetOwner", "Player")]
function Weapon:FreezeMovement() end
