---@meta

--- This is a list of all methods only available for vehicles. It is also possible to call [Entity](https://wiki.facepunch.com/gmod/Entity) functions on vehicles.
---@source https://wiki.facepunch.com/gmod/Vehicle
---@class (partial) Vehicle : Entity
local Vehicle = {}
---@class (partial) VEHICLE : Vehicle
VEHICLE = Vehicle

---Returns the remaining boosting time left.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:BoostTimeLeft
---@return number # The remaining boosting time left
function Vehicle:BoostTimeLeft() end

---Tries to find an Exit Point for leaving vehicle, if one is unobstructed in the direction given.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:CheckExitPoint
---@param yaw number Yaw/roll from vehicle angle to check for exit
---@param distance number Distance from origin to drop player
---@return Vector # Returns the vector for exit position or nil if cannot exit that way.
function Vehicle:CheckExitPoint(yaw, distance) end

---Sets whether the engine is enabled or disabled, i.e. can be started or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:EnableEngine
---@param enable boolean Enable or disable the engine
function Vehicle:EnableEngine(enable) end

---Returns information about the ammo of the vehicle
---@realm client
---@source https://wiki.facepunch.com/gmod/Vehicle:GetAmmo
---@return number # Ammo type of the vehicle ammo
---@return number # Clip size
---@return number # Count
function Vehicle:GetAmmo() end

---Returns third person camera distance.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:GetCameraDistance
---@return number # Camera distance
function Vehicle:GetCameraDistance() end

---Gets the driver of the vehicle, returns NULL Entity if no driver is present.
---In Garry's Mod, only Players can drive vehicles.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:GetDriver
---@return Player|NULL driver The driver of the vehicle.
function Vehicle:GetDriver() end

---Returns the current speed of the vehicle in Half-Life Hammer Units (in/s). Same as [Entity:GetVelocity](https://wiki.facepunch.com/gmod/Entity:GetVelocity) + [Vector:Length](https://wiki.facepunch.com/gmod/Vector:Length).
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetHLSpeed
---@return number # The speed of the vehicle
function Vehicle:GetHLSpeed() end

---Returns the max speed of the vehicle in MPH.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetMaxSpeed
---@return number # The max speed of the vehicle in MPH
function Vehicle:GetMaxSpeed() end

---Returns some info about the vehicle.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetOperatingParams
---@return OperatingParams # The operating parameters.
function Vehicle:GetOperatingParams() end

---Gets the passenger of the vehicle, returns [NULL](https://wiki.facepunch.com/gmod/NULL) if no drivers is present.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:GetPassenger
---@param passenger number The index of the passenger ( 0 is the driver )
---@return Entity # The passenger
function Vehicle:GetPassenger(passenger) end

---Returns the seat position and angle of a given passenger seat.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetPassengerSeatPoint
---@param role number The passenger role. ( 0 is the driver )
---@return Vector # The seat position in worldspace coordinates.
---@return Angle # The seat angle in worldspace coordinates.
function Vehicle:GetPassengerSeatPoint(role) end

---Returns the current RPM of the vehicle. This value is fake and doesn't actually affect the vehicle movement.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetRPM
---@return number # The RPM.
function Vehicle:GetRPM() end

---Returns the current speed of the vehicle in MPH.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetSpeed
---@return number # The speed of the vehicle in MPH
function Vehicle:GetSpeed() end

---Returns the current steering of the vehicle.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetSteering
---@return number # The current steering of the vehicle.
function Vehicle:GetSteering() end

---Returns the maximum steering degree of the vehicle
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetSteeringDegrees
---@return number # The maximum steering degree of the vehicle
function Vehicle:GetSteeringDegrees() end

---Returns if vehicle has thirdperson mode enabled or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:GetThirdPersonMode
---@return boolean # Returns `true` if third person mode enabled, `false` otherwise
function Vehicle:GetThirdPersonMode() end

---Returns the current throttle of the vehicle.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetThrottle
---@return number # The current throttle of the vehicle
function Vehicle:GetThrottle() end

---Returns the vehicle class name. This is only useful for Sandbox spawned vehicles or any vehicle that properly sets the vehicle class with [Vehicle:SetVehicleClass](https://wiki.facepunch.com/gmod/Vehicle:SetVehicleClass).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:GetVehicleClass
---@return string # The class name of the vehicle.
function Vehicle:GetVehicleClass() end

---Returns the vehicle parameters of given vehicle.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetVehicleParams
---@return VehicleParams # The vehicle parameters.
function Vehicle:GetVehicleParams() end

---Returns the view position and forward angle of a given passenger seat.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:GetVehicleViewPosition
---@param role? number The passenger role. 0 is the driver. This parameter seems to be ignored by the game engine and is therefore optional.
---@return Vector # The view position, will be 0, 0, 0 on failure
---@return Angle # The view angles, will be 0, 0, 0 on failure
---@return number # The field of view, will be 0 on failure
function Vehicle:GetVehicleViewPosition(role) end

---Returns the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) of given wheel.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetWheel
---@param wheel number The wheel to retrieve
---@return PhysObj # The wheel
function Vehicle:GetWheel(wheel) end

---Returns the base wheel height.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetWheelBaseHeight
---@param wheel number The wheel to get the base wheel height of.
---@return number # The base wheel height.
function Vehicle:GetWheelBaseHeight(wheel) end

---Returns the wheel contact point.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetWheelContactPoint
---@param wheel number The wheel to check
---@return Vector # The contact position
---@return number # The Surface Properties ID of hit surface.
---@return boolean # Whether the wheel is on ground or not
function Vehicle:GetWheelContactPoint(wheel) end

---Returns the wheel count of the vehicle
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetWheelCount
---@return number # The amount of wheels
function Vehicle:GetWheelCount() end

---Returns the total wheel height.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:GetWheelTotalHeight
---@param wheel number The wheel to get the base wheel height of.
---@return number # The total wheel height.
function Vehicle:GetWheelTotalHeight(wheel) end

---Returns whether this vehicle has boost at all.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:HasBoost
---@return boolean # Whether this vehicle has boost at all.
function Vehicle:HasBoost() end

---Returns whether this vehicle has a brake pedal. See [Vehicle:SetHasBrakePedal](https://wiki.facepunch.com/gmod/Vehicle:SetHasBrakePedal).
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:HasBrakePedal
---@return boolean # Whether this vehicle has a brake pedal or not.
function Vehicle:HasBrakePedal() end

---Returns whether this vehicle is currently boosting or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:IsBoosting
---@return boolean # Whether this vehicle is currently boosting or not.
function Vehicle:IsBoosting() end

---Returns whether the engine is enabled or not, i.e. whether it can be started.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:IsEngineEnabled
---@return boolean # Whether the engine is enabled
function Vehicle:IsEngineEnabled() end

---Returns whether the engine is started or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:IsEngineStarted
---@return boolean # Whether the engine is started or not.
function Vehicle:IsEngineStarted() end

---Determines whether a given [Vehicle](https://wiki.facepunch.com/gmod/Vehicle) is fully initialized.
---
--- It is possible, in uncommon circumstances, for a [valid](https://wiki.facepunch.com/gmod/Global.IsValid) [vehicle](https://wiki.facepunch.com/gmod/Entity:IsVehicle) entity to be in an invalid state, such as before [Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn) is called on the vehicle after creation.
---
--- If this function returns `false`, then the [Vehicle](https://wiki.facepunch.com/gmod/Vehicle) functions are not usable on this vehicle, while [Entity](https://wiki.facepunch.com/gmod/Entity) functions are.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:IsValidVehicle
---@return boolean # `true` if the Vehicle is in a valid state, or `false` if the Vehicle is in an invalid state.
function Vehicle:IsValidVehicle() end

---Returns whether this vehicle's engine is underwater or not. ( Internally the attachment point "engine" or "vehicle_engine" is checked )
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:IsVehicleBodyInWater
---@return boolean # Whether this vehicle's engine is underwater or not.
function Vehicle:IsVehicleBodyInWater() end

---Releases the vehicle's handbrake (Jeep) so it can roll without any passengers.
---
--- This will be overwritten if the vehicle has a driver. Same as [Vehicle:SetHandbrake](https://wiki.facepunch.com/gmod/Vehicle:SetHandbrake)( false )
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:ReleaseHandbrake
function Vehicle:ReleaseHandbrake() end

---Sets the boost. It is possible that this function does not work while the vehicle has a valid driver in it.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetBoost
---@param boost number The new boost value
function Vehicle:SetBoost(boost) end

---Sets the third person camera distance of the vehicle.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:SetCameraDistance
---@param distance number Camera distance to set to
function Vehicle:SetCameraDistance(distance) end

---Turns on or off the Jeep handbrake so it can roll without a driver inside.
---
--- Does nothing while the vehicle has a driver in it.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetHandbrake
---@param handbrake boolean true to turn on, false to turn off.
function Vehicle:SetHandbrake(handbrake) end

---Sets whether this vehicle has a brake pedal.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetHasBrakePedal
---@param brakePedal boolean Whether this vehicle has a brake pedal
function Vehicle:SetHasBrakePedal(brakePedal) end

---Sets maximum reverse throttle
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetMaxReverseThrottle
---@param maxRevThrottle number The new maximum throttle. This number must be negative.
function Vehicle:SetMaxReverseThrottle(maxRevThrottle) end

---Sets maximum forward throttle
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetMaxThrottle
---@param maxThrottle number The new maximum throttle.
function Vehicle:SetMaxThrottle(maxThrottle) end

---Sets spring length of given wheel
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetSpringLength
---@param wheel number The wheel to change spring length of
---@param length number The new spring length
function Vehicle:SetSpringLength(wheel, length) end

---Sets the steering of the vehicle.
--- The correct range, 0 to 1 or -1 to 1
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetSteering
---@param front number Angle of the front wheels (-1 to 1)
---@param rear number Angle of the rear wheels (-1 to 1)
function Vehicle:SetSteering(front, rear) end

---Sets the maximum steering degrees of the vehicle
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetSteeringDegrees
---@param steeringDegrees number The new maximum steering degree
function Vehicle:SetSteeringDegrees(steeringDegrees) end

---Sets the third person mode state.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:SetThirdPersonMode
---@param enable boolean Enable or disable the third person mode for this vehicle
function Vehicle:SetThirdPersonMode(enable) end

---Sets the throttle of the vehicle. It is possible that this function does not work with a valid driver in it.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetThrottle
---@param throttle number The new throttle.
function Vehicle:SetThrottle(throttle) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Sets the vehicle class name.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Vehicle:SetVehicleClass
---@param class string The vehicle class name to set
function Vehicle:SetVehicleClass(class) end

---Sets whether the entry or exit camera animation should be played or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetVehicleEntryAnim
---@param bOn boolean Whether the entry or exit camera animation should be played or not.
function Vehicle:SetVehicleEntryAnim(bOn) end

---Sets the vehicle parameters for given vehicle.
---
--- **NOTE**: Not all variables from the [Structures/VehicleParams](https://wiki.facepunch.com/gmod/Structures/VehicleParams) can be set.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetVehicleParams
---@param params VehicleParams The new new vehicle parameters. See Structures/VehicleParams.
function Vehicle:SetVehicleParams(params) end

---Sets friction of given wheel.  This function may be broken.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:SetWheelFriction
---@param wheel number The wheel to change the friction of
---@param friction number The new friction to set
function Vehicle:SetWheelFriction(wheel, friction) end

---Starts or stops the engine.
---@realm server
---@source https://wiki.facepunch.com/gmod/Vehicle:StartEngine
---@param start boolean True to start, false to stop.
function Vehicle:StartEngine(start) end
