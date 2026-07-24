---@class ws_dupe : WorkshopFileBase
---Sandbox dupes workshop helper used by the menu HTML bridge.
ws_dupe = {}

---Downloads and arms a subscribed dupe from the workshop.
---@realm menu
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L52
---@param wsid string|number The workshop item ID.
function ws_dupe:DownloadAndArm(wsid) end

---Arms a local dupe file for placement.
---@realm menu
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L46
---@param filename string The dupe file path.
function ws_dupe:Arm(filename) end
