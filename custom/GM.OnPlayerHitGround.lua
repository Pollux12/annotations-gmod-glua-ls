---Called when a player makes contact with the ground after a jump or a fall.
---@hook OnPlayerHitGround
---@realm shared
---@source https://wiki.facepunch.com/gmod/GM:OnPlayerHitGround
---@param player Player Player
---@param inWater boolean Did the player land in water?
---@param onFloater boolean Did the player land on an object floating in the water?
---@param speed number The speed at which the player hit the ground
---@return boolean # Return true to suppress default action
function GM:OnPlayerHitGround(player, inWater, onFloater, speed) end
