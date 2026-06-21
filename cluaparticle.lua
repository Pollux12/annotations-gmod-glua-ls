---@meta

--- List of all possible functions available for Lua particles. This is the object returned by the [CLuaEmitter:Add](https://wiki.facepunch.com/gmod/CLuaEmitter:Add) function.
---@source https://wiki.facepunch.com/gmod/CLuaParticle
---@class (partial) CLuaParticle
local CLuaParticle = {}

---Returns the air resistance of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetAirResistance
---@return number # The air resistance of the particle
function CLuaParticle:GetAirResistance() end

---Returns the current orientation of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetAngles
---@return Angle # The angles of the particle
function CLuaParticle:GetAngles() end

---Returns the angular velocity of the particle
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetAngleVelocity
---@return Angle # The angular velocity of the particle
function CLuaParticle:GetAngleVelocity() end

---Returns the 'bounciness' of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetBounce
---@return number # The 'bounciness' of the particle
---
--- 2 means it will gain 100% of its previous velocity,
---
--- 1 means it will not lose velocity,
---
--- 0.5 means it will lose half of its velocity with each bounce.
function CLuaParticle:GetBounce() end

---Returns the color of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetColor
---@return number # Red part of the color
---@return number # Green part of the color
---@return number # Blue part of the color
function CLuaParticle:GetColor() end

---Returns the amount of time in seconds after which the particle will be destroyed.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetDieTime
---@return number # The amount of time in seconds after which the particle will be destroyed
function CLuaParticle:GetDieTime() end

---Returns the alpha value that the particle will reach on its death.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetEndAlpha
---@return number # The alpha value the particle will fade to
function CLuaParticle:GetEndAlpha() end

---Returns the length that the particle will reach on its death.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetEndLength
---@return number # The length the particle will reach
function CLuaParticle:GetEndLength() end

---Returns the size that the particle will reach on its death.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetEndSize
---@return number # The size the particle will reach
function CLuaParticle:GetEndSize() end

---Returns the gravity of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetGravity
---@return Vector # The gravity of the particle.
function CLuaParticle:GetGravity() end

---Returns the 'life time' of the particle, how long the particle existed since its creation.
---
--- This value will always be between 0 and [CLuaParticle:GetDieTime](https://wiki.facepunch.com/gmod/CLuaParticle:GetDieTime).
---
--- It changes automatically as time goes.
---
--- It can be manipulated using [CLuaParticle:SetLifeTime](https://wiki.facepunch.com/gmod/CLuaParticle:SetLifeTime).
---
--- If the life time of the particle will be more than [CLuaParticle:GetDieTime](https://wiki.facepunch.com/gmod/CLuaParticle:GetDieTime), it will be removed.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetLifeTime
---@return number # How long the particle existed, in seconds.
function CLuaParticle:GetLifeTime() end

---Returns the current material of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetMaterial
---@return IMaterial # The material.
function CLuaParticle:GetMaterial() end

---Returns the absolute position of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetPos
---@return Vector # The absolute position of the particle.
function CLuaParticle:GetPos() end

---Returns the current rotation of the particle in radians, this should only be used for 2D particles.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetRoll
---@return number # The current rotation of the particle in radians
function CLuaParticle:GetRoll() end

---Returns the current rotation speed of the particle in radians, this should only be used for 2D particles.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetRollDelta
---@return number # The current rotation speed of the particle in radians
function CLuaParticle:GetRollDelta() end

---Returns the alpha value which the particle has when it's created.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetStartAlpha
---@return number # The alpha value which the particle has when it's created.
function CLuaParticle:GetStartAlpha() end

---Returns the length which the particle has when it's created.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetStartLength
---@return number # The length which the particle has when it's created.
function CLuaParticle:GetStartLength() end

---Returns the size which the particle has when it's created.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetStartSize
---@return number # The size which the particle has when it's created.
function CLuaParticle:GetStartSize() end

---Returns the current velocity of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:GetVelocity
---@return Vector # The current velocity of the particle.
function CLuaParticle:GetVelocity() end

---Sets the air resistance of the the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetAirResistance
---@param airResistance number New air resistance.
function CLuaParticle:SetAirResistance(airResistance) end

---Sets the angles of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetAngles
---@param ang Angle New angle.
function CLuaParticle:SetAngles(ang) end

---Sets the angular velocity of the the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetAngleVelocity
---@param angVel Angle New angular velocity.
function CLuaParticle:SetAngleVelocity(angVel) end

---Sets the 'bounciness' of the the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetBounce
---@param bounce number New 'bounciness' of the particle
---
--- 2 means it will gain 100% of its previous velocity,
---
--- 1 means it will not lose velocity,
---
--- 0.5 means it will lose half of its velocity with each bounce.
function CLuaParticle:SetBounce(bounce) end

---Sets the whether the particle should collide with the world or not.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetCollide
---@param shouldCollide boolean Whether the particle should collide with the world or not
function CLuaParticle:SetCollide(shouldCollide) end

---Sets the function that gets called whenever the particle collides with the world.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetCollideCallback
---@param collideFunc fun(particle: CLuaParticle, hitPos: Vector, hitNormal: Vector) The collision callback.
---
--- Function argument(s):
--- * CLuaParticle `particle` - The particle itself
--- * Vector `hitPos` - Position of the collision
--- * Vector `hitNormal` - Direction of the collision, perpendicular to the hit surface
function CLuaParticle:SetCollideCallback(collideFunc) end

---Sets the color of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetColor
---@param r number The red component.
---@param g number The green component.
---@param b number The blue component.
function CLuaParticle:SetColor(r, g, b) end

---Sets the time where the particle will be removed.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetDieTime
---@param dieTime number The new die time.
function CLuaParticle:SetDieTime(dieTime) end

---Sets the alpha value of the particle that it will reach when it dies.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetEndAlpha
---@param endAlpha number The new alpha value of the particle that it will reach when it dies.
function CLuaParticle:SetEndAlpha(endAlpha) end

---Sets the length of the particle that it will reach when it dies.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetEndLength
---@param endLength number The new length of the particle that it will reach when it dies.
function CLuaParticle:SetEndLength(endLength) end

---Sets the size of the particle that it will reach when it dies.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetEndSize
---@param endSize number The new size of the particle that it will reach when it dies.
function CLuaParticle:SetEndSize(endSize) end

---Sets the directional gravity aka. acceleration of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetGravity
---@param gravity Vector The directional gravity.
function CLuaParticle:SetGravity(gravity) end

---Sets the 'life time' of the particle, how long the particle existed since its creation.
---
--- This value should always be between 0 and [CLuaParticle:GetDieTime](https://wiki.facepunch.com/gmod/CLuaParticle:GetDieTime).
---
--- It changes automatically as time goes.
---
--- If the life time of the particle will be more than [CLuaParticle:GetDieTime](https://wiki.facepunch.com/gmod/CLuaParticle:GetDieTime), it will be removed.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetLifeTime
---@param lifeTime number The new life time of the particle.
function CLuaParticle:SetLifeTime(lifeTime) end

---Sets whether the particle should be affected by lighting.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetLighting
---@param useLighting boolean Whether the particle should be affected by lighting.
function CLuaParticle:SetLighting(useLighting) end

---Sets the material of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetMaterial
---@param mat IMaterial The new material to set. Can also be a string.
function CLuaParticle:SetMaterial(mat) end

---Sets when the particles think function should be called next, this uses the synchronized server time returned by [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime).
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetNextThink
---@param nextThink number Next think time.
function CLuaParticle:SetNextThink(nextThink) end

---Sets the absolute position of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetPos
---@param pos Vector The new particle position.
function CLuaParticle:SetPos(pos) end

---Sets the roll of the particle in radians. This should only be used for 2D particles.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetRoll
---@param roll number The new rotation of the particle in radians.
function CLuaParticle:SetRoll(roll) end

---Sets the rotation speed of the particle in radians. This should only be used for 2D particles.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetRollDelta
---@param rollDelta number The new rotation speed of the particle in radians.
function CLuaParticle:SetRollDelta(rollDelta) end

---Sets the initial alpha value of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetStartAlpha
---@param startAlpha number Initial alpha.
function CLuaParticle:SetStartAlpha(startAlpha) end

---Sets the initial length value of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetStartLength
---@param startLength number Initial length.
function CLuaParticle:SetStartLength(startLength) end

---Sets the initial size value of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetStartSize
---@param startSize number Initial size.
function CLuaParticle:SetStartSize(startSize) end

---Sets the think function of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetThinkFunction
---@param thinkFunc fun(particle: CLuaParticle) Think function.
---
--- Function argument(s):
--- * CLuaParticle `particle` - The particle the think hook is set on
function CLuaParticle:SetThinkFunction(thinkFunc) end

---Sets the velocity of the particle.
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetVelocity
---@param vel Vector The new velocity of the particle.
function CLuaParticle:SetVelocity(vel) end

---Automatically scales the length of the particle based on the particle speed, multiplied with [CLuaParticle:SetStartLength](https://wiki.facepunch.com/gmod/CLuaParticle:SetStartLength) and [CLuaParticle:SetEndLength](https://wiki.facepunch.com/gmod/CLuaParticle:SetEndLength). Width remains the same as [CLuaParticle:SetStartSize](https://wiki.facepunch.com/gmod/CLuaParticle:SetStartSize) and [CLuaParticle:SetEndSize](https://wiki.facepunch.com/gmod/CLuaParticle:SetEndSize).
---@realm client
---@source https://wiki.facepunch.com/gmod/CLuaParticle:SetVelocityScale
---@param doScale? boolean Use velocity scaling.
function CLuaParticle:SetVelocityScale(doScale) end
