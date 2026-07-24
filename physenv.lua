---@meta

--- The physenv library allows you to control the physics environment created by the engine, and lets you modify constants such as gravity and maximum velocity.
physenv = {}

---Adds a [material surface property](https://developer.valvesoftware.com/wiki/Material_surface_properties) type to the game's physics environment.
---
--- See [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData) for the opposite function.
---
--- The game has a limit of 128 surface properties - this includes properties loaded automatically from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt). Due to this, there's only a small amount of open slots that can be registered with GMod's provided surfaceproperties.txt.
---
--- Does nothing on `x86-64` beta.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.AddSurfaceData
---@param properties string The properties to add. Each one should include `"base"` or the game will crash due to some values being missing.
function physenv.AddSurfaceData(properties) end

---Returns the air density used to calculate drag on physics objects.
--- 		The unit is in `kg/m³`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.GetAirDensity
---@return number # Default value is 2.
function physenv.GetAirDensity() end

---Gets the gravitational acceleration used for physics objects in `source_unit/s^2`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.GetGravity
---@return Vector # Gravity direction and strength.
function physenv.GetGravity() end

---Returns the last simulation duration of the in-game physics.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.GetLastSimulationTime
---@return number # The last simulation duration of the in-game physics in seconds
function physenv.GetLastSimulationTime() end

---Gets the current performance settings in table form.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.GetPerformanceSettings
---@return table # Performance settings or nil if called too early. See Structures/PhysEnvPerformanceSettings
function physenv.GetPerformanceSettings() end

---Returns the pause status of global physics simulation. See [physenv.SetPhysicsPaused](https://wiki.facepunch.com/gmod/physenv.SetPhysicsPaused) for the setter.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.GetPhysicsPaused
---@return boolean # `true` if paused.
function physenv.GetPhysicsPaused() end

---Returns the physics time scale set with [physenv.SetTimeScale](https://wiki.facepunch.com/gmod/physenv.SetTimeScale).
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.GetTimeScale
---@return number # The current physics time scale.
function physenv.GetTimeScale() end

---Sets the air density.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.SetAirDensity
---@param airDensity number The new air density.
function physenv.SetAirDensity(airDensity) end

---Sets the gravitational acceleration used for physics objects. Does not affect players.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.SetGravity
---@param gravAccel Vector The new gravity in `source_unit/s^2`.
function physenv.SetGravity(gravAccel) end

---Sets the performance settings.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.SetPerformanceSettings
---@param performanceSettings PhysEnvPerformanceSettings The new performance settings. See Structures/PhysEnvPerformanceSettings
function physenv.SetPerformanceSettings(performanceSettings) end

---Pauses or unpauses the physics simulation globally. See [physenv.GetPhysicsPaused](https://wiki.facepunch.com/gmod/physenv.GetPhysicsPaused) for the getter.
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.SetPhysicsPaused
---@param pause boolean `true` to pause, `false` to unpause.
function physenv.SetPhysicsPaused(pause) end

---Sets the time scale of the physics simulation.
---
--- This will affect serverside-only physics if called on server, and clientside-only physics if used on the client.
---
--- See [game.SetTimeScale](https://wiki.facepunch.com/gmod/game.SetTimeScale) for a function that also affects all game logic.
---
--- The true timescale will be `phys_timescale` (`cl_phys_timescale` on client) multiplied by [physenv.GetTimeScale](https://wiki.facepunch.com/gmod/physenv.GetTimeScale).
---@realm shared
---@source https://wiki.facepunch.com/gmod/physenv.SetTimeScale
---@param timeScale number The new timescale, minimum value is 0.001 and maximum is 5.
function physenv.SetTimeScale(timeScale) end
