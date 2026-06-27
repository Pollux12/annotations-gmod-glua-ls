---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_lamp.lua
---@class gmod_lamp : base_gmodentity
local gmod_lamp = {}

---@class gmod_lamp.LightInfo
---@field Offset Vector
---@field Angle Angle
---@field NearZ number
---@field Scale number
---@field Skin number

---@realm shared
---@return boolean
function gmod_lamp:GetOn() end

---@realm shared
---@param on boolean
function gmod_lamp:SetOn(on) end

---@realm shared
---@return boolean
function gmod_lamp:GetToggle() end

---@realm shared
---@param toggle boolean
function gmod_lamp:SetToggle(toggle) end

---@realm shared
---@return number
function gmod_lamp:GetLightFOV() end

---@realm shared
---@param fov number
function gmod_lamp:SetLightFOV(fov) end

---@realm shared
---@return number
function gmod_lamp:GetDistance() end

---@realm shared
---@param distance number
function gmod_lamp:SetDistance(distance) end

---@realm shared
---@return number
function gmod_lamp:GetBrightness() end

---@realm shared
---@param brightness number
function gmod_lamp:SetBrightness(brightness) end

---@realm shared
---@param ply? Player Extra arguments are ignored by the entity method but passed by the drive property.
---@return string
function gmod_lamp:GetEntityDriveMode(ply) end

---@realm shared
---@return gmod_lamp.LightInfo
function gmod_lamp:GetLightInfo() end

---@realm server
---@param bOn boolean
function gmod_lamp:Switch(bOn) end

---@realm server
---@param bOn boolean
function gmod_lamp:OnSwitch(bOn) end

---@realm server
function gmod_lamp:Toggle() end

---@realm server
---@param name string
---@param old any
---@param new any
function gmod_lamp:OnUpdateLight(name, old, new) end

---@realm server
function gmod_lamp:UpdateLight() end
