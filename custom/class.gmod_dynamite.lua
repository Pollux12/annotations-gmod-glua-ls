---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_dynamite.lua
---@class gmod_dynamite : base_gmodentity
local gmod_dynamite = {}

---@realm shared
---@return boolean
function gmod_dynamite:GetShouldRemove() end

---@realm shared
---@param shouldRemove boolean
function gmod_dynamite:SetShouldRemove(shouldRemove) end

---@realm shared
---@return number
function gmod_dynamite:GetDamage() end

---@realm shared
---@param damage number
function gmod_dynamite:SetDamage(damage) end

---@realm shared
---@return number
function gmod_dynamite:GetDelay() end

---@realm shared
---@param delay number
function gmod_dynamite:SetDelay(delay) end

---@realm shared
---@param damage number
function gmod_dynamite:Setup(damage) end

---@realm server
function gmod_dynamite:HandleQueuedExplosions() end

---@realm shared
---@param delayOverride? number
---@param ply? Entity Fallbacks to self when no valid attacker entity is supplied.
function gmod_dynamite:Explode(delayOverride, ply) end
