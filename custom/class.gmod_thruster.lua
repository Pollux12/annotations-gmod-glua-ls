---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_thruster.lua
---@class gmod_thruster : base_gmodentity
local gmod_thruster = {}

---@realm shared
---@param name string
function gmod_thruster:SetEffect(name) end

---@realm shared
---@return string
function gmod_thruster:GetEffect() end

---@realm shared
---@param on boolean
function gmod_thruster:SetOn(on) end

---@realm shared
---@return boolean
function gmod_thruster:IsOn() end

---@realm shared
---@param v Vector
function gmod_thruster:SetOffset(v) end

---@realm shared
---@return Vector
function gmod_thruster:GetOffset() end

---@realm server
---@param force? number
---@param mul? number
function gmod_thruster:SetForce(force, mul) end

---@realm server
---@param mul number
---@param bDown boolean
function gmod_thruster:AddMul(mul, bDown) end

---@realm server
---@param on boolean
---@return boolean
function gmod_thruster:Switch(on) end

---@realm server
---@param sound string
function gmod_thruster:SetSound(sound) end

---@realm server
function gmod_thruster:StartThrustSound() end

---@realm server
function gmod_thruster:StopThrustSound() end

---@realm server
---@param tog boolean
function gmod_thruster:SetToggle(tog) end

---@realm server
---@return boolean
function gmod_thruster:GetToggle() end
