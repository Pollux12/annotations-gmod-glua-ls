---@class (partial) DupeWorkshopFileBase : WorkshopFileBase
---@field DownloadAndArm fun(wsid: string|number) Downloads and arms a subscribed dupe from the workshop.
---@field Arm fun(filename: string) Arms a local dupe file for placement.
local DupeWorkshopFileBase = {}

---@class ws_dupe : DupeWorkshopFileBase
---Sandbox dupes workshop helper used by the menu HTML bridge. [(View Source)](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L11)
ws_dupe = {}

---Downloads and arms a subscribed dupe from the workshop.
---
---**INTERNAL**: This is used internally by the sandbox spawnmenu dupes UI.
---@realm menu
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L50
---@param wsid string|number The workshop item ID.
function DupeWorkshopFileBase.DownloadAndArm(wsid) end

---Downloads and arms a subscribed dupe from the workshop.
---
---**INTERNAL**: This method is source-backed on the sandbox `ws_dupe` workshop helper.
---@realm menu
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L50
---@param wsid string|number The workshop item ID.
function WorkshopFileBase:DownloadAndArm(wsid) end

---Arms a local dupe file for placement.
---
---**INTERNAL**: This is used internally by the sandbox spawnmenu dupes UI.
---@realm menu
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L63
---@param filename string The dupe file path.
function DupeWorkshopFileBase.Arm(filename) end

---Arms a local dupe file for placement.
---
---**INTERNAL**: This method is source-backed on the sandbox `ws_dupe` workshop helper.
---@realm menu
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L63
---@param filename string The dupe file path.
function WorkshopFileBase:Arm(filename) end

---Downloads and arms a subscribed dupe from the workshop.
---
---**INTERNAL**: This is used internally by the sandbox spawnmenu dupes UI.
---@realm menu
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L50
---@param wsid string|number The workshop item ID.
function ws_dupe:DownloadAndArm(wsid) end

---Arms a local dupe file for placement.
---
---**INTERNAL**: This is used internally by the sandbox spawnmenu dupes UI.
---@realm menu
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L63
---@param filename string The dupe file path.
function ws_dupe:Arm(filename) end
