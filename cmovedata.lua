---@meta

--- A class used to store the inputs from [CUserCmd](https://wiki.facepunch.com/gmod/CUserCmd) and other information related to the current movement simulation, such as velocity, position and so on.
---
--- This can only be accessed during [GM:SetupMove](https://wiki.facepunch.com/gmod/GM:SetupMove) , [GM:Move](https://wiki.facepunch.com/gmod/GM:Move) , [GM:PlayerTick](https://wiki.facepunch.com/gmod/GM:PlayerTick) and [GM:FinishMove](https://wiki.facepunch.com/gmod/GM:FinishMove).
---@source https://wiki.facepunch.com/gmod/CMoveData
---@class (partial) CMoveData
local CMoveData = {}

---Adds keys to the move data, as if player pressed them.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:AddKey
---@param keys number Keys to add, see Enums/IN
function CMoveData:AddKey(keys) end

---Gets the aim angle. Seems to be same as [CMoveData:GetAngles](https://wiki.facepunch.com/gmod/CMoveData:GetAngles).
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetAbsMoveAngles
---@return Angle # Aiming angle
function CMoveData:GetAbsMoveAngles() end

---Gets the aim angle. On client is the same as [Entity:GetAngles](https://wiki.facepunch.com/gmod/Entity:GetAngles).
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetAngles
---@return Angle # Aiming angle
function CMoveData:GetAngles() end

---Gets which buttons are down
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetButtons
---@return number # An integer representing which buttons are down, see Enums/IN
function CMoveData:GetButtons() end

---Returns the center of the player movement constraint. See [CMoveData:SetConstraintCenter](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintCenter).
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetConstraintCenter
---@return Vector # The constraint origin.
function CMoveData:GetConstraintCenter() end

---Returns the radius that constrains the players movement. See [CMoveData:SetConstraintRadius](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintRadius).
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetConstraintRadius
---@return number # The constraint radius
function CMoveData:GetConstraintRadius() end

---Returns the player movement constraint speed scale. See [CMoveData:SetConstraintSpeedScale](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintSpeedScale).
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetConstraintSpeedScale
---@return number # The constraint speed scale
function CMoveData:GetConstraintSpeedScale() end

---Returns the width (distance from the edge of the radius, inward) where the actual movement constraint functions.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetConstraintWidth
---@return number # The constraint width
function CMoveData:GetConstraintWidth() end

---Returns an internal player movement variable `m_outWishVel`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetFinalIdealVelocity
---@return Vector #
function CMoveData:GetFinalIdealVelocity() end

---Returns an internal player movement variable `m_outJumpVel`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetFinalJumpVelocity
---@return Vector #
function CMoveData:GetFinalJumpVelocity() end

---Returns an internal player movement variable `m_outStepHeight`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetFinalStepHeight
---@return number #
function CMoveData:GetFinalStepHeight() end

---Returns the players forward speed.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetForwardSpeed
---@return number # speed
function CMoveData:GetForwardSpeed() end

---Gets the number passed to "impulse" console command
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetImpulseCommand
---@return number # The impulse
function CMoveData:GetImpulseCommand() end

---Returns the maximum client speed of the player
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetMaxClientSpeed
---@return number # The maximum client speed
function CMoveData:GetMaxClientSpeed() end

---Returns the maximum speed of the player.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetMaxSpeed
---@return number # The maximum speed
function CMoveData:GetMaxSpeed() end

---Returns the angle the player is moving at. For more info, see [CMoveData:SetMoveAngles](https://wiki.facepunch.com/gmod/CMoveData:SetMoveAngles).
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetMoveAngles
---@return Angle # The move direction
function CMoveData:GetMoveAngles() end

---Gets the aim angle. Only works clientside, server returns same as [CMoveData:GetAngles](https://wiki.facepunch.com/gmod/CMoveData:GetAngles).
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetOldAngles
---@return Angle # The aim angle
function CMoveData:GetOldAngles() end

---Get which buttons were down last frame
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetOldButtons
---@return number # An integer representing which buttons were down, see Enums/IN
function CMoveData:GetOldButtons() end

---Gets the player's position.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetOrigin
---@return Vector # The player's position.
function CMoveData:GetOrigin() end

---Returns the strafe speed of the player.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetSideSpeed
---@return number # speed
function CMoveData:GetSideSpeed() end

---Returns the vertical speed of the player. ( Z axis of [CMoveData:GetVelocity](https://wiki.facepunch.com/gmod/CMoveData:GetVelocity) )
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetUpSpeed
---@return number # Vertical speed
function CMoveData:GetUpSpeed() end

---Gets the players velocity.
---
--- This will return Vector(0,0,0) sometimes when walking on props.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:GetVelocity
---@return Vector # The players velocity
function CMoveData:GetVelocity() end

---Returns whether the key is down or not
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:KeyDown
---@param key number The key to test, see Enums/IN
---@return boolean # Is the key down or not
function CMoveData:KeyDown(key) end

---Returns whether the key was pressed. If you want to check if the key is held down, try [CMoveData:KeyDown](https://wiki.facepunch.com/gmod/CMoveData:KeyDown)
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:KeyPressed
---@param key number The key to test, see Enums/IN
---@return boolean # Was the key pressed or not.
function CMoveData:KeyPressed(key) end

---Returns whether the key was released
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:KeyReleased
---@param key number A key to test, see Enums/IN
---@return boolean # Was the key released or not.
function CMoveData:KeyReleased(key) end

---Returns whether the key was down or not.
---
--- Unlike [CMoveData:KeyDown](https://wiki.facepunch.com/gmod/CMoveData:KeyDown), it will return false if [CMoveData:KeyPressed](https://wiki.facepunch.com/gmod/CMoveData:KeyPressed) is true and it will return true if [CMoveData:KeyReleased](https://wiki.facepunch.com/gmod/CMoveData:KeyReleased) is true.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:KeyWasDown
---@param key number The key to test, see Enums/IN
---@return boolean # Was the key down or not
function CMoveData:KeyWasDown(key) end

---Sets absolute move angles.( ? ) Doesn't seem to do anything.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetAbsMoveAngles
---@param ang Angle New absolute move angles
function CMoveData:SetAbsMoveAngles(ang) end

---Sets angles.
---
--- This function does nothing.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetAngles
---@param ang Angle The angles.
function CMoveData:SetAngles(ang) end

---Sets the pressed buttons on the move data
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetButtons
---@param buttons number A number representing which buttons are down, see Enums/IN
function CMoveData:SetButtons(buttons) end

---Sets the center of the player movement constraint. See [CMoveData:SetConstraintRadius](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintRadius).
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetConstraintCenter
---@param pos Vector The constraint origin.
function CMoveData:SetConstraintCenter(pos) end

---Sets the radius that constrains the players movement.
---
--- Works with conjunction of:
--- * [CMoveData:SetConstraintWidth](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintWidth)
--- * [CMoveData:SetConstraintSpeedScale](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintSpeedScale)
--- * [CMoveData:SetConstraintCenter](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintCenter)
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetConstraintRadius
---@param radius number The new constraint radius
function CMoveData:SetConstraintRadius(radius) end

---Sets the player movement constraint speed scale. This will be applied to the player within the [constraint radius](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintRadius) when approaching its edge.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetConstraintSpeedScale
---@param number number The constraint speed scale
function CMoveData:SetConstraintSpeedScale(number) end

---Sets  the width (distance from the edge of the [radius](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintRadius), inward) where the actual movement constraint functions.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetConstraintWidth
---@param number number The constraint width
function CMoveData:SetConstraintWidth(number) end

---Sets an internal player movement variable `m_outWishVel`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetFinalIdealVelocity
---@param idealVel Vector
function CMoveData:SetFinalIdealVelocity(idealVel) end

---Sets an internal player movement variable `m_outJumpVel`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetFinalJumpVelocity
---@param jumpVel Vector
function CMoveData:SetFinalJumpVelocity(jumpVel) end

---Sets an internal player movement variable `m_outStepHeight`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetFinalStepHeight
---@param stepHeight number
function CMoveData:SetFinalStepHeight(stepHeight) end

---Sets players forward speed.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetForwardSpeed
---@param speed number New forward speed
function CMoveData:SetForwardSpeed(speed) end

---Sets the impulse command. This isn't actually utilised in the engine anywhere.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetImpulseCommand
---@param impulse number The impulse to set
function CMoveData:SetImpulseCommand(impulse) end

---Sets the maximum player speed. Player won't be able to run or sprint faster then this value.
---
--- This also automatically sets [CMoveData:SetMaxSpeed](https://wiki.facepunch.com/gmod/CMoveData:SetMaxSpeed) when used in the [GM:SetupMove](https://wiki.facepunch.com/gmod/GM:SetupMove) hook. You must set it manually in the [GM:Move](https://wiki.facepunch.com/gmod/GM:Move) hook.
---
--- This must be called on both client and server to avoid prediction errors.
---
--- This will **not** reduce speed in air.
--- **NOTE**: Setting this to 0 will not make the player stationary. It won't do anything.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetMaxClientSpeed
---@param maxSpeed number The new maximum speed
function CMoveData:SetMaxClientSpeed(maxSpeed) end

---Sets the maximum speed of the player. This must match with [CMoveData:SetMaxClientSpeed](https://wiki.facepunch.com/gmod/CMoveData:SetMaxClientSpeed) both, on server and client.
---
--- Doesn't seem to be doing anything on it's own, use [CMoveData:SetMaxClientSpeed](https://wiki.facepunch.com/gmod/CMoveData:SetMaxClientSpeed) instead.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetMaxSpeed
---@param maxSpeed number The new maximum speed
function CMoveData:SetMaxSpeed(maxSpeed) end

---Sets the serverside move angles, making the movement keys act as if player was facing that direction.
---
--- This function is predicted, and should be called shared with matching data on client and server.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetMoveAngles
---@param dir Angle The aim direction.
function CMoveData:SetMoveAngles(dir) end

---Sets old aim angles. ( ? ) Doesn't seem to be doing anything.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetOldAngles
---@param aimAng Angle The old angles
function CMoveData:SetOldAngles(aimAng) end

---Sets the 'old' pressed buttons on the move data. These buttons are used to work out which buttons have been released, which have just been pressed and which are being held down.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetOldButtons
---@param buttons number A number representing which buttons were down, see Enums/IN
function CMoveData:SetOldButtons(buttons) end

---Sets the players position.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetOrigin
---@param pos Vector The position
function CMoveData:SetOrigin(pos) end

---Sets players strafe speed.
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetSideSpeed
---@param speed number Strafe speed
function CMoveData:SetSideSpeed(speed) end

---Sets vertical speed of the player. ( Z axis of [CMoveData:SetVelocity](https://wiki.facepunch.com/gmod/CMoveData:SetVelocity) )
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetUpSpeed
---@param speed number Vertical speed to set
function CMoveData:SetUpSpeed(speed) end

---Sets the player's velocity
---@realm shared
---@source https://wiki.facepunch.com/gmod/CMoveData:SetVelocity
---@param velocity Vector The velocity to set
function CMoveData:SetVelocity(velocity) end
