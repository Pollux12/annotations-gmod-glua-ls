---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_hoverball.lua
---@class gmod_hoverball : base_gmodentity
local gmod_hoverball = {}

---@realm shared
---@return boolean
function gmod_hoverball:GetEnabled() end

---@realm shared
---@param enabled boolean
function gmod_hoverball:SetEnabled(enabled) end

---@realm shared
---@return number
function gmod_hoverball:GetTargetZ() end

---@realm shared
---@param z number
function gmod_hoverball:SetTargetZ(z) end

---@realm shared
---@return number
function gmod_hoverball:GetSpeedVar() end

---@realm shared
---@param speed number
function gmod_hoverball:SetSpeedVar(speed) end

---@realm shared
---@return number
function gmod_hoverball:GetAirResistanceVar() end

---@realm shared
---@param resistance number
function gmod_hoverball:SetAirResistanceVar(resistance) end

---@realm shared
---@return number
function gmod_hoverball:GetSpeed() end

---@realm shared
---@param s number
function gmod_hoverball:SetSpeed(s) end

---@realm shared
---@return number
function gmod_hoverball:GetAirResistance() end

---@realm shared
---@param num number
function gmod_hoverball:SetAirResistance(num) end

---@realm shared
---@param z number
function gmod_hoverball:SetZVelocity(z) end

---@realm shared
---@param strength number
function gmod_hoverball:SetStrength(strength) end

---@realm shared
function gmod_hoverball:Toggle() end
