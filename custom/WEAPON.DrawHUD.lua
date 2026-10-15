---This hook allows you to draw on screen while this weapon is in use.
---
--- If you want to draw a custom crosshair, consider using [WEAPON:DoDrawCrosshair](https://wiki.facepunch.com/gmod/WEAPON:DoDrawCrosshair) instead.
---@hook DrawHUD
---@realm client
---@source https://wiki.facepunch.com/gmod/WEAPON:DrawHUD
---@[self_call_type("GetOwner", "Player")]
function Weapon:DrawHUD() end
