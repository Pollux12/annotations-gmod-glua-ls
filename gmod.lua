---@meta

--- Similar purpose to the [game](https://wiki.facepunch.com/gmod/game) and [engine](https://wiki.facepunch.com/gmod/engine), allows access to various features of the game's engine.
gmod = {}

---Returns the [GAMEMODE](https://wiki.facepunch.com/gmod/GAMEMODE) table.
---
--- You will want to wait until [GM:OnGamemodeLoaded](https://wiki.facepunch.com/gmod/GM:OnGamemodeLoaded) for it to return a valid value.
---@realm shared
---@source https://wiki.facepunch.com/gmod/gmod.GetGamemode
---@return GM # The `GAMEMODE` table.
function gmod.GetGamemode() end
