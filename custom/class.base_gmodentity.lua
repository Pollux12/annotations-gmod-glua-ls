---Sandbox scripted entity base that stores creator/player ownership metadata.
---@source garrysmod/gamemodes/sandbox/entities/entities/base_gmodentity.lua
---@class base_gmodentity : Entity
local base_gmodentity = {}

---Sets the owning player for Sandbox-derived entities.
---@realm shared
---@param ply? Player|NULL The owning player.
function base_gmodentity:SetPlayer(ply) end

---Returns the owning player for Sandbox-derived entities.
---@realm shared
---@return Player|NULL
function base_gmodentity:GetPlayer() end

---Returns the owning player's unique ID for Sandbox-derived entities.
---@realm shared
---@return number
function base_gmodentity:GetPlayerIndex() end

---Returns the owning player's SteamID64 for Sandbox-derived entities.
---@realm shared
---@return string
function base_gmodentity:GetPlayerSteamID() end

---Returns the owning player's display name for Sandbox-derived entities.
---@realm shared
---@return string
function base_gmodentity:GetPlayerName() end
