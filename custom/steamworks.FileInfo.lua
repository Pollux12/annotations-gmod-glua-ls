---Retrieves info about supplied Steam Workshop addon.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/steamworks.FileInfo
---@param workshopItemID string The ID of Steam Workshop item.
---@param resultCallback fun(data: UGCFileInfo?) The function to process retrieved data.
---
--- Function argument(s):
--- * table `data` - The data about the item, if the request succeeded, `nil` otherwise. See Structures/UGCFileInfo.
function steamworks.FileInfo(workshopItemID, resultCallback) end
