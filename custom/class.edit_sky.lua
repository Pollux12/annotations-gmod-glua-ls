---Sandbox sky editor entity; its data tables are a copy of `env_skypaint`'s.
---@source garrysmod/gamemodes/sandbox/entities/entities/edit_sky.lua
---@class edit_sky : base_edit
local edit_sky = {}

---@realm shared
---@return Vector
function edit_sky:GetTopColor() end

---@realm shared
---@param color Vector
function edit_sky:SetTopColor(color) end

---@realm shared
---@return Vector
function edit_sky:GetBottomColor() end

---@realm shared
---@param color Vector
function edit_sky:SetBottomColor(color) end

---@realm shared
---@return number
function edit_sky:GetFadeBias() end

---@realm shared
---@param bias number
function edit_sky:SetFadeBias(bias) end

---@realm shared
---@return number
function edit_sky:GetHDRScale() end

---@realm shared
---@param scale number
function edit_sky:SetHDRScale(scale) end

---@realm shared
---@return number
function edit_sky:GetSunSize() end

---@realm shared
---@param size number
function edit_sky:SetSunSize(size) end

---@realm shared
---@return Vector
function edit_sky:GetSunNormal() end

---@realm shared
---@param normal Vector
function edit_sky:SetSunNormal(normal) end

---@realm shared
---@return Vector
function edit_sky:GetSunColor() end

---@realm shared
---@param color Vector
function edit_sky:SetSunColor(color) end

---@realm shared
---@return number
function edit_sky:GetDuskScale() end

---@realm shared
---@param scale number
function edit_sky:SetDuskScale(scale) end

---@realm shared
---@return number
function edit_sky:GetDuskIntensity() end

---@realm shared
---@param intensity number
function edit_sky:SetDuskIntensity(intensity) end

---@realm shared
---@return Vector
function edit_sky:GetDuskColor() end

---@realm shared
---@param color Vector
function edit_sky:SetDuskColor(color) end

---@realm shared
---@return boolean
function edit_sky:GetDrawStars() end

---@realm shared
---@param draw boolean
function edit_sky:SetDrawStars(draw) end

---@realm shared
---@return string
function edit_sky:GetStarTexture() end

---@realm shared
---@param texture string
function edit_sky:SetStarTexture(texture) end

---@realm shared
---@return number
function edit_sky:GetStarLayers() end

---@realm shared
---@param layers number
function edit_sky:SetStarLayers(layers) end

---@realm shared
---@return number
function edit_sky:GetStarScale() end

---@realm shared
---@param scale number
function edit_sky:SetStarScale(scale) end

---@realm shared
---@return number
function edit_sky:GetStarFade() end

---@realm shared
---@param fade number
function edit_sky:SetStarFade(fade) end

---@realm shared
---@return number
function edit_sky:GetStarSpeed() end

---@realm shared
---@param speed number
function edit_sky:SetStarSpeed(speed) end
