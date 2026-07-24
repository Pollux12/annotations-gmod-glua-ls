---@class gmod_wheel : Entity
local gmod_wheel = {}

---@realm server
---@param motor table The wheel constraint motor data.
function gmod_wheel:SetMotor(motor) end

---@realm server
---@param direction number The wheel direction.
function gmod_wheel:SetDirection(direction) end

---@realm server
---@param axis Vector The wheel axis.
function gmod_wheel:SetAxis(axis) end

---@realm server
function gmod_wheel:DoDirectionEffect() end
