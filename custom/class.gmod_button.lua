---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_button.lua
---@class gmod_button : base_gmodentity
local gmod_button = {}

---@realm shared
---@return integer
function gmod_button:GetKey() end

---@realm shared
---@param key integer
function gmod_button:SetKey(key) end

---@realm shared
---@return boolean
function gmod_button:GetOn() end

---@realm shared
---@param on boolean
function gmod_button:SetOn(on) end

---@realm shared
---@return boolean
function gmod_button:GetIsToggle() end

---@realm shared
---@param isToggle boolean
function gmod_button:SetIsToggle(isToggle) end

---@realm shared
---@return string
function gmod_button:GetLabel() end

---@realm shared
---@param label string
function gmod_button:SetLabel(label) end

---@realm shared
---@param bEnable boolean
---@param ply? Player
function gmod_button:Toggle(bEnable, ply) end

---@realm shared
function gmod_button:UpdateLever() end
