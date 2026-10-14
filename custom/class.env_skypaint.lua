---Sky painter point entity shipped by the base gamemode; its network vars drive the 2D skybox.
---@source garrysmod/gamemodes/base/entities/entities/env_skypaint.lua
---@class env_skypaint : base_point
local env_skypaint = {}

---@realm shared
---@return Vector
function env_skypaint:GetTopColor() end

---@realm shared
---@param color Vector
function env_skypaint:SetTopColor(color) end

---@realm shared
---@return Vector
function env_skypaint:GetBottomColor() end

---@realm shared
---@param color Vector
function env_skypaint:SetBottomColor(color) end

---@realm shared
---@return number
function env_skypaint:GetFadeBias() end

---@realm shared
---@param bias number
function env_skypaint:SetFadeBias(bias) end

---@realm shared
---@return number
function env_skypaint:GetHDRScale() end

---@realm shared
---@param scale number
function env_skypaint:SetHDRScale(scale) end

---@realm shared
---@return number
function env_skypaint:GetSunSize() end

---@realm shared
---@param size number
function env_skypaint:SetSunSize(size) end

---@realm shared
---@return Vector
function env_skypaint:GetSunNormal() end

---@realm shared
---@param normal Vector
function env_skypaint:SetSunNormal(normal) end

---@realm shared
---@return Vector
function env_skypaint:GetSunColor() end

---@realm shared
---@param color Vector
function env_skypaint:SetSunColor(color) end

---@realm shared
---@return number
function env_skypaint:GetDuskScale() end

---@realm shared
---@param scale number
function env_skypaint:SetDuskScale(scale) end

---@realm shared
---@return number
function env_skypaint:GetDuskIntensity() end

---@realm shared
---@param intensity number
function env_skypaint:SetDuskIntensity(intensity) end

---@realm shared
---@return Vector
function env_skypaint:GetDuskColor() end

---@realm shared
---@param color Vector
function env_skypaint:SetDuskColor(color) end

---@realm shared
---@return boolean
function env_skypaint:GetDrawStars() end

---@realm shared
---@param draw boolean
function env_skypaint:SetDrawStars(draw) end

---@realm shared
---@return string
function env_skypaint:GetStarTexture() end

---@realm shared
---@param texture string
function env_skypaint:SetStarTexture(texture) end

---@realm shared
---@return number
function env_skypaint:GetStarLayers() end

---@realm shared
---@param layers number
function env_skypaint:SetStarLayers(layers) end

---@realm shared
---@return number
function env_skypaint:GetStarScale() end

---@realm shared
---@param scale number
function env_skypaint:SetStarScale(scale) end

---@realm shared
---@return number
function env_skypaint:GetStarFade() end

---@realm shared
---@param fade number
function env_skypaint:SetStarFade(fade) end

---@realm shared
---@return number
function env_skypaint:GetStarSpeed() end

---@realm shared
---@param speed number
function env_skypaint:SetStarSpeed(speed) end
