---This hook allows you to draw on screen while this weapon is in use. This hook is called **before** [WEAPON:DrawHUD](https://wiki.facepunch.com/gmod/WEAPON:DrawHUD) and is equivalent of [GM:HUDPaintBackground](https://wiki.facepunch.com/gmod/GM:HUDPaintBackground).
---@hook DrawHUDBackground
---@realm client
---@source https://wiki.facepunch.com/gmod/WEAPON:DrawHUDBackground
---@[self_call_type("GetOwner", "Player")]
function Weapon:DrawHUDBackground() end
