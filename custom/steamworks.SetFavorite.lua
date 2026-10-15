---Sets or clears the local player's favorite mark on a Steam Workshop item.
---
--- Undocumented on the wiki; the menu HTML bridge (`includes/util/javascript_util.lua`) calls it.
---@realm menu
---@param workshopItemID string The ID of the Steam Workshop item.
---@param favorite boolean Whether the item should be favorited.
function steamworks.SetFavorite(workshopItemID, favorite) end
