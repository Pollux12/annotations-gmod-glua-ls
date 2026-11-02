---**INTERNAL**: Use [SANDBOX:SpawnmenuIconMenuOpen](https://wiki.facepunch.com/gmod/SANDBOX:SpawnmenuIconMenuOpen) if you wish to add new options to spawnmenu icon right click menus.
---
--- Called when there's one or more items selected in the spawnmenu by the player, to open the multi selection right click menu ([DMenu](https://wiki.facepunch.com/gmod/DMenu))
---@hook SpawnlistOpenGenericMenu
---@realm client
---@source https://wiki.facepunch.com/gmod/SANDBOX:SpawnlistOpenGenericMenu
---@param canvas DDragBase The canvas that has the selection. (Panel:GetSelectionCanvas)
function SANDBOX:SpawnlistOpenGenericMenu(canvas) end
