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
