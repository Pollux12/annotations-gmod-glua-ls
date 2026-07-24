---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This object is created by [Global.WorkshopFileBase](https://wiki.facepunch.com/gmod/Global.WorkshopFileBase) which is used internally to fetch data of the specific namespace
--- or to publish saves and dupes.
---
--- This also exists on the Server but most functions may throw an error. It's meant to be used clientside.
--- **NOTE**: You need to set the `HTML` field to a [DHTML](https://wiki.facepunch.com/gmod/DHTML) panel that is set up correctly like [here](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L12), or else you might get errors.
---@source https://wiki.facepunch.com/gmod/WorkshopFileBase
---@class (partial) WorkshopFileBase
local WorkshopFileBase = {}

---Fetches all subscriptions for the set namespace and type
--- **NOTE**: If you want to use the type `local` you need to implement the `:FetchLocal(offset, perpage)` function!
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/WorkshopFileBase:Fetch
---@param type string The type to search for. (`local`, `subscribed`, `subscribed_ugc`, `mine`, `favorite`)
---@param offset number Skips the first x results.
---@param perpage number How many results per page should be returned.
---@param extratags table additional tags to filter the results.
---@param searchText string text that needs to be in the addon title. Use an empty string for none
---@param filter? number The filter for the results. (`enabledonly`, `disabledonly`)
---@param sort? string How it should be sorted. If set to `nil`, it will fallback to `timeadded`. (`title`, `size`, `updated`)
function WorkshopFileBase:Fetch(type, offset, perpage, extratags, searchText, filter, sort) end

---Fetches all subscriptions for the set namespace and passes the result to [WorkshopFileBase:FillFileInfo](https://wiki.facepunch.com/gmod/WorkshopFileBase:FillFileInfo).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/WorkshopFileBase:FetchSubscribed
---@param offset number Skips the first x results.
---@param perpage number How many results per page should be returned.
---@param tags table additional tags to filter the results.
---@param searchText string text that needs to be in the addon title. Use an empty string for none
---@param isUGC? boolean if true it will use engine.GetUserContent instead of engine.GetAddons
---@param filter? number The filter for the results. (`enabledonly`, `disabledonly`)
---@param sort? string How it should be sorted. If set to `nil`, it will fallback to `timeadded`. (`title`, `size`, `updated`)
function WorkshopFileBase:FetchSubscribed(offset, perpage, tags, searchText, isUGC, filter, sort) end

---Updates the set HTML panel with the newly fetched results
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/WorkshopFileBase:FillFileInfo
---@param results table The type to search for. (`local`, `subscribed`, `subscribed_ugc`, `mine`, `favorite`)
---@param isUGC boolean Skips the first x results.
function WorkshopFileBase:FillFileInfo(results, isUGC) end

---Creates a [UGCPublishWindow](https://wiki.facepunch.com/gmod/UGCPublishWindow) to publish the dupe or save
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/WorkshopFileBase:Publish
---@param filename string The type to search for. (`local`, `subscribed`, `subscribed_ugc`, `mine`, `favorite`)
---@param image string The image to use
function WorkshopFileBase:Publish(filename, image) end

---Retrieves the username for the given SteamID.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/WorkshopFileBase:RetrieveUserName
---@param steamid string SteamID to retrieve the name for
---@param callback fun(name: string) Callback function.
---
---
--- Function argument(s):
--- * string `name` - The retrieved name
function WorkshopFileBase:RetrieveUserName(steamid, callback) end

---@class (partial) WorkshopFileInfoEntry
---@field downloaded number The amount of bytes downloaded.
---@field models table Model table list.
---@field title string The addon title.
---@field file string Local addon file path when available.
---@field mounted boolean Whether the addon is mounted.
---@field wsid string The workshop ID or negative local addon key.
---@field size number Addon file size.
---@field updated number Last update timestamp.
---@field tags string Comma-separated tags.
---@field timeadded number Time the addon was added.
local WorkshopFileInfoEntry = {}

---@class (partial) WorkshopUserContentEntry
---@field title string The content title.
---@field type string The content type.
---@field tags string Comma-separated tags.
---@field wsid string The workshop ID.
---@field timeadded number Time the content was added.
---@field file? string Local addon file path when available.
local WorkshopUserContentEntry = {}

---@class (partial) WorkshopFileInfoResults
---@field results string[] The results IDs for this page.
---@field otherresults string[] All result IDs before pagination.
---@field totalresults number Total number of matching results.
---@field extraresults table<integer, WorkshopFileInfoEntry | WorkshopUserContentEntry> Additional row metadata.
local WorkshopFileInfoResults = {}

---Updates the set HTML panel with the newly fetched results
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/WorkshopFileBase:FillFileInfo
---@param results WorkshopFileInfoResults The result payload.
---@param isUGC? boolean Skips first x results.
function WorkshopFileBase:FillFileInfo(results, isUGC) end

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
