---@class gmod_cameraprop : Entity
local gmod_cameraprop = {}

---Sets the entity and local position tracked by the camera prop.
---@realm server
---@param ent Entity|NULL The entity to track, or NULL for no target.
---@param localPos Vector The local tracking position.
function gmod_cameraprop:SetTracking(ent, localPos) end
