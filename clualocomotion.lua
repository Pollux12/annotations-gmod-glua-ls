---@meta

--- This class is essentially what controls a [NextBot](https://wiki.facepunch.com/gmod/NextBot) NPC. You can access it in a [NextBot](https://wiki.facepunch.com/gmod/NextBot) NPC by using **self.loco** variable.
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion
---@class (partial) CLuaLocomotion
local CLuaLocomotion = {}

---Moves the [NextBot](https://wiki.facepunch.com/gmod/NextBot) incrementally closer to the provided goal location.
---
--- Each time this function is called, the NextBot moves towards the goal position passed as an argument by the amount previously set by [CLuaLocomotion:SetDesiredSpeed](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDesiredSpeed).
---
--- To achieve smooth movement, this function must be called frequently.
--- This is commonly accomplished by calling it in the [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) hook.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:Approach
---@param goal Vector The vector we want to get to.
---@param goalWeight number How influential the movement should be, in case of this function being called multiple times in between physical movements of the entity.
---
--- If unsure then set this to `1`.
function CLuaLocomotion:Approach(goal, goalWeight) end

---Removes the stuck status from the bot
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:ClearStuck
function CLuaLocomotion:ClearStuck() end

---Sets the direction we want to face
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:FaceTowards
---@param goal Vector The vector we want to face
function CLuaLocomotion:FaceTowards(goal) end

---Returns the acceleration speed
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetAcceleration
---@return number # Current acceleration speed
function CLuaLocomotion:GetAcceleration() end

---Returns whether the Nextbot is allowed to avoid obstacles or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetAvoidAllowed
---@return boolean # Whether this bot is allowed to try to avoid obstacles.
function CLuaLocomotion:GetAvoidAllowed() end

---Returns whether the Nextbot is allowed to climb or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetClimbAllowed
---@return boolean # Whether this bot is allowed to climb.
function CLuaLocomotion:GetClimbAllowed() end

---Returns the current acceleration as a vector
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetCurrentAcceleration
---@return Vector # Current acceleration
function CLuaLocomotion:GetCurrentAcceleration() end

---Gets the height the bot is scared to fall from
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDeathDropHeight
---@return number # Current death drop height
function CLuaLocomotion:GetDeathDropHeight() end

---Gets the deceleration speed
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDeceleration
---@return number # Current deceleration speed
function CLuaLocomotion:GetDeceleration() end

---Returns the desired movement speed set by [CLuaLocomotion:SetDesiredSpeed](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDesiredSpeed)
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDesiredSpeed
---@return number # The desired movement speed.
function CLuaLocomotion:GetDesiredSpeed() end

---Returns the locomotion's gravity.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGravity
---@return number # The gravity.
function CLuaLocomotion:GetGravity() end

---Return unit vector in XY plane describing our direction of motion - even if we are currently not moving
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGroundMotionVector
---@return Vector # A vector representing the X and Y movement
function CLuaLocomotion:GetGroundMotionVector() end

---Returns the current ground normal.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGroundNormal
---@return Vector # The current ground normal.
function CLuaLocomotion:GetGroundNormal() end

---Returns whether the Nextbot is allowed to jump gaps or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetJumpGapsAllowed
---@return boolean # Whether this bot is allowed to jump gaps.
function CLuaLocomotion:GetJumpGapsAllowed() end

---Gets the height of the bot's jump
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetJumpHeight
---@return number # Current jump height
function CLuaLocomotion:GetJumpHeight() end

---Returns maximum jump height of this [CLuaLocomotion](https://wiki.facepunch.com/gmod/CLuaLocomotion).
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetMaxJumpHeight
---@return number # The maximum jump height.
function CLuaLocomotion:GetMaxJumpHeight() end

---Returns the max rate at which the NextBot can visually rotate.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetMaxYawRate
---@return number # Maximum yaw rate
function CLuaLocomotion:GetMaxYawRate() end

---Returns the [NextBot](https://wiki.facepunch.com/gmod/NextBot) this locomotion is associated with.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetNextBot
---@return NextBot # The nextbot
function CLuaLocomotion:GetNextBot() end

---Gets the max height the bot can step up
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetStepHeight
---@return number # Current step height
function CLuaLocomotion:GetStepHeight() end

---Returns the current movement velocity as a vector
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:GetVelocity
---@return Vector # Current velocity
function CLuaLocomotion:GetVelocity() end

---Returns whether this [CLuaLocomotion](https://wiki.facepunch.com/gmod/CLuaLocomotion) can reach and/or traverse/move in given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:IsAreaTraversable
---@param area CNavArea The area to test
---@return boolean # Whether this CLuaLocomotion can traverse given CNavArea.
function CLuaLocomotion:IsAreaTraversable(area) end

---Returns true if we're trying to move.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:IsAttemptingToMove
---@return boolean # Whether we're trying to move or not.
function CLuaLocomotion:IsAttemptingToMove() end

---Returns true of the locomotion engine is jumping or climbing
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:IsClimbingOrJumping
---@return boolean # Whether we're climbing or jumping or not
function CLuaLocomotion:IsClimbingOrJumping() end

---Returns whether the nextbot this locomotion is attached to is on ground or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:IsOnGround
---@return boolean # Whether the nextbot is on ground or not.
function CLuaLocomotion:IsOnGround() end

---Returns true if we're stuck
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:IsStuck
---@return boolean # Whether we're stuck or not
function CLuaLocomotion:IsStuck() end

---Returns whether or not the target in question is on a ladder or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:IsUsingLadder
---@return boolean # If the target is on a ladder or not.
function CLuaLocomotion:IsUsingLadder() end

---Makes the bot jump. It must be on ground ([Entity:IsOnGround](https://wiki.facepunch.com/gmod/Entity:IsOnGround)) and its model must have `ACT_JUMP` activity.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:Jump
---@param act? number The activity to use as the jumping animation.
function CLuaLocomotion:Jump(act) end

---Makes the bot jump across a gap. The bot must be on ground ([Entity:IsOnGround](https://wiki.facepunch.com/gmod/Entity:IsOnGround)) and its model must have `ACT_JUMP` activity.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:JumpAcrossGap
---@param landingGoal Vector
---@param landingForward Vector
function CLuaLocomotion:JumpAcrossGap(landingGoal, landingForward) end

---Sets the acceleration speed
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetAcceleration
---@param speed? number Speed acceleration
function CLuaLocomotion:SetAcceleration(speed) end

---Sets whether the Nextbot is allowed try to to avoid obstacles or not. This is used during path generation. Works similarly to `nb_allow_avoiding` convar. By default bots are allowed to try to avoid obstacles.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetAvoidAllowed
---@param allowed boolean Whether this bot should be allowed to try to avoid obstacles.
function CLuaLocomotion:SetAvoidAllowed(allowed) end

---Sets whether the Nextbot is allowed to climb or not. This is used during path generation. Works similarly to `nb_allow_climbing` convar. By default bots are allowed to climb.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetClimbAllowed
---@param allowed boolean Whether this bot should be allowed to climb.
function CLuaLocomotion:SetClimbAllowed(allowed) end

---Sets the height the bot is scared to fall from.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDeathDropHeight
---@param height? number Height
function CLuaLocomotion:SetDeathDropHeight(height) end

---Sets the deceleration speed.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDeceleration
---@param deceleration? number New deceleration speed.
function CLuaLocomotion:SetDeceleration(deceleration) end

---Sets how far the NextBot will need to move each time [CLuaLocomotion:Approach](https://wiki.facepunch.com/gmod/CLuaLocomotion:Approach) is called to move at given speed.
---
--- The default amount is 0. This means the bot will not move if this value has not been set.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDesiredSpeed
---@param speed? number The new desired speed
function CLuaLocomotion:SetDesiredSpeed(speed) end

---Sets the locomotion's gravity.
---
--- **NOTE**: With values 0 or below, or even lower positive values, the nextbot will start to drift sideways, use [CLuaLocomotion:SetVelocity](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetVelocity) to counteract this.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetGravity
---@param gravity? number New gravity to set.
function CLuaLocomotion:SetGravity(gravity) end

---Sets whether the Nextbot is allowed to jump gaps or not. This is used during path generation. Works similarly to `nb_allow_gap_jumping` convar. By default bots are allowed to jump gaps.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetJumpGapsAllowed
---@param allowed boolean Whether this bot should be allowed to jump gaps.
function CLuaLocomotion:SetJumpGapsAllowed(allowed) end

---Sets the height of the bot's jump
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetJumpHeight
---@param height? number Height
function CLuaLocomotion:SetJumpHeight(height) end

---Sets the max rate at which the NextBot can visually rotate. This will not affect moving or pathing.
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetMaxYawRate
---@param yawRate? number Desired new maximum yaw rate
function CLuaLocomotion:SetMaxYawRate(yawRate) end

---Sets the max height the bot can step up
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetStepHeight
---@param height? number Height
function CLuaLocomotion:SetStepHeight(height) end

---Sets the current movement velocity
---@realm server
---@source https://wiki.facepunch.com/gmod/CLuaLocomotion:SetVelocity
---@param velocity Vector
function CLuaLocomotion:SetVelocity(velocity) end
