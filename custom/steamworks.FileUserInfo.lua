---Retrieves local file/user data for a Steam Workshop addon.
---@realm client
---@realm menu
---@param workshopItemID string The ID of Steam Workshop item.
---@param callback fun(info: SteamworksFileUserInfo) The function to process the returned info.
---@deprecated Used internally for in-game menus.
function steamworks.FileUserInfo(workshopItemID, callback) end

---@class (partial) SteamworksFileUserInfo
---@field error? number Error code from steamworks, if any.
local SteamworksFileUserInfo = {}
