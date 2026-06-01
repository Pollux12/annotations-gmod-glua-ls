---@meta

--- For a list of possible members of [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities) see [ENT Structure](https://wiki.facepunch.com/gmod/Structures/ENT).
---@class Entity
---@field BaseClass Entity? The base class table of this entity, used for inheritance in the scripted entity system.
---@field EntityMods table? A table of entity modifications stored by the duplicator system via Entity:SetEntityMods.
local Entity = {}
---@class ENTITY : Entity
ENTITY = Entity

---Returns a table containing all key-value pairs stored on this entity's Lua table.
---The returned table contains all fields but method calls via `:` are not supported.
---@return tableof<self>
function Entity:GetTable() end

---Called when another entity fires an event to this entity.
---@hook AcceptInput
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:AcceptInput
---@param inputName string The name of the input that was triggered.
---@param activator Entity The initial cause for the input getting triggered. (e.g. the player who pushed a button)
---@param caller Entity The entity that directly triggered the input. (e.g. the button that was pushed)
---@param param string The input parameter.
---@return boolean # Should we suppress the default action for this input?
---
--- Returning `true` for unknown inputs will also prevent the game complaining about the unknown input in console with `developer 2`.
function Entity:AcceptInput(inputName, activator, caller, param) end

---Activates the entity. This needs to be used on some entities (like constraints) after being spawned.
---
--- **NOTE**: For some entity types when this function is used after [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale), the physics object will be recreated with the new scale. [Source-sdk-2013](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/baseanimating.cpp#L321-L327).
---
--- Calling this method after [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale) will recreate a new scaled `SOLID_VPHYSICS` [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) on scripted entities. This can be a problem if you made a properly scaled [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) of another kind (using [Entity:PhysicsInitSphere](https://wiki.facepunch.com/gmod/Entity:PhysicsInitSphere) for instance) or if you edited the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)'s properties. This is especially the behavior of the Sandbox spawn menu.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:Activate
function Entity:Activate() end

---Add a callback function to a specific event. This is used instead of hooks to avoid calling empty functions unnecessarily.
---
--- This also allows you to use certain hooks in engine entities (non-scripted entities).
---
--- **WARNING**: This method does not check if the function has already been added to this object before, so if you add the same callback twice, it will be run twice! Make sure to add your callback only once.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:AddCallback
---@param hook string The hook name to hook onto. See Entity Callbacks
---@param func function The function to call. It's arguments and return values will depend on the hook specified in the first argument.
---@return number # The callback ID that was just added, which can later be used in Entity:RemoveCallback.
---
--- Returns nothing if the passed callback function was invalid or when asking for a non-existent hook.
function Entity:AddCallback(hook, func) end

---Applies an engine effect to an entity.
---
--- See also [Entity:IsEffectActive](https://wiki.facepunch.com/gmod/Entity:IsEffectActive) and  [Entity:RemoveEffects](https://wiki.facepunch.com/gmod/Entity:RemoveEffects).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:AddEffects
---@param effect EF The effect to apply, see Enums/EF.
function Entity:AddEffects(effect) end

---Adds engine flags.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:AddEFlags
---@param flag EFL Engine flag to add, see Enums/EFL
function Entity:AddEFlags(flag) end

---Adds flags to the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:AddFlags
---@param flag FL Flag to add, see Enums/FL
function Entity:AddFlags(flag) end

---Adds a gesture animation to the entity and plays it.
---
--- See [Entity:AddGestureSequence](https://wiki.facepunch.com/gmod/Entity:AddGestureSequence) and [Entity:AddLayeredSequence](https://wiki.facepunch.com/gmod/Entity:AddLayeredSequence) for functions that takes sequences instead of [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:AddGesture
---@param activity number The activity to play as the gesture. See Enums/ACT.
---@param autokill? boolean Automatically remove the gesture when it fully plays (Entity:GetLayerCycle reaches 1).
---@return number # Layer ID of the started gesture, used to manipulate the played gesture by other functions.
--- If a layer has already been allocated for supplied [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT), it will return existing layer ID instead of allocating a new layer.
function Entity:AddGesture(activity, autokill) end

---Adds a gesture animation to the entity and plays it.
---
--- See [Entity:AddGesture](https://wiki.facepunch.com/gmod/Entity:AddGesture) for a function that takes [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT).
---
--- See also [Entity:AddLayeredSequence](https://wiki.facepunch.com/gmod/Entity:AddLayeredSequence).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:AddGestureSequence
---@param sequence number The sequence ID to play as the gesture. See Entity:LookupSequence.
---@param autokill? boolean Automatically remove the gesture when it fully plays (Entity:GetLayerCycle reaches 1).
---@return number # Layer ID of the started gesture, used to manipulate the played gesture by other functions.
function Entity:AddGestureSequence(sequence, autokill) end

---Adds a gesture animation to the entity and plays it.
---
--- See [Entity:AddGestureSequence](https://wiki.facepunch.com/gmod/Entity:AddGestureSequence) for a function that doesn't take priority.
---
--- See [Entity:AddGesture](https://wiki.facepunch.com/gmod/Entity:AddGesture) for a function that takes [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:AddLayeredSequence
---@param sequence number The sequence ID to play as the gesture. See Entity:LookupSequence.
---@param priority number
---@return number # Layer ID of created layer
function Entity:AddLayeredSequence(sequence, priority) end

---A helper function for creating [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
--- Similar to [ENTITY:AddOutputFromKeyValue](https://wiki.facepunch.com/gmod/ENTITY:AddOutputFromKeyValue), call it from [ENTITY:AcceptInput](https://wiki.facepunch.com/gmod/ENTITY:AcceptInput) and it'll return true if it successfully added an output from the passed input data.
---@hook AddOutputFromAcceptInput
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:AddOutputFromAcceptInput
---@param name string The input name from ENTITY:AcceptInput.
---@param data string The input data from ENTITY:AcceptInput.
---@return boolean # Whether any outputs were added or not.
function Entity:AddOutputFromAcceptInput(name, data) end

---A helper function for creating [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
--- Call it from [ENTITY:KeyValue](https://wiki.facepunch.com/gmod/ENTITY:KeyValue) and it'll return true if it successfully added an output from the passed KV pair.
---@hook AddOutputFromKeyValue
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:AddOutputFromKeyValue
---@param key string The key-value key.
---@param value string The key-value value.
---@return boolean # Whether any outputs were added or not.
function Entity:AddOutputFromKeyValue(key, value) end

---Adds solid flag(s) to the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:AddSolidFlags
---@param flags number The flag(s) to apply, see Enums/FSOLID.
function Entity:AddSolidFlags(flags) end

---Adds onto the current SpawnFlags of an Entity.
---
--- SpawnFlags can easily be found on https://developer.valvesoftware.com/wiki/.
---
--- 	**NOTE**: See also [Entity:RemoveSpawnFlags](https://wiki.facepunch.com/gmod/Entity:RemoveSpawnFlags), [Entity:SetSpawnFlags](https://wiki.facepunch.com/gmod/Entity:SetSpawnFlags)
---
--- 	Using [SF Enumerations](https://wiki.facepunch.com/gmod/Enums/SF) won't work, if this function is ran clientside due to the enumerations being defined only Serverside. Use the actual SpawnFlag number.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:AddSpawnFlags
---@param flag number The SpawnFlag to add to the Entity
function Entity:AddSpawnFlags(flag) end

---Adds a [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ect to the entity's motion controller so that [ENTITY:PhysicsSimulate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate) will be called for given [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ect as well.
---
--- You must first create a motion controller with [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController).
---
--- You can remove added [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ects by using [Entity:RemoveFromMotionController](https://wiki.facepunch.com/gmod/Entity:RemoveFromMotionController).
---
--- **NOTE**: Only works on a scripted [Entity](https://wiki.facepunch.com/gmod/Entity) of anim type
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:AddToMotionController
---@param physObj PhysObj The PhysObj to add to the motion controller.
function Entity:AddToMotionController(physObj) end

---Returns an angle based on the ones inputted that you can use to align an object.
---
--- **NOTE**: This function doesn't change the angle of the entity on its own (see example).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:AlignAngles
---@param from Angle The angle you want to align from
---@param to Angle The angle you want to align to
---@return Angle # The resulting aligned angle
function Entity:AlignAngles(from, to) end

---Checks if the entity is considered alive.
---
--- Checks entity's internal life state variable. Does not check health, but it is generally expected the health to be 0 or below at the point of an entity being considered dead. This internally looks up the save value `m_lifeState`
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:Alive
---@return boolean # Whether the entity is considered alive.
function Entity:Alive() end

---Spawns a clientside ragdoll for the entity, positioning it in place of the original entity, and makes the entity invisible. It doesn't preserve flex values (face posing) as CSRagdolls don't support flex.
---
--- It does not work on players. Use [Player:CreateRagdoll](https://wiki.facepunch.com/gmod/Player:CreateRagdoll) instead.
---
--- The original entity is not removed, and neither are any ragdolls previously generated with this function.
---
--- To make the entity re-appear, run [Entity:SetNoDraw](https://wiki.facepunch.com/gmod/Entity:SetNoDraw)( false )
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:BecomeRagdollOnClient
---@return Entity # The created ragdoll. (`class C_ClientRagdoll`)
function Entity:BecomeRagdollOnClient() end

---Returns true if the entity is being looked at by the local player and is within 256 units of distance.
---
--- **NOTE**: This function is only available in entities that are based off of sandbox's base_gmodentity.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:BeingLookedAtByLocalPlayer
---@return boolean # Is the entity being looked at by the local player and within 256 units.
function Entity:BeingLookedAtByLocalPlayer() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Dispatches blocked events to this entity's blocked handler. This function is only useful when interacting with entities like func_movelinear.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Blocked
---@param entity Entity The entity that is blocking us
function Entity:Blocked(entity) end

---Returns a centered vector of this entity, NPCs use this internally to aim at their targets.
---
--- **NOTE**: This only works on players and NPCs.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:BodyTarget
---@param origin Vector The vector of where the the attack comes from.
---@param noisy? boolean Decides if it should return the centered vector with a random offset to it.
---@return Vector # The centered vector.
function Entity:BodyTarget(origin, noisy) end

---Returns whether the entity's bone has the flag or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:BoneHasFlag
---@param boneID number Bone ID to test flag of.
---@param flag BONE The flag to test, see Enums/BONE
---@return boolean # Whether the bone has that flag or not
function Entity:BoneHasFlag(boneID, flag) end

---Returns the length between given bone's position and the position of given bone's parent.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:BoneLength
---@param boneID number The ID of the bone you want the length of. You may want to get the length of the next bone ( boneID + 1 ) for decent results
---@return number # The length of the bone
function Entity:BoneLength(boneID) end

---Returns the distance between the center of the bounding box and the furthest bounding box corner.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:BoundingRadius
---@return number # The radius of the bounding box.
function Entity:BoundingRadius() end

---Called whenever the entity's position changes. A callback for when an entity's angle changes is available via [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback).
---
--- Like [ENTITY:RenderOverride](https://wiki.facepunch.com/gmod/ENTITY:RenderOverride), this hook works on any entity (scripted or not) it is applied on.
---
--- **NOTE**: If EFL_DIRTY_ABSTRANSFORM is set on the entity, this will be called serverside only; otherwise, this will be called clientside only. This means serverside calls of [Entity:SetPos](https://wiki.facepunch.com/gmod/Entity:SetPos) without the EFL_DIRTY_ABSTRANSFORM flag enabled (most cases) will be called clientside only.
---
--- **NOTE**: The give concommand will call this hook serverside only upon entity spawn.
---@hook CalcAbsolutePosition
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:CalcAbsolutePosition
---@param pos Vector The entity's actual position. May differ from Entity:GetPos
---@param ang Angle The entity's actual angles. May differ from Entity:GetAngles
---@return Vector # New position
---@return Angle # New angles
function Entity:CalcAbsolutePosition(pos, ang) end

---Calls all [Entity:NetworkVarNotify](https://wiki.facepunch.com/gmod/Entity:NetworkVarNotify) functions with the given new value, but doesn't change the real value.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:CallDTVarProxies
---@param type string The NetworkVar Type. Supported choices:
---
--- * `String` (up to 511 characters)
--- * `Bool`
--- * `Float`
--- * `Int` (32-bit signed integer)
--- * `Vector`
--- * `Angle`
--- * `Entity`
---@param slot number The NetworkVar slot. See Entity:NetworkVar for more detailed explanation.
---@param newValue any The new value.
function Entity:CallDTVarProxies(type, slot, newValue) end

---Causes a specified function to be run if the entity is removed by any means. This can later be undone by [Entity:RemoveCallOnRemove](https://wiki.facepunch.com/gmod/Entity:RemoveCallOnRemove) if you need it to not run.
---
--- **WARNING**: This hook is called clientside during full updates. See [GM:EntityRemoved](https://wiki.facepunch.com/gmod/GM:EntityRemoved) for more information.
---
--- **WARNING**: An error being thrown inside `removeFunc` will stop other `EntityRemoved` hooks from executing.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:CallOnRemove
---@param identifier any Identifier that can be optionally used with Entity:RemoveCallOnRemove to undo this call on remove.
---@param removeFunc fun(ent: Entity, ...: any) Function to be called on remove.
---
--- Function argument(s):
--- * Entity `ent` - The entity about to be removed.
--- * vararg `data` - Data passed from the arguments to `CallOnRemove`.
---@param ... any Optional arguments to pass to removeFunc. Do note that the first argument passed to the function will always be the entity being removed, and the arguments passed on here start after that.
function Entity:CallOnRemove(identifier, removeFunc, ...) end

---Called by the Sandbox gamemode from the default implementation of [GM:CanEditVariable](https://wiki.facepunch.com/gmod/GM:CanEditVariable).
---@hook CanEditVariables
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:CanEditVariables
---@param ply Player The player is trying to edit a variable on this entity.
---@return boolean # `true` to allow the edit, `false` to disallow.
function Entity:CanEditVariables(ply) end

---Controls if a property can be used on this entity or not.
---
--- This hook will only work in Sandbox derived gamemodes that do not have [GM:CanProperty](https://wiki.facepunch.com/gmod/GM:CanProperty) overridden.
---
--- **NOTE**: This hook will work on ALL entities, not just the scripted ones (SENTs)
---@hook CanProperty
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:CanProperty
---@param ply Player Player, that tried to use the property
---@param property string Class of the property that is tried to use, for example - bonemanipulate
---@return boolean # Return false to disallow using that property, return true to allow.
---
--- You must return a value. Not returning anything can cause unexpected results.
function Entity:CanProperty(ply, property) end

---Controls if a tool can be used on this entity or not.
---
--- This hook will only work in Sandbox derived gamemodes that do not have [SANDBOX:CanTool](https://wiki.facepunch.com/gmod/SANDBOX:CanTool) overridden.
---
--- **NOTE**: This hook will work on ALL entities, not just the scripted ones (SENTs)
---@hook CanTool
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:CanTool
---@param ply Player Player, that tried to use the tool
---@param tr TraceResult The trace of the tool.
--- Returns only [Entity](https://wiki.facepunch.com/gmod/Structures/TraceResult#Entity) when the 5th argument returns `4`
---@param toolname string Class of the tool that is tried to use, for example - `weld`
---@param tool table The tool mode table the player currently has selected.
---@param button number The tool button pressed.
--- * 1 - left click
--- * 2 - right click
--- * 3 - reload
--- * 4 - Menu (No interaction with the toolgun)
--- The number `4` is a test that Rubat is conducting to implement the CanTool in the SpawnMenu. It may disappear.
---@return boolean # Return `false` to disallow using that tool on this entity, return `true` to allow.
function Entity:CanTool(ply, tr, toolname, tool, button) end

---Clears all registered events for map I/O outputs on this entity. If a string is given, will use the string as a wildcard to limit removed outputs by name matches.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:ClearAllOutputs
---@param outputName? string An optional string that will be used to limit removed outputs by name matches, supports wildcards.
function Entity:ClearAllOutputs(outputName) end

---Resets all pose parameters such as aim_yaw, aim_pitch and rotation.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ClearPoseParameters
function Entity:ClearPoseParameters() end

---Declares that the collision rules of the entity have changed, and subsequent calls for [GM:ShouldCollide](https://wiki.facepunch.com/gmod/GM:ShouldCollide) with this entity may return a different value than they did previously.
---
--- **WARNING**: This function must **not** be called inside of [GM:ShouldCollide](https://wiki.facepunch.com/gmod/GM:ShouldCollide). Instead, it must be called in advance when the condition is known to change.
---
--- **WARNING**: Failure to use this function correctly will result in a crash of the physics engine.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:CollisionRulesChanged
function Entity:CollisionRulesChanged() end

---Same as [Entity:GetBoneMatrix](https://wiki.facepunch.com/gmod/Entity:GetBoneMatrix), but instead of returning a new matrix object, it copies the data to a given matrix.
---
--- This is measurably faster when accessing bone matrices a lot.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:CopyBoneMatrix
---@param boneID number The bone ID to retrieve matrix of, starting at index 0.
---@param data VMatrix The matrix to copy the bone matrix to.
function Entity:CopyBoneMatrix(boneID, data) end

---Creates bone followers based on the current entity model.
---
--- Bone followers are [Entities](https://wiki.facepunch.com/gmod/Entity) whose [Physics Object](https://wiki.facepunch.com/gmod/PhysObj) follows a specific bone on another Entity's model.
--- This is what is used by `prop_dynamic` for things like big combine doors for vehicles with multiple physics objects which follow the visual mesh of the door when it animates.
---
--- Be mindful that bone followers create a separate entity (`phys_bone_follower`) for each physics object.
---
--- You must call [Entity:UpdateBoneFollowers](https://wiki.facepunch.com/gmod/Entity:UpdateBoneFollowers) every tick for bone followers to update their positions.
---
--- **NOTE**: This function only works on `anim`, `nextbot` and `ai` type entities.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:CreateBoneFollowers
---@param bone_whitelist? table If set, a whitelist of bone names to create bone followers for. If a models' bone name is not in this list, a bone follower entity will not be created for it.
function Entity:CreateBoneFollowers(bone_whitelist) end

---Returns whether the entity was created by map or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:CreatedByMap
---@return boolean # Is created by map?
function Entity:CreatedByMap() end

---Creates a clientside particle system attached to the entity. See also [Global.CreateParticleSystem](https://wiki.facepunch.com/gmod/Global.CreateParticleSystem)
---
--- **NOTE**: The particle effect must be precached with [Global.PrecacheParticleSystem](https://wiki.facepunch.com/gmod/Global.PrecacheParticleSystem) and the file its from must be added via [game.AddParticles](https://wiki.facepunch.com/gmod/game.AddParticles) before it can be used!
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:CreateParticleEffect
---@param particle string The particle name to create
---@param attachment number Attachment ID to attach the particle to
---@param options? table A table of tables ( IDs 1 to 64 ) having the following structure:
--- * number attachtype - The particle attach type. See Enums/PATTACH. **Default:** PATTACH_ABSORIGIN
--- * Entity entity - The parent entity? **Default:** NULL
--- * Vector position - The offset position for given control point. **Default:**  nil
---
--- This only affects the control points of the particle effects and will do nothing if the effect doesn't use control points.
---@return CNewParticleEffect # The created particle system.
function Entity:CreateParticleEffect(particle, attachment, options) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Called just before [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) for "ai" type entities only.
---@hook CreateSchedulesInternal
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:CreateSchedulesInternal
function Entity:CreateSchedulesInternal() end

---Draws the shadow of an entity.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:CreateShadow
function Entity:CreateShadow() end

---Whenever the entity is removed, entityToRemove will be removed also.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:DeleteOnRemove
---@param entityToRemove Entity The entity to be removed
function Entity:DeleteOnRemove(entityToRemove) end

---Destroys bone followers created by [Entity:CreateBoneFollowers](https://wiki.facepunch.com/gmod/Entity:CreateBoneFollowers).
---
--- **NOTE**: This function only works on `anim` type entities.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:DestroyBoneFollowers
function Entity:DestroyBoneFollowers() end

---Removes the shadow for the entity.
---
--- The shadow will be recreated as soon as the entity wakes.
---
--- **NOTE**: Doesn't affect shadows from flashlight/lamps/env_projectedtexture.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:DestroyShadow
function Entity:DestroyShadow() end

---Disables an active matrix. See [Entity:EnableMatrix](https://wiki.facepunch.com/gmod/Entity:EnableMatrix) for more info about active matrixes.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:DisableMatrix
---@param matrixType string The name of the matrix type to disable.
---
--- Currently the only matrix type is `"RenderMultiply"`.
function Entity:DisableMatrix(matrixType) end

---Performs a trace attack towards the entity this function is called on, as if an invisible bullet is shot towards it. Visually identical to [Entity:TakeDamageInfo](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo).
--- **WARNING**: Calling this function on the victim entity in [ENTITY:OnTakeDamage](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage) can cause infinite loops.
---
--- **NOTE**: This function correctly applies damage to [func_breakable_surf](https://developer.valvesoftware.com/wiki/Func_breakable_surf) entities, unlike [Entity:TakeDamageInfo](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:DispatchTraceAttack
---@param damageInfo CTakeDamageInfo The damage to apply.
---@param traceRes TraceResult Trace result to use to deal damage. See Structures/TraceResult
---@param dir? Vector Direction of the attack.
function Entity:DispatchTraceAttack(damageInfo, traceRes, dir) end

---Dissolves the entity.
---
--- This function creates an `env_entity_dissolver` entity internally, which is parented to the target entity and remains until the entity is fully dissolved. Calling this function on an entity that is already dissolving will not create another `env_entity_dissolver` entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Dissolve
---@param type? number Dissolve type. Should be one of the following values:
---
--- | ID | Description |
--- |||
--- | 0 | ENTITY_DISSOLVE_NORMAL |
--- | 1 | ELECTRICAL|
--- | 2 | ELECTRICAL_LIGHT |
--- | 3 | ENTITY_DISSOLVE_CORE |
---@param magnitude? number Magnitude of the dissolve effect, its effect depends on the dissolve type.
---@param origin? Vector The origin for the dissolve effect, its effect depends on the dissolve type. Defaults to entity's origin.
---@param delay? number Delay until starting the dissolve, in seconds. There will be some particles produced during this time.
function Entity:Dissolve(type, magnitude, origin, delay) end

---Called so the entity can override the bullet impact effects it makes. This is called when the entity itself fires bullets via [Entity:FireBullets](https://wiki.facepunch.com/gmod/Entity:FireBullets), not when it gets hit.
---
--- **NOTE**: This hook only works for the `anim` type entities.
---@hook DoImpactEffect
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:DoImpactEffect
---@param tr TraceResult A Structures/TraceResult from the bullet's start point to the impact point
---@param damageType number The damage type of bullet. See Enums/DMG
---@return boolean # Return true to not do the default thing - which is to call `UTIL_ImpactTrace` in C++
function Entity:DoImpactEffect(tr, damageType) end

---Called by the default `base_ai` SNPC, checking whether `ENT.bDoingEngineSchedule` is set by [ENTITY:StartEngineSchedule](https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule)..
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook DoingEngineSchedule
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:DoingEngineSchedule
---@return boolean #
function Entity:DoingEngineSchedule() end

---This removes the argument entity from an ent's list of entities to 'delete on remove'
--- 	**NOTE**: Also see [Entity:DeleteOnRemove](https://wiki.facepunch.com/gmod/Entity:DeleteOnRemove)
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:DontDeleteOnRemove
---@param entityToUnremove Entity The entity to be removed from the list of entities to delete
function Entity:DontDeleteOnRemove(entityToUnremove) end

---Runs a Lua schedule. Runs tasks inside the schedule.
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook DoSchedule
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:DoSchedule
---@param sched table The schedule to run.
function Entity:DoSchedule(sched) end

---Called if and when the entity should be drawn opaquely, based on the [Entity:GetRenderGroup](https://wiki.facepunch.com/gmod/Entity:GetRenderGroup) of the entity.
---
--- See [Structures/ENT](https://wiki.facepunch.com/gmod/Structures/ENT) and [Enums/RENDERGROUP](https://wiki.facepunch.com/gmod/Enums/RENDERGROUP) for more information.
---
--- See also [ENTITY:DrawTranslucent](https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent).
---
--- **NOTE**: This function will not called if the entity's render bounds are not in player's view. See [Entity:SetRenderBounds](https://wiki.facepunch.com/gmod/Entity:SetRenderBounds).
---@hook Draw
---@realm client
---@source https://wiki.facepunch.com/gmod/ENTITY:Draw
---@param flags number The bit flags from Enums/STUDIO
function Entity:Draw(flags) end

---Draws the entity or model.
---
--- If called inside [ENTITY:Draw](https://wiki.facepunch.com/gmod/ENTITY:Draw) or [ENTITY:DrawTranslucent](https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent), it only draws the entity's model itself.
---
--- If called outside of those hooks, it will call both of said hooks depending on [Entity:GetRenderGroup](https://wiki.facepunch.com/gmod/Entity:GetRenderGroup), drawing the entire entity again.
---
--- When drawing an entity more than once per frame in different positions, you should call [Entity:SetupBones](https://wiki.facepunch.com/gmod/Entity:SetupBones) before each draw; Otherwise, the entity will retain its first drawn position.
---
--- Calling this on entities with [EF_BONEMERGE](https://wiki.facepunch.com/gmod/Enums/EF) and [EF_NODRAW](https://wiki.facepunch.com/gmod/Enums/EF) applied causes a crash.
---
--- Using this with a map model ([game.GetWorld](https://wiki.facepunch.com/gmod/game.GetWorld)():[GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel)()) crashes the game.
---
--- Calling this on a player during that player's [GM:PrePlayerDraw](https://wiki.facepunch.com/gmod/GM:PrePlayerDraw) hook call will cause infinite recursion and crash the game.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:DrawModel
---@param flags? number The optional Enums/STUDIO flags, usually taken from ENTITY:Draw and similar hooks.
function Entity:DrawModel(flags) end

---Sets whether an entity's shadow should be drawn.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:DrawShadow
---@param shouldDraw boolean True to enable, false to disable shadow drawing.
function Entity:DrawShadow(shouldDraw) end

---Called when the entity should be drawn translucently. If your scripted entity has a translucent model, it will be invisible unless it is drawn here.
---
--- See [ENTITY:Draw](https://wiki.facepunch.com/gmod/ENTITY:Draw) for the opaque rendering alternative to this hook.
---@hook DrawTranslucent
---@realm client
---@source https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent
---@param flags number The bit flags from Enums/STUDIO
function Entity:DrawTranslucent(flags) end

---Move an entity down until it collides with something.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:DropToFloor
---@param mask? number Trace mask.
---@param ignoreEnt? Entity Trace ignore entity.
---@param maxDist? number Max trace dist.
function Entity:DropToFloor(mask, ignoreEnt, maxDist) end

---**INTERNAL**: You should use [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) instead
---
--- Sets up a self.dt.NAME alias for a Data Table variable.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:DTVar
---@overload fun(type: string, name: string)
---@param type string The type of the DTVar being set up. Supported choices:
---
--- * `String` (up to 511 characters)
--- * `Bool`
--- * `Float`
--- * `Int` (32-bit signed integer)
--- * `Vector`
--- * `Angle`
--- * `Entity`
---@param slot number The ID of the DTVar. Can be between `0` and `3` for strings, `0` and `31` for everything else.
---
--- This can be omitted entirely (arguments will shift) and it will use the next available slot.
---@param name string Name by which you will refer to DTVar. It must be a valid variable name. (No spaces!)
function Entity:DTVar(type, slot, name) end

---Plays a sound on an entity. See also [Global.EmitSound](https://wiki.facepunch.com/gmod/Global.EmitSound) if you wish to play sounds without an entity.
---
--- If run clientside, the sound will only be heard locally.
--- If used on a player or NPC character with the mouth rigged, the character will "lip-sync" if the sound file contains lipsync data. See [this page](https://developer.valvesoftware.com/wiki/Choreography_creation/Lip_syncing) for more information.
---
--- **NOTE**: When using this function with weapons, use the [Weapon](https://wiki.facepunch.com/gmod/Weapon) itself as the entity, not its owner!
---
--- **WARNING**: Due to engine quirks, [sound scripts](https://developer.valvesoftware.com/wiki/Soundscripts) can't have their soundlevel, pitch, volume, or channel changed when played from an entity—the sound script parameters will override whatever you pass to this function.
---
--- You can do one of these instead:
--- * Use [sound.GetProperties](https://wiki.facepunch.com/gmod/sound.GetProperties) to select a sound from the script, and play the sound file directly.
--- * For single-use sounds, you can pass the [SND_CHANGE_VOL](https://wiki.facepunch.com/gmod/Enums/SND) or [SND_CHANGE_PITCH](https://wiki.facepunch.com/gmod/Enums/SND) sound flags. However, this will change the volume or pitch of the sound if it's already playing, instead of starting the sound over or playing another instance.
--- * Use [Global.EmitSound](https://wiki.facepunch.com/gmod/Global.EmitSound) with the entity parameter set to the [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex) of the entity you want to play the sound on.
---
--- This does not respond to [Global.SuppressHostEvents](https://wiki.facepunch.com/gmod/Global.SuppressHostEvents).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:EmitSound
---@param soundName string The name of the sound to be played.
---
--- This should either be a sound script name (sound.Add) or a file path relative to the `sound/` folder. (so don't include `sound/`, and make note that it's not sound**s** when moving the sound file itself)
---
--- The string cannot have whitespace at the start or end. You can remove this with [string.Trim](https://wiki.facepunch.com/gmod/string.Trim).
---@param soundLevel? number A modifier for the distance this sound will reach, acceptable range is 0 to 511. 100 means no adjustment to the level. See Enums/SNDLVL
---@param pitchPercent? number The pitch applied to the sound. The acceptable range is from 0 to 255. 100 means the pitch is not changed.
---@param volume? number The volume, from 0 to 1.
---@param channel? number The sound channel, see Enums/CHAN.
---@param soundFlags? number The flags of the sound, see Enums/SND
---@param dsp? number The DSP preset for this sound. DSP_Presets
---@param filter? CRecipientFilter If set serverside, the sound will only be networked to the clients in the filter.
function Entity:EmitSound(soundName, soundLevel, pitchPercent, volume, channel, soundFlags, dsp, filter) end

---Toggles the constraints of this ragdoll entity on and off.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:EnableConstraints
---@param toggleConstraints boolean Set to true to enable the constraints and false to disable them.
---
--- Disabling constraints will delete the constraints.
function Entity:EnableConstraints(toggleConstraints) end

---Flags an entity as using custom lua defined collisions. Fixes entities having spongy player collisions or not hitting traces, such as after [Entity:PhysicsFromMesh](https://wiki.facepunch.com/gmod/Entity:PhysicsFromMesh)
---
--- Internally identical to `Entity:AddSolidFlags( bit.bor( FSOLID_CUSTOMRAYTEST, FSOLID_CUSTOMBOXTEST ) )`
---
--- Do not confuse this function with [Entity:SetCustomCollisionCheck](https://wiki.facepunch.com/gmod/Entity:SetCustomCollisionCheck), they are not the same.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:EnableCustomCollisions
function Entity:EnableCustomCollisions() end

---Can be used to apply a custom [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) to the entity, mostly used for scaling the model by a [Vector](https://wiki.facepunch.com/gmod/Vector).
---
--- To disable it, use [Entity:DisableMatrix](https://wiki.facepunch.com/gmod/Entity:DisableMatrix).
---
--- If your old scales are wrong due to a recent update, use [Entity:SetLegacyTransform](https://wiki.facepunch.com/gmod/Entity:SetLegacyTransform) as a quick fix.
---
--- **NOTE**: The matrix can also be modified to apply a custom rotation and offset via the [VMatrix:SetAngles](https://wiki.facepunch.com/gmod/VMatrix:SetAngles) and [VMatrix:SetTranslation](https://wiki.facepunch.com/gmod/VMatrix:SetTranslation) functions.
---
--- This does not scale procedural bones, and disables inverse kinematics of the entity.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:EnableMatrix
---@param matrixType string The name of the matrix type.
--- Currently the only matrix type is `"RenderMultiply"`.
---@param matrix VMatrix The matrix to apply before drawing the entity.
function Entity:EnableMatrix(matrixType, matrix) end

---Called when the entity stops touching another entity.
---
--- See [ENTITY:StartTouch](https://wiki.facepunch.com/gmod/ENTITY:StartTouch) and [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch) for related hooks.
---
--- **WARNING**: This only works for **brush** entities and for entities that have [Entity:SetTrigger](https://wiki.facepunch.com/gmod/Entity:SetTrigger) set to true.
---@hook EndTouch
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:EndTouch
---@param entity Entity The entity that we no longer touch.
function Entity:EndTouch(entity) end

---Called whenever an engine schedule is finished; either the last task within the engine schedule has been finished or the schedule has been interrupted by an interrupt condition.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
--- **NOTE**: This hook isn't called when the engine schedule is failed, the schedule is cleared with [NPC:ClearSchedule](https://wiki.facepunch.com/gmod/NPC:ClearSchedule) or [NPC:SetSchedule](https://wiki.facepunch.com/gmod/NPC:SetSchedule) has been called.
---@hook EngineScheduleFinish
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:EngineScheduleFinish
function Entity:EngineScheduleFinish() end

---Gets the unique entity index of an entity.
---
--- **NOTE**: Entity indices are marked as unused after deletion, and can be reused by newly-created entities
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:EntIndex
---@return number # The index of the entity.
---
--- `-1` for clientside-only or `0` for serverside-only and NULL entities.
function Entity:EntIndex() end

---Called when an NPC's expression has finished.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook ExpressionFinished
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:ExpressionFinished
---@param strExp string The path of the expression.
function Entity:ExpressionFinished(strExp) end

---Extinguishes the entity if it is on fire.
---
--- Has no effect if called inside [GM:EntityTakeDamage](https://wiki.facepunch.com/gmod/GM:EntityTakeDamage) (and the attacker is the flame that's hurting the entity)
---
--- See also [Entity:Ignite](https://wiki.facepunch.com/gmod/Entity:Ignite).
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Extinguish
function Entity:Extinguish() end

---Returns the direction a player, npc or ragdoll is looking as a world-oriented angle.
---
--- This can return an incorrect value in vehicles (like pods, buggy, ...). **This bug has been fixed in the past but was causing many addons being broken, so the fix has been removed but applied to [Player:GetAimVector](https://wiki.facepunch.com/gmod/Player:GetAimVector) only**.
---
--- This may return local angles in jeeps when used with [Player:EnterVehicle](https://wiki.facepunch.com/gmod/Player:EnterVehicle). **A workaround is available in the second example.**
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:EyeAngles
---@return Angle # Player's eye angle.
function Entity:EyeAngles() end

---Returns the position of an Player/NPC's view.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:EyePos
---@return Vector # View position of the entity.
function Entity:EyePos() end

---Searches the [Entity's](https://wiki.facepunch.com/gmod/Entity) model for a Body Group with a given name.
--- **NOTE**: Weapons will return results from their viewmodels.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:FindBodygroupByName
---@param name string The name to search for.
---@return number # The Structures/BodyGroupData#id or `-1` if no Body Group has the provided name.
function Entity:FindBodygroupByName(name) end

---Searches the currently active layers for a layer playing animation with given activity.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:FindGestureLayer
---@param activity ACT The activity to search for.
---@return number # A layer ID for given activity, or `-1` if not found.
function Entity:FindGestureLayer(activity) end

---Searches the currently active layers for a layer playing animation with given sequence.
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:FindGestureSequenceLayer
---@param sequenceID number The sequence ID to search for. See Entity:LookupSequence.
---@return number # A layer ID for given sequence, or `-1` if not found.
function Entity:FindGestureSequenceLayer(sequenceID) end

---Returns a transition from the given start and end sequence.
---
--- This function was only used by HL1 entities and NPCs, before the advent of sequence blending and gestures.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:FindTransitionSequence
---@param currentSequence number The currently playing sequence
---@param goalSequence number The goal sequence.
---@return number # The transition sequence, -1 if not available.
function Entity:FindTransitionSequence(currentSequence, goalSequence) end

---Fires an entity's input, conforming to the map IO event queue system. You can find inputs for most entities on the [Valve Developer Wiki](https://developer.valvesoftware.com/wiki/Output)
---
--- See also [Entity:Input](https://wiki.facepunch.com/gmod/Entity:Input) for a function that bypasses the event queue and [GM:AcceptInput](https://wiki.facepunch.com/gmod/GM:AcceptInput).
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Fire
---@param input string The name of the input to fire
---@param param? string|number|boolean The value to give to the input, can also be a number or a boolean.
---@param delay? number Delay in seconds before firing
---@param activator? Entity The entity that caused this input (i.e. the player who pushed a button)
---@param caller? Entity The entity that is triggering this input (i.e. the button that was pushed)
function Entity:Fire(input, param, delay, activator, caller) end

---Called before firing clientside animation events, such as muzzle flashes or shell ejections.
---
--- See [ENTITY:HandleAnimEvent](https://wiki.facepunch.com/gmod/ENTITY:HandleAnimEvent) for the serverside version.
---
--- **NOTE**: This hook only works on "anim", "nextbot" and "ai" type entities.
---@hook FireAnimationEvent
---@realm client
---@source https://wiki.facepunch.com/gmod/ENTITY:FireAnimationEvent
---@param pos Vector Position of the effect
---@param ang Angle Angle of the effect
---@param event number The event ID of happened even. See [this page](http://developer.valvesoftware.com/wiki/Animation_Events). Only event IDs above 5000 will appear in this hook. (Are considered the "new" system in-engine)
---@param name string Name of the event
---@return boolean # Return true to disable the effect
function Entity:FireAnimationEvent(pos, ang, event, name) end

---Fires a bullet.
---
--- When used in a  hook such as [WEAPON:Think](https://wiki.facepunch.com/gmod/WEAPON:Think) or [WEAPON:PrimaryAttack](https://wiki.facepunch.com/gmod/WEAPON:PrimaryAttack), it will use [Player:LagCompensation](https://wiki.facepunch.com/gmod/Player:LagCompensation) internally.
---
--- Lag compensation will not work if this function is called in a timer, regardless if the timer was made in a predicted hook.
---
--- Due to how `Entity:FireBullets` is set up internally, bullet tracers will always originate from the first attachment/index 1. This can be avoided by supplying your own tracer effect.
---
--- When firing bullets from a [Weapon](https://wiki.facepunch.com/gmod/Weapon), it is recommended to fire bullets from the weapon owner entity ([Player](https://wiki.facepunch.com/gmod/Player) or [NPC](https://wiki.facepunch.com/gmod/NPC)), not the [Weapon](https://wiki.facepunch.com/gmod/Weapon) itself.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:FireBullets
---@param bulletInfo Bullet The bullet data to be used. See the Structures/Bullet.
---@param suppressHostEvents? boolean Has the effect of encasing the FireBullets call in Global.SuppressHostEvents, only works in multiplayer.
function Entity:FireBullets(bulletInfo, suppressHostEvents) end

---Makes an entity follow another entity's bone.
---
--- Internally this function calls [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent)( parent, boneid ), [Entity:AddEffects](https://wiki.facepunch.com/gmod/Entity:AddEffects)( EF_FOLLOWBONE
---  ) and sets an internal flag to always rebuild all bones.
--- **NOTE**: If the entity vibrates or stops following the parent, you probably need to run [Entity:SetPredictable](https://wiki.facepunch.com/gmod/Entity:SetPredictable)( true ) clientside.
---
--- **WARNING**: This function will not work if the target bone's parent bone is invalid or if the bone is not used by VERTEX LOD0
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:FollowBone
---@param parent? Entity The entity to follow the bone of. If unset, removes the FollowBone effect.
---@param boneid number The bone to follow
function Entity:FollowBone(parent, boneid) end

---Forces the entity to be dropped, if it is being held by a player's Gravity Gun, Physics Gun or `+use` pickup.
---
--- See also [Player:DropObject](https://wiki.facepunch.com/gmod/Player:DropObject).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ForcePlayerDrop
function Entity:ForcePlayerDrop() end

---Advances the cycle of an animated entity.
---
--- Animations that loop will automatically reset the cycle so you don't have to - ones that do not will stop animating once you reach the end of their sequence.
---
--- **WARNING**: Do not call this function multiple times a frame, as it can cause unexpected results, such as animations playing at increased rate, etc.
---
--- [NextBot:BodyMoveXY](https://wiki.facepunch.com/gmod/NextBot:BodyMoveXY) calls this internally, so do not call this function before or after [NextBot:BodyMoveXY](https://wiki.facepunch.com/gmod/NextBot:BodyMoveXY).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:FrameAdvance
function Entity:FrameAdvance() end

---Returns the entity's velocity.
---
--- **NOTE**: Actually binds to CBaseEntity::GetLocalVelocity() which retrieves the velocity of the entity due to its movement in the world from forces such as gravity. Does not include velocity from entity-on-entity collision.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetAbsVelocity
---@return Vector # The velocity of the entity.
function Entity:GetAbsVelocity() end

---Gets the angles of given entity.
---
--- This returns incorrect results for the local player clientside.
---
--- This will return the local player's [Global.EyeAngles](https://wiki.facepunch.com/gmod/Global.EyeAngles) in [rendering hooks](https://wiki.facepunch.com/gmod/3D_Rendering_Hooks).
---
--- This will return [Global.Angle](https://wiki.facepunch.com/gmod/Global.Angle)(0,0,0) in [rendering hooks](https://wiki.facepunch.com/gmod/3D_Rendering_Hooks) while paused in single-player.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetAngles
---@return Angle # The angles of the entity.
function Entity:GetAngles() end

---Returns the amount of animations (not to be confused with sequences) the entity's model has. A sequence can consist of multiple animations.
---
--- See also [Entity:GetAnimInfo](https://wiki.facepunch.com/gmod/Entity:GetAnimInfo)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetAnimCount
---@return number # The amount of animations the entity's model has.
function Entity:GetAnimCount() end

---Returns a table containing the number of frames, flags, name, and FPS of an entity's animation ID.
---
--- **NOTE**: Animation ID is not the same as sequence ID. See [Entity:GetAnimCount](https://wiki.facepunch.com/gmod/Entity:GetAnimCount)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetAnimInfo
---@param animIndex number The animation ID to look up, starting at 0.
---@return table|nil # Information about the animation, or `nil` if the index is out of bounds.
---
--- A table with the following keys:
--- * string label - Animation name
--- * number fps - How many frames per second the animation should be played at
--- * number flags - [STUDIO_](https://github.com/ZeqMacaw/Crowbar/blob/0d46f3b6a694b74453db407c72c12a9685d8eb1d/Crowbar/Core/GameModel/SourceCommon/SourceMdlFileData/SourceMdlAnimationDesc.vb#L181) flags, such as looping
--- * number numframes - Number of frames the animation has
function Entity:GetAnimInfo(animIndex) end

---Returns the last time the entity had an animation update. Returns 0 if the entity doesn't animate.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:GetAnimTime
---@return number # The last time the entity had an animation update.
function Entity:GetAnimTime() end

---Returns the amount of time since last animation.
---
--- Works only on `CBaseAnimating` entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetAnimTimeInterval
---@return number # The amount of time since last animation.
function Entity:GetAnimTimeInterval() end

---Gets the orientation and position of the attachment by its ID, returns nothing if the attachment does not exist.
---
--- **NOTE**: The update rate of this function is limited by the setting of ENT.AutomaticFrameAdvance for [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities)!
---
--- This will return improper values for viewmodels if used in [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetAttachment
---@param attachmentId number The internal ID of the attachment.
---@return AngPos # The table with angle and position of the attachment or `nil` if does not exist. See the Structures/AngPos. Most notably, the table contains the keys `Ang` and `Pos` as well as `Bone`.
function Entity:GetAttachment(attachmentId) end

---Returns a table containing all attachments of the given entity's model.
---
--- This can have inconsistent results in single-player.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetAttachments
---@return table # Attachment data. See Structures/AttachmentData.
---
--- Returns an empty table in case its model has no attachments or there's a some kind of other issue.
function Entity:GetAttachments() end

---Called to determine how good an NPC is at using a particular weapon.
---
--- **NOTE**: "ai" base only
---@hook GetAttackSpread
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:GetAttackSpread
---@param wep Weapon The weapon being used by the NPC.
---@param target NPC The target the NPC is attacking
---@return number # The number of degrees of inaccuracy in the NPC's attack.
function Entity:GetAttackSpread(wep, target) end

---Returns the entity's base velocity which is their velocity due to forces applied by other entities. This includes entity-on-entity collision or riding a treadmill.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBaseVelocity
---@return Vector # The base velocity of the entity.
function Entity:GetBaseVelocity() end

---Returns the blood color of this entity. This can be set with [Entity:SetBloodColor](https://wiki.facepunch.com/gmod/Entity:SetBloodColor).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBloodColor
---@return BLOOD_COLOR # Color from Enums/BLOOD_COLOR or nil
function Entity:GetBloodColor() end

---Returns the [Sub Model ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#submodels) for the currently active [Sub Model](https://wiki.facepunch.com/gmod/Entity:GetSubModels) of the Body Group corresponding to the given [Body Group ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#id).
---
--- **NOTE**: Weapons will return results from their viewmodels.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBodygroup
---@param bodyGroupId number The Body Group ID to retrieve the active Sub Model ID for.
--- Body Group IDs start at `0`.
---@return number # The currently active Sub Model ID.
--- Sub Model IDs start at `0`.
function Entity:GetBodygroup(bodyGroupId) end

---Returns the number of [Sub Models](https://wiki.facepunch.com/gmod/Entity:GetSubModels) in the Body Group corresponding to a given [Body Group ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#id) of the [Entity's](https://wiki.facepunch.com/gmod/Entity) model.
--- **NOTE**: Weapons will return results from their viewmodels.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBodygroupCount
---@param bodyGroupId number The Body Group ID to retrieve the Sub Model count of.
--- Body Group IDs start at `0`.
---@return number # The number of Sub Models in the Body Group.
function Entity:GetBodygroupCount(bodyGroupId) end

---Retrieves the name of the Body Group corresponding to a given [Body Group ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#id) on the [Entity's](https://wiki.facepunch.com/gmod/Entity) model.
--- **NOTE**: Weapons will return results from their viewmodels.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBodygroupName
---@param bodyGroupId number The Body Group ID to get the name of.
---@return string # The name of the Body Group.
function Entity:GetBodygroupName(bodyGroupId) end

---Returns a list of information about each Body Group present on the [Entity's](https://wiki.facepunch.com/gmod/Entity) model.
--- **NOTE**: Weapons will return results from their viewmodels.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBodyGroups
---@return table # A table of Body Group information where each value is a Structures/BodyGroupData.
function Entity:GetBodyGroups() end

---Returns the contents of the specified bone.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBoneContents
---@param bone number The bone id, starting at index 0. See Entity:LookupBone.
---@return number # The contents as a Enums/CONTENTS or 0 on failure.
function Entity:GetBoneContents(bone) end

---Returns the value of the bone controller with the specified ID.
---
--- **NOTE**: This is the precursor of pose parameters, and only works for Half Life 1: Source models supporting it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBoneController
---@param boneID number ID of the bone controller. Goes from 0 to 3.
---@return number # The value set on the bone controller.
function Entity:GetBoneController(boneID) end

---Returns the amount of bones in the entity.
---
--- **NOTE**: Will return `0` for [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel) or undrawn entities until [Entity:SetupBones](https://wiki.facepunch.com/gmod/Entity:SetupBones) is called on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBoneCount
---@return number # The amount of bones in given entity, starting at index 0.
function Entity:GetBoneCount() end

---Returns the transformation matrix of a given bone on the entity's model. The matrix contains the transformation used to position the bone in the world. It is not relative to the parent bone.
---
--- This is equivalent to constructing a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) using [Entity:GetBonePosition](https://wiki.facepunch.com/gmod/Entity:GetBonePosition).
---
--- See [Entity:CopyBoneMatrix](https://wiki.facepunch.com/gmod/Entity:CopyBoneMatrix) for a more performant version.
---
--- This can return the server's matrix during server lag.
---
--- This can return garbage serverside or a 0,0,0 fourth column (represents position) for v49 models.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBoneMatrix
---@param boneID number The bone ID to retrieve matrix of, starting at index 0.
--- * Bones clientside and serverside will differ
---@return VMatrix # The matrix
---
--- * Some entities don't update animation every frame such as prop_physics and won't have accurate bone matrix.
function Entity:GetBoneMatrix(boneID) end

---Returns name of given bone id.
---
--- 	See [Entity:LookupBone](https://wiki.facepunch.com/gmod/Entity:LookupBone) for the inverse of this function.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBoneName
---@param index number ID of bone to lookup name of, starting at index 0.
---@return string # The name of given bone.
---
--- * `"__INVALIDBONE__"` in case the name cannot be read or the index is out of range, or we failed or entity doesn't have a model.
function Entity:GetBoneName(index) end

---Returns parent bone of given bone.
---
--- **NOTE**: Will return -1 for [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel) until [Entity:SetupBones](https://wiki.facepunch.com/gmod/Entity:SetupBones) is called on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBoneParent
---@param bone number The bone ID of the bone to get parent of, starting at index 0.
---@return number # Parent bone ID or -1 if we failed for some reason.
function Entity:GetBoneParent(bone) end

---Returns the position and angle of the given attachment, relative to the world.
---
--- **WARNING**: This function can return entity's `GetPos()` instead if the entity doesn't have it's bone cache set up.
---
--- To ensure the bone position is correct use this:
--- ```lua
--- local pos = ent:GetBonePosition(0)
--- if pos == ent:GetPos() then
--- 	pos = ent:GetBoneMatrix(0):GetTranslation()
--- end
--- ```
---
--- **NOTE**: This function returns the bone position from the last tick, so if your framerate is higher than the server's tickrate it may appear to lag behind if used on a fast moving entity. You can fix this by using the bone's matrix instead:
--- ```lua
--- local matrix = entity:GetBoneMatrix(0)
--- local pos = matrix:GetTranslation()
--- local ang = matrix:GetAngles()
--- ```
---
--- This can return the server's position during server lag.
---
--- This can return garbage serverside or [Global.Vector](https://wiki.facepunch.com/gmod/Global.Vector)(0,0,0) for v49 models.
---
--- This can return garbage if a trace passed through the target bone during bone matrix access.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBonePosition
---@param boneIndex number The bone index of the bone to get the position of, starting at index 0. See Entity:LookupBone.
---@return Vector # The bone's position relative to the world. It can return nothing if the requested bone is out of bounds, or the entity has no model.
---@return Angle # The bone's angle relative to the world.
function Entity:GetBonePosition(boneIndex) end

---Returns the surface property of the specified bone. See [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData) for more details about what they are.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBoneSurfaceProp
---@param bone number The bone id, starting at index 0. See Entity:LookupBone.
---@return string # The surface property of the bone to be used with util.GetSurfaceIndex or an empty string on failure.
function Entity:GetBoneSurfaceProp(bone) end

---Returns info about given plane of non-nodraw brush model surfaces of the entity's model. Works on worldspawn as well.
---
--- **WARNING**: This only works on entities with brush models.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBrushPlane
---@param id number The index of the plane to get info of. Starts from 0.
---@return Vector # The origin of the plane.
---
--- This will be either the first vertex's position (if available) or the plane's normal multiplied by the plane's distance.
---@return Vector # The normal of the plane.
---@return number # The "distance" of the plane.
---
--- The distance is the dot product of the plane's normal and the point it was initialized with.
function Entity:GetBrushPlane(id) end

---Returns the amount of planes of non-nodraw brush model surfaces of the entity's model.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBrushPlaneCount
---@return number # The amount of brush model planes of the entity's model. This will be 0 for any non-brush model.
function Entity:GetBrushPlaneCount() end

---Returns a table of brushes surfaces for brush model entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetBrushSurfaces
---@return SurfaceInfo[] # A list of SurfaceInfo elements if the entity has a brush model, or `nil` otherwise.
function Entity:GetBrushSurfaces() end

---Returns the specified hook callbacks for this entity added with [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback)
---
--- The callbacks can then be removed with [Entity:RemoveCallback](https://wiki.facepunch.com/gmod/Entity:RemoveCallback).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetCallbacks
---@param hook string The hook to retrieve the callbacks from, see Entity Callbacks for the possible hooks.
---@return table # A table containing the callbackid and function of all the callbacks for the specified hook
function Entity:GetCallbacks(hook) end

---Returns ids of child bones of given bone.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetChildBones
---@param boneid number Bone id to lookup children of
---@return table # A table of bone ids
function Entity:GetChildBones(boneid) end

---Gets the children of the entity - that is, every entity whose move parent is this entity.
---
--- **NOTE**: This function returns [Entity:SetMoveParent](https://wiki.facepunch.com/gmod/Entity:SetMoveParent) children, **NOT** [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent)!
---
--- [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent) however also calls [Entity:SetMoveParent](https://wiki.facepunch.com/gmod/Entity:SetMoveParent).
---
--- This means that some entities in the returned list might have a NULL [Entity:GetParent](https://wiki.facepunch.com/gmod/Entity:GetParent).
---
--- This also means that using this function on players will return their weapons on the client but not the server.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetChildren
---@return Entity[] # A list of movement children entities
function Entity:GetChildren() end

---Returns the classname of a entity. This is often the name of the Lua file or folder containing the files for the entity
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetClass
---@return string # The entity's classname
function Entity:GetClass() end

---Returns an entity's collision bounding box.
---
--- In most cases, this will return the same bounding box as [Entity:GetModelBounds](https://wiki.facepunch.com/gmod/Entity:GetModelBounds) unless the entity does not have a physics mesh or it has a [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) different from the default.
---
--- Collision bounds can be previewed in singleplayer via `ent_bbox` console command, while looking at a desired entity and with `developer 1`. (Will appear as an orange wireframe box)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds
---@return Vector # The minimum vector of the collision bounds, basically Entity:OBBMins.
---@return Vector # The maximum vector of the collision bounds, basically Entity:OBBMaxs.
function Entity:GetCollisionBounds() end

---Returns the entity's collision group
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetCollisionGroup
---@return COLLISION_GROUP # The collision group. See Enums/COLLISION_GROUP
function Entity:GetCollisionGroup() end

---Returns the color the entity is set to.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetColor
---@return Color # The color of the entity as a Color.
function Entity:GetColor() end

---Returns the color the entity is set to without using a color object.
---
--- **INTERNAL**: Internally used to implement [Entity:GetColor](https://wiki.facepunch.com/gmod/Entity:GetColor).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetColor4Part
---@return number #
---@return number #
---@return number #
---@return number #
function Entity:GetColor4Part() end

---Returns the two entities involved in a constraint ent, or nil if the entity is not a constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetConstrainedEntities
---@return Entity # ent1
---@return Entity # ent2
function Entity:GetConstrainedEntities() end

---Returns the two entities physobjects involved in a constraint ent, or no value if the entity is not a constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetConstrainedPhysObjects
---@return PhysObj # phys1
---@return PhysObj # phys2
function Entity:GetConstrainedPhysObjects() end

---Returns entity's creation ID. Unlike [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex) or [Entity:MapCreationID](https://wiki.facepunch.com/gmod/Entity:MapCreationID).
---
--- It will increase up until value of `10 000 000`, at which point it will reset back to `0`.
--- This returns `0` for clientside only entities, such as `class CLuaEffect`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetCreationID
---@return number # The creation ID
function Entity:GetCreationID() end

---Returns the time the entity was created on, relative to [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime).
--- This returns `0` for clientside only entities, such as `class CLuaEffect`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetCreationTime
---@return number # The time the entity was created on.
function Entity:GetCreationTime() end

---Gets the creator of the SENT.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetCreator
---@return Player # The creator, NULL for no creator.
function Entity:GetCreator() end

---Returns whether this entity uses custom collision check set by [Entity:SetCustomCollisionCheck](https://wiki.facepunch.com/gmod/Entity:SetCustomCollisionCheck).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetCustomCollisionCheck
---@return boolean # Whether this entity uses custom collision check or not
function Entity:GetCustomCollisionCheck() end

---Returns the frame of the currently played sequence. This will be a number between 0 and 1 as a representation of sequence progress.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetCycle
---@return number # The frame of the currently played sequence
function Entity:GetCycle() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get an angle stored in the datatable of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetDTAngle
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return Angle # Requested angle.
function Entity:GetDTAngle(key) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get a boolean stored in the datatable of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetDTBool
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return boolean # Requested boolean.
function Entity:GetDTBool(key) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Returns an entity stored in the datatable of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetDTEntity
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return Entity # Requested entity.
function Entity:GetDTEntity(key) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get a float stored in the datatable of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetDTFloat
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return number # Requested float.
function Entity:GetDTFloat(key) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get an integer stored in the datatable of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetDTInt
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return number # 32-bit signed integer
function Entity:GetDTInt(key) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get a string stored in the datatable of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetDTString
---@param key number Goes from 0 to 3.
--- Specifies what key to grab from datatable.
---@return string # Requested string.
function Entity:GetDTString(key) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get a vector stored in the datatable of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetDTVector
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return Vector # Requested vector.
function Entity:GetDTVector(key) end

---Returns internal data about editable [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar)s.
---
--- This is used internally by [DEntityProperties](https://wiki.facepunch.com/gmod/DEntityProperties) and [Editable Entities](https://wiki.facepunch.com/gmod/Editable_Entities) system.
---
--- **NOTE**: This function will only work on entities which had [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) called on them, which is done automatically for players and all [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetEditingData
---@return table # The internal data
function Entity:GetEditingData() end

---Returns a bit flag of all engine effect flags of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetEffects
---@return number # Engine effect flags, see Enums/EF
function Entity:GetEffects() end

---Returns a bit flag of all engine flags of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetEFlags
---@return number # Engine flags, see Enums/EFL
function Entity:GetEFlags() end

---Returns the elasticity of this entity, used by some flying entities such as the Helicopter NPC to determine how much it should bounce around when colliding.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetElasticity
---@return number # elasticity
function Entity:GetElasticity() end

---Returns all flags of given entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFlags
---@return number # Flags of given entity as a bitflag, see Enums/FL
function Entity:GetFlags() end

---Returns acceptable value range for the flex controller, as defined by the model.
---
--- Used with [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFlexBounds
---@param flex number The ID of the flex to look up bounds of
---@return number # The minimum value for this flex
---@return number # The maximum value for this flex
function Entity:GetFlexBounds(flex) end

---Returns the ID of the flex based on the beginning or the entire name.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFlexIDByName
---@param name string The name of the flex to get the ID of. Case sensitive.
---@return number # The ID of flex
--- * `nil` if no flex with given name was found
function Entity:GetFlexIDByName(name) end

---Returns the flex controller name at given index.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFlexName
---@param id number The flex index to look up name of. The range is between `0` and Entity:GetFlexNum - 1.
---@return string # The flex name, or no value if the requested ID is out of bounds.
function Entity:GetFlexName(id) end

---Returns the number of flex controllers this entity's model has.
---
--- **NOTE**: Please note that while this function can return the real number of flex controllers, the game supports only a certain amount due to networking limitations. See [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFlexNum
---@return number # The number of flexes.
function Entity:GetFlexNum() end

---Returns the flex scale of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFlexScale
---@return number # The flex scale
function Entity:GetFlexScale() end

---Returns flex controller type or "category". Used internally by Faceposer to categorize flex controllers.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFlexType
---@param id number The flex index to look up type of. The range is between `0` and Entity:GetFlexNum - 1.
---@return string # The flex type, or no value if the requested ID is out of bounds.
function Entity:GetFlexType(id) end

---Returns current weight ( value ) of given flex controller. Please see [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight) regarding limitations.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFlexWeight
---@param flex number The ID of the flex to get weight of
---@return number # The current weight of the flex, or 0 if out of bounds.
function Entity:GetFlexWeight(flex) end

---Returns the forward vector of the entity, as a normalized direction vector
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetForward
---@return Vector # forwardDir
function Entity:GetForward() end

---Returns the friction modifier for this entity. Entities default to `1` (100%) and can be higher.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetFriction
---@return number # friction
function Entity:GetFriction() end

---Gets the gravity multiplier of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetGravity
---@return number # gravityMultiplier
function Entity:GetGravity() end

---Returns the object the entity is standing on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetGroundEntity
---@return Entity # The ground entity.
function Entity:GetGroundEntity() end

---Returns the entity's ground speed velocity, which is based on the entity's walk/run speed and/or the ground speed of their sequence ( [Entity:GetSequenceGroundSpeed](https://wiki.facepunch.com/gmod/Entity:GetSequenceGroundSpeed) ). Will return an empty [Vector](https://wiki.facepunch.com/gmod/Vector) if the entity isn't moving on the ground.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetGroundSpeedVelocity
---@return Vector # The ground speed velocity.
function Entity:GetGroundSpeedVelocity() end

---Gets the bone the hit box is attached to.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetHitBoxBone
---@param hitbox number The number of the hit box.
---@param hboxset number The number of the hit box set. This should be 0 in most cases.
---
--- Numbering for these sets start from 0. The total amount of sets can be found with Entity:GetHitBoxSetCount.
---@return number # The number of the bone. Will be nil if the hit box index was out of range.
function Entity:GetHitBoxBone(hitbox, hboxset) end

---Gets the bounds (min and max corners) of a hit box.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetHitBoxBounds
---@param hitbox number The number of the hit box.
---@param set number The hitbox set of the hit box. This should be 0 in most cases.
---@return Vector # Hit box mins. Will be nil if the hit box index was out of range.
---@return Vector # Hit box maxs. Will be nil if the hit box index was out of range.
function Entity:GetHitBoxBounds(hitbox, set) end

---Gets how many hit boxes are in a given hit box set.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetHitBoxCount
---@param set number The number of the hit box set.
---@return number # The number of hit boxes.
function Entity:GetHitBoxCount(set) end

---Returns the number of hit box sets that an entity has. Functionally identical to [Entity:GetHitboxSetCount](https://wiki.facepunch.com/gmod/Entity:GetHitboxSetCount)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetHitBoxGroupCount
---@return number # number of hit box sets
---@deprecated You should use Entity:GetHitboxSetCount instead.
function Entity:GetHitBoxGroupCount() end

---Gets the hit group of a given hitbox in a given hitbox set.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetHitBoxHitGroup
---@param hitbox number The number of the hit box.
---@param hitboxset number The number of the hit box set. This should be 0 in most cases.
---
--- Numbering for these sets start from 0. The total group count can be found with Entity:GetHitBoxSetCount.
---@return number # The hitbox group of given hitbox. See Enums/HITGROUP
function Entity:GetHitBoxHitGroup(hitbox, hitboxset) end

---Returns entity's current hit box set
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetHitboxSet
---@return number # The current hit box set id, or no value if the entity doesn't have hit boxes
---@return string # The current hit box set name, or no value if the entity doesn't have hit boxes
function Entity:GetHitboxSet() end

---Returns the amount of hitbox sets in the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetHitboxSetCount
---@return number # The amount of hitbox sets in the entity.
function Entity:GetHitboxSetCount() end

---An interface for accessing internal key values on entities.
---
--- See [Entity:GetSaveTable](https://wiki.facepunch.com/gmod/Entity:GetSaveTable) for a more detailed explanation. See [Entity:SetSaveValue](https://wiki.facepunch.com/gmod/Entity:SetSaveValue) for the opposite of this function.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetInternalVariable
---@param variableName string Name of variable corresponding to an entity save value.
---@return any # The internal variable value.
function Entity:GetInternalVariable(variableName) end

---Returns a table containing Hammer key values the entity has stored. **Not all key values will be accessible this way.** Use [GM:EntityKeyValue](https://wiki.facepunch.com/gmod/GM:EntityKeyValue) or [ENTITY:KeyValue](https://wiki.facepunch.com/gmod/ENTITY:KeyValue) to capture and store every key value.
---
--- Single key values can usually be retrieved with [Entity:GetInternalVariable](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable).
---
--- Here's a list of keyvalues that will not appear in this list, as they are not stored/defined as actual keyvalues internally:
--- * rendercolor - [Entity:GetColor](https://wiki.facepunch.com/gmod/Entity:GetColor) (Only RGB)
--- * rendercolor32 - [Entity:GetColor](https://wiki.facepunch.com/gmod/Entity:GetColor) (RGBA)
--- * renderamt - [Entity:GetColor](https://wiki.facepunch.com/gmod/Entity:GetColor) (Alpha)
--- * disableshadows - [EF_NOSHADOW](https://wiki.facepunch.com/gmod/Enums/EF#EF_NOSHADOW)
--- * mins - [Entity:GetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds)
--- * maxs - [Entity:GetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds)
--- * disablereceiveshadows - [EF_NORECEIVESHADOW](https://wiki.facepunch.com/gmod/Enums/EF#EF_NORECEIVESHADOW)
--- * nodamageforces - [EFL_NO_DAMAGE_FORCES](https://wiki.facepunch.com/gmod/Enums/EFL#EFL_NO_DAMAGE_FORCES)
--- * angle - [Entity:GetAngles](https://wiki.facepunch.com/gmod/Entity:GetAngles)
--- * angles - [Entity:GetAngles](https://wiki.facepunch.com/gmod/Entity:GetAngles)
--- * origin - [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos)
--- * targetname - [Entity:GetName](https://wiki.facepunch.com/gmod/Entity:GetName)
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetKeyValues
---@return table # A table of key values.
function Entity:GetKeyValues() end

---Returns the animation cycle/frame for given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetLayerCycle
---@param layerID number The Layer ID
---@return number # The animation cycle/frame for given layer.
function Entity:GetLayerCycle(layerID) end

---Returns the duration of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetLayerDuration
---@param layerID number The Layer ID
---@return number # The duration of the layer
function Entity:GetLayerDuration(layerID) end

---Returns the layer playback rate. See also [Entity:GetLayerDuration](https://wiki.facepunch.com/gmod/Entity:GetLayerDuration).
--- 	**NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetLayerPlaybackRate
---@param layerID number The Layer ID
---@return number # The current playback rate.
function Entity:GetLayerPlaybackRate(layerID) end

---Returns the sequence id of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetLayerSequence
---@param layerID number The Layer ID.
---@return number # The sequenceID of the layer.
function Entity:GetLayerSequence(layerID) end

---Returns the current weight of the layer. See [Entity:SetLayerWeight](https://wiki.facepunch.com/gmod/Entity:SetLayerWeight) for more information.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetLayerWeight
---@param layerID number The Layer ID
---@return number # The current weight of the layer
function Entity:GetLayerWeight(layerID) end

---Returns the entity that is being used as the light origin position for this entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetLightingOriginEntity
---@return Entity # The lighting entity. This will usually be NULL.
function Entity:GetLightingOriginEntity() end

---Returns the rotation of the entity relative to its parent entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetLocalAngles
---@return Angle # Relative angle
function Entity:GetLocalAngles() end

---Returns the non-VPhysics angular velocity of the entity relative to its parent entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetLocalAngularVelocity
---@return Angle # The velocity
function Entity:GetLocalAngularVelocity() end

---Returns entity's position relative to it's [Entity:GetParent](https://wiki.facepunch.com/gmod/Entity:GetParent).
---
--- See [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos) for the absolute position.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetLocalPos
---@return Vector # Relative position
function Entity:GetLocalPos() end

---Gets the entity's angle manipulation of the given bone. This is relative to the default angle, so the angle is zero when unmodified.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetManipulateBoneAngles
---@param boneID number The bone's ID
---@return Angle # The entity's angle manipulation of the given bone.
function Entity:GetManipulateBoneAngles(boneID) end

---Returns the jiggle amount of the entity's bone.
---
--- See [Entity:ManipulateBoneJiggle](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneJiggle) for more info.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetManipulateBoneJiggle
---@param boneID number The bone ID
---@return number # The jiggle bone type, as set by Entity:ManipulateBoneJiggle.
function Entity:GetManipulateBoneJiggle(boneID) end

---Gets the entity's position manipulation of the given bone. This is relative to the default position, so it is zero when unmodified.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetManipulateBonePosition
---@param boneId number The bone's ID
---@return Vector # The entity's position manipulation of the given bone.
function Entity:GetManipulateBonePosition(boneId) end

---Gets the entity's scale manipulation of the given bone. Normal scale is Vector( 1, 1, 1 )
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetManipulateBoneScale
---@param boneID number The bone's ID
---@return Vector # The entity's scale manipulation of the given bone
function Entity:GetManipulateBoneScale(boneID) end

---Returns the material override for this entity.
---
--- Returns an empty string if no material override exists. Use [Entity:GetMaterials](https://wiki.facepunch.com/gmod/Entity:GetMaterials) to list its default materials.
---
--- The server's value takes priority on the client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetMaterial
---@return string # material
function Entity:GetMaterial() end

---Returns all materials of the entity's model.
---
--- This function is unaffected by [Entity:SetSubMaterial](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial) as it returns the original materials.
---
--- The table returned by this function will not contain materials if they are missing from the disk/repository. This means that if you are attempting to find the ID of a material to replace with [Entity:SetSubMaterial](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial) and there are missing materials on the model, all subsequent materials will be offset in the table, meaning that the ID you are trying to get will be incorrect.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetMaterials
---@return string[] # A table containing full paths to the materials of the model.
---
--- For models, it's limited to `128` materials.
function Entity:GetMaterials() end

---Returns the [surface material type](https://developer.valvesoftware.com/wiki/Material_Types) of this entity.
---
--- This can be approximated clientside via [util.GetModelInfo](https://wiki.facepunch.com/gmod/util.GetModelInfo).
---
--- Internally, all this does is return `gamematerial` of the surface property on the first physics object of the entity. You can do this yourself using [PhysObj:GetMaterial](https://wiki.facepunch.com/gmod/PhysObj:GetMaterial) and [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData).
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetMaterialType
---@return MAT # Surface material type.
function Entity:GetMaterialType() end

---Returns the max health that the entity was given. It can be set via [Entity:SetMaxHealth](https://wiki.facepunch.com/gmod/Entity:SetMaxHealth).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetMaxHealth
---@return number # Max health.
function Entity:GetMaxHealth() end

---Gets the model of given entity.
---
--- This does not necessarily return the model's path, as is the case for brush and virtual models. This is intentional behaviour, however, there is currently no way to retrieve the actual file path.
---
--- This also affects certain models that are edited by 3rd party programs after being compiled.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetModel
---@return string|nil # The entity's model. Will be a filesystem path for most models.
---
--- This is guaranteed to be lower case.
---
--- This will be nil for entities which cannot have models, such as point entities.
function Entity:GetModel() end

---Returns the entity's model bounds, not scaled by [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale).
---
--- These bounds are affected by all the animations the model has at compile time, if they go outside of the models' render bounds at any point.
--- See [Entity:GetModelRenderBounds](https://wiki.facepunch.com/gmod/Entity:GetModelRenderBounds) for just the render bounds of the model.
---
--- This is different than the collision bounds/hull, which are set via [Entity:SetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetModelBounds
---@return Vector # The minimum vector of the bounds
---@return Vector # The maximum vector of the bounds
function Entity:GetModelBounds() end

---Returns the contents of the entity's current model.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetModelContents
---@return number # The contents of the entity's model. See Enums/CONTENTS.
function Entity:GetModelContents() end

---Gets the physics bone count of the entity's model. This is only applicable to `anim` type [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities) with ragdoll models.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:GetModelPhysBoneCount
---@return number # How many physics bones exist on the model.
function Entity:GetModelPhysBoneCount() end

---Gets the models radius.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetModelRadius
---@return number # The radius of the model.
--- This can return [nil](https://wiki.facepunch.com/gmod/nil) instead of a [number](https://wiki.facepunch.com/gmod/number) in some cases.
function Entity:GetModelRadius() end

---Returns the entity's model render bounds. Unlike [Entity:GetModelBounds](https://wiki.facepunch.com/gmod/Entity:GetModelBounds), bounds returning by this function will not be affected by animations (at compile time).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetModelRenderBounds
---@return Vector # The minimum vector of the bounds
---@return Vector # The maximum vector of the bounds
function Entity:GetModelRenderBounds() end

---Gets the selected entity's model scale.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetModelScale
---@return number # Scale of that entity's model.
function Entity:GetModelScale() end

---Returns the amount a momentary_rot_button entity is turned based on the given angle. 0 meaning completely turned closed, 1 meaning completely turned open.
---
--- **WARNING**: This only works on momentary_rot_button entities.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetMomentaryRotButtonPos
---@param turnAngle Angle The angle of rotation to compare - usually should be Entity:GetAngles.
---@return number # The amount the momentary_rot_button is turned, ranging from 0 to 1, or nil if the entity is not a momentary_rot_button.
function Entity:GetMomentaryRotButtonPos(turnAngle) end

---Returns the move collide type of the entity. The move collide is the way a physics object reacts to hitting an object - will it bounce, slide?
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetMoveCollide
---@return number # The move collide type, see Enums/MOVECOLLIDE
function Entity:GetMoveCollide() end

---Returns the movement parent of this entity.
---
--- See [Entity:SetMoveParent](https://wiki.facepunch.com/gmod/Entity:SetMoveParent) for more info.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetMoveParent
---@return Entity # The movement parent of this entity.
function Entity:GetMoveParent() end

---Returns the entity's movetype
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetMoveType
---@return number # Move type. See Enums/MOVETYPE
function Entity:GetMoveType() end

---Returns the "targetname" of this entity, typically used in map making and scripting to uniquely identify and target (hence 'targetname') an entity or a group of entities.
---
--- **WARNING**: For players, this function is overwritten by [Player:GetName](https://wiki.facepunch.com/gmod/Player:GetName), which returns the player's nick name, not the target name.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetName
---@return string # The name of the Entity
function Entity:GetName() end

---Gets networked angles for entity.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkAngles
---@return Angle # angle
function Entity:GetNetworkAngles() end

---Retrieves a networked angle value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Angle
---@generic T
---@overload fun(self: Entity, key: string): Angle # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Angle|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Angle instead.
function Entity:GetNetworked2Angle(key, fallback) end

---Retrieves a networked boolean value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Bool
---@generic T
---@overload fun(self: Entity, key: string): boolean # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return boolean|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Bool instead.
function Entity:GetNetworked2Bool(key, fallback) end

---Retrieves a networked entity value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Entity
---@generic T
---@overload fun(self: Entity, key: string): Entity|NULL # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Entity|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Entity instead.
function Entity:GetNetworked2Entity(key, fallback) end

---Retrieves a networked float value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Float
---@generic T
---@overload fun(self: Entity, key: string): number # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return number|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Float instead.
function Entity:GetNetworked2Float(key, fallback) end

---Retrieves a networked integer value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Int
---@generic T
---@overload fun(self: Entity, key: string): number # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return number|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Int instead.
function Entity:GetNetworked2Int(key, fallback) end

---Retrieves a networked string value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2String
---@generic T
---@overload fun(self: Entity, key: string): string # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return string|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2String instead.
function Entity:GetNetworked2String(key, fallback) end

---Retrieves a networked value at specified index on the entity that is set by [Entity:SetNetworked2Var](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Var).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Var
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2Var instead.
function Entity:GetNetworked2Var(key, fallback) end

---Returns callback function for given NWVar of this entity. Alias of [Entity:GetNW2VarProxy](https://wiki.facepunch.com/gmod/Entity:GetNW2VarProxy)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2VarProxy
---@param key any The key of the NWVar to get callback of.
---@return function # The callback of given NWVar, or nil if not found.
---@deprecated You should be using Entity:GetNW2VarProxy instead.
function Entity:GetNetworked2VarProxy(key) end

---Returns all the networked2 variables in an entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2VarTable
---@return table # Key-Value table of all networked2 variables.
---@deprecated You should be using Entity:GetNW2VarTable instead.
function Entity:GetNetworked2VarTable() end

---Retrieves a networked vector value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworked2Vector
---@generic T
---@overload fun(self: Entity, key: string): Vector # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Vector|T # The value associated with the key
---@deprecated You should be using Entity:GetNW2Vector instead.
function Entity:GetNetworked2Vector(key, fallback) end

---Retrieves a networked angle value at specified index on the entity that is set by [Entity:SetNetworkedAngle](https://wiki.facepunch.com/gmod/Entity:SetNetworkedAngle).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedAngle
---@generic T
---@overload fun(self: Entity, key: string): Angle # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Angle|T # The retrieved value
---@deprecated You should use Entity:GetNWAngle instead.
function Entity:GetNetworkedAngle(key, fallback) end

---Retrieves a networked boolean value at specified index on the entity that is set by [Entity:SetNetworkedBool](https://wiki.facepunch.com/gmod/Entity:SetNetworkedBool).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedBool
---@generic T
---@overload fun(self: Entity, key: string): boolean # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return boolean|T # The retrieved value
---@deprecated You should use Entity:GetNWBool instead.
function Entity:GetNetworkedBool(key, fallback) end

---Retrieves a networked float value at specified index on the entity that is set by [Entity:SetNetworkedEntity](https://wiki.facepunch.com/gmod/Entity:SetNetworkedEntity).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedEntity
---@generic T
---@overload fun(self: Entity, key: string): Entity|NULL # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Entity|T # The retrieved value
---@deprecated You should use Entity:GetNWEntity instead.
function Entity:GetNetworkedEntity(key, fallback) end

---Retrieves a networked float value at specified index on the entity that is set by [Entity:SetNetworkedFloat](https://wiki.facepunch.com/gmod/Entity:SetNetworkedFloat).
---
--- Seems to be the same as [Entity:GetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedFloat
---@generic T
---@overload fun(self: Entity, key: string): number # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return number|T # The retrieved value
---@deprecated You should use Entity:GetNWFloat instead.
function Entity:GetNetworkedFloat(key, fallback) end

---Retrieves a networked integer value at specified index on the entity that is set by [Entity:SetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:SetNetworkedInt).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt
---@generic T
---@overload fun(self: Entity, key: string): number # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return number|T # The retrieved value
---@deprecated You should use Entity:GetNWInt instead.
function Entity:GetNetworkedInt(key, fallback) end

---Retrieves a networked string value at specified index on the entity that is set by [Entity:SetNetworkedString](https://wiki.facepunch.com/gmod/Entity:SetNetworkedString).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedString
---@generic T
---@overload fun(self: Entity, key: string): string # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return string|T # The retrieved value
---@deprecated You should use Entity:GetNWString instead.
function Entity:GetNetworkedString(key, fallback) end

---Retrieves a networked value at specified index on the entity that is set by [Entity:SetNetworkedVar](https://wiki.facepunch.com/gmod/Entity:SetNetworkedVar).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedVar
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNetworkedVar(key, fallback) end

---This function was superseded by [Entity:GetNetworked2VarProxy](https://wiki.facepunch.com/gmod/Entity:GetNetworked2VarProxy). This page still exists an archive in case anybody ever stumbles across old code and needs to know what it is
--- Returns callback function for given NWVar of this entity, previously set by [Entity:SetNWVarProxy](https://wiki.facepunch.com/gmod/Entity:SetNWVarProxy).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedVarProxy
---@param name string The name of the NWVar to get callback of.
---@return fun(ent: Entity, name: string, oldval: any, newval: any) # The callback of given NWVar, if any.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NWVar that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:GetNetworkedVarProxy(name) end

---Returns all the networked variables in an entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedVarTable
---@return table<string,any> # Key-Value table of all networked variables.
---@deprecated You should be using Entity:GetNWVarTable instead.
function Entity:GetNetworkedVarTable() end

---Retrieves a networked vector value at specified index on the entity that is set by [Entity:SetNetworkedVector](https://wiki.facepunch.com/gmod/Entity:SetNetworkedVector).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkedVector
---@generic T
---@overload fun(self: Entity, key: string): Vector # The retrieved value
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Vector|T # The retrieved value
---@deprecated You should use Entity:GetNWVector instead.
function Entity:GetNetworkedVector(key, fallback) end

---Gets networked origin for entity.
--- 		**NOTE**: On the Client, this seems to return the position relative to the parent (if it has one). On the server-side this will return what you expect even if it has a parent.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkOrigin
---@return Vector # The last received origin of the entity.
function Entity:GetNetworkOrigin() end

---Returns all network vars created by [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) and [Entity:NetworkVarElement](https://wiki.facepunch.com/gmod/Entity:NetworkVarElement) and their current values.
---
--- This is used internally by the duplicator. `Entity` type Network vars will not be returned!
---
--- For NWVars see [Entity:GetNWVarTable](https://wiki.facepunch.com/gmod/Entity:GetNWVarTable).
---
--- **NOTE**: This function will only work on entities which had [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) called on them, which is done automatically for players and all [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNetworkVars
---@return table # The Key-Value formatted table of network var names and their current values
function Entity:GetNetworkVars() end

---Returns if the entity's rendering and transmitting has been disabled.
---
--- **NOTE**: This is equivalent to calling [Entity:IsEffectActive](https://wiki.facepunch.com/gmod/Entity:IsEffectActive)( EF_NODRAW )
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNoDraw
---@return boolean # Whether the entity's rendering and transmitting has been disabled.
function Entity:GetNoDraw() end

---Gets the NPC classification. Internally gets the `m_iClass` variable which is polled by the engine. This will be equivalent to [NPC:Classify](https://wiki.facepunch.com/gmod/NPC:Classify).
---
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:GetNPCClass
---@return number # See Enums/CLASS
function Entity:GetNPCClass() end

---Returns the number of Body Groups that the [Entity's](https://wiki.facepunch.com/gmod/Entity) model contains.
---
--- **NOTE**: Weapons will return results from their viewmodels.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNumBodyGroups
---@return number # The amount of Body Groups on the Entity's model.
function Entity:GetNumBodyGroups() end

---Returns the number of pose parameters this entity has.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNumPoseParameters
---@return number # Amount of pose parameters the entity has
function Entity:GetNumPoseParameters() end

---Retrieves a networked angle value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2Angle
---@generic T
---@overload fun(self: Entity, key: string): Angle # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Angle|T # The value associated with the key
function Entity:GetNW2Angle(key, fallback) end

---Retrieves a networked boolean value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2Bool
---@generic T
---@overload fun(self: Entity, key: string): boolean # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return boolean|T # The value associated with the key
function Entity:GetNW2Bool(key, fallback) end

---Retrieves a networked entity value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2Entity
---@generic T
---@overload fun(self: Entity, key: string): Entity|NULL # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Entity|T # The value associated with the key
function Entity:GetNW2Entity(key, fallback) end

---Retrieves a networked float value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2Float
---@generic T
---@overload fun(self: Entity, key: string): number # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return number|T # The value associated with the key
function Entity:GetNW2Float(key, fallback) end

---Retrieves a networked integer value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2Int
---@generic T
---@overload fun(self: Entity, key: string): number # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return number|T # The value associated with the key
function Entity:GetNW2Int(key, fallback) end

---Retrieves a networked string value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2String
---@generic T
---@overload fun(self: Entity, key: string): string # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return string|T # The value associated with the key
function Entity:GetNW2String(key, fallback) end

---Retrieves a networked value at specified index on the entity that is set by [Entity:SetNW2Var](https://wiki.facepunch.com/gmod/Entity:SetNW2Var).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2Var
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNW2Var(key, fallback) end

---Returns callback function for given NWVar of this entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2VarProxy
---@param key any The key of the NWVar to get callback of.
---@return fun(ent: Entity, name: string, oldval: any, newval: any) # The callback of given NWVar, or nil if not found.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NW2Var that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:GetNW2VarProxy(key) end

---Returns all the NW2 variables in an entity.
--- This function will return keys with empty tables if the NW2Var is nil.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2VarTable
---@return table # Key-Value table of all NW2 variables.
function Entity:GetNW2VarTable() end

---Retrieves a networked vector value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNW2Vector
---@generic T
---@overload fun(self: Entity, key: string): Vector # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Vector|T # The value associated with the key
function Entity:GetNW2Vector(key, fallback) end

---Retrieves a networked angle value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWAngle
---@generic T
---@overload fun(self: Entity, key: string): Angle # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Angle|T # The value associated with the key
function Entity:GetNWAngle(key, fallback) end

---Retrieves a networked boolean value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWBool
---@generic T
---@overload fun(self: Entity, key: string): boolean # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return boolean|T # The value associated with the key
function Entity:GetNWBool(key, fallback) end

---Retrieves a networked entity value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWEntity
---@generic T
---@overload fun(self: Entity, key: string): Entity|NULL # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Entity|T # The value associated with the key
function Entity:GetNWEntity(key, fallback) end

---Retrieves a networked float value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWFloat
---@generic T
---@overload fun(self: Entity, key: string): number # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return number|T # The value associated with the key
function Entity:GetNWFloat(key, fallback) end

---Retrieves a networked integer value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWInt
---@generic T
---@overload fun(self: Entity, key: string): number # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return number|T # The value associated with the key
function Entity:GetNWInt(key, fallback) end

---Retrieves a networked string value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWString
---@generic T
---@overload fun(self: Entity, key: string): string # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return string|T # The value associated with the key
function Entity:GetNWString(key, fallback) end

---Returns callback function for given NWVar of this entity, previously set by [Entity:SetNWVarProxy](https://wiki.facepunch.com/gmod/Entity:SetNWVarProxy).
--- This function was superseded by [Entity:GetNW2VarProxy](https://wiki.facepunch.com/gmod/Entity:GetNW2VarProxy). This page still exists an archive in case anybody ever stumbles across old code and needs to know what it is
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWVarProxy
---@param key string The key of the NWVar to get callback of.
---@return fun(ent: Entity, name: string, oldval: any, newval: any) # The callback of given NWVar, or nil if not found.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NWVar that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:GetNWVarProxy(key) end

---Returns all the networked variables in an entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWVarTable
---@return table<string,any> # Key-Value table of all networked variables.
function Entity:GetNWVarTable() end

---Retrieves a networked vector value at specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetNWVector
---@generic T
---@overload fun(self: Entity, key: string): Vector # The value associated with the key
---@param key string The key that is associated with the value
---@param fallback T The value to return if we failed to retrieve the value.
---@return Vector|T # The value associated with the key
function Entity:GetNWVector(key, fallback) end

---Returns the owner entity of this entity. See [Entity:SetOwner](https://wiki.facepunch.com/gmod/Entity:SetOwner) for more info.
---
--- 	**NOTE**: This function is generally used to disable physics interactions on projectiles being fired by their owner, but can also be used for normal ownership in case physics interactions are not involved at all. The Gravity gun will be able to pick up the entity even if the owner can't collide with it, the Physics gun however will not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetOwner
---@return Entity # The owner entity of this entity.
function Entity:GetOwner() end

---Returns the parent entity of this entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetParent
---@return Entity # parentEntity
function Entity:GetParent() end

---Returns the attachment/bone index of the entity's parent. Returns 0 if the entity is not parented to an attachment/bone or if it isn't parented at all.
---
--- This is set by second argument of [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent) or the **SetParentAttachment** input.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetParentAttachment
---@return number # The parented attachment/bone index
--- Will return bone index instead of attachment index if the **EF_FOLLOWBONE** effect is active on the entity. See [Entity:IsEffectActive](https://wiki.facepunch.com/gmod/Entity:IsEffectActive).
function Entity:GetParentAttachment() end

---If the entity is parented to an entity that has a model with multiple physics objects (like a ragdoll), this is used to retrieve what physics object number the entity is parented to on it's parent.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetParentPhysNum
---@return number # The physics object id, or nil if the entity has no parent
function Entity:GetParentPhysNum() end

---Returns the position and angle of the entity's move parent as a 3x4 matrix ([VMatrix](https://wiki.facepunch.com/gmod/VMatrix) is 4x4 so the fourth row goes unused). The first three columns store the angle as a [rotation matrix](https://en.wikipedia.org/wiki/Rotation_matrix), and the fourth column stores the position vector.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetParentWorldTransformMatrix
---@return VMatrix # The position and angle matrix.
---
--- If the entity has no move parent, an identity matrix will be returned.
--- If the entity is Entity:GetParentAttachment 0 or the parent isn't a BaseAnimating entity, the equivalent of Entity:Entity:GetMoveParent:Entity:GetWorldTransformMatrix will be returned.
function Entity:GetParentWorldTransformMatrix() end

---Returns whether the entity is persistent or not.
---
--- See [Entity:SetPersistent](https://wiki.facepunch.com/gmod/Entity:SetPersistent) for more information on persistence.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPersistent
---@return boolean # True if the entity is set to be persistent.
function Entity:GetPersistent() end

---Returns player who is claiming kills of physics damage the entity deals.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetPhysicsAttacker
---@param timeLimit? number The time to check if the entity was still a proper physics attacker.
---
--- Some entities such as the Combine Ball disregard the time limit and always return the physics attacker.
---@return Player # The player. If entity that was set is not a player, it will return NULL entity.
function Entity:GetPhysicsAttacker(timeLimit) end

---Returns the entity's physics object, if the entity has physics. Same as `ent:GetPhysicsObjectNum( 0 )`
---
--- **NOTE**: Entities don't have clientside physics objects by default, so this will return `[NULL PHYSOBJ]` on the client in most cases.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPhysicsObject
---@return PhysObj # The entity's physics object.
function Entity:GetPhysicsObject() end

---Returns the number of physics objects an entity has (usually 1 for non-ragdolls)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPhysicsObjectCount
---@return number # numObjects
function Entity:GetPhysicsObjectCount() end

---Returns a specific physics object from an entity with multiple [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ects (like ragdolls)
---
--- See also [Entity:TranslateBoneToPhysBone](https://wiki.facepunch.com/gmod/Entity:TranslateBoneToPhysBone).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPhysicsObjectNum
---@param physNum number The number corresponding to the PhysObj to grab. Starts at 0.
---@return PhysObj # The physics object or nil if not found
function Entity:GetPhysicsObjectNum(physNum) end

---Returns the playback rate of the main sequence on this entity, with 1.0 being the default speed.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPlaybackRate
---@return number # The playback rate.
function Entity:GetPlaybackRate() end

---Gets the position of given entity in the world.
---
--- See [Entity:GetLocalPos](https://wiki.facepunch.com/gmod/Entity:GetLocalPos) for the position relative to the entity's [Entity:GetParent](https://wiki.facepunch.com/gmod/Entity:GetParent).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPos
---@return Vector # The position of the entity.
function Entity:GetPos() end

---Returns the pose parameter value
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPoseParameter
---@param name string|number Pose parameter name to look up. Can also be a pose parameter ID.
---@return number # Value of given pose parameter.
---
--- This value will be from 0 - 1 on the client and from minimum range to maximum range on the server! You'll have to [remap](https://wiki.facepunch.com/gmod/math.Remap) this value clientside to [Entity:GetPoseParameterRange](https://wiki.facepunch.com/gmod/Entity:GetPoseParameterRange)'s returns if you want get the actual pose parameter value. See [Entity:SetPoseParameter](https://wiki.facepunch.com/gmod/Entity:SetPoseParameter)'s example.
function Entity:GetPoseParameter(name) end

---Returns name of given pose parameter
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPoseParameterName
---@param id number Id of the pose paremeter
---@return string # Name of given pose parameter
function Entity:GetPoseParameterName(id) end

---Returns pose parameter range
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetPoseParameterRange
---@param id number|string Pose parameter ID to look up. Can also be a pose parameter name.
---@return number # The minimum value
---@return number # The maximum value
function Entity:GetPoseParameterRange(id) end

---Returns whether this entity is predictable or not.
---
--- See [Entity:SetPredictable](https://wiki.facepunch.com/gmod/Entity:SetPredictable) for more information
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:GetPredictable
---@return boolean # Whether this entity is predictable or not.
function Entity:GetPredictable() end

---Called to override the preferred carry angles of this object.
---
--- **NOTE**: This callback is only called for `anim` and `ai` type entities. For rest use [GM:GetPreferredCarryAngles](https://wiki.facepunch.com/gmod/GM:GetPreferredCarryAngles).
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:GetPreferredCarryAngles
---@param ply Player The player who is holding the object.
---@return Angle # Return an angle to override the carry angles.
function Entity:GetPreferredCarryAngles(ply) end

---Returns the entity which the ragdoll came from. The opposite of [Player:GetRagdollEntity](https://wiki.facepunch.com/gmod/Player:GetRagdollEntity).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetRagdollOwner
---@return Entity # The entity who owns the ragdoll.
function Entity:GetRagdollOwner() end

---Called when scripted NPC needs to check how he "feels" against another entity, such as when [NPC:Disposition](https://wiki.facepunch.com/gmod/NPC:Disposition) is called.
--- **NOTE**: Scripted NPCs will not select other entities using same [Entity:GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel) as this Scripted NPC's [Entity:GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel) as enemy, unless [NPC:AddEntityRelationship](https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship) is cast.
---@hook GetRelationship
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:GetRelationship
---@param ent Entity The entity in question
---@return D # How our scripter NPC "feels" towards the entity in question. See Enums/D. Not returning any value will make NPC:Disposition return the default disposition for this SNPC's given `m_iClass` by the engine.
function Entity:GetRelationship(ent) end

---Returns the entity's render angles, set by [Entity:SetRenderAngles](https://wiki.facepunch.com/gmod/Entity:SetRenderAngles) in a drawing hook.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:GetRenderAngles
---@return Angle # The entitys render angles
function Entity:GetRenderAngles() end

---Returns render bounds of the entity as local vectors. Can be overridden by [Entity:SetRenderBounds](https://wiki.facepunch.com/gmod/Entity:SetRenderBounds).
---
--- If the render bounds are not inside players view, the entity will not be drawn!
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:GetRenderBounds
---@return Vector # The minimum vector of the bounds
---@return Vector # The maximum vector of the bounds.
function Entity:GetRenderBounds() end

---Returns current render FX of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetRenderFX
---@return number # The current render FX of the entity. See Enums/kRenderFx
function Entity:GetRenderFX() end

---Returns the render group of the entity.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:GetRenderGroup
---@return number # The render group. See Enums/RENDERGROUP
function Entity:GetRenderGroup() end

---Specify a mesh that should be rendered instead of this SENT's model.
--- **NOTE**: You should not be creating or modifying an [IMesh](https://wiki.facepunch.com/gmod/IMesh) in this hook. [Reference](https://github.com/Facepunch/garrysmod-issues/issues/6411#issuecomment-3070608549)
---@hook GetRenderMesh
---@realm client
---@source https://wiki.facepunch.com/gmod/ENTITY:GetRenderMesh
---@return table # A table containing the following keys:
--- * IMesh Mesh - (Required) The mesh to render instead of the default model
--- * IMaterial Material - (Required) The material to render the mesh with.
--- * VMatrix Matrix - (Optional) - Render matrix override (mesh position, angles, etc)
function Entity:GetRenderMesh() end

---Returns the render mode of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetRenderMode
---@return number # The render Mode. See Enums/RENDERMODE
function Entity:GetRenderMode() end

---Returns the entity's render origin, set by [Entity:SetRenderOrigin](https://wiki.facepunch.com/gmod/Entity:SetRenderOrigin) in a drawing hook.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:GetRenderOrigin
---@return Vector # The entitys render origin
function Entity:GetRenderOrigin() end

---Returns the rightward vector of the entity, as a normalized direction vector
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetRight
---@return Vector # rightDir
function Entity:GetRight() end

---Returns axis-aligned bounding box (AABB) of a orientated bounding box (OBB) based on entity's rotation.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetRotatedAABB
---@param min Vector Minimum extent of an OBB in local coordinates.
---@param max Vector Maximum extent of an OBB in local coordinates.
---@return Vector # Minimum extent of the AABB relative to entity's position.
---@return Vector # Maximum extent of the AABB relative to entity's position.
function Entity:GetRotatedAABB(min, max) end

---Returns a table of save values for an entity.
---
--- These tables are not the same between the client and the server, and different entities may have different fields.
---
--- **NOTE**: It is highly recommended to use [Entity:GetInternalVariable](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable) for retrieving a single key of the save table for performance reasons.
---
--- You can get the list different fields an entity has by looking at it's source code (the 2013 SDK can be found [online](https://github.com/ValveSoftware/source-sdk-2013)). Accessible fields are defined by each `DEFINE_FIELD` and `DEFINE_KEYFIELD` inside the `DATADESC` block.
---
--- Take the headcrab, for example:
---
--- ```
--- BEGIN_DATADESC( CBaseHeadcrab )
--- 	// m_nGibCount - don't save
--- 	DEFINE_FIELD( m_bHidden, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_flTimeDrown, FIELD_TIME ),
--- 	DEFINE_FIELD( m_bCommittedToJump, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_vecCommittedJumpPos, FIELD_POSITION_VECTOR ),
--- 	DEFINE_FIELD( m_flNextNPCThink, FIELD_TIME ),
--- 	DEFINE_FIELD( m_flIgnoreWorldCollisionTime, FIELD_TIME ),
---
--- 	DEFINE_KEYFIELD( m_bStartBurrowed, FIELD_BOOLEAN, "startburrowed" ),
--- 	DEFINE_FIELD( m_bBurrowed, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_flBurrowTime, FIELD_TIME ),
--- 	DEFINE_FIELD( m_nContext, FIELD_INTEGER ),
--- 	DEFINE_FIELD( m_bCrawlFromCanister, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_bMidJump, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_nJumpFromCanisterDir, FIELD_INTEGER ),
--- 	DEFINE_FIELD( m_bHangingFromCeiling, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_flIlluminatedTime, FIELD_TIME ),
---
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "Burrow", InputBurrow ),
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "BurrowImmediate", InputBurrowImmediate ),
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "Unburrow", InputUnburrow ),
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "StartHangingFromCeiling", InputStartHangingFromCeiling ),
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "DropFromCeiling", InputDropFromCeiling ),
---
--- 	// Function Pointers
--- 	DEFINE_THINKFUNC( EliminateRollAndPitch ),
--- 	DEFINE_THINKFUNC( ThrowThink ),
--- 	DEFINE_ENTITYFUNC( LeapTouch ),
--- END_DATADESC()
--- ```
---
--- * For each **DEFINE_FIELD**, the save table will have a key with name of **first** argument.
--- * For each **DEFINE_KEYFIELD**, the save table will have a key with name of the **third** argument.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSaveTable
---@param showAll? boolean If set, shows all variables, not just the ones marked for save/load system.
---@return table # A table containing all save values in key/value format.
---
--- The value may be a sequential table (starting with **1**) if the field in question is an array in engine.
function Entity:GetSaveTable(showAll) end

---Return the index of the model sequence that is currently active for the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequence
---@return number # The index of the model sequence.
function Entity:GetSequence() end

---Return activity id out of sequence id. Opposite of [Entity:SelectWeightedSequence](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequence).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceActivity
---@param seq number The sequence ID
---@return number # The activity ID, ie Enums/ACT
function Entity:GetSequenceActivity(seq) end

---Returns the activity name for the given sequence id.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceActivityName
---@param sequenceId number The sequence id.
---@return string # The Enums/ACT as a string, returns "Not Found!" with an invalid sequence and "No model!" when no model is set.
function Entity:GetSequenceActivityName(sequenceId) end

---Returns the amount of sequences ( animations ) the entity's model has.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceCount
---@return number # The amount of sequences ( animations ) the entity's model has.
function Entity:GetSequenceCount() end

---Returns the ground speed of the entity's sequence.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceGroundSpeed
---@param sequenceId number The sequence ID.
---@return number # The ground speed of this sequence.
function Entity:GetSequenceGroundSpeed(sequenceId) end

---Returns a table of information about an entity's sequence.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceInfo
---@param sequenceId number The sequence id of the entity.
---@return table # Table of information about the entity's sequence, or `nil` is ID is out of range. See Structures/SequenceInfo.
function Entity:GetSequenceInfo(sequenceId) end

---Returns a list of all sequences ( animations ) the model has.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceList
---@return table # The list of all sequences ( animations ) the model has. The indices start with 0!
function Entity:GetSequenceList() end

---Returns an entity's sequence move distance (the change in position over the course of the entire sequence).
---
--- See [Entity:GetSequenceMovement](https://wiki.facepunch.com/gmod/Entity:GetSequenceMovement) for a similar function with more options.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceMoveDist
---@param sequenceId number The sequence index.
---@return number # The move distance of the sequence.
function Entity:GetSequenceMoveDist(sequenceId) end

---Returns the delta movement and angles of a sequence of the entity's model.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceMovement
---@param sequenceId number The sequence index. See Entity:LookupSequence.
---@param startCycle? number The sequence start cycle. 0 is the start of the animation, 1 is the end.
---@param endCyclnde? number The sequence end cycle. 0 is the start of the animation, 1 is the end. Values like 2, etc are allowed.
---@return boolean # Whether the operation was successful
---@return Vector # The delta vector of the animation, how much the model's origin point moved.
---@return Angle # The delta angle of the animation.
function Entity:GetSequenceMovement(sequenceId, startCycle, endCyclnde) end

---Returns the change in heading direction in between the start and the end of the sequence.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceMoveYaw
---@param seq number The sequence index. See Entity:LookupSequence.
---@return number # The yaw delta. Returns 99999 for no movement.
function Entity:GetSequenceMoveYaw(seq) end

---Return the name of the sequence for the index provided.
--- Refer to [Entity:GetSequence](https://wiki.facepunch.com/gmod/Entity:GetSequence) to find the current active sequence on this entity.
---
--- See [Entity:LookupSequence](https://wiki.facepunch.com/gmod/Entity:LookupSequence) for a function that does the opposite.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceName
---@param index number The index of the sequence to look up.
---@return string # Name of the sequence, `"Unknown"` if it was out of bounds or `"Not Found!"` if -1 is provided.
function Entity:GetSequenceName(index) end

---Returns an entity's sequence velocity at given animation frame.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSequenceVelocity
---@param sequenceId number The sequence index.
---@param cycle number The point in animation, from `0` to `1`.
---@return Vector # Velocity of the sequence at given point in the animation.
function Entity:GetSequenceVelocity(sequenceId, cycle) end

---Called when the shadow needs to be recomputed. Allows shadow angles to be customized. This only works for `anim` type entities.
---@hook GetShadowCastDirection
---@realm client
---@source https://wiki.facepunch.com/gmod/ENTITY:GetShadowCastDirection
---@param type number Type of the shadow this entity uses. Possible values:
--- * 0 - No shadow
--- * 1 - Simple 'blob' shadow
--- * 2 - Render To Texture shadow (updates only when necessary)
--- * 3 - Dynamic RTT - updates always
--- * 4 - Render to Depth Texture
---@return Vector # The new shadow direction to use.
function Entity:GetShadowCastDirection(type) end

---Checks if the entity plays a sound when picked up by a player.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetShouldPlayPickupSound
---@return boolean # `true` if it plays the pickup sound, `false` otherwise.
function Entity:GetShouldPlayPickupSound() end

---Returns if entity should create a server ragdoll on death or a client one.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetShouldServerRagdoll
---@return boolean # Returns true if ragdoll will be created on server, false if on client
function Entity:GetShouldServerRagdoll() end

---Returns the skin index of the current skin. Can be manipulated via [Entity:SetSkin](https://wiki.facepunch.com/gmod/Entity:SetSkin).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSkin
---@return number # Current skin index.
function Entity:GetSkin() end

---Returns solid type of an entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSolid
---@return number # The solid type. See the Enums/SOLID.
function Entity:GetSolid() end

---Returns solid flag(s) of an entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSolidFlags
---@return FSOLID # The flag(s) of the entity, see Enums/FSOLID.
function Entity:GetSolidFlags() end

---Called every second to poll the sound hint interests of this SNPC. This is used in conjunction with other sound hint functions, such as [sound.EmitHint](https://wiki.facepunch.com/gmod/sound.EmitHint) and [NPC:GetBestSoundHint](https://wiki.facepunch.com/gmod/NPC:GetBestSoundHint).
--- **NOTE**: This hook only exists for `ai` type SENTs
---@hook GetSoundInterests
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:GetSoundInterests
---@return number # A bitflag representing which sound types this NPC wants to react to.  See Enums/SOUND.
function Entity:GetSoundInterests() end

---Returns if we should show a spawn effect on spawn on this entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSpawnEffect
---@return boolean # The flag to allow or disallow the spawn effect.
function Entity:GetSpawnEffect() end

---Returns the bitwise spawn flags used by the entity. These can be set by [Entity:SetKeyValue](https://wiki.facepunch.com/gmod/Entity:SetKeyValue).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSpawnFlags
---@return number # The spawn flags of the entity, see Enums/SF.
function Entity:GetSpawnFlags() end

---Returns the material override for the given index.
---
--- Returns "" if no material override exists. Use [Entity:GetMaterials](https://wiki.facepunch.com/gmod/Entity:GetMaterials) to list it's default materials.
---
--- The server's value takes priority on the client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSubMaterial
---@param index number The index of the sub material. Acceptable values are from 0 to 31.
---@return string # The material that overrides this index, if any.
function Entity:GetSubMaterial(index) end

---Returns a list of models included into the entity's model in the .qc file.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSubModels
---@return table[] # The list of models included into the entity's model in the .qc file.
function Entity:GetSubModels() end

---Returns two vectors representing the minimum and maximum extent of the entity's axis-aligned bounding box for hitbox detection. In most cases, this will return the same bounding box as [Entity:WorldSpaceAABB](https://wiki.facepunch.com/gmod/Entity:WorldSpaceAABB) unless it was changed by [Entity:SetSurroundingBounds](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBounds) or [Entity:SetSurroundingBoundsType](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBoundsType).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetSurroundingBounds
---@return Vector # The minimum vector for the entity's bounding box in world space.
---@return Vector # The maximum vector for the entity's bounding box in world space.
function Entity:GetSurroundingBounds() end

---Returns a [table](https://wiki.facepunch.com/gmod/table) that contains all lua-based key-value pairs saved on the [Entity](https://wiki.facepunch.com/gmod/Entity).
---
--- For retrieving engine-based key-value pairs, see [Entity:GetSaveTable](https://wiki.facepunch.com/gmod/Entity:GetSaveTable)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetTable
---@return table # A table of the lua data stored on the Entity, or `nil` if the Entity is NULL.
function Entity:GetTable() end

---Returns the last trace used in the collision callbacks such as [ENTITY:StartTouch](https://wiki.facepunch.com/gmod/ENTITY:StartTouch), [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch) and [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch).
---
--- **NOTE**: This returns the last collision trace used, regardless of the entity that caused it. As such, it's only reliable when used in the hooks mentioned above
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetTouchTrace
---@return TraceResult # The Structures/TraceResult
function Entity:GetTouchTrace() end

---Returns true if the TransmitWithParent flag is set or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetTransmitWithParent
---@return boolean # Is the TransmitWithParent flag is set or not
function Entity:GetTransmitWithParent() end

---Returns if the entity is unfreezable, meaning it can't be frozen with the physgun. By default props are freezable, so this function will typically return false.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetUnFreezable
---@return boolean # True if the entity is unfreezable, false otherwise.
function Entity:GetUnFreezable() end

---Returns the upward vector of the entity, as a normalized direction vector
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetUp
---@return Vector # upDir
function Entity:GetUp() end

---Retrieves a value from entity's [Entity:GetTable](https://wiki.facepunch.com/gmod/Entity:GetTable). Set by [Entity:SetVar](https://wiki.facepunch.com/gmod/Entity:SetVar).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetVar
---@param key any Key of the value to retrieve
---@param default? any A default value to fallback to if we couldn't retrieve the value from entity
---@return any # Retrieved value
function Entity:GetVar(key, default) end

---Returns the entity's velocity.
---
--- This returns the total velocity of the entity and is equal to local velocity + base velocity.
---
--- Clientside the velocity may be estimated for certain entities, such as physics based entities, instead of returning the "real" velocity from the server.
---
--- This can become out-of-sync on the client if the server has been up for a long time.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetVelocity
---@return Vector # The velocity of the entity.
function Entity:GetVelocity() end

---Returns ID of workshop addon that the entity is from.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:GetWorkshopID
---@return number # The workshop ID
---@deprecated The function **currently** does nothing and always returns nil
function Entity:GetWorkshopID() end

---Returns the position and angle of the entity as a 3x4 matrix ([VMatrix](https://wiki.facepunch.com/gmod/VMatrix) is 4x4 so the fourth row goes unused). The first three columns store the angle as a [rotation matrix](https://en.wikipedia.org/wiki/Rotation_matrix), and the fourth column stores the position vector.
---
--- This returns incorrect results for the angular component (columns 1-3) for the local player clientside.
---
--- This will use the local player's [Global.EyeAngles](https://wiki.facepunch.com/gmod/Global.EyeAngles) in [rendering hooks](https://wiki.facepunch.com/gmod/3D_Rendering_Hooks).
---
--- Columns 1-3 will be all 0 (angular component) in [rendering hooks](https://wiki.facepunch.com/gmod/3D_Rendering_Hooks) while paused in single-player.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GetWorldTransformMatrix
---@return VMatrix # The position and angle matrix.
function Entity:GetWorldTransformMatrix() end

---Causes the entity to break into its current models gibs, if it has any.
---
--- You must call [Entity:PrecacheGibs](https://wiki.facepunch.com/gmod/Entity:PrecacheGibs) on the entity before using this function, or it will not create any gibs.
---
--- If called on server, the gibs will be spawned on the currently connected clients and will not be synchronized. Otherwise the gibs will be spawned only for the client the function is called on.
---
--- **NOTE**: this function will not remove or hide the entity it is called on.
--- 	For more expensive version of this function see [Entity:GibBreakServer](https://wiki.facepunch.com/gmod/Entity:GibBreakServer).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GibBreakClient
---@param force Vector The force to apply to the created gibs.
---@param clr? Color If set, this will be color of the broken gibs instead of the entity's color.
function Entity:GibBreakClient(force, clr) end

---Causes the entity to break into its current models gibs, if it has any.
---
--- You must call [Entity:PrecacheGibs](https://wiki.facepunch.com/gmod/Entity:PrecacheGibs) on the entity before using this function, or it will not create any gibs.
---
--- The gibs will be spawned on the server and be synchronized with all clients.
---
--- Note, that this function will not remove or hide the entity it is called on.
---
--- This function is affected by `props_break_max_pieces_perframe`, `props_break_max_pieces`, `prop_active_gib_limit` and `prop_active_gib_max_fade_time` console variables.
---
--- **WARNING**: Large numbers of serverside gibs will cause lag.
---
--- You can avoid this cost by spawning the gibs on the client using [Entity:GibBreakClient](https://wiki.facepunch.com/gmod/Entity:GibBreakClient)
---
--- **NOTE**: Despite existing on client, it doesn't actually do anything on client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:GibBreakServer
---@param force Vector The force to apply to the created gibs
function Entity:GibBreakServer(force) end

---Called by [GM:GravGunPickupAllowed](https://wiki.facepunch.com/gmod/GM:GravGunPickupAllowed) on ALL entites in Sandbox-derived  gamemodes and acts as an override.
---@hook GravGunPickupAllowed
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:GravGunPickupAllowed
---@param ply Player The player aiming at us
---@return boolean # Return true to allow the entity to be picked up
function Entity:GravGunPickupAllowed(ply) end

---Called when this entity is about to be punted with the gravity gun (primary fire).
---
--- Only works in Sandbox derived gamemodes and only if [GM:GravGunPunt](https://wiki.facepunch.com/gmod/GM:GravGunPunt) is not overridden.
---@hook GravGunPunt
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:GravGunPunt
---@param ply Player The player pressing left-click with the gravity gun at an entity
---@return boolean # Return true or false to enable or disable punting respectively.
function Entity:GravGunPunt(ply) end

---Called before firing serverside animation events, such as weapon reload, drawing and holstering for NPCs, scripted sequences, etc.
---
--- See [ENTITY:FireAnimationEvent](https://wiki.facepunch.com/gmod/ENTITY:FireAnimationEvent) for the clientside version.
---
--- **NOTE**: This hook only works on "anim", "ai" and "nextbot" type entities.
---@hook HandleAnimEvent
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:HandleAnimEvent
---@param event number The ID of the event. See [this page](http://developer.valvesoftware.com/wiki/Animation_Events) for a list of default events, and see util.GetAnimEventNameByID for a helper function in handing custom events.
---@param eventTime number The absolute time this event occurred using Global.CurTime.
---@param cycle number The frame this event occurred as a number between 0 and 1.
---@param type number Event type. See [the Source SDK](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/shared/eventlist.h#L14-L23).
---@param options string Name or options of this event.
---@return boolean # Return true to mark the event as handled.
function Entity:HandleAnimEvent(event, eventTime, cycle, type, options) end

---Returns whether or not the bone manipulation functions have ever been called on given  entity.
---
--- Related functions are [Entity:ManipulateBonePosition](https://wiki.facepunch.com/gmod/Entity:ManipulateBonePosition), [Entity:ManipulateBoneAngles](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneAngles), [Entity:ManipulateBoneJiggle](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneJiggle), and [Entity:ManipulateBoneScale](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneScale).
---
--- This will return true if the entity's bones have ever been manipulated. Resetting the position/angles/jiggle/scaling to 0,0,0 will not affect this function.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:HasBoneManipulations
---@return boolean # True if the entity has been bone manipulated, false otherwise.
function Entity:HasBoneManipulations() end

---Returns whether or not the the entity has had flex manipulations performed with [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight) or [Entity:SetFlexScale](https://wiki.facepunch.com/gmod/Entity:SetFlexScale).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:HasFlexManipulatior
---@return boolean # True if the entity has flex manipulations, false otherwise.
function Entity:HasFlexManipulatior() end

---Returns whether this entity has the specified spawnflags bits set.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:HasSpawnFlags
---@param spawnFlags number The spawnflag bits to check, see Enums/SF.
---@return boolean # Whether the entity has that spawnflag set or not.
function Entity:HasSpawnFlags(spawnFlags) end

---Returns the position of the head of this entity, NPCs use this internally to aim at their targets.
---
--- **NOTE**: This only works on players and NPCs.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:HeadTarget
---@param origin Vector The vector of where the attack comes from.
---@return Vector # The head position.
function Entity:HeadTarget(origin) end

---Returns the health of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:Health
---@return number # health
function Entity:Health() end

---Sets the entity on fire.
---
--- See also [Entity:Extinguish](https://wiki.facepunch.com/gmod/Entity:Extinguish).
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Ignite
---@param length number How long to keep the entity ignited, in seconds.
---@param radius? number The radius of the ignition, will ignite everything around the entity that is in this radius.
function Entity:Ignite(length, radius) end

---Called when a bullet trace hits this entity and allows you to override the default behavior by returning true.
---@hook ImpactTrace
---@realm client
---@source https://wiki.facepunch.com/gmod/ENTITY:ImpactTrace
---@param traceResult TraceResult The trace that hit this entity as a Structures/TraceResult.
---@param damageType number The damage bits associated with the trace, see Enums/DMG
---@param customImpactName? string The effect name to override the impact effect with.
--- Possible arguments are ImpactJeep, AirboatGunImpact, HelicopterImpact, ImpactGunship.
---@return boolean # Return true to override the default impact effects.
function Entity:ImpactTrace(traceResult, damageType, customImpactName) end

---Called when the entity is created. This is called when you [Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn) the custom entity.
---
--- This is called **after** [ENTITY:SetupDataTables](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables) and [GM:OnEntityCreated](https://wiki.facepunch.com/gmod/GM:OnEntityCreated).
---@hook Initialize
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:Initialize
function Entity:Initialize() end

---Initializes this entity as being clientside only.
---
--- Only works on entities fully created clientside, and as such it currently has no use due to this being automatically called by [ents.CreateClientProp](https://wiki.facepunch.com/gmod/ents.CreateClientProp), [ents.CreateClientside](https://wiki.facepunch.com/gmod/ents.CreateClientside), [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel) and [Global.ClientsideScene](https://wiki.facepunch.com/gmod/Global.ClientsideScene).
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:InitializeAsClientEntity
---@deprecated This function got disabled and will always throw an error if it's used. This is the error:  ``` [ERROR] InitializeAsClientEntity is deprecated and should no longer be used. ```
function Entity:InitializeAsClientEntity() end

---Fires input to the entity with the ability to make another entity responsible, bypassing the event queue system.
---
--- You should only use this function over [Entity:Fire](https://wiki.facepunch.com/gmod/Entity:Fire) if you know what you are doing.
---
--- See [Entity:Fire](https://wiki.facepunch.com/gmod/Entity:Fire) for a function that conforms to the internal map IO event queue and [GM:AcceptInput](https://wiki.facepunch.com/gmod/GM:AcceptInput) for a hook that can intercept inputs.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Input
---@param input string The name of the input to fire
---@param activator? Entity The entity that caused this input (i.e. the player who pushed a button)
---@param caller? Entity The entity that is triggering this input (i.e. the button that was pushed)
---@param param? string|number|boolean The value to give to the input. Can be either a string, a number or a boolean.
function Entity:Input(input, activator, caller, param) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Sets up Data Tables from entity to use with [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:InstallDataTable
function Entity:InstallDataTable() end

---Resets the entity's bone cache values in order to prepare for a model change.
---
--- This should be called after calling [Entity:SetPoseParameter](https://wiki.facepunch.com/gmod/Entity:SetPoseParameter).
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:InvalidateBoneCache
function Entity:InvalidateBoneCache() end

---Returns true if the entity has constraints attached to it
---
--- This will only update clientside if the server calls it first. This only checks constraints added through the [constraint](https://wiki.facepunch.com/gmod/constraint) so this will not react to map constraints.
---
--- For a serverside alternative, see [constraint.HasConstraints](https://wiki.facepunch.com/gmod/constraint.HasConstraints)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsConstrained
---@return boolean # Whether the entity is constrained or not.
function Entity:IsConstrained() end

---Returns if entity is constraint or not.
---
--- This also means that [Entity:GetConstrainedPhysObjects](https://wiki.facepunch.com/gmod/Entity:GetConstrainedPhysObjects). [Entity:GetConstrainedEntities](https://wiki.facepunch.com/gmod/Entity:GetConstrainedEntities) and  [Entity:SetPhysConstraintObjects](https://wiki.facepunch.com/gmod/Entity:SetPhysConstraintObjects) can be used on this entity.
---
--- **WARNING**: For some constraint entities, such as `phys_spring`, `phys_slideconstraint`, `phys_torque` and `logic_collision_pair`, this function will return `false`!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:IsConstraint
---@return boolean # Is the entity a constraint or not
function Entity:IsConstraint() end

---Returns whether the entity is dormant or not.
---
--- Client/server entities become dormant when they leave the PVS on the server. Client side entities can decide for themselves whether to become dormant.
--- This mainly applies to [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community").
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsDormant
---@return boolean # Whether the entity is dormant or not.
function Entity:IsDormant() end

---Returns whether an entity has engine effect applied or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsEffectActive
---@param effect EF The effect to check for, see Enums/EF.
---@return boolean # Whether the entity has the engine effect applied or not.
function Entity:IsEffectActive(effect) end

---Checks if given flag is set or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsEFlagSet
---@param flag EFL The engine flag to test, see Enums/EFL
---@return boolean # Is set or not
function Entity:IsEFlagSet(flag) end

---Checks if given flag(s) is set or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsFlagSet
---@param flag FL The engine flag(s) to test, see Enums/FL
---@return boolean # Is set or not
function Entity:IsFlagSet(flag) end

---Returns whether the entity is in the world (not inside a wall or outside of the map).
---
--- **NOTE**: Internally this function uses [util.IsInWorld](https://wiki.facepunch.com/gmod/util.IsInWorld), that means that this function only checks [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos) of the entity. If an entity is only partially inside a wall, or has a weird GetPos offset, this function may not give reliable output.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:IsInWorld
---@return boolean # False if the entity is inside a wall or outside of the map, true otherwise.
function Entity:IsInWorld() end

---Called when deciding if the Scripted NPC should be able to perform a certain jump or not.
--- **NOTE**: This is only called for "ai" type entities
---@hook IsJumpLegal
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:IsJumpLegal
---@param startPos Vector Start of the jump
---@param apex Vector Apex point of the jump
---@param endPos Vector The landing position
---@return boolean # Return true if this jump should be allowed to be performed, false otherwise.
---
--- Not returning anything, or returning a non boolean will perform the [default action](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/ai_basenpc_movement.cpp#L319).
function Entity:IsJumpLegal(startPos, apex, endPos) end

---Returns whether the entity is lag compensated or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:IsLagCompensated
---@return boolean # Whether the entity is lag compensated or not.
function Entity:IsLagCompensated() end

---Returns true if the target is in line of sight.
--- 		**NOTE**: This will only work when called on CBaseCombatCharacter entities. This includes players, NPCs, grenades, RPG rockets, crossbow bolts, and physics cannisters.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsLineOfSightClear
---@param target Vector The target to test. You can also supply an Entity instead of a Vector
---@return boolean # Returns true if the line of sight is clear
function Entity:IsLineOfSightClear(target) end

---Determines if a given Entity is going to be removed at the start of the next tick.
---
--- This will return `true` for an [Entity](https://wiki.facepunch.com/gmod/Entity) after [Entity:Remove](https://wiki.facepunch.com/gmod/Entity:Remove) is called on it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsMarkedForDeletion
---@return boolean # `true` if the Entity is going to be removed, `false` otherwise.
function Entity:IsMarkedForDeletion() end

---Checks if the entity is a [NextBot](https://wiki.facepunch.com/gmod/NextBot) or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsNextBot
---@return boolean # Whether the entity is an NextBot entity or not.
function Entity:IsNextBot() end

---Checks if the entity is an [NPC](https://wiki.facepunch.com/gmod/NPC) or not.
---
--- This will return false for [NextBot](https://wiki.facepunch.com/gmod/NextBot)s, see [Entity:IsNextBot](https://wiki.facepunch.com/gmod/Entity:IsNextBot) for that.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsNPC
---@return boolean # Whether the entity is an NPC.
function Entity:IsNPC() end

---Returns whether the entity is on fire.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsOnFire
---@return boolean # Whether the entity is on fire or not.
function Entity:IsOnFire() end

---Returns whether the entity is on ground or not.
---
--- Internally, this checks if [FL_ONGROUND](https://wiki.facepunch.com/gmod/Enums/FL) is set on the entity.
---
--- This function is an alias of [Entity:OnGround](https://wiki.facepunch.com/gmod/Entity:OnGround).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsOnGround
---@return boolean # Whether the entity is on ground or not.
function Entity:IsOnGround() end

---Checks if the entity is a player or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsPlayer
---@return boolean # Whether the entity is a player.
---@return_cast self Player
function Entity:IsPlayer() end

---Returns true if the entity is being held by a player. Either by physics gun, gravity gun or use-key (+use).
---
--- If multiple players are holding an object and one drops it, this will return false despite the object still being held.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:IsPlayerHolding
---@return boolean # IsBeingHeld
function Entity:IsPlayerHolding() end

---Returns whether there's a gesture with the given activity being played.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:IsPlayingGesture
---@param activity number The activity to test. See Enums/ACT.
---@return boolean # Whether there's a gesture is given activity being played.
function Entity:IsPlayingGesture(activity) end

---Returns whether a given point is within the entity's Orientated Bounding Box.
---
--- This relies on the entity having a collision mesh (not a physics object) and will be affected by `SOLID_NONE`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsPointInBounds
---@param point Vector The point to test, in world space coordinates.
---@return boolean # Whether the point is within the entity's bounds.
function Entity:IsPointInBounds(point) end

---Checks if the entity is a ragdoll, or became a ragdoll. Internally checks whether [kRenderFXRagdoll](https://wiki.facepunch.com/gmod/kRenderFX) is set.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsRagdoll
---@return boolean # Is ragdoll or not
function Entity:IsRagdoll() end

---Checks if the entity is a SENT or a built-in entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsScripted
---@return boolean # Returns true if entity is scripted ( SENT ), false if not ( A built-in engine entity )
function Entity:IsScripted() end

---Returns whether the entity's current sequence is finished or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsSequenceFinished
---@return boolean # Whether the entity's sequence is finished or not.
function Entity:IsSequenceFinished() end

---Returns if the entity is solid or not.
--- Very useful for determining if the entity is a trigger or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsSolid
---@return boolean # Whether the entity is solid or not.
function Entity:IsSolid() end

---Returns whether the entity is a valid entity or not.
---
--- An entity is valid if:
--- * It is not a [NULL](https://wiki.facepunch.com/gmod/Global_Variables) entity
--- * It is not the worldspawn entity ([game.GetWorld](https://wiki.facepunch.com/gmod/game.GetWorld))
---
--- **NOTE**: Instead of calling this method directly, it's a good idea to call the global [Global.IsValid](https://wiki.facepunch.com/gmod/Global.IsValid) instead, however if you're sure the variable you're using is always an entity object it's better to use this method
---
--- It will check whether the given variable contains an object (an Entity) or nothing at all for you. See examples.
---
--- **WARNING**: NULL entities can still be assigned with key/value pairs, but they will be instantly negated. See example 3
---
--- This might be a cause for a lot of headache. Usually happening during networking etc., when completely valid entities suddenly become invalid on the client, but are never filtered with IsValid(). See [GM:InitPostEntity](https://wiki.facepunch.com/gmod/GM:InitPostEntity) for more details.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsValid
---@return boolean # true if the entity is valid, false otherwise
function Entity:IsValid() end

---Returns whether the given layer ID is valid and exists on this entity.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsValidLayer
---@param layerID number The Layer ID
---@return boolean # Whether the given layer ID is valid and exists on this entity.
function Entity:IsValidLayer(layerID) end

---Checks if the entity is a vehicle or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsVehicle
---@return boolean # Whether the entity is a vehicle.
function Entity:IsVehicle() end

---Checks if the entity is a weapon or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsWeapon
---@return boolean # Whether the entity is a weapon
function Entity:IsWeapon() end

---Returns whether the entity is a widget or not.
---
--- This is used by the "Edit Bones" context menu property.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsWidget
---@return boolean # Whether the entity is a widget or not.
function Entity:IsWidget() end

---Returns if this entity is the map entity `Entity[0] worldspawn`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:IsWorld
---@return boolean # Whether this entity is the world entity.
function Entity:IsWorld() end

---Called when the engine sets a value for this scripted entity.
---
--- This hook is called **before** [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) when the key-values are set by the map.
--- Otherwise this hook will be called whenever [Entity:SetKeyValue](https://wiki.facepunch.com/gmod/Entity:SetKeyValue) is called on the entity.
---
--- See [GM:EntityKeyValue](https://wiki.facepunch.com/gmod/GM:EntityKeyValue) for a hook that works for all entities.
---
--- See [WEAPON:KeyValue](https://wiki.facepunch.com/gmod/WEAPON:KeyValue) for a hook that works for scripted weapons.
---@hook KeyValue
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:KeyValue
---@param key string The key that was affected.
---@param value string The new value.
---@return boolean # Return true to suppress this KeyValue or return false or nothing to apply this key value.
function Entity:KeyValue(key, value) end

---Translates a vector relative to the entity's coordinate system into a worldspace vector.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:LocalToWorld
---@param lpos Vector A local space vector.
---@return Vector # The corresponding worldspace vector.
function Entity:LocalToWorld(lpos) end

---Translates an angle relative to the entity's coordinate system to a worldspace angle.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:LocalToWorldAngles
---@param ang Angle A local space angle.
---@return Angle # The corresponding worldspace angle.
function Entity:LocalToWorldAngles(ang) end

---Returns the attachment index of the given attachment name.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:LookupAttachment
---@param attachmentName string The name of the attachment.
---@return number # The attachment index, or 0 if the attachment does not exist and -1 if the model is invalid.
function Entity:LookupAttachment(attachmentName) end

---Gets the bone index of the given bone name, returns `nil` if the bone does not exist.
--- **NOTE**: When called on [Weapon](https://wiki.facepunch.com/gmod/Weapon)s equipped by any Player, this will return their viewmodel's bone index instead of worldmodel.
---
--- See [Entity:GetBoneName](https://wiki.facepunch.com/gmod/Entity:GetBoneName) for the inverse of this function.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:LookupBone
---@param boneName string The name of the bone.
---
--- Common generic bones ( for player models and some HL2 models ):
--- * ValveBiped.Bip01_Head1
--- * ValveBiped.Bip01_Spine
--- * ValveBiped.Anim_Attachment_RH
---
--- Common hand bones (left hand equivalents also available, replace _R_ with _L_)
--- * ValveBiped.Bip01_R_Hand
--- * ValveBiped.Bip01_R_Forearm
--- * ValveBiped.Bip01_R_Foot
--- * ValveBiped.Bip01_R_Thigh
--- * ValveBiped.Bip01_R_Calf
--- * ValveBiped.Bip01_R_Shoulder
--- * ValveBiped.Bip01_R_Elbow
---@return number|nil # Index of the given bone name, or `nil` if the bone doesn't exist on the Entity.
function Entity:LookupBone(boneName) end

---Returns pose parameter ID from its name.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:LookupPoseParameter
---@param name string Pose parameter name
---@return number # The ID of the given pose parameter name, if it exists, -1 otherwise
function Entity:LookupPoseParameter(name) end

---Returns sequence ID from either sequence name or activity name. See [Entity:GetSequenceName](https://wiki.facepunch.com/gmod/Entity:GetSequenceName) for a function that does the opposite.
---
--- **Sequences** are animations tied to a specific model. Different models can have sequences with same names, but have different IDs.
--- Sequences can also be tied to certain activities ([Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT)), see [Entity:SelectWeightedSequence](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequence).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:LookupSequence
---@param name string Sequence name. Input string can alternatively be an activity name, to lookup an activity from its name and get a sequence as result.
---@return number # Sequence ID for that name. This **will** differ for models with same sequence names. Will be `-1` when the sequence is invalid or not found.
---@return number # The sequence duration, or `0` if the sequence is invalid or there's no sequence with given name on entity's current model.
function Entity:LookupSequence(name) end

---Turns the [Entity:GetPhysicsObject](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObject) into a physics shadow.
--- It's used internally for the Player's and NPC's physics object, and certain HL2 entities such as the crane.
---
--- A physics shadow can be used to have static entities that never move by setting both arguments to false.
---
--- **NOTE**: Unlike [Entity:PhysicsInitShadow](https://wiki.facepunch.com/gmod/Entity:PhysicsInitShadow), this function doesn't remove the current physics object.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:MakePhysicsObjectAShadow
---@param allowPhysicsMovement? boolean Whether to allow the physics shadow to move under stress.
---@param allowPhysicsRotation? boolean Whether to allow the physics shadow to rotate under stress.
function Entity:MakePhysicsObjectAShadow(allowPhysicsMovement, allowPhysicsRotation) end

---Sets custom bone angles.
---
--- When used repeatedly serverside, this method is strongly discouraged due to the huge network traffic produced
---
--- As of update `2024.10.29` this has been resolved. However, network traffic is still generated and should be taken into consideration.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ManipulateBoneAngles
---@param boneID number Index of the bone you want to manipulate
---@param ang Angle Angle to apply.
---
--- The angle is relative to the original bone angle, not relative to the world or the entity.
---@param networking? boolean boolean to network these changes (if called from server)
function Entity:ManipulateBoneAngles(boneID, ang, networking) end

---Manipulates the bone's jiggle status. This allows non jiggly bones to become jiggly.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ManipulateBoneJiggle
---@param boneID number Index of the bone you want to manipulate.
---@param type number The jiggle bone type. There are currently the following options:
--- * `0` = No jiggle override, use model default
--- * `1` = Force jiggle, with hardcoded settings
--- * `2` = Force disable jiggle bone
function Entity:ManipulateBoneJiggle(boneID, type) end

---Sets custom bone offsets.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ManipulateBonePosition
---@param boneID number Index of the bone you want to manipulate.
---@param pos Vector Position vector to apply. Note that the position is relative to the original bone position, not relative to the world or the entity.
---@param networking? boolean boolean to network these changes (if called from server)
function Entity:ManipulateBonePosition(boneID, pos, networking) end

---Sets custom bone scale.
--- This does not scale procedural bones.
--- **NOTE**: This silently fails when given a Vector with nan values, hiding the vertices associated with the bone. See example below.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ManipulateBoneScale
---@param boneID number Index of the bone you want to manipulate
---@param scale Vector Scale vector to apply. Note that the scale is relative to the original bone scale, not relative to the world or the entity.
function Entity:ManipulateBoneScale(boneID, scale) end

---Returns entity's map creation ID. Unlike [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex) or [Entity:GetCreationID](https://wiki.facepunch.com/gmod/Entity:GetCreationID), it will always be the same on same map, no matter how much you clean up or restart it.
---
--- It may change if the map is recompiled, even if no edits were made. It will definitely change if entities are added or removed from the map file.
---
--- To be used in conjunction with [ents.GetMapCreatedEntity](https://wiki.facepunch.com/gmod/ents.GetMapCreatedEntity). See also [Entity:CreatedByMap](https://wiki.facepunch.com/gmod/Entity:CreatedByMap).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:MapCreationID
---@return number # The map creation ID or -1 if the entity is not compiled into the map.
--- 			If the ID exists, it is identical to the entity's order number as it appears in Lump 1 of the BSP file. It is believed to start at 1234 for some reason.
function Entity:MapCreationID() end

---Refreshes the shadow of the entity.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:MarkShadowAsDirty
function Entity:MarkShadowAsDirty() end

---Fires the muzzle flash effect of the weapon the entity is carrying. This only creates a light effect and is often called alongside [Weapon:SendWeaponAnim](https://wiki.facepunch.com/gmod/Weapon:SendWeaponAnim)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:MuzzleFlash
function Entity:MuzzleFlash() end

---Performs a Ray-Orientated Bounding Box intersection from the given position to the origin of the OBBox with the entity and returns the hit position on the OBBox.
---
--- This relies on the entity having a collision mesh (not a physics object) and will be affected by `SOLID_NONE`
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:NearestPoint
---@param position Vector The vector to start the intersection from.
---@return Vector # The nearest hit point of the entity's bounding box in world coordinates.
function Entity:NearestPoint(position) end

---Creates a network variable on the entity and adds Set/Get functions for it. This function should only be called in [ENTITY:SetupDataTables](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables).
---
--- See [Entity:NetworkVarNotify](https://wiki.facepunch.com/gmod/Entity:NetworkVarNotify) for a function to hook NetworkVar changes.
---
--- **NOTE**: Entity NetworkVars are influenced by the return value of [ENTITY:UpdateTransmitState](https://wiki.facepunch.com/gmod/ENTITY:UpdateTransmitState).
--- 	So if you use the **PVS**(**default**), then the NetworkVars can be different for each client.
---
--- **WARNING**: Make sure to not call the SetDT* and your custom set methods on the client realm unless you know exactly what you are doing.
---
--- Combining this function with [util.TableToJSON](https://wiki.facepunch.com/gmod/util.TableToJSON) can also provide a way to network tables as serialized strings.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:NetworkVar
---@overload fun(type: string, name: string, extended?: table)
---@param type string Supported choices:
---
--- * `String` (up to 511 characters)
--- * `Bool`
--- * `Float`
--- * `Int` (32-bit signed integer)
--- * `Vector`
--- * `Angle`
--- * `Entity`
---@param slot number Each network variable has to have a unique slot. The slot is per type - so you can have an int in slot `0`, a bool in slot `0` and a float in slot `0` etc. You can't have two ints in slot `0`, instead you would do a int in slot `0` and another int in slot `1`.
---
--- The max slots for strings `4` - so you should pick a number between `0` and `3`.
---
--- The max slots for everything else `32` - so you should pick a number between `0` and `31`.
---
--- This can be omitted entirely (arguments will shift) and it will use the next available slot.
---@param name string The name will affect how you access it. If you call it `Foo` you would add two new functions on your entity - `SetFoo()` and `GetFoo()`. So be careful that what you call it won't collide with any existing functions (don't call it `Pos` for example).
---@param extended? table A table of extended information.
---
--- `KeyName`
--- * Allows the NetworkVar to be set using Entity:SetKeyValue.
--- * This is **required** for the entity editing to work.
---
--- This is useful if you're making an entity that you want to be loaded in a map. The sky entity uses this.
---
--- `Edit`
--- * The edit key lets you mark this variable as editable. See Editable Entities for more information.
function Entity:NetworkVar(type, slot, name, extended) end

---Similarly to [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar), creates a network variable on the entity and adds Set/Get functions for it. This method stores it's value as a member value of a vector or an angle. This allows to go beyond the normal variable limit of [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) for `Int` and `Float` types, at the expense of `Vector` and `Angle` limit.
---
--- This function should only be called in [ENTITY:SetupDataTables](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables).
---
--- **WARNING**: Make sure to not call the SetDT* and your custom set methods on the client realm unless you know exactly what you are doing.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:NetworkVarElement
---@overload fun(type: string, element: string, name: string, extended?: table)
---@param type string Supported choices:
--- * `Vector`
--- * `Angle`
---@param slot number The slot for this `Vector` or `Angle`, from `0` to `31`. See Entity:NetworkVar for more detailed explanation.
---
--- This can be omitted entirely (arguments will shift) and it will use the next available slot.
---@param element string Which element of a `Vector` or an `Angle` to store the value on. This can be `p`, `y`, `r` for Angles, and `x`, `y`, `z` for Vectors
---@param name string The name will affect how you access it. If you call it `Foo` you would add two new functions on your entity - `SetFoo()` and `GetFoo()`. So be careful that what you call it won't collide with any existing functions (don't call it "Pos" for example).
---@param extended? table A table of extra information. See Entity:NetworkVar for details.
function Entity:NetworkVarElement(type, slot, element, name, extended) end

---Creates a callback that will execute when the given network variable changes - that is, when the `Set()` function is run.
---
--- The callback is executed **before** the value is changed, and is called even if the new and old values are the same.
---
--- This function does not exist on entities in which [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) has not been called.
---
--- By default, this means this function only exists on SENTs (both serverside and clientside) and on players with a [Player Class](https://wiki.facepunch.com/gmod/Player_Classes) (serverside and clientside [Global.LocalPlayer](https://wiki.facepunch.com/gmod/Global.LocalPlayer) only).
---
--- It's therefore safest to only use this in [ENTITY:SetupDataTables](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables).
---
--- The callback will not be called clientside if the var is changed right after entity spawn.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:NetworkVarNotify
---@param name string Name of variable to track changes of.
---@param callback fun(entity: Entity, name: string, old: any, new: any) The function to call when the variable changes.
---
--- Function argument(s):
--- * Entity `entity` - Entity whos variable changed.
--- * string `name` - Name of changed variable.
--- * any `old` - Old/current variable value.
--- * any `new` - New variable value that it was set to.
function Entity:NetworkVarNotify(name, callback) end

---Start the next task in specific Lua schedule.
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook NextTask
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:NextTask
---@param sched table The schedule to start next task in.
function Entity:NextTask(sched) end

---Controls when, relative to [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime), the [Entity](https://wiki.facepunch.com/gmod/Entity) will next run its Think function.
---
--- For Scripted Entities, this is the [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) function.
--- For engine Entities, this is an internal function whose behavior will depend on the specific Entity type.
---
--- For a Client-side equivalent, see [Entity:SetNextClientThink](https://wiki.facepunch.com/gmod/Entity:SetNextClientThink).
---
--- This does not work with SWEPs or Nextbots.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:NextThink
---@param timestamp number The timestamp, relative to Global.CurTime, when the next think should occur.
function Entity:NextThink(timestamp) end

---Returns the center of an entity's collision bounding box as a local vector.
---
--- See also [Entity:GetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds), [Entity:OBBMins](https://wiki.facepunch.com/gmod/Entity:OBBMins) and [Entity:OBBMaxs](https://wiki.facepunch.com/gmod/Entity:OBBMaxs).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:OBBCenter
---@return Vector # The center of an entity's bounding box relative to its Entity:GetPos.
function Entity:OBBCenter() end

---Returns the highest corner of an entity's collision bounding box as a local vector.
---
--- See also [Entity:GetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds), [Entity:OBBMins](https://wiki.facepunch.com/gmod/Entity:OBBMins) and [Entity:OBBCenter](https://wiki.facepunch.com/gmod/Entity:OBBCenter).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:OBBMaxs
---@return Vector # The local position of the highest corner of the entity's oriented bounding box.
function Entity:OBBMaxs() end

---Returns the lowest corner of an entity's collision bounding box as a local vector.
---
--- See also [Entity:GetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds), [Entity:OBBMaxs](https://wiki.facepunch.com/gmod/Entity:OBBMaxs) and [Entity:OBBCenter](https://wiki.facepunch.com/gmod/Entity:OBBCenter).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:OBBMins
---@return Vector # The local position of the lowest corner of the entity's oriented bounding box.
function Entity:OBBMins() end

---Returns the entity's capabilities as a bitfield.
---
--- In the engine this function is mostly used to check the use type, the save/restore system and level transitions flags.
---
--- Even though the function is defined shared, it is not guaranteed to return the same value across states.
---
--- **NOTE**: The enums for this are not currently implemented in Lua, however you can access the defines [here](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/shared/baseentity_shared.h#L21-L38).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ObjectCaps
---@return number # The bitfield, a combination of the [FCAP_](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/shared/baseentity_shared.h#L21-L38) flags.
function Entity:ObjectCaps() end

---Called when the currently active weapon of the SNPC changes.
--- **NOTE**: This hook only works on `ai` type entities.
---@hook OnChangeActiveWeapon
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnChangeActiveWeapon
---@param old Weapon The previous active weapon.
---@param new Weapon The new active weapon.
function Entity:OnChangeActiveWeapon(old, new) end

---Called when the NPC has changed its activity.
---
--- **NOTE**: This hook only works for `ai` type entities.
---@hook OnChangeActivity
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnChangeActivity
---@param act number The new activity. See Enums/ACT.
function Entity:OnChangeActivity(act) end

---Called each time the NPC updates its condition.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook OnCondition
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnCondition
---@param conditionID number The ID of condition. See NPC:ConditionName.
function Entity:OnCondition(conditionID) end

---Called on any entity after it has been created by the [duplicator](https://wiki.facepunch.com/gmod/duplicator) and before any bone/entity modifiers have been applied.
---
--- This hook is called after [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) and before [ENTITY:PostEntityPaste](https://wiki.facepunch.com/gmod/ENTITY:PostEntityPaste).
---@hook OnDuplicated
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnDuplicated
---@param entTable EntityCopyData The stored data about the original entity that was duplicated. This would typically contain the Entity:GetTable fields that are serializalble. See Structures/EntityCopyData.
function Entity:OnDuplicated(entTable) end

---Called after duplicator finishes saving the entity, allowing you to modify the save data.
---
--- This is called after [ENTITY:PostEntityCopy](https://wiki.facepunch.com/gmod/ENTITY:PostEntityCopy).
---@hook OnEntityCopyTableFinish
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnEntityCopyTableFinish
---@param data EntityCopyData The save Structures/EntityCopyData that you can modify.
function Entity:OnEntityCopyTableFinish(data) end

---Returns true if the entity is on the ground, and false if it isn't.
---
--- Internally, this checks if [FL_ONGROUND](https://wiki.facepunch.com/gmod/Enums/FL) is set on the entity. This is only updated for players and NPCs, and thus won't inherently work for other entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:OnGround
---@return boolean # Whether the entity is on the ground or not.
function Entity:OnGround() end

---Called when the SNPC completes its movement to its destination.
--- **NOTE**: This hook only works on `ai` type entities.
---@hook OnMovementComplete
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnMovementComplete
function Entity:OnMovementComplete() end

---Called when the SNPC failed to move to its destination.
--- **NOTE**: This hook only works on `ai` type entities.
---@hook OnMovementFailed
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnMovementFailed
function Entity:OnMovementFailed() end

---Called when the entity is reloaded by the lua auto-refresh system, i.e. when the developer edits the lua file for the entity while the game is running.
---@hook OnReloaded
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:OnReloaded
function Entity:OnReloaded() end

---Called when the entity is about to be removed.
---
--- See also [Entity:CallOnRemove](https://wiki.facepunch.com/gmod/Entity:CallOnRemove), which can even be used on engine (non-Lua) entities.
---
--- 	Create an explosion when the entity will be removed. To create an entity, you can read [ents.Create](https://wiki.facepunch.com/gmod/ents.Create).
---
--- function ENT:OnRemove()
--- 	local explosion = ents.Create( "env_explosion" ) -- The explosion entity
--- 	explosion:SetPos( self:GetPos() ) -- Put the position of the explosion at the position of the entity
--- 	explosion:Spawn() -- Spawn the explosion
--- 	explosion:SetKeyValue( "iMagnitude", "50" ) -- the magnitude of the explosion
--- 	explosion:Fire( "Explode", 0, 0 ) -- explode
--- end
---@hook OnRemove
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:OnRemove
---@param fullUpdate boolean Whether the removal is happening due to a full update clientside.
---
--- The entity may or **may not** be recreated immediately after, depending on whether it is in the local player's [PVS](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community"). (See Entity:IsDormant)
function Entity:OnRemove(fullUpdate) end

---Called when the entity is reloaded from a Source Engine save (not the Sandbox saves or dupes) or on a changelevel (for example Half-Life 2 campaign level transitions).
---
--- For the [duplicator](https://wiki.facepunch.com/gmod/duplicator) callbacks, see [ENTITY:OnDuplicated](https://wiki.facepunch.com/gmod/ENTITY:OnDuplicated).
---@hook OnRestore
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:OnRestore
function Entity:OnRestore() end

---Called by the engine when NPC's state changes.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---@hook OnStateChange
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnStateChange
---@param oldState number The old state. See Enums/NPC_STATE.
---@param newState number The new state. See Enums/NPC_STATE.
function Entity:OnStateChange(oldState, newState) end

---Called when the entity is taking damage.
---
--- **WARNING**: Calling [Entity:TakeDamage](https://wiki.facepunch.com/gmod/Entity:TakeDamage), [Entity:TakeDamageInfo](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo), [Entity:DispatchTraceAttack](https://wiki.facepunch.com/gmod/Entity:DispatchTraceAttack), or [Player:TraceHullAttack](https://wiki.facepunch.com/gmod/Player:TraceHullAttack) (if the entity is hit) in this hook on the victim entity can cause infinite loops since the hook will be called again. Make sure to setup recursion safeguards like the example below.
---
--- **NOTE**: This hook is only called for `ai`, `nextbot` and `anim` type entities.
---@hook OnTakeDamage
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage
---@param damage CTakeDamageInfo The damage to be applied to the entity.
---@return number # How much damage the entity took. Basically `> 0` means took damage, `0` means did not take damage.
function Entity:OnTakeDamage(damage) end

---Called from the engine when TaskComplete is called.
--- This allows us to move onto the next task - even when TaskComplete was called from an engine side task.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook OnTaskComplete
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnTaskComplete
function Entity:OnTaskComplete() end

---Called when a task this NPC was running has failed for whatever reason.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook OnTaskFailed
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OnTaskFailed
---@param failCode number The fail code for the task. It will be a [FAIL_ enum](https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/sp/src/game/server/ai_task.h#L26) or a generated code for a custom string. (second argument)
---@param failReason string If set, a custom reason for the failure.
function Entity:OnTaskFailed(failCode, failReason) end

---Called to completely override NPC movement. This can be used for example for flying NPCs.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---@hook OverrideMove
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OverrideMove
---@param interval number Time interval for the movement, in seconds. Usually time since last movement.
---@return boolean # Return `true` to disable the default movement code.
function Entity:OverrideMove(interval) end

---Called to completely override the direction NPC will be facing during navigation.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---
--- **NOTE**: This hook is called by the default movement hook. Returning `true` inside [ENTITY:OverrideMove](https://wiki.facepunch.com/gmod/ENTITY:OverrideMove) will prevent engine from calling this hook.
---@hook OverrideMoveFacing
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:OverrideMoveFacing
---@param interval number Time interval for the movement, in seconds. Usually time since last movement.
---@param AILMG table Extra data for the movement. A table containing the following data:
--- * boolean hasTraced - The result if a forward probing trace has been done
--- * number expectedDist = `speed*interval` - The distance expected to move this think
--- * number flags - [AILMG flags](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/ai_movetypes.h#L113)
--- * number maxDist = NPC:GetPathDistanceToGoal - The distance maximum distance intended to travel in path length
--- * number navType - Enums/NAV
--- * number speed - Entity:GetSequenceGroundSpeed Note these need not always agree with `target`
--- * Entity moveTarget = `m_hGoalEnt` - Target entity as goal.
--- * Vector dir - The step direction, towards `target`
--- * Vector facing - The direction NPC's body will turn during movement.
--- * Vector target = NPC:GetCurWaypointPos - Current waypoint in world coordinates.
---@return boolean # Return `true` to disable the default movement facing code.
function Entity:OverrideMoveFacing(interval, AILMG) end

---Tests whether the damage passes the entity filter.
---
--- This will call [ENTITY:PassesDamageFilter](https://wiki.facepunch.com/gmod/ENTITY:PassesDamageFilter) on scripted entities of the type "filter".
---
--- **NOTE**: This function only works on entities of the type "filter". ( filter_* entities, including base game filter entites )
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:PassesDamageFilter
---@param dmg CTakeDamageInfo The damage info to test
---@return boolean # Whether the damage info passes the entity filter.
function Entity:PassesDamageFilter(dmg) end

---Tests whether the entity passes the entity filter.
---
--- This will call [ENTITY:PassesFilter](https://wiki.facepunch.com/gmod/ENTITY:PassesFilter) on scripted entities of the type "filter".
---
--- **NOTE**: This function only works on entities of the type "filter". ( filter_* entities, including base game filter entites )
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:PassesFilter
---@param caller Entity The initiator of the test.
---
--- For example the trigger this filter entity is used in.
---@param ent Entity The entity to test against the entity filter.
---@return boolean # Whether the entity info passes the entity filter.
function Entity:PassesFilter(caller, ent) end

---Polls whenever the entity should trigger the brush.
---
--- **WARNING**: This hook is broken and will not work without code below
---@hook PassesTriggerFilters
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:PassesTriggerFilters
---@param ent Entity The entity that is about to trigger.
---@return boolean # Should trigger or not.
function Entity:PassesTriggerFilters(ent) end

---Called when the entity collides with anything via [physics objects](https://wiki.facepunch.com/gmod/PhysObj). The [move type](https://wiki.facepunch.com/gmod/Enums/MOVETYPE) and [solid mode](https://wiki.facepunch.com/gmod/Enums/SOLID) must be `VPHYSICS` for the hook to be called.
--- This hook only works for `anim` type entities.
---
--- This is different from [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch).
---
--- **NOTE**: If you want to use this hook on default/engine/non-Lua entities (like `prop_physics`), use [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback) instead! This page describes a hook for Lua scripted entities
---@hook PhysicsCollide
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:PhysicsCollide
---@param colData CollisionData Information regarding the collision. See Structures/CollisionData.
---@param collider PhysObj The physics object that collided.
function Entity:PhysicsCollide(colData, collider) end

---Destroys the current physics object of an entity.
---
--- **NOTE**: Cannot be used on a ragdoll or the world entity.
---
--- **WARNING**: This function cannot be used when called from a physics callback.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsDestroy
function Entity:PhysicsDestroy() end

---Initializes the physics mesh of the entity from a triangle soup defined by a table of vertices. The resulting mesh is hollow, may contain holes, and always has a volume of 0.
---
--- While this is very useful for static geometry such as terrain displacements, it is advised to use [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) or [Entity:PhysicsInitMultiConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitMultiConvex) for moving solid objects instead.
---
--- [Entity:EnableCustomCollisions](https://wiki.facepunch.com/gmod/Entity:EnableCustomCollisions) needs to be called if you want players to collide with the entity correctly.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsFromMesh
---@param vertices table A table of Vectors. Every 3 vertices define a triangle in the physics mesh
---
--- Alternatively, you can input a table consisting of Structures/MeshVertex (only the `pos` element is taken into account).
---@param surfaceprop? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@param massCenterOveride? Vector If set, overwrites the center of mass for the created physics object.
---@return boolean # Returns `true` on success, `nil` otherwise.
function Entity:PhysicsFromMesh(vertices, surfaceprop, massCenterOveride) end

---Initializes the [physics object](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObject) of the entity using its current [model](https://wiki.facepunch.com/gmod/Entity:GetModel). Deletes the previous physics object if it existed and the new object creation was successful.
---
--- If the entity's current model has no physics mesh associated to it, no physics object will be created and the previous object will still exist, if applicable.
---
--- **NOTE**: When called clientside, this will not create a valid [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) if the model hasn't been [precached](https://wiki.facepunch.com/gmod/util.PrecacheModel) serverside.
---
--- If successful, this function will automatically call [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid)( solidType ) and [Entity:SetSolidFlags](https://wiki.facepunch.com/gmod/Entity:SetSolidFlags)( 0 ).
---
--- Clientside physics objects on serverside entities do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsInit
---@param solidType number The solid type of the physics object to create, see Enums/SOLID. Should be `SOLID_VPHYSICS` in most cases.
---
--- 		Using `SOLID_NONE` will only delete the current physics object - it does not create a new one.
---@param massCenterOverride? Vector If set, overwrites the center of mass for the created physics object.
---@return boolean # Returns `true` on success, `false` otherwise.
function Entity:PhysicsInit(solidType, massCenterOverride) end

---Makes the physics object of the entity a AABB.
---
--- This function will automatically destroy any previous physics objects and do the following:
--- * [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid)( `SOLID_BBOX` )
--- * [Entity:SetMoveType](https://wiki.facepunch.com/gmod/Entity:SetMoveType)( `MOVETYPE_VPHYSICS` )
--- * [Entity:SetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds)( `mins`, `maxs` )
---
--- **NOTE**: If the volume of the resulting box is 0 (the mins and maxs are the same), the mins and maxs will be changed to [Global.Vector](https://wiki.facepunch.com/gmod/Global.Vector)( -1, -1, -1 ) and [Global.Vector](https://wiki.facepunch.com/gmod/Global.Vector)( 1, 1, 1 ), respectively.
---
--- Clientside physics objects on serverside entities do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsInitBox
---@param mins Vector The minimum position of the box. This is automatically ordered with the maxs.
---@param maxs Vector The maximum position of the box. This is automatically ordered with the mins.
---@param surfaceprop? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@param massCenterOverride? Vector If set, overwrites the center of mass for the created physics object.
---@return boolean # Returns `true` on success, `nil` otherwise. This fails when the game cannot create any more PhysCollides.
function Entity:PhysicsInitBox(mins, maxs, surfaceprop, massCenterOverride) end

---Initializes the physics mesh of the entity with a convex mesh defined by a table of points. The resulting mesh is the  of all the input points. If successful, the previous physics object will be removed.
---
--- This is the standard way of creating moving physics objects with a custom convex shape. For more complex, concave shapes, see [Entity:PhysicsInitMultiConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitMultiConvex).
---
--- You may be expected to call [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid) with desired solid type **before** calling this function.
---
--- Clientside physics objects on serverside entities do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- You can use the following workaround for movement, though clientside collisions will still be broken.
--- ```
--- function ENT:Think()
--- 	if ( CLIENT ) then
--- 		local physobj = self:GetPhysicsObject()
---
--- 		if ( IsValid( physobj ) ) then
--- 			physobj:SetPos( self:GetPos() )
--- 			physobj:SetAngles( self:GetAngles() )
--- 		end
--- 	end
--- end
--- ```
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex
---@param points table A table of eight Vectors, in local coordinates, to be used in the computation of the convex mesh. Order does not matter.
---@param surfaceprop? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@param massCenterOverride? Vector If set, overwrites the center of mass for the created physics object.
---@return boolean # Returns `true` on success, `false` otherwise.
function Entity:PhysicsInitConvex(points, surfaceprop, massCenterOverride) end

---An advanced version of [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) which initializes a physics object from multiple convex meshes. This should be used for physics objects with a custom shape which cannot be represented by a single convex mesh.
---
--- If successful, the previous physics object will be removed.
---
--- You may be expected to call [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid) with desired solid type **before** calling this function.
---
--- Clientside physics objects on serverside entities do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsInitMultiConvex
---@param vertices table A table consisting of tables of Vectors. Each sub-table defines a set of points to be used in the computation of one convex mesh.
---@param surfaceprop? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@param massCenterOverride? Vector If set, overwrites the center of mass for the created physics object.
---@return boolean # Returns `true` on success, `nil` otherwise.
function Entity:PhysicsInitMultiConvex(vertices, surfaceprop, massCenterOverride) end

---Initializes the entity's physics object as a physics shadow. Removes the previous physics object if successful. This is used internally for the Player's and NPC's physics object, and certain HL2 entities such as the crane.
---
--- A physics shadow can be used to have static entities that never move by setting both arguments to false.
---
--- The created physics object will depend on the entity's solidity `SOLID_NONE` will not create a physics object, `SOLID_BBOX` will create a Axis-Aligned BBox one, `SOLID_OBB` will create Orientated Bounding Box one, and anything else will use the models' physics mesh.
---
--- Clientside physics objects on serverside entities do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsInitShadow
---@param allowPhysicsMovement? boolean Whether to allow the physics shadow to move under stress.
---@param allowPhysicsRotation? boolean Whether to allow the physics shadow to rotate under stress.
---@return boolean # Return `true` on success, `nil` otherwise.
function Entity:PhysicsInitShadow(allowPhysicsMovement, allowPhysicsRotation) end

---Makes the physics object of the entity a sphere.
---
--- This function will automatically destroy any previous physics objects and do the following:
--- * [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid)( `SOLID_BBOX` )
--- * [Entity:SetMoveType](https://wiki.facepunch.com/gmod/Entity:SetMoveType)( `MOVETYPE_VPHYSICS` )
---
--- Clientside physics objects on serverside entities do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsInitSphere
---@param radius number The radius of the sphere.
---@param physmat? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@return boolean # Returns `true` on success, `false` otherwise
function Entity:PhysicsInitSphere(radius, physmat) end

---Initializes a static physics object of the entity using its [current model](https://wiki.facepunch.com/gmod/Entity:GetModel). If successful, the previous physics object is removed.
---
--- This is what used by entities such as `func_breakable`, `prop_dynamic`, `item_suitcharger`, `prop_thumper` and `npc_rollermine` while it is in its "buried" state in the Half-Life 2 Campaign.
---
--- If the entity's current model has no physics mesh associated to it, no physics object will be created.
---
--- **NOTE**: This function will automatically call [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid)( `solidType` ).
---
--- Clientside physics objects on serverside entities do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysicsInitStatic
---@param solidType number The solid type of the physics object to create, see Enums/SOLID. Should be `SOLID_VPHYSICS` in most cases.
---@return boolean # Returns `true` on success, `false` otherwise. This will fail if the entity's current model has no associated physics mesh.
function Entity:PhysicsInitStatic(solidType) end

---Called from the Entity's motion controller to simulate physics.
---
--- This will only be called after using [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController) on a [scripted entity](https://wiki.facepunch.com/gmod/Scripted_Entities) of `anim` type.
---
--- **NOTE**: This hook can work on the CLIENT if you call [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController) and use [Entity:AddToMotionController](https://wiki.facepunch.com/gmod/Entity:AddToMotionController) on the physics objects you want to control
---
--- **WARNING**: Do not use functions such as [PhysObj:EnableCollisions](https://wiki.facepunch.com/gmod/PhysObj:EnableCollisions) or [PhysObj:EnableGravity](https://wiki.facepunch.com/gmod/PhysObj:EnableGravity) in this hook as they're very likely to crash your game. You may want to use [ENTITY:PhysicsUpdate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsUpdate) instead.
---@hook PhysicsSimulate
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate
---@param phys PhysObj The physics object of the entity.
---@param deltaTime number Time since the last call.
---@return Vector # Angular force. The 3rd argument must be above SIM_NOTHING.
---@return Vector # Linear force. The 3rd argument must be above SIM_NOTHING.
---@return number # One of the Enums/SIM.
function Entity:PhysicsSimulate(phys, deltaTime) end

---Called whenever a physics object of this entity is updated.
---
--- This hook won't be called if the Entity's [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) goes asleep, or doesn't exist.
---@hook PhysicsUpdate
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:PhysicsUpdate
---@param phys PhysObj The physics object of the entity.
function Entity:PhysicsUpdate(phys) end

---Wakes up the entity's physics object
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:PhysWake
function Entity:PhysWake() end

---Makes the entity play a .vcd scene. [All scenes from Half-Life 2](https://developer.valvesoftware.com/wiki/Half-Life_2_Scenes_List).
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:PlayScene
---@param scene string Filepath to scene.
---@param delay? number Delay in seconds until the scene starts playing.
---@return number # Estimated length of the scene.
---@return Entity # The scene entity, removing which will stop the scene from continuing to play.
function Entity:PlayScene(scene, delay) end

---Changes an entities angles so that it faces the target entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:PointAtEntity
---@param target Entity The entity to face.
function Entity:PointAtEntity(target) end

---Called after the duplicator finished copying the entity.
---
--- See also [ENTITY:PreEntityCopy](https://wiki.facepunch.com/gmod/ENTITY:PreEntityCopy), [ENTITY:PostEntityPaste](https://wiki.facepunch.com/gmod/ENTITY:PostEntityPaste) and [ENTITY:OnEntityCopyTableFinish](https://wiki.facepunch.com/gmod/ENTITY:OnEntityCopyTableFinish).
---@hook PostEntityCopy
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:PostEntityCopy
function Entity:PostEntityCopy() end

---Called after the [duplicator](https://wiki.facepunch.com/gmod/duplicator) pastes the entity, after the bone/entity modifiers have been applied to the entity.
---
--- This hook is called after [ENTITY:OnDuplicated](https://wiki.facepunch.com/gmod/ENTITY:OnDuplicated). See also [ENTITY:PreEntityCopy](https://wiki.facepunch.com/gmod/ENTITY:PreEntityCopy).
---@hook PostEntityPaste
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:PostEntityPaste
---@param ply Player The player who pasted the entity.
---
--- This may not be a valid player in some circumstances. For example, when a save is loaded from the main menu, this hook will be called before the player is spawned. This argument will be a NULL entity in that case.
---@param ent Entity The entity itself. Same as `self` within the function context.
---@param createdEntities table All entities that are within the placed dupe.
--- The keys of each value in this table are the original entity indexes when the duplication was created. This can be utilized to restore entity references that don't get saved in duplications.
function Entity:PostEntityPaste(ply, ent, createdEntities) end

---Precaches gibs for the entity's model.
---
--- Normally this function should be ran when the entity is spawned, for example the [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize), after [Entity:SetModel](https://wiki.facepunch.com/gmod/Entity:SetModel) is called.
---
--- This is required for [Entity:GibBreakServer](https://wiki.facepunch.com/gmod/Entity:GibBreakServer) and [Entity:GibBreakClient](https://wiki.facepunch.com/gmod/Entity:GibBreakClient) to work.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:PrecacheGibs
---@return number # The amount of gibs the prop has
function Entity:PrecacheGibs() end

---Called before the duplicator copies the entity.
---
--- If you are looking for a way to make the duplicator spawn another entity when duplicated. (For example, you duplicate a `prop_physics`, but you want the duplicator to spawn `prop_physics_my`), you should add `prop_physics.ClassOverride = "prop_physics_my"`. The duplication table should be also stored on that `prop_physics`, not on `prop_physics_my`.
---
--- See also [ENTITY:PostEntityCopy](https://wiki.facepunch.com/gmod/ENTITY:PostEntityCopy).
---@hook PreEntityCopy
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:PreEntityCopy
function Entity:PreEntityCopy() end

---Normalizes the ragdoll. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:RagdollSolve
function Entity:RagdollSolve() end

---Sets the function to build the ragdoll. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:RagdollStopControlling
function Entity:RagdollStopControlling() end

---Makes the physics objects follow the set bone positions. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:RagdollUpdatePhysics
function Entity:RagdollUpdatePhysics() end

---Removes (or deletes) a given [Entity](https://wiki.facepunch.com/gmod/Entity).
---
--- The Entity will continue to exist until the start of the next tick.
---
--- To check if an Entity will be removed in the next tick, see [Entity:IsMarkedForDeletion](https://wiki.facepunch.com/gmod/Entity:IsMarkedForDeletion)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:Remove
function Entity:Remove() end

---Removes all decals from the entities surface.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveAllDecals
function Entity:RemoveAllDecals() end

---Removes and stops all gestures.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
--- **NOTE**: Layer removal procedures aren't immediate. Layer removal functions actually manipulate [Entity:GetLayerWeight](https://wiki.facepunch.com/gmod/Entity:GetLayerWeight) down to 0, then remove the layer in next intervals. If the targeted layer's weight keeps changing, your layer will not be removed.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:RemoveAllGestures
function Entity:RemoveAllGestures() end

---Removes a callback previously added with [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveCallback
---@param hook string The hook name to remove. See Entity Callbacks
---@param callbackid number The callback id previously retrieved with the return of Entity:AddCallback or Entity:GetCallbacks
function Entity:RemoveCallback(hook, callbackid) end

---Removes a function previously added via [Entity:CallOnRemove](https://wiki.facepunch.com/gmod/Entity:CallOnRemove).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveCallOnRemove
---@param identifier any Identifier of the function given to Entity:CallOnRemove.
function Entity:RemoveCallOnRemove(identifier) end

---Removes an engine effect applied to an entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveEffects
---@param effect EF The effect to remove, see Enums/EF.
function Entity:RemoveEffects(effect) end

---Removes specified engine flag
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveEFlags
---@param flag EFL The flag to remove, see Enums/EFL
function Entity:RemoveEFlags(flag) end

---Removes specified flag(s) from the entity
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveFlags
---@param flag FL The flag(s) to remove, see Enums/FL
function Entity:RemoveFlags(flag) end

---Removes a [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ect from the entity's motion controller so that [ENTITY:PhysicsSimulate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate) will no longer be called for given [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ect.
---
--- You must first create a motion controller with [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController).
---
--- **NOTE**: Only works on a scripted [Entity](https://wiki.facepunch.com/gmod/Entity) of anim type
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveFromMotionController
---@param physObj PhysObj The PhysObj to remove from the motion controller.
function Entity:RemoveFromMotionController(physObj) end

---Removes and stops the gesture with given activity. Same as [Entity:RemoveLayer](https://wiki.facepunch.com/gmod/Entity:RemoveLayer) with [Entity:FindGestureLayer](https://wiki.facepunch.com/gmod/Entity:FindGestureLayer).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
--- **NOTE**: Layer removal procedures aren't immediate. Layer removal functions actually manipulate [Entity:GetLayerWeight](https://wiki.facepunch.com/gmod/Entity:GetLayerWeight) down to 0, then remove the layer in next intervals. If the targeted layer's weight keeps changing, your layer will not be removed.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:RemoveGesture
---@param activity number The activity remove. See Enums/ACT.
function Entity:RemoveGesture(activity) end

---Breaks internal Ragdoll constrains, so you can for example separate an arm from the body of a ragdoll and preserve all physics.
---
--- The visual mesh will still stretch as if it was properly connected unless the ragdoll model is specifically designed to avoid that.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:RemoveInternalConstraint
---@param num? number Which constraint to break, values below 0 mean break them all
function Entity:RemoveInternalConstraint(num) end

---Removes the given layer by ID. See also [Entity:RemoveGesture](https://wiki.facepunch.com/gmod/Entity:RemoveGesture).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
--- **NOTE**: Layer removal procedures aren't immediate. Layer removal functions actually manipulate [Entity:GetLayerWeight](https://wiki.facepunch.com/gmod/Entity:GetLayerWeight) down to 0, then remove the layer in next intervals. If the targeted layer's weight keeps changing, your layer will not be removed.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:RemoveLayer
---@param layerID number The layer ID to remove.
function Entity:RemoveLayer(layerID) end

---Removes solid flag(s) from the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveSolidFlags
---@param flags number The flag(s) to remove, see Enums/FSOLID.
function Entity:RemoveSolidFlags(flags) end

---Removes a SpawnFlag from the current SpawnFlags of an Entity.
---
--- SpawnFlags can easily be found on https://developer.valvesoftware.com/wiki/.
---
--- 	**NOTE**: See also [Entity:AddSpawnFlags](https://wiki.facepunch.com/gmod/Entity:AddSpawnFlags), [Entity:SetSpawnFlags](https://wiki.facepunch.com/gmod/Entity:SetSpawnFlags)
---
--- 	Using [SF Enumerations](https://wiki.facepunch.com/gmod/Enums/SF) won't work, if this function is ran clientside due to the enumerations being defined only Serverside. Use the actual SpawnFlag number.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RemoveSpawnFlags
---@param flag number The SpawnFlag to remove from the Entity
function Entity:RemoveSpawnFlags(flag) end

---Called instead of the engine drawing function of the entity. This hook works on any entity (scripted or not) it is applied on.
---
--- This does not work on "physgun_beam", use [GM:DrawPhysgunBeam](https://wiki.facepunch.com/gmod/GM:DrawPhysgunBeam) instead.
---
--- Drawing a viewmodel in this function will cause [GM:PreDrawViewModel](https://wiki.facepunch.com/gmod/GM:PreDrawViewModel), [WEAPON:PreDrawViewModel](https://wiki.facepunch.com/gmod/WEAPON:PreDrawViewModel), [WEAPON:ViewModelDrawn](https://wiki.facepunch.com/gmod/WEAPON:ViewModelDrawn), [GM:PostDrawViewModel](https://wiki.facepunch.com/gmod/GM:PostDrawViewModel), and [WEAPON:PostDrawViewModel](https://wiki.facepunch.com/gmod/WEAPON:PostDrawViewModel) to be called twice.
---
--- This is called before PrePlayerDraw for players. If this function exists at all on a player, their worldmodel will always be rendered regardless of PrePlayerDraw's return.
---@hook RenderOverride
---@realm client
---@source https://wiki.facepunch.com/gmod/ENTITY:RenderOverride
---@param flags number The Enums/STUDIO flags for this render operation.
function Entity:RenderOverride(flags) end

---Plays an animation on the entity. This may not always work on engine entities.
---
--- **WARNING**: This will not reset the animation on viewmodels, use [Entity:SendViewModelMatchingSequence](https://wiki.facepunch.com/gmod/Entity:SendViewModelMatchingSequence) instead.
---
--- **NOTE**: This will not work properly if called directly after calling [Entity:SetModel](https://wiki.facepunch.com/gmod/Entity:SetModel). Consider waiting until the next Tick.
---
--- Will not work on players due to the animations being reset every frame by the base gamemode animation system. See [GM:CalcMainActivity](https://wiki.facepunch.com/gmod/GM:CalcMainActivity).
---
--- For custom scripted entities you will want to apply example from [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) to make animations work.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ResetSequence
---@param sequence number|string The sequence to play. Also accepts strings.
---
--- If set to a string, the function will automatically call [Entity:LookupSequence](https://wiki.facepunch.com/gmod/Entity:LookupSequence) to retrieve the sequence ID as a number.
function Entity:ResetSequence(sequence) end

---Reset entity sequence info such as playback rate, ground speed, last event check, etc.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ResetSequenceInfo
function Entity:ResetSequenceInfo() end

---Called during a non-VPhysics collision event for flying entities.
---
--- This is best used to make projectiles bounce off from surfaces in their own way. For this to be triggered, this entity must be the one that's colliding, have some velocity, [Entity:GetMoveType](https://wiki.facepunch.com/gmod/Entity:GetMoveType) must be either [MOVETYPE_FLY](https://wiki.facepunch.com/gmod/Enums/MOVETYPE#MOVETYPE_FLY) or [MOVETYPE_FLYGRAVITY](https://wiki.facepunch.com/gmod/Enums/MOVETYPE#MOVETYPE_FLYGRAVITY), and [Entity:GetMoveCollide](https://wiki.facepunch.com/gmod/Entity:GetMoveCollide) must be [MOVECOLLIDE_FLY_CUSTOM](https://wiki.facepunch.com/gmod/Enums/MOVECOLLIDE#MOVECOLLIDE_FLY_CUSTOM).
--- 	**NOTE**: This works only on `anim` type entities.
---@hook ResolveCustomFlyCollision
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:ResolveCustomFlyCollision
---@param traceResult TraceResult The Structures/TraceResult where the collision occured.
---@param vel vector The calculated velocity after calculations such as bounciness, elasticity, ground sliding etc...
---@return boolean # Return `true` to prevent default action.
function Entity:ResolveCustomFlyCollision(traceResult, vel) end

---Makes the entity/weapon respawn.
---
--- Only usable on HL2/HL:S pickups and any weapons. Seems to be buggy with weapons.
--- Very unreliable.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Respawn
function Entity:Respawn() end

---Restarts the entity's animation gesture. If the given gesture is already playing, it will reset it and play it from the beginning.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:RestartGesture
---@param activity number The activity number to send to the entity. See Enums/ACT and Entity:GetSequenceActivity
---@param addIfMissing? boolean Add/start the gesture to if it has not been yet started.
---@param autokill? boolean
function Entity:RestartGesture(activity, addIfMissing, autokill) end

---Calls the associated `Entity:Set*` function for each network var provided.
---
--- **INTERNAL**: Used for the built-in duplicator, you do not need to call this yourself.
---
--- **NOTE**: This function will only work on entities which had [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) called on them, which is done automatically for players and all [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:RestoreNetworkVars
---@param data table The data from Entity:GetNetworkVars.
function Entity:RestoreNetworkVars(data) end

---Called from the engine every [m_flNextDecisionTime](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/ai_basenpc.cpp#L3943C10-L3943C30) in seconds. This interval changes depending on NPC's [Efficiency](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/ai_basenpc.cpp#L3093). Returning `true` inside this hook will allow [CAI_BaseNPC::MaintainSchedule](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/ai_basenpc_schedule.cpp#L562) to also be called.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook RunAI
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:RunAI
---@return boolean # `true` to run engine schedules
function Entity:RunAI() end

---Called when an engine task is ran on the entity.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook RunEngineTask
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:RunEngineTask
---@param taskID number The task ID, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param taskData number The task data.
---@return boolean # true to prevent default action
function Entity:RunEngineTask(taskID, taskData) end

---Called every think on running task.
--- The actual task function should tell us when the task is finished.
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook RunTask
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:RunTask
---@param task table The task to run
function Entity:RunTask(task) end

---Called whenever a Lua schedule is finished or [ENTITY:StartEngineSchedule](https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule) is called. Clears out schedule and task data stored within NPC's table.
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook ScheduleFinished
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:ScheduleFinished
function Entity:ScheduleFinished() end

---Set the schedule we should be playing right now. Allows the NPC to start either a Lua schedule or an engine schedule. Despite sharing the same name as `CAI_BaseNPC::SelectSchedule()`, this isn't hooked to that function; this is called by Lua's [ENTITY:RunAI](https://wiki.facepunch.com/gmod/ENTITY:RunAI), doesn't return an engine function, returning an engine function doesn't help and doesn't make the NPC start an engine schedule. To alter initial engine schedule, it is recommended to use [ENTITY:TranslateSchedule](https://wiki.facepunch.com/gmod/ENTITY:TranslateSchedule).
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook SelectSchedule
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:SelectSchedule
function Entity:SelectSchedule() end

---Returns sequence ID corresponding to given activity ID.
---
--- Multiple sequences can be assigned to a single [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT), in which case a random one will be selected. This can be used for example to randomize idle animations (and is used for that by built-in weapons) without the need to code logic for this.
--- See also [Entity:SelectWeightedSequenceSeeded](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequenceSeeded).
---
--- Opposite of [Entity:GetSequenceActivity](https://wiki.facepunch.com/gmod/Entity:GetSequenceActivity).
---
--- Similar to [Entity:LookupSequence](https://wiki.facepunch.com/gmod/Entity:LookupSequence).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequence
---@param act ACT The activity ID, see Enums/ACT.
---@return number # The sequence ID, or `-1` if not found.
function Entity:SelectWeightedSequence(act) end

---Returns the sequence ID corresponding to given activity ID, and uses the provided seed for random selection. The seed should be the same server-side and client-side if used in a predicted environment.
---
--- See [Entity:SelectWeightedSequence](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequence) for a provided-seed version of this function.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequenceSeeded
---@param act number The activity ID, see Enums/ACT.
---@param seed number The seed to use for randomly selecting a sequence in the case the activity ID has multiple sequences bound to it. Entity:SelectWeightedSequence uses the same seed as util.SharedRandom internally for this.
---@return number # The sequence ID, or `-1` if not found.
function Entity:SelectWeightedSequenceSeeded(act, seed) end

---Sends sequence animation to the view model. It is recommended to use this for view model animations, instead of [Entity:ResetSequence](https://wiki.facepunch.com/gmod/Entity:ResetSequence).
---
--- This function is only usable on view models.
---
--- **NOTE**: Predicted viewmodels will have their sequence and cycle reset during prediction checks, making this function appear to do nothing unless also called on the server.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SendViewModelMatchingSequence
---@param seq number The sequence ID returned by Entity:LookupSequence or  Entity:SelectWeightedSequence.
function Entity:SendViewModelMatchingSequence(seq) end

---Returns length of currently played sequence.
---
--- This will return incorrect results for weapons and viewmodels clientside in thirdperson.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SequenceDuration
---@param seqid? number A sequence ID to return the length specific sequence of instead of the entity's main/currently playing sequence.
---@return number # The length of the sequence
function Entity:SequenceDuration(seqid) end

---Sets the entity's velocity.
---
--- **NOTE**: Actually binds to CBaseEntity::SetLocalVelocity() which sets the entity's velocity due to movement in the world from forces such as gravity. Does not include velocity from entity-on-entity collision or other world movement.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetAbsVelocity
---@param velocity Vector The new velocity to set.
function Entity:SetAbsVelocity(velocity) end

---Sets the angles of the entity.
---
--- **NOTE**: To set a player's angles, use [Player:SetEyeAngles](https://wiki.facepunch.com/gmod/Player:SetEyeAngles) instead.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetAngles
---@param angles Angle The new angles.
function Entity:SetAngles(angles) end

---Sets a player's third-person animation. Mainly used by [Weapon](https://wiki.facepunch.com/gmod/Weapon)s to start the player's weapon attack and reload animations.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetAnimation
---@param playerAnim number Player animation, see Enums/PLAYER.
function Entity:SetAnimation(playerAnim) end

---Sets the start time (relative to [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime)) of the current animation, which is used to determine [Entity:GetCycle](https://wiki.facepunch.com/gmod/Entity:GetCycle). Should be less than CurTime to play an animation from the middle.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetAnimTime
---@param time number The time the animation was supposed to begin.
function Entity:SetAnimTime(time) end

---Parents the sprite to an attachment on another model.
---
--- Works only on `env_sprite` entities.
---
--- Despite existing on client, it doesn't actually do anything on client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetAttachment
---@param ent Entity The entity to attach/parent to
---@param attachment number The attachment ID to parent to
---@deprecated You should be using Entity:SetParent instead.
function Entity:SetAttachment(ent, attachment) end

---Toggles automatic frame advancing for animated sequences on an entity.
---
--- This has the same effect as setting the ``ENT.AutomaticFrameAdvance`` property. (See [Structures/ENT](https://wiki.facepunch.com/gmod/Structures/ENT))
---@hook SetAutomaticFrameAdvance
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:SetAutomaticFrameAdvance
---@param enable boolean Whether or not to set automatic frame advancing.
function Entity:SetAutomaticFrameAdvance(enable) end

---Sets the blood color this entity uses.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetBloodColor
---@param bloodColor BLOOD_COLOR An integer corresponding to Enums/BLOOD_COLOR.
function Entity:SetBloodColor(bloodColor) end

---Sets the currently active [Sub Model ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#submodels) for the Body Group corresponding to the given [Body Group ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#id) of the [Entity's](https://wiki.facepunch.com/gmod/Entity) model.
---
--- Bodygroups, for which [Entity:GetBodygroupCount](https://wiki.facepunch.com/gmod/Entity:GetBodygroupCount) returns `1` or less are considered invalid, and will have no effect in-game.
--- **NOTE**: When used on a Weapon, this will modify its viewmodel.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetBodygroup
---@param bodyGroupId number The Body Group ID to set the Sub Model ID of.
--- Body Group IDs start at `0`.
---@param subModelId number The Sub Model ID to set as active for this Body Group.
--- Sub Model IDs start at `0`.
function Entity:SetBodygroup(bodyGroupId, subModelId) end

---Sets the [Entity's](https://wiki.facepunch.com/gmod/Entity) active Sub Models via a string of [Sub Model IDs](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#submodels) in order from the first [Body Group ID](https://wiki.facepunch.com/gmod/Structures/BodyGroupData#id) to the last.
---
--- This is a convenience function for [Entity:SetBodygroup](https://wiki.facepunch.com/gmod/Entity:SetBodygroup).
--- **NOTE**: When used on a Weapon, this will modify its viewmodel.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetBodyGroups
---@param subModelIds string The Sub Model IDs to activate for each Body Group on the Entity's model.
---
--- The first character corresponds with Body Group ID `0`, the second character coressponds to Body Group ID `1`, etc.
---
--- To support Body Groups with more than `0`-`9` options, values above `9` are represented using alphabetical characters starting with `a` and ending with `z`.
function Entity:SetBodyGroups(subModelIds) end

---Sets the specified value on the bone controller with the given ID of this entity, it's used in HL1 to change the head rotation of NPCs, turret aiming and so on.
---
--- **NOTE**: This is the precursor of pose parameters, and only works for Half Life 1: Source models supporting it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetBoneController
---@param boneControllerID number The ID of the bone controller to set the value to.
--- Goes from 0 to 3.
---@param value number The value to set on the specified bone controller.
function Entity:SetBoneController(boneControllerID, value) end

---Sets the bone matrix of given bone to given matrix. See also [Entity:GetBoneMatrix](https://wiki.facepunch.com/gmod/Entity:GetBoneMatrix). Will cause a uncatchable error when used on `__INVALIDBONE__` bones, see the examples on a way to prevent this.
---
--- **NOTE**: Despite existing serverside, it does nothing.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetBoneMatrix
---@param boneid number The ID of the bone
---@param matrix VMatrix The matrix to set.
function Entity:SetBoneMatrix(boneid, matrix) end

---Sets the bone position and angles.
---
--- 	For changes to happen, this must be called in a [rendering](https://wiki.facepunch.com/gmod/Render_Order) hook.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetBonePosition
---@param bone number The bone ID to manipulate
---@param pos Vector The position to set
---@param ang Angle The angles to set
function Entity:SetBonePosition(bone, pos, ang) end

---Sets the collision bounds for the entity, which are used for triggers ([Entity:SetTrigger](https://wiki.facepunch.com/gmod/Entity:SetTrigger), [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch)), and collision (If [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid) set as [SOLID_BBOX](https://wiki.facepunch.com/gmod/Enums/SOLID)).
---
--- Input bounds are relative to [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos)!
--- See also [Entity:SetCollisionBoundsWS](https://wiki.facepunch.com/gmod/Entity:SetCollisionBoundsWS).
---
--- **NOTE**: Player collision bounds are reset every frame to player's [Player:SetHull](https://wiki.facepunch.com/gmod/Player:SetHull) values.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds
---@param mins Vector The minimum vector of the bounds.
---@param maxs Vector The maximum vector of the bounds.
function Entity:SetCollisionBounds(mins, maxs) end

---A convenience function that sets the collision bounds for the entity in world space coordinates by transforming given vectors to entity's local space and passing them to [Entity:SetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetCollisionBoundsWS
---@param vec1 Vector The first vector of the bounds.
---@param vec2 Vector The second vector of the bounds.
function Entity:SetCollisionBoundsWS(vec1, vec2) end

---Sets the entity's collision group.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetCollisionGroup
---@param group COLLISION_GROUP Collision group of the entity, see Enums/COLLISION_GROUP
function Entity:SetCollisionGroup(group) end

---Sets the color of an entity.
---
--- Some entities may need a custom [render mode](https://wiki.facepunch.com/gmod/Enums/RENDERMODE) set for transparency to work. See example 2.
--- Entities also must have a proper [render group](https://wiki.facepunch.com/gmod/Enums/RENDERGROUP) set for transparency to work.
---
--- When rendering a model manually via [Entity:SetNoDraw](https://wiki.facepunch.com/gmod/Entity:SetNoDraw) inside [ENTITY:Draw](https://wiki.facepunch.com/gmod/ENTITY:Draw), you may need to use [render.SetColorModulation](https://wiki.facepunch.com/gmod/render.SetColorModulation) in the render hook (where you call [Entity:DrawModel](https://wiki.facepunch.com/gmod/Entity:DrawModel)) instead.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetColor
---@param color? Color The color to set. Uses the Color.
function Entity:SetColor(color) end

---Sets the color of an entity without usage of a [Global.Color](https://wiki.facepunch.com/gmod/Global.Color) object.
---
--- **INTERNAL**: Used internally to implement [Entity:SetColor](https://wiki.facepunch.com/gmod/Entity:SetColor).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetColor4Part
---@param r number
---@param g number
---@param b number
---@param a number
function Entity:SetColor4Part(r, g, b, a) end

---Sets the creator of this entity. This is set automatically in Sandbox gamemode when spawning SENTs, but is never used/read by default.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetCreator
---@param ply? Player The creator
function Entity:SetCreator(ply) end

---Marks the entity to call [GM:ShouldCollide](https://wiki.facepunch.com/gmod/GM:ShouldCollide). Not to be confused with [Entity:EnableCustomCollisions](https://wiki.facepunch.com/gmod/Entity:EnableCustomCollisions).
--- 		**NOTE**: Make sure to use [Entity:CollisionRulesChanged](https://wiki.facepunch.com/gmod/Entity:CollisionRulesChanged) after changing this value.
--- 			Otherwise it can cause crashes.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetCustomCollisionCheck
---@param enable boolean Enable or disable the custom collision check
function Entity:SetCustomCollisionCheck(enable) end

---Sets the progress of the current animation to a specific value between 0 and 1.
---
--- Viewmodels overwrite their animation cycle every frame, for prediction/interpolation purposes.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetCycle
---@param value number The desired cycle value
function Entity:SetCycle(value) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified angle on the entity's datatable.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetDTAngle
---@param key number Goes from 0 to 31.
---@param ang Angle The angle to write on the entity's datatable.
function Entity:SetDTAngle(key, ang) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified bool on the entity's datatable.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetDTBool
---@param key number Goes from 0 to 31.
---@param bool boolean The boolean to write on the entity's metatable.
function Entity:SetDTBool(key, bool) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified entity on this entity's datatable.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetDTEntity
---@param key number Goes from 0 to 31.
---@param ent Entity The entity to write on this entity's datatable.
function Entity:SetDTEntity(key, ent) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified float on the entity's datatable.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetDTFloat
---@param key number Goes from 0 to 31.
---@param float number The float to write on the entity's datatable.
function Entity:SetDTFloat(key, float) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified integer on the entity's datatable.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetDTInt
---@param key number Goes from 0 to 31.
---@param integer number The integer to write on the entity's datatable. This will be cast to a 32-bit signed integer internally.
function Entity:SetDTInt(key, integer) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified string on the entity's datatable.
---
--- **NOTE**: The length of these strings are capped at 512 characters.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetDTString
---@param key number Goes from 0 to 3.
---@param str string The string to write on the entity's datatable, can't be more than 512 characters per string.
function Entity:SetDTString(key, str) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified vector on the entity's datatable.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetDTVector
---@param key number Goes from 0 to 31.
---@param vec Vector The vector to write on the entity's datatable.
function Entity:SetDTVector(key, vec) end

---Sets the elasticity of this entity, used by some flying entities such as the Helicopter NPC to determine how much it should bounce around when colliding.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetElasticity
---@param elasticity number The elasticity to set.
function Entity:SetElasticity(elasticity) end

---Allows you to set the Start or End entity attachment for the rope.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetEntity
---@param name string The name of the variable to modify.
--- Accepted names are StartEntity and EndEntity.
---@param entity Entity The entity to apply to the specific attachment.
function Entity:SetEntity(name, entity) end

---Sets the position an entity's eyes look toward. This works as an override for default behavior. Set to `0,0,0` to disable the override.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetEyeTarget
---@param pos Vector For NPCs and all other entities except ragdolls - the **world position** for the entity to look towards
---
--- For ragdolls specifically - a **local position** in front of their `eyes` attachment.
function Entity:SetEyeTarget(pos) end

---Sets the scale of all the flexes of this entity. See [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetFlexScale
---@param scale number The new flex scale to set to
function Entity:SetFlexScale(scale) end

---Sets the weight/value of given flex controller.
---
--- Setting flex weights spawns an internal networked entity (one per entity face posed) to accommodate networking to clients.
---
--- **NOTE**: Only `96` flex controllers can be set! Flex controllers on models with higher amounts will not be accessible.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetFlexWeight
---@param flex number The ID of the flex to modify weight of.  The range is between `0` and Entity:GetFlexNum - 1.
---@param weight number The new weight to set.
---
--- The range is [0,1] for entities with Entity:HasFlexManipulatior, and the model-defined input range otherwise (Entity:GetFlexBounds)
---
--- Exceeding the range is allowed, and will amplify the effect (to possibly bad results), exactly like Entity:SetFlexScale does.
function Entity:SetFlexWeight(flex, weight) end

---Sets friction multiplier for this entity when sliding against a surface. Entities default to 1 (100%) and can be higher.
---
--- This may not affect all entities, but does work for players (the range is 0 to 10), as well as other entities using [MOVETYPE_STEP ](https://wiki.facepunch.com/gmod/Enums/MOVETYPE#MOVETYPE_STEP_)
---
--- This only multiplies the friction of the entity, to change the value itself use [PhysObj:SetMaterial](https://wiki.facepunch.com/gmod/PhysObj:SetMaterial).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetFriction
---@param friction number Friction multiplier
function Entity:SetFriction(friction) end

---Sets the gravity multiplier of the entity.
---
--- This may not affect affect all entities, but does affect players, and entities with [MOVETYPE_FLYGRAVITY](https://wiki.facepunch.com/gmod/Enums/MOVETYPE#MOVETYPE_FLYGRAVITY), such as projectiles.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetGravity
---@param multiplier number By how much to multiply the gravity. `1` is normal gravity, `0.5` is half-gravity, etc.
function Entity:SetGravity(multiplier) end

---Sets the ground the entity is standing on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetGroundEntity
---@param ground Entity The ground entity.
function Entity:SetGroundEntity(ground) end

---Sets the health of the entity.
---
--- **NOTE**: You may want to take [Entity:GetMaxHealth](https://wiki.facepunch.com/gmod/Entity:GetMaxHealth) into account when calculating what to set health to, in case a gamemode has a different max health than 100.
--- In some cases, setting health only serverside can cause hitches in movement, for example if something is modifying the player speed based on health.
--- To solve this issue, it is better to set it shared in a predicted hook.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetHealth
---@param newHealth number New health value.
function Entity:SetHealth(newHealth) end

---Sets the current Hitbox set for the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetHitboxSet
---@param id number The new hitbox set to set. Can be a name as a string, or the ID as a number.
---
--- If the operation failed, the function will silently fail.
function Entity:SetHitboxSet(id) end

---Enables or disable the inverse kinematic usage of this entity.
--- 		**WARNING**: Calling this with false outside of [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) requires a model change to take effect.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetIK
---@param useIK? boolean The state of the IK.
function Entity:SetIK(useIK) end

---Sets Hammer key values on an entity.
---
--- You can look up which entities have what key values on the [Valve Developer Community](https://developer.valvesoftware.com/wiki/) on entity pages. A  list of basic entities can be found [here](https://developer.valvesoftware.com/wiki/List_of_entities).
---
--- Alternatively you can look at the `.fgd` files shipped with Garry's Mod in the `bin/` folder with a text editor to see the key values as they appear in Hammer.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetKeyValue
---@param key string The internal key name
---@param value string|number The value to set
function Entity:SetKeyValue(key, value) end

---This allows the entity to be lag compensated during [Player:LagCompensation](https://wiki.facepunch.com/gmod/Player:LagCompensation).
---
--- **NOTE**: Players are lag compensated by default and there's no need to call this function for them.
---
--- It's best to not enable lag compensation on parented entities, as the system does not handle it that well ( they will be moved back but then the entity will lag behind ).
--- Parented entities move back with the parent if it's lag compensated, so if you are making some kind of armor piece you shouldn't do anything.
---
--- As a side note for parented entities, if your entity can be shot at, keep in mind that its collision bounds need to be bigger than the bone's hitbox the entity is parented to, or hull/line traces ( such as the crowbar attack or bullets ) might not hit at all.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetLagCompensated
---@param enable boolean Whether the entity should be lag compensated or not.
function Entity:SetLagCompensated(enable) end

---Sets the autokill flag on the layer, making the layer be automatically removed once the animation playback finishes.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerAutokill
---@param layerID number The layer ID to change.
---@param autoKill boolean Whether to set or unset the autokill flag.
function Entity:SetLayerAutokill(layerID, autoKill) end

---Sets the interval the layer will fully blend in since startup, based on [Entity:GetLayerCycle](https://wiki.facepunch.com/gmod/Entity:GetLayerCycle). Setting this above 0 will enable internal blending of [Entity:GetLayerWeight](https://wiki.facepunch.com/gmod/Entity:GetLayerWeight).
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
--- Enabling this will prevent looping gestures with autokill disabled to be removed with [Entity:RemoveGesture](https://wiki.facepunch.com/gmod/Entity:RemoveGesture) or [Entity:RemoveAllGestures](https://wiki.facepunch.com/gmod/Entity:RemoveAllGestures) because layer removal functions mark the layer to decrement [Entity:GetLayerWeight](https://wiki.facepunch.com/gmod/Entity:GetLayerWeight) and unallocate layer ID in next frames if the layer weight is `0`, but blending functions will still keep manipulating layer weight.
---
--- Therefore; before calling layer cleanup functions, make sure both [Entity:SetLayerBlendIn](https://wiki.facepunch.com/gmod/Entity:SetLayerBlendIn) and [Entity:SetLayerBlendOut](https://wiki.facepunch.com/gmod/Entity:SetLayerBlendOut) are set to `0`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerBlendIn
---@param layerID number The Layer ID
---@param blendIn number Blend range from 0 to 1.
function Entity:SetLayerBlendIn(layerID, blendIn) end

---Sets the interval the layer will fully blend out, based on [Entity:GetLayerCycle](https://wiki.facepunch.com/gmod/Entity:GetLayerCycle). Setting this above 0 will enable internal blending of [Entity:GetLayerWeight](https://wiki.facepunch.com/gmod/Entity:GetLayerWeight).
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
--- Enabling this will prevent looping gestures with autokill disabled to be removed with [Entity:RemoveGesture](https://wiki.facepunch.com/gmod/Entity:RemoveGesture) or [Entity:RemoveAllGestures](https://wiki.facepunch.com/gmod/Entity:RemoveAllGestures) because layer removal functions mark the layer to decrement [Entity:GetLayerWeight](https://wiki.facepunch.com/gmod/Entity:GetLayerWeight) and unallocate layer ID in next frames if the layer weight is `0`, but blending functions will still keep manipulating layer weight.
---
--- Therefore; before calling layer cleanup functions, make sure both [Entity:SetLayerBlendIn](https://wiki.facepunch.com/gmod/Entity:SetLayerBlendIn) and [Entity:SetLayerBlendOut](https://wiki.facepunch.com/gmod/Entity:SetLayerBlendOut) are set to `0`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerBlendOut
---@param layerID number The Layer ID
---@param blendOut number Blend range from 0 to 1.
function Entity:SetLayerBlendOut(layerID, blendOut) end

---Sets the animation cycle/frame of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerCycle
---@param layerID number The Layer ID
---@param cycle number The new animation cycle/frame for given layer.
function Entity:SetLayerCycle(layerID, cycle) end

---Sets the duration of given layer. This internally overrides the [Entity:SetLayerPlaybackRate](https://wiki.facepunch.com/gmod/Entity:SetLayerPlaybackRate).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
--- This stops layer playback if layer sequence conists of 1 frame. Use `Entity:SetLayerPlaybackRate(layerID,1/duration)` instead.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerDuration
---@param layerID number The Layer ID
---@param duration number The new duration of the layer in seconds.
function Entity:SetLayerDuration(layerID, duration) end

---Sets whether the layer should loop or not.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerLooping
---@param layerID number The Layer ID
---@param loop boolean Whether the layer should loop or not.
function Entity:SetLayerLooping(layerID, loop) end

---Sets the layer playback rate. See also [Entity:SetLayerDuration](https://wiki.facepunch.com/gmod/Entity:SetLayerDuration).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerPlaybackRate
---@param layerID number The Layer ID
---@param rate number The new playback rate.
function Entity:SetLayerPlaybackRate(layerID, rate) end

---Sets the priority of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerPriority
---@param layerID number The Layer ID
---@param priority number The new priority of the layer.
function Entity:SetLayerPriority(layerID, priority) end

---Sets the sequence of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerSequence
---@param layerID number The Layer ID.
---@param seq number The sequenceID to set. See Entity:LookupSequence.
function Entity:SetLayerSequence(layerID, seq) end

---Sets the layer weight. This influences how strongly the animation should be overriding the normal animations of the entity.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
--- **NOTE**: Setting either [Entity:SetLayerBlendIn](https://wiki.facepunch.com/gmod/Entity:SetLayerBlendIn) or [Entity:SetLayerBlendOut](https://wiki.facepunch.com/gmod/Entity:SetLayerBlendOut) above 0 will turn on automatic weight blending, so you shouldn't be using this if you use any of above.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLayerWeight
---@param layerID number The Layer ID
---@param weight number The new layer weight.
function Entity:SetLayerWeight(layerID, weight) end

---This forces an entity to use the bone transformation behaviour from versions prior to **8 July 2014**.
---
--- This behaviour affects [Entity:EnableMatrix](https://wiki.facepunch.com/gmod/Entity:EnableMatrix) and [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale) and is incorrect, therefore this function be used exclusively as a quick fix for old scripts that rely on it.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetLegacyTransform
---@param enabled boolean Whether the entity should use the old bone transformation behaviour or not.
function Entity:SetLegacyTransform(enabled) end

---Sets the entity to be used as the light origin position for this entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetLightingOriginEntity
---@param lightOrigin Entity The lighting entity.
function Entity:SetLightingOriginEntity(lightOrigin) end

---Sets angles relative to angles of [Entity:GetParent](https://wiki.facepunch.com/gmod/Entity:GetParent)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLocalAngles
---@param ang Angle The local angle
function Entity:SetLocalAngles(ang) end

---Sets the entity's angular velocity (rotation speed).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLocalAngularVelocity
---@param angVel Angle The angular velocity to set.
function Entity:SetLocalAngularVelocity(angVel) end

---Sets local position relative to the parented position. This is for use with [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent) to offset position.
---
--- This is also used by NPCs for interpolated movement. If you use [Entity:SetPos](https://wiki.facepunch.com/gmod/Entity:SetPos) for step movement, your NPC will snap to position instead.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLocalPos
---@param pos Vector The local position
function Entity:SetLocalPos(pos) end

---Sets the entity's local velocity which is their velocity due to movement in the world from forces such as gravity. Does not include velocity from entity-on-entity collision or other world movement.
---
--- **WARNING**: Same as [Entity:SetAbsVelocity](https://wiki.facepunch.com/gmod/Entity:SetAbsVelocity), but clamps the given velocity, and is not recommended to be used because of that.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetLocalVelocity
---@param velocity Vector The new velocity to set.
function Entity:SetLocalVelocity(velocity) end

---Sets the Level Of Detail model to use with this entity. This may not work for all models if the model doesn't include any LOD sub models.
---
--- This function works exactly like the clientside r_lod convar and takes priority over it.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetLOD
---@param lod? number The Level Of Detail model ID to use. -1 leaves the engine to automatically set the Level of Detail.
---
--- The Level Of Detail may range from 0 to 8, with 0 being the highest quality and 8 the lowest.
function Entity:SetLOD(lod) end

---Sets the rendering material override of the entity.
---
--- To set a Lua material created with [Global.CreateMaterial](https://wiki.facepunch.com/gmod/Global.CreateMaterial), just prepend a "!" to the material name.
---
--- If you wish to override a single material on the model, use [Entity:SetSubMaterial](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial) instead.
---
--- **NOTE**: To apply materials to models, that material **must** have **VertexLitGeneric** shader. For that reason you cannot apply map textures onto models, map textures use a different material shader - **LightmappedGeneric**, which can be used on brush entities.
---
--- The server's value takes priority on the client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetMaterial
---@param materialName string New material name. Use an empty string ("") to reset to the default materials.
function Entity:SetMaterial(materialName) end

---Sets the maximum health for entity. Note, that you can still set entity's health above this amount with [Entity:SetHealth](https://wiki.facepunch.com/gmod/Entity:SetHealth).
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetMaxHealth
---@param maxhealth number What the max health should be
function Entity:SetMaxHealth(maxhealth) end

---Sets the NPC max yaw speed. Internally sets the `m_fMaxYawSpeed` variable which is polled by the engine.
---
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:SetMaxYawSpeed
---@param maxyaw number The new max yaw value to set
function Entity:SetMaxYawSpeed(maxyaw) end

---Sets the model of the entity.
---
--- This does not update the physics of the entity - see [Entity:PhysicsInit](https://wiki.facepunch.com/gmod/Entity:PhysicsInit).
---
--- **WARNING**: This silently fails when given an empty string.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetModel
---@param modelName string New model value.
function Entity:SetModel(modelName) end

---Alter the model name returned by [Entity:GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel). Does not affect the entity's actual model.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetModelName
---@param modelname string The new model name.
function Entity:SetModelName(modelname) end

---Uniformly scales the model of the entity, if the entity is a [Player](https://wiki.facepunch.com/gmod/Player) or an [NPC](https://wiki.facepunch.com/gmod/NPC) the hitboxes will be scaled as well.
---
--- To resize the entity non-uniformly, along any axis, use [Entity:EnableMatrix](https://wiki.facepunch.com/gmod/Entity:EnableMatrix) instead.
---
--- For some entities (Such as `prop_physics` and `anim` type [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities)), calling [Entity:Activate](https://wiki.facepunch.com/gmod/Entity:Activate) after this will scale the collision bounds and [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) as well; be wary as there's no optimization being done internally and highly complex collision models might crash the server.
---
--- Client-side trace detection seems to mess up if `deltaTime` is set to anything but zero. A very small decimal can be used instead of zero to solve this issue.
---
--- If your old scales are wrong, use [Entity:SetLegacyTransform](https://wiki.facepunch.com/gmod/Entity:SetLegacyTransform) as a quick fix.
---
--- **NOTE**: If you do not want the physics to be affected by [Entity:Activate](https://wiki.facepunch.com/gmod/Entity:Activate), you can use [Entity:ManipulateBoneScale](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneScale)`( 0, Vector( scale, scale, scale ) )` instead.
---
---  On the client, `anim` types' collision testing prediction fails for changed model scales: you can use `cl_showerror 2` to see by how much. Essentially, the client will freak out when you stand/run past on a Scripted Entity or prop that has been modified using this method.
---
--- This disables IK.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetModelScale
---@param scale number A float to scale the model by. 0 will not draw anything. A number less than 0 will draw the model inverted.
---@param deltaTime? number Transition time of the scale change, set to 0 to modify the scale right away. To avoid issues with client-side trace detection this must be set, and can be an extremely low number to mimic a value of 0 such as .000001.
function Entity:SetModelScale(scale, deltaTime) end

---Sets the move collide type of the entity. The move collide is the way a physics object reacts to hitting an object - will it bounce, slide?
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetMoveCollide
---@param moveCollideType number The move collide type, see Enums/MOVECOLLIDE
function Entity:SetMoveCollide(moveCollideType) end

---Sets the Movement Parent of an entity to another entity.
---
--- Similar to [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent), except the object's coordinates are not translated automatically before parenting.
---
--- Does nothing on client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetMoveParent
---@param Parent Entity The entity to change this entity's Movement Parent to.
function Entity:SetMoveParent(Parent) end

---Sets the entity's move type. This should be called before initializing the physics object on the entity, unless it will override SetMoveType such as [Entity:PhysicsInitBox](https://wiki.facepunch.com/gmod/Entity:PhysicsInitBox).
---
--- Despite existing on client, it doesn't actually do anything on client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetMoveType
---@param movetype number The new movetype, see Enums/MOVETYPE
function Entity:SetMoveType(movetype) end

---Sets the mapping name of the entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetName
---@param mappingName string The name to set for the entity.
function Entity:SetName(mappingName) end

---Alters the entity's perceived serverside angle on the client.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkAngles
---@param angle Angle Networked angle.
function Entity:SetNetworkAngles(angle) end

---Sets a networked angle value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Angle](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Angle) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWAngle](https://wiki.facepunch.com/gmod/Entity:SetNWAngle) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2Angle
---@param key string The key to associate the value with
---@param value Angle The value to set
---@deprecated You should be using Entity:SetNW2Angle instead.
function Entity:SetNetworked2Angle(key, value) end

---Sets a networked boolean value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Bool](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Bool) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWBool](https://wiki.facepunch.com/gmod/Entity:SetNWBool) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2Bool
---@param key string The key to associate the value with
---@param value boolean The value to set
---@deprecated You should be using Entity:SetNW2Bool instead.
function Entity:SetNetworked2Bool(key, value) end

---Sets a networked entity value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Entity](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Entity) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWEntity](https://wiki.facepunch.com/gmod/Entity:SetNWEntity) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2Entity
---@param key string The key to associate the value with
---@param value Entity The value to set
---@deprecated You should be using Entity:SetNW2Entity instead.
function Entity:SetNetworked2Entity(key, value) end

---Sets a networked float (number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Float](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Float) both from client and server.
---
--- Unlike [Entity:SetNetworked2Int](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Int), floats don't have to be whole numbers.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWFloat](https://wiki.facepunch.com/gmod/Entity:SetNWFloat) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2Float
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNetworked2Float(key, value) end

---Sets a networked integer (whole number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Int](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Int) both from client and server.
---
--- See [Entity:SetNW2Float](https://wiki.facepunch.com/gmod/Entity:SetNW2Float) for numbers that aren't integers.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS.
--- The integer has a 32 bit limit. Use [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2Int
---@param key string The key to associate the value with
---@param value number The value to set
---@deprecated You should be using Entity:SetNW2Int instead.
function Entity:SetNetworked2Int(key, value) end

---Sets a networked string value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2String](https://wiki.facepunch.com/gmod/Entity:GetNetworked2String) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWString](https://wiki.facepunch.com/gmod/Entity:SetNWString) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2String
---@param key string The key to associate the value with
---@param value string The value to set, up to 511 characters.
---@deprecated You should be using Entity:SetNW2String instead.
function Entity:SetNetworked2String(key, value) end

---Sets a networked value on the entity.
--[[

The value can then be accessed with [Entity:GetNetworked2Var](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Var) both from client and server.

| Allowed Types   |  
| --------------- |  
| Angle           |  
| Boolean         |  
| Entity          |  
| Float           |  
| Int             |  
| String          |  
| Vector          |  

**WARNING**: Trying to network a type that is not listed above leads to the value not being networked!

**NOTE**: Running this function clientside will only set it for the client it is called on.  
The value will only be networked if it isn't the same as the current value and unlike SetNW*
the value will only ne networked once and not every 10 seconds.
--]]
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2Var
---@param key string The key to associate the value with
---@param value any The value to set
---@deprecated You should be using Entity:SetNW2Var instead.
function Entity:SetNetworked2Var(key, value) end

---Sets a function to be called when the NW2Var changes. Internally uses [GM:EntityNetworkedVarChanged](https://wiki.facepunch.com/gmod/GM:EntityNetworkedVarChanged) to call the function.
--- **NOTE**: Only one NW2VarProxy can be set per-var
--- Running this function clientside will only set it for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2VarProxy
---@param name string The name of the NW2Var to add callback for.
---@param callback fun(ent: Entity, name: string, oldval: any, newval: any) The function to be called when the NW2Var changes.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NW2Var that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:SetNetworked2VarProxy(name, callback) end

---Sets a networked vector value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Vector](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Vector) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWVector](https://wiki.facepunch.com/gmod/Entity:SetNWVector) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworked2Vector
---@param key string The key to associate the value with
---@param value Vector The value to set
---@deprecated You should be using Entity:SetNW2Vector instead.
function Entity:SetNetworked2Vector(key, value) end

---Sets a networked angle value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedAngle](https://wiki.facepunch.com/gmod/Entity:GetNetworkedAngle) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedAngle
---@param key string The key to associate the value with
---@param value? Angle The value to set
---@deprecated You should use Entity:SetNWAngle instead.
function Entity:SetNetworkedAngle(key, value) end

---Sets a networked boolean value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedBool](https://wiki.facepunch.com/gmod/Entity:GetNetworkedBool) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedBool
---@param key string The key to associate the value with
---@param value? boolean The value to set
---@deprecated You should use Entity:SetNWBool instead.
function Entity:SetNetworkedBool(key, value) end

---Sets a networked entity value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedEntity](https://wiki.facepunch.com/gmod/Entity:GetNetworkedEntity) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedEntity
---@param key string The key to associate the value with
---@param value? Entity The value to set
---@deprecated You should use Entity:SetNWEntity instead.
function Entity:SetNetworkedEntity(key, value) end

---Sets a networked float value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedFloat](https://wiki.facepunch.com/gmod/Entity:GetNetworkedFloat) both from client and server.
---
--- Seems to be the same as [Entity:GetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt).
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedFloat
---@param key string The key to associate the value with
---@param value? number The value to set
---@deprecated You should use Entity:SetNWFloat instead.
function Entity:SetNetworkedFloat(key, value) end

---Sets a networked integer value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedInt
---@param key string The key to associate the value with
---@param value? number The value to set
---@deprecated You should use Entity:SetNWInt instead.
function Entity:SetNetworkedInt(key, value) end

---Sets a networked number at the specified index on the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedNumber
---@param index any The index that the value is stored in.
---@param number number The value to network.
---@deprecated You should be using Entity:SetNWFloat instead.
function Entity:SetNetworkedNumber(index, number) end

---Sets a networked string value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedString](https://wiki.facepunch.com/gmod/Entity:GetNetworkedString) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedString
---@param key string The key to associate the value with
---@param value? string The value to set
---@deprecated You should use Entity:SetNWString instead.
function Entity:SetNetworkedString(key, value) end

---Sets a networked value on the entity.
--[[

The value can then be accessed with [Entity:GetNetworkedVar](https://wiki.facepunch.com/gmod/Entity:GetNetworkedVar) both from client and server.

| Allowed Types   |  
| --------------- |  
| Angle           |  
| Boolean         |  
| Entity          |  
| Float           |  
| Int             |  
| String          |  
| Vector          |  

**WARNING**: Trying to network a type that is not listed above leads to the value not being networked!  
the value will only be updated clientside if the entity is or enters the clients PVS.

**NOTE**: Running this function clientside will only set it for the client it is called on.  
The value will only be networked if it isn't the same as the current value and unlike SetNW*
the value will only be networked once and not every 10 seconds.
--]]
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedVar
---@param key string The key to associate the value with
---@param value any The value to set
function Entity:SetNetworkedVar(key, value) end

---Sets callback function to be called when given NWVar changes.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedVarProxy
---@param name string The name of the NWVar to add callback for.
---@param callback fun(ent: Entity, name: string, oldval: any, newval: any) The function to be called when the NWVar changes.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NWVar that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
---@deprecated You should be using Entity:SetNWVarProxy instead.
function Entity:SetNetworkedVarProxy(name, callback) end

---Sets a networked vector value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedVector](https://wiki.facepunch.com/gmod/Entity:GetNetworkedVector) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkedVector
---@param key string The key to associate the value with
---@param value? Vector The value to set
---@deprecated You should use Entity:SetNWVector instead.
function Entity:SetNetworkedVector(key, value) end

---A helper function to allow setting [Network Variables](https://wiki.facepunch.com/gmod/Networking_Entities) via [Entity:SetKeyValue](https://wiki.facepunch.com/gmod/Entity:SetKeyValue), primarily to allow mappers to set them from Hammer.
---
--- Meant to be called from [ENTITY:KeyValue](https://wiki.facepunch.com/gmod/ENTITY:KeyValue), see example.
---
--- See also [Entity:SetNetworkVarsFromMapInput](https://wiki.facepunch.com/gmod/Entity:SetNetworkVarsFromMapInput) for a function that does similar thing for map inputs instead.
---
--- **NOTE**: This function will only work on entities which had [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) called on them, which is done automatically for players and all [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkKeyValue
---@param key string The key-value name, or simply the "key".
---@param value string The key-value value.
---@return boolean # Whether a network variable was set successfully
function Entity:SetNetworkKeyValue(key, value) end

---Virtually changes entity position for clients. Does almost the same thing as [Entity:SetPos](https://wiki.facepunch.com/gmod/Entity:SetPos) when used serverside.
--- **NOTE**: Unlike [Entity:SetPos](https://wiki.facepunch.com/gmod/Entity:SetPos) it directly changes the position without checking for any unreasonable position.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkOrigin
---@param origin Vector The position to make clients think this entity is at.
function Entity:SetNetworkOrigin(origin) end

---A helper function to allow setting [Network Variables](https://wiki.facepunch.com/gmod/Networking_Entities) via [Entity:Fire](https://wiki.facepunch.com/gmod/Entity:Fire), primarily to allow mappers to set them from Hammer via Map I/O logic.
---
--- Meant to be called from [ENTITY:AcceptInput](https://wiki.facepunch.com/gmod/ENTITY:AcceptInput), see example.
---
--- See also [Entity:SetNetworkKeyValue](https://wiki.facepunch.com/gmod/Entity:SetNetworkKeyValue) for a function that does similar thing, but for entity key-values in Hammer instead.
---
--- **NOTE**: This function will only work on entities which had [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) called on them, which is done automatically for players and all [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetNetworkVarsFromMapInput
---@param name string The name of the Map I/O input, including the `Set` prefix.
---@param param string The input parameter.
---@return boolean # Whether a network variable was set successfully
function Entity:SetNetworkVarsFromMapInput(name, param) end

---Sets the next time the clientside [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) is called.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetNextClientThink
---@param nextthink number The next time, relative to Global.CurTime, to execute the ENTITY:Think clientside.
function Entity:SetNextClientThink(nextthink) end

---Sets if the entity's model should render at all.
---
--- If set on the server, this entity will no longer network to clients, and for all intents and purposes cease to exist clientside.
---
--- The entity can still be manually rendered via [Entity:DrawModel](https://wiki.facepunch.com/gmod/Entity:DrawModel) in appropriate hooks.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNoDraw
---@param shouldNotDraw boolean true disables drawing
function Entity:SetNoDraw(shouldNotDraw) end

---Sets whether the entity is solid or not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNotSolid
---@param IsNotSolid boolean True will make the entity not solid, false will make it solid.
function Entity:SetNotSolid(IsNotSolid) end

---Sets the NPC classification. Internally sets the `m_iClass` variable which is polled by the engine.
---
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:SetNPCClass
---@param classification number The Enums/CLASS
function Entity:SetNPCClass(classification) end

---Sets a networked angle value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Angle](https://wiki.facepunch.com/gmod/Entity:GetNW2Angle) both from client and server.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWAngle](https://wiki.facepunch.com/gmod/Entity:SetNWAngle) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2Angle
---@param key string The key to associate the value with
---@param value Angle The value to set
function Entity:SetNW2Angle(key, value) end

---Sets a networked boolean value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Bool](https://wiki.facepunch.com/gmod/Entity:GetNW2Bool) both from client and server.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWBool](https://wiki.facepunch.com/gmod/Entity:SetNWBool) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2Bool
---@param key string The key to associate the value with
---@param value boolean The value to set
function Entity:SetNW2Bool(key, value) end

---Sets a networked entity value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Entity](https://wiki.facepunch.com/gmod/Entity:GetNW2Entity) both from client and server.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWEntity](https://wiki.facepunch.com/gmod/Entity:SetNWEntity) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2Entity
---@param key string The key to associate the value with
---@param value Entity The value to set
function Entity:SetNW2Entity(key, value) end

---Sets a networked float (number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Float](https://wiki.facepunch.com/gmod/Entity:GetNW2Float) both from client and server.
---
--- Unlike [Entity:SetNW2Int](https://wiki.facepunch.com/gmod/Entity:SetNW2Int), floats don't have to be whole numbers.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWFloat](https://wiki.facepunch.com/gmod/Entity:SetNWFloat) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2Float
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNW2Float(key, value) end

---Sets a networked integer (whole number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Int](https://wiki.facepunch.com/gmod/Entity:GetNW2Int) both from client and server.
---
--- See [Entity:SetNW2Float](https://wiki.facepunch.com/gmod/Entity:SetNW2Float) for numbers that aren't integers.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS.
--- The integer has a 32 bit limit. Use [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2Int
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNW2Int(key, value) end

---Sets a networked string value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2String](https://wiki.facepunch.com/gmod/Entity:GetNW2String) both from client and server.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWString](https://wiki.facepunch.com/gmod/Entity:SetNWString) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2String
---@param key string The key to associate the value with, up to 1023 characters
---@param value string The value to set, up to 511 characters.
function Entity:SetNW2String(key, value) end

---Sets a networked value on the entity.
--[[

The value can then be accessed with [Entity:GetNW2Var](https://wiki.facepunch.com/gmod/Entity:GetNW2Var) both from client and server.

| Allowed Types   |  
| --------------- |  
| Angle           |  
| Boolean         |  
| Entity          |  
| Float           |  
| Int             |  
| String          |  
| Vector          |  
**WARNING**: Trying to network a type that is not listed above leads to the value not being networked!  
the value will only be updated clientside if the entity is or enters the clients PVS.

You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.

**NOTE**: Running this function clientside will only set it for the client it is called on.  
The value will only be networked if it isn't the same as the current value and unlike SetNW*
the value will only be networked once and not every 10 seconds.
--]]
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2Var
---@param key string The key to associate the value with
---@param value any The value to set
function Entity:SetNW2Var(key, value) end

---Sets a function to be called when the NW2Var changes. Internally uses [GM:EntityNetworkedVarChanged](https://wiki.facepunch.com/gmod/GM:EntityNetworkedVarChanged) to call the function.
--- Alias of [Entity:SetNetworked2VarProxy](https://wiki.facepunch.com/gmod/Entity:SetNetworked2VarProxy)
--- You should not use the NW2 System on entities that are based on a Lua Entity, or else this will be called multiple times and the NW2Var could get mixed up with other ones.
--- **NOTE**: Only one NW2VarProxy can be set per-var
--- Running this function will only set it for the realm it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2VarProxy
---@param key string The key of the NW2Var to add callback for.
---@param callback function The function to be called when the NW2Var changes. It has 4 arguments:
--- * Entity ent - The entity
--- * string name - Name of the NW2Var that has changed
--- * any oldval - The old value
--- * any newval - The new value
function Entity:SetNW2VarProxy(key, callback) end

---Sets a networked vector value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Vector](https://wiki.facepunch.com/gmod/Entity:GetNW2Vector) both from client and server.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWVector](https://wiki.facepunch.com/gmod/Entity:SetNWVector) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNW2Vector
---@param key string The key to associate the value with
---@param value Vector The value to set
function Entity:SetNW2Vector(key, value) end

---Sets a networked angle value on the entity.
---
--- The value can then be accessed with [Entity:GetNWAngle](https://wiki.facepunch.com/gmod/Entity:GetNWAngle) both from client and server.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Angle](https://wiki.facepunch.com/gmod/Entity:SetNW2Angle). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNWAngle
---@param key string The key to associate the value with
---@param value Angle The value to set
function Entity:SetNWAngle(key, value) end

---Sets a networked boolean value on the entity.
---
--- The value can then be accessed with [Entity:GetNWBool](https://wiki.facepunch.com/gmod/Entity:GetNWBool) both from client and server.
--- **WARNING**: There's a 4096 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Bool](https://wiki.facepunch.com/gmod/Entity:SetNW2Bool). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNWBool
---@param key string The key to associate the value with
---@param value boolean The value to set
function Entity:SetNWBool(key, value) end

---Sets a networked entity value on the entity.
---
--- The value can then be accessed with [Entity:GetNWEntity](https://wiki.facepunch.com/gmod/Entity:GetNWEntity) both from client and server.
--- **WARNING**: There's a 4096 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Entity](https://wiki.facepunch.com/gmod/Entity:SetNW2Entity). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNWEntity
---@param key string The key to associate the value with
---@param value Entity The value to set
function Entity:SetNWEntity(key, value) end

---Sets a networked float (number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNWFloat](https://wiki.facepunch.com/gmod/Entity:GetNWFloat) both from client and server.
---
--- Unlike [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt), floats don't have to be whole numbers.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Float](https://wiki.facepunch.com/gmod/Entity:SetNW2Float). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNWFloat
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNWFloat(key, value) end

---Sets a networked integer (whole number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNWInt](https://wiki.facepunch.com/gmod/Entity:GetNWInt) both from client and server.
---
--- See [Entity:SetNWFloat](https://wiki.facepunch.com/gmod/Entity:SetNWFloat) for numbers that aren't integers.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Int](https://wiki.facepunch.com/gmod/Entity:SetNW2Int). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---
--- This function will not round decimal values as it actually networks a float internally.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNWInt
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNWInt(key, value) end

---Sets a networked string value on the entity.
---
--- The value can then be accessed with [Entity:GetNWString](https://wiki.facepunch.com/gmod/Entity:GetNWString) both from client and server.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2String](https://wiki.facepunch.com/gmod/Entity:SetNW2String). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNWString
---@param key string The key to associate the value with
---@param value string The value to set, up to 199 characters.
function Entity:SetNWString(key, value) end

---**NOTE**: Only one NWVarProxy can be set per-var
--- Running this function will only set it for the realm it is called on.
---
--- Sets a function to be called when the NWVar changes.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNWVarProxy
---@param key string The key of the NWVar to add callback for.
---@param callback fun(ent: Entity, name: string, oldval: any, newval: any) The function to be called when the NWVar changes.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NWVar that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:SetNWVarProxy(key, callback) end

---Sets a networked vector value on the entity.
---
--- The value can then be accessed with [Entity:GetNWVector](https://wiki.facepunch.com/gmod/Entity:GetNWVector) both from client and server.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Vector](https://wiki.facepunch.com/gmod/Entity:SetNW2Vector). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetNWVector
---@param key string The key to associate the value with
---@param value Vector The value to set
function Entity:SetNWVector(key, value) end

---Sets the owner of this entity, disabling all physics interaction with it.
---
--- **NOTE**: This function is generally used to disable physics interactions on projectiles being fired by their owner, but can also be used for normal ownership in case physics interactions are not involved at all. The Gravity gun will be able to pick up the entity even if the owner can't collide with it, the Physics gun however will not.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetOwner
---@param owner? Entity The entity to be set as owner.
function Entity:SetOwner(owner) end

---Sets the parent of this entity, making it move with its parent. This will make the child entity non solid, nothing can interact with them, including traces (but [util.TraceHull](https://wiki.facepunch.com/gmod/util.TraceHull) will work).
---
--- All children of the parent get removed whenever it gets removed.
---
--- **NOTE**: This does not work on [the world](https://wiki.facepunch.com/gmod/game.GetWorld).
---
--- **WARNING**: This can cause undefined physics behavior when used on entities that don't support parenting. See the [Valve developer wiki](https://developer.valvesoftware.com/wiki/Entity_Hierarchy_(parenting)) for more information.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetParent
---@param parent? Entity The entity to parent to. Setting this to nil will clear the parent.
---@param attachmentOrBoneId? number The attachment or bone id to use when parenting. Defaults to -1 or whatever the parent had set previously.
---
--- Use Entity:AddEffects( EF_FOLLOWBONE ) to treat this argument as a Bone ID instead of an Attachment ID. Similar to Entity:FollowBone.
---
--- You must call [Entity:SetMoveType](https://wiki.facepunch.com/gmod/Entity:SetMoveType)( MOVETYPE_NONE ) on the child for this argument to have any effect!
--- Parenting to attachment IDs more than `255` is unsupported and will output a LUA error.
function Entity:SetParent(parent, attachmentOrBoneId) end

---Sets the parent of an entity to another entity with the given physics bone number. Similar to [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent), except it is parented to a physbone. This function is useful mainly for ragdolls.
---
--- **NOTE**: Despite this function being available server side, it doesn't actually do anything server side.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetParentPhysNum
---@param bone number Physics bone number to attach to. Use 0 for objects with only one physics bone. (See Entity:GetPhysicsObjectNum)
function Entity:SetParentPhysNum(bone) end

---Sets whether or not the given entity is persistent. A persistent entity will be saved on server shutdown and loaded back when the server starts up. Additionally, by default persistent entities cannot be grabbed with the physgun and tools cannot be used on them.
---
--- In sandbox, this can be set on an entity by opening the context menu, right clicking the entity, and choosing `"Make Persistent"`.
---
--- **NOTE**: Persistence can only be enabled with the sbox_persist convar, which works as an identifier for the current set of persistent entities. An empty identifier (which is the default value) disables this feature.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetPersistent
---@param persist boolean Whether or not the entity should be persistent.
function Entity:SetPersistent(persist) end

---When called on a constraint entity, sets the two physics objects to be constrained.
---
--- Usage is not recommended as the Constraint library provides easier ways to deal with constraints.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetPhysConstraintObjects
---@param Phys1 PhysObj The first physics object to be constrained.
---@param Phys2 PhysObj The second physics object to be constrained.
function Entity:SetPhysConstraintObjects(Phys1, Phys2) end

---Sets the player who gets credit if this entity kills something with physics damage within the time limit.
---
--- **NOTE**: Only functional on props, "anim" type SENTs, vehicles and a few other select entities.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetPhysicsAttacker
---@param ent Player Player who gets the kills. Setting this to a non-player entity will not work.
---@param timeLimit? number Time in seconds until the entity forgets its physics attacker and prevents it from getting the kill credit.
function Entity:SetPhysicsAttacker(ent, timeLimit) end

---Allows you to set how fast an entity's animation will play, with 1.0 being the default speed.
---
--- It is networked to clients, but limited to [-4,12] range when networking.
---
--- **NOTE**: This function does not affect gestures.
--- 	Use [Entity:SetLayerPlaybackRate](https://wiki.facepunch.com/gmod/Entity:SetLayerPlaybackRate) instead.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetPlaybackRate
---@param fSpeed number How fast the animation will play.
function Entity:SetPlaybackRate(fSpeed) end

---Moves the entity to the specified position.
---
--- Some entities, such as ragdolls, will continually reset their position. Consider using [PhysObj:SetPos](https://wiki.facepunch.com/gmod/PhysObj:SetPos) on every physics object to move ragdolls.
---
--- **NOTE**: If the new position doesn't take effect right away, you can use [Entity:SetupBones](https://wiki.facepunch.com/gmod/Entity:SetupBones) to force it to do so. This issue is especially common when trying to render the same entity twice or more in a single frame at different positions.
---
--- **WARNING**: Entities with [Entity:GetSolid](https://wiki.facepunch.com/gmod/Entity:GetSolid) of `SOLID_BBOX` will have their angles reset!
---
--- This will fail inside of predicted functions called during player movement processing. This includes [WEAPON:PrimaryAttack](https://wiki.facepunch.com/gmod/WEAPON:PrimaryAttack) and [WEAPON:Think](https://wiki.facepunch.com/gmod/WEAPON:Think).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetPos
---@param position Vector The position to move the entity to.
function Entity:SetPos(position) end

---Sets the specified pose parameter to the specified value.
---
--- You should call [Entity:InvalidateBoneCache](https://wiki.facepunch.com/gmod/Entity:InvalidateBoneCache) after calling this function.
---
--- **NOTE**: Avoid calling this in draw hooks, especially when animating things, as it might cause visual artifacts.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetPoseParameter
---@param poseName string|number Name of the pose parameter. Entity:GetPoseParameterName might come in handy here.
---
--- Can also be a pose parameter ID.
---@param poseValue number The value to set the pose to.
function Entity:SetPoseParameter(poseName, poseValue) end

---Sets whether an entity should be predictable or not.
--- When an entity is set as predictable, its DT vars can be changed during predicted hooks. This is useful for entities which can be controlled by player input.
---
--- Any datatable value that mismatches from the server will be overridden and a prediction error will be spewed.
---
--- Weapons are predictable by default, and the drive system uses this function to make the controlled prop predictable as well.
---
--- Visit  for a list of all predicted hooks, and the [Prediction](https://wiki.facepunch.com/gmod/Prediction) page.
--- For further technical information on the subject, visit [valve's wiki](https://developer.valvesoftware.com/wiki/Prediction).
---
--- **NOTE**: This function resets the datatable variables everytime it's called, it should ideally be called when a player starts using the entity and when he stops
---
--- **NOTE**: Entities set as predictable with this function will be unmarked when the user lags and receives a full packet update, to handle such case visit [GM:NotifyShouldTransmit](https://wiki.facepunch.com/gmod/GM:NotifyShouldTransmit)
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetPredictable
---@param setPredictable boolean whether to make this entity predictable or not.
function Entity:SetPredictable(setPredictable) end

---Prevents the server from sending any further information about the entity to a player.
---
--- **NOTE**: You must also call this function on all entity's children. See [Entity:GetChildren](https://wiki.facepunch.com/gmod/Entity:GetChildren).
---
--- [issue tracker](https://github.com/Facepunch/garrysmod-issues/issues/1736)
---
--- [Entity:SetFlexScale](https://wiki.facepunch.com/gmod/Entity:SetFlexScale) and other flex/bone manipulation functions will create a child entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetPreventTransmit
---@param player Player|CRecipientFilter|Player[] The player to stop networking the entity to. Can also be a CRecipientFilter or a table as of March 2024 to affect multiple players at once.
---@param stopTransmitting boolean true to stop the entity from networking, false to make it network again.
function Entity:SetPreventTransmit(player, stopTransmitting) end

---Sets the bone angles. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetRagdollAng
---@param boneid number Bone ID
---@param pos Angle Angle to set
function Entity:SetRagdollAng(boneid, pos) end

---Sets the function to build the ragdoll. This is used alongside Kinect, for more info see `ragdoll_motion` entity in the game files.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction
---@param builder fun(ragdoll: Entity) The build function.
---
--- Function argument(s):
--- * Entity `ragdoll` - The ragdoll to build
function Entity:SetRagdollBuildFunction(builder) end

---Sets the bone position. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetRagdollPos
---@param boneid number Bone ID
---@param pos Vector Position to set
function Entity:SetRagdollPos(boneid, pos) end

---Sets the render angles override for the entity. [Entity:GetAngles](https://wiki.facepunch.com/gmod/Entity:GetAngles) will return the value set by this function until the override is disabled. (This is all this does internally)
---
--- See [Entity:SetRenderOrigin](https://wiki.facepunch.com/gmod/Entity:SetRenderOrigin) for the function to manipulate origin.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetRenderAngles
---@param newAngles? Angle|nil The new render angles to be set to. To disable the override, set to nil.
function Entity:SetRenderAngles(newAngles) end

---Sets the render bounds for the entity.
---
--- For world space coordinate alternative see [Entity:SetRenderBoundsWS](https://wiki.facepunch.com/gmod/Entity:SetRenderBoundsWS).
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetRenderBounds
---@param mins Vector The minimum corner of the bounds, relative to origin of the entity.
---@param maxs Vector The maximum corner of the bounds, relative to origin of the entity.
---@param add? Vector If defined, adds this vector to maxs and subtracts this vector from mins.
function Entity:SetRenderBounds(mins, maxs, add) end

---Sets the render bounds for the entity in world space coordinates. For relative coordinates see [Entity:SetRenderBounds](https://wiki.facepunch.com/gmod/Entity:SetRenderBounds).
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetRenderBoundsWS
---@param mins Vector The minimum corner of the bounds, relative to origin of the world/map.
---@param maxs Vector The maximum corner of the bounds, relative to origin of the world/map.
---@param add? Vector If defined, adds this vector to maxs and subtracts this vector from mins.
function Entity:SetRenderBoundsWS(mins, maxs, add) end

---Used to specify a plane, past which an object will be visually clipped.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetRenderClipPlane
---@param planeNormal Vector The normal of the plane. Anything behind the normal will be clipped.
---@param planePosition number The position of the plane.
function Entity:SetRenderClipPlane(planeNormal, planePosition) end

---Enables the use of clipping planes to "cut" objects.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetRenderClipPlaneEnabled
---@param enabled boolean Enable or disable clipping planes
function Entity:SetRenderClipPlaneEnabled(enabled) end

---Sets entity's render FX. Requires the entitys rendermode to support transparency.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetRenderFX
---@param renderFX number The new render FX to set, see Enums/kRenderFx
function Entity:SetRenderFX(renderFX) end

---Sets the render mode of the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetRenderMode
---@param renderMode number New render mode to set, see Enums/RENDERMODE.
function Entity:SetRenderMode(renderMode) end

---Sets the render origin override, a position where the entity will be rendered at. [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos) will return the value set by this function until the override is disabled. (This is all this does internally)
---
--- See [Entity:SetRenderAngles](https://wiki.facepunch.com/gmod/Entity:SetRenderAngles) for the function to manipulate angles.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetRenderOrigin
---@param newOrigin? Vector|nil The new origin in world coordinates where the entity's model will now be rendered at. To disable the override, set to nil.
function Entity:SetRenderOrigin(newOrigin) end

---Sets a save value for an entity. You can see a full list of an entity's save values by creating it and printing [Entity:GetSaveTable](https://wiki.facepunch.com/gmod/Entity:GetSaveTable).
---
--- See [Entity:GetInternalVariable](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable) for the opposite of this function.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSaveValue
---@param name string Name of the save value to set
---@param value any Value to set
---@return boolean # Key successfully set
function Entity:SetSaveValue(name, value) end

---Sets the entity's model sequence.
---
--- If the specified sequence is already active, the animation will not be restarted. See [Entity:ResetSequence](https://wiki.facepunch.com/gmod/Entity:ResetSequence) for a function that restarts the animation even if it is already playing.
---
--- In some cases you want to run [Entity:ResetSequenceInfo](https://wiki.facepunch.com/gmod/Entity:ResetSequenceInfo) to make this function run.
---
--- **NOTE**: This will not work properly if called directly after calling [Entity:SetModel](https://wiki.facepunch.com/gmod/Entity:SetModel). Consider waiting until the next Tick.
---
--- Will not work on players due to the animations being reset every frame by the base gamemode animation system. See [GM:CalcMainActivity](https://wiki.facepunch.com/gmod/GM:CalcMainActivity).
---
--- For custom scripted entities you will want to apply example from [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) to make animations work.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSequence
---@param sequence number|string The sequence to play.
---
--- If set to a number, the input is treated as the sequence ID.
--- If set to a string, the function will automatically call Entity:LookupSequence to retrieve the sequence ID.
function Entity:SetSequence(sequence) end

---Sets whether or not the entity should make a physics contact sound when it's been picked up by a player.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetShouldPlayPickupSound
---@param playsound? boolean True to play the pickup sound, false otherwise.
function Entity:SetShouldPlayPickupSound(playsound) end

---Sets if entity should create a server ragdoll on death or a client one.
---
--- **NOTE**: This is reset for players when they respawn ([Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn)).
---
--- Player ragdolls created with this enabled will have an owner set, see [Entity:SetOwner](https://wiki.facepunch.com/gmod/Entity:SetOwner) for more information on what effects this has.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetShouldServerRagdoll
---@param serverragdoll boolean Set `true` if ragdoll should be created on server, `false` if on client.
function Entity:SetShouldServerRagdoll(serverragdoll) end

---Sets the skin of the entity.
---
--- [Entity:GetSkin](https://wiki.facepunch.com/gmod/Entity:GetSkin) returns current skin and [Entity:SkinCount](https://wiki.facepunch.com/gmod/Entity:SkinCount) returns amount of skins.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSkin
---@param skinIndex number 0-based index of the skin to use.
function Entity:SetSkin(skinIndex) end

---Sets the solidity of an entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSolid
---@param solid_type number The solid type. See the Enums/SOLID.
function Entity:SetSolid(solid_type) end

--- Custom override: SetSolidFlags accepts FSOLID enum or number since
--- bit.bor() with flag values returns a plain number.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSolidFlags
---@param flags FSOLID|number
function Entity:SetSolidFlags(flags) end

---Sets whether the entity should use a spawn effect when it is created on the client.
---
--- See [Entity:GetSpawnEffect](https://wiki.facepunch.com/gmod/Entity:GetSpawnEffect) for more information on how the effect is applied.
---
--- **NOTE**: This function will only have an effect when the entity spawns. After that it will do nothing even is set to true.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSpawnEffect
---@param spawnEffect boolean Sets if we should show a spawn effect.
function Entity:SetSpawnEffect(spawnEffect) end

---Sets the SpawnFlags to set of an Entity
---
--- SpawnFlags can easily be found on https://developer.valvesoftware.com/wiki/.
---
--- 	**NOTE**: See also [Entity:RemoveSpawnFlags](https://wiki.facepunch.com/gmod/Entity:RemoveSpawnFlags), [Entity:AddSpawnFlags](https://wiki.facepunch.com/gmod/Entity:AddSpawnFlags)
---
--- 		Using [SF Enumerations](https://wiki.facepunch.com/gmod/Enums/SF) won't work, if this function is ran clientside due to the enumerations being defined only Serverside. Use the actual SpawnFlag number.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSpawnFlags
---@param flags number The SpawnFlag to remove from the Entity
function Entity:SetSpawnFlags(flags) end

---Overrides a single material on the model of this entity.
---
--- To set a Lua material created with [Global.CreateMaterial](https://wiki.facepunch.com/gmod/Global.CreateMaterial), just prepend a `!` to the material name.
---
--- 	The index argument limit seems to be larger than 0 to 31.
---
--- The server's value takes priority on the client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSubMaterial
---@param index? number Index of the material to override, acceptable values are from `0` to `31`.
---
--- Indexes are by Entity:GetMaterials, but you have to subtract `1` from them.
---
--- If called with no arguments, all sub materials will be reset.
---@param material? string The material to override the default one with. Set to nil to revert to default material.
function Entity:SetSubMaterial(index, material) end

---Sets the axis-aligned bounding box (AABB) for an entity's hitbox detection.
---
--- 	See also [Entity:SetSurroundingBoundsType](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBoundsType) (mutually exclusive).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSurroundingBounds
---@param min Vector Minimum extent of the AABB relative to entity's position.
---@param max Vector Maximum extent of the AABB relative to entity's position.
function Entity:SetSurroundingBounds(min, max) end

---Automatically sets the axis-aligned bounding box (AABB) for an entity's hitbox detection.
---
--- 	See also [Entity:SetSurroundingBounds](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBounds) (mutually exclusive).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetSurroundingBoundsType
---@param bounds BOUNDS Bounds type of the entity, see Enums/BOUNDS
function Entity:SetSurroundingBoundsType(bounds) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Changes the table that can be accessed by indexing an entity. Each entity starts with its own table by default.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetTable
---@param tab table Table for the entity to use
function Entity:SetTable(tab) end

---Sets the current task, to be used in a Lua schedule.
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook SetTask
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:SetTask
---@param task table The task to set.
function Entity:SetTask(task) end

---When this flag is set the entity will only transmit to the player when its parent is transmitted. This is useful for things like viewmodel attachments since without this flag they will transmit to everyone (and cause the viewmodels to transmit to everyone too).
---
--- **NOTE**: In the case of scripted entities, this will override [ENTITY:UpdateTransmitState](https://wiki.facepunch.com/gmod/ENTITY:UpdateTransmitState)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetTransmitWithParent
---@param onoff boolean Will set the TransmitWithParent flag on or off
function Entity:SetTransmitWithParent(onoff) end

---Marks the entity as a trigger, so it will generate [ENTITY:StartTouch](https://wiki.facepunch.com/gmod/ENTITY:StartTouch), [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch) and [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch) callbacks.
---
--- Internally this is stored as [FSOLID_TRIGGER](https://wiki.facepunch.com/gmod/Enums/FSOLID) flag.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetTrigger
---@param maketrigger boolean Make the entity trigger or not
function Entity:SetTrigger(maketrigger) end

---Sets whether an entity can be unfrozen, meaning that it cannot be unfrozen using the physgun.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetUnFreezable
---@param freezable? boolean True to make the entity unfreezable, false otherwise.
function Entity:SetUnFreezable(freezable) end

---Forces the entity to reconfigure its bones. You might need to call this after changing your model's scales or when manually drawing the entity multiple times at different positions.
---
--- **NOTE**: This calls the BuildBonePositions callback added via [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback), so avoid calling this function inside it to prevent an infinite loop.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetupBones
function Entity:SetupBones() end

---Called when the entity should set up its [ Data Tables](https://wiki.facepunch.com/gmod/Networking_Entities).
---
--- This is a much better option than using Set/Get Networked Values.
---
--- This hook is called after [GM:OnEntityCreated](https://wiki.facepunch.com/gmod/GM:OnEntityCreated) and [GM:NetworkEntityCreated](https://wiki.facepunch.com/gmod/GM:NetworkEntityCreated).
---@hook SetupDataTables
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables
function Entity:SetupDataTables() end

---Initializes the class names of an entity's phoneme mappings (mouth movement data). This is called by default with argument "phonemes" when a flex-based entity (such as an [NPC](https://wiki.facepunch.com/gmod/NPC)) is created.
---
--- **NOTE**: TF2 phonemes can be accessed by using a path such as "player/scout/phonemes/phonemes" , check TF2's "tf2_misc_dir.vpk" with GCFScape for other paths, however it seems that TF2 sounds don't contain phoneme definitions anymore after being converted to mp3 and only rely on VCD animations, this needs to be further investigated
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SetupPhonemeMappings
---@param fileRoot string The file prefix of the phoneme mappings (relative to "garrysmod/expressions/").
function Entity:SetupPhonemeMappings(fileRoot) end

---Sets the use type of an entity, affecting how often [ENTITY:Use](https://wiki.facepunch.com/gmod/ENTITY:Use) will be called for Lua entities.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:SetUseType
---@param useType _USE The use type to apply to the entity. Uses Enums/_USE.
function Entity:SetUseType(useType) end

---Allows to quickly set variable to entity's [Entity:GetTable](https://wiki.facepunch.com/gmod/Entity:GetTable).
---
--- **NOTE**: This will not network the variable to client(s). You want [Entity:SetNWString](https://wiki.facepunch.com/gmod/Entity:SetNWString) and similar functions for that
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetVar
---@param key any Key of the value to set
---@param value any Value to set the variable to
function Entity:SetVar(key, value) end

---Sets the entity's velocity. For entities with physics, consider using [PhysObj:SetVelocity](https://wiki.facepunch.com/gmod/PhysObj:SetVelocity) on the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) of the entity.
---
--- **NOTE**: Actually binds to CBaseEntity::SetBaseVelocity() which sets the entity's velocity due to forces applied by other entities.
---
--- **WARNING**: If applied to a player, this will actually **ADD** velocity, not set it. (due to how movement code handles base velocity)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetVelocity
---@param velocity Vector The new velocity to set.
function Entity:SetVelocity(velocity) end

---Sets the model and associated weapon to this viewmodel entity.
---
--- This is used internally when the player switches weapon.
---
--- **NOTE**: View models are not drawn without a weapons associated to them.
---
--- **WARNING**: This will silently fail if the entity is not a viewmodel.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SetWeaponModel
---@param viewModel string The model string to give to this viewmodel.
--- Example: "models/weapons/c_smg1.mdl"
---@param weapon? Weapon The weapon entity to associate this viewmodel to.
function Entity:SetWeaponModel(viewModel, weapon) end

---Returns the amount of skins the entity has.
---
--- To set the entity's skin, use [Entity:SetSkin](https://wiki.facepunch.com/gmod/Entity:SetSkin).
--- To retrieve the total number of skins without an entity, see [util.GetModelInfo](https://wiki.facepunch.com/gmod/util.GetModelInfo).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:SkinCount
---@return number # The amount of skins the entity's model has.
function Entity:SkinCount() end

---Moves the model instance from the source entity to this entity. This can be used to transfer decals that have been applied on one entity to another.
---
--- Both entities must have the same model.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:SnatchModelInstance
---@param srcEntity Entity Entity to move the model instance from.
---@return boolean # Whether the operation was successful or not
function Entity:SnatchModelInstance(srcEntity) end

---Initializes the entity and starts its networking. If called on a player, it will respawn them.
---
--- This calls [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) on Lua-defined entities.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:Spawn
function Entity:Spawn() end

---This is the spawn function. It's called when a player spawns the entity from the spawnmenu.
---
--- If you want to make your SENT spawnable you need this function to properly create the entity.
---
--- **WARNING**: Unlike other ENTITY functions, the "self" parameter of this function is not an entity but rather the table used to generate the SENT. This table is equivalent to [scripted_ents.GetStored](https://wiki.facepunch.com/gmod/scripted_ents.GetStored)("ent_name").
---@hook SpawnFunction
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:SpawnFunction
---@param ply Player The player that is spawning this SENT
---@param tr TraceResult A Structures/TraceResult from player eyes to their aim position
---@param ClassName string The classname of your entity
function Entity:SpawnFunction(ply, tr, ClassName) end

---Called by the engine only whenever [NPC:SetSchedule](https://wiki.facepunch.com/gmod/NPC:SetSchedule) is called.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook StartEngineSchedule
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule
---@param scheduleID number Schedule ID to start. See Enums/SCHED
function Entity:StartEngineSchedule(scheduleID) end

---Called when an engine task has been started on the entity.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook StartEngineTask
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:StartEngineTask
---@param taskID number Task ID to start, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param TaskData number Task data
---@return boolean # true to stop default action
function Entity:StartEngineTask(taskID, TaskData) end

---Starts a "looping" sound. As with any other sound playing methods, this function expects the sound file to be looping itself and will not automatically loop a non looping sound file as one might expect.
---
--- This function is almost identical to [Global.CreateSound](https://wiki.facepunch.com/gmod/Global.CreateSound), with the exception of the sound being created in the STATIC channel and with normal attenuation.
---
--- See also [Entity:StopLoopingSound](https://wiki.facepunch.com/gmod/Entity:StopLoopingSound)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:StartLoopingSound
---@param sound string Sound to play. Can be either a sound script or a filepath.
---@return number # The ID number of started sound starting with 0, or -1 if we failed for some reason.
function Entity:StartLoopingSound(sound) end

---Starts a motion controller in the physics engine tied to this entity's [PhysObj](https://wiki.facepunch.com/gmod/PhysObj), which enables the use of [ENTITY:PhysicsSimulate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate).
---
--- The motion controller can later be destroyed via [Entity:StopMotionController](https://wiki.facepunch.com/gmod/Entity:StopMotionController).
---
--- Motion controllers are used internally to control other Entities' [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ects, such as the Gravity Gun, +use pickup and the Physics Gun.
---
--- This function should be called every time you recreate the Entity's [PhysObj](https://wiki.facepunch.com/gmod/PhysObj). Or alternatively you should call [Entity:AddToMotionController](https://wiki.facepunch.com/gmod/Entity:AddToMotionController) on the new [PhysObj](https://wiki.facepunch.com/gmod/PhysObj).
---
--- Also see [Entity:AddToMotionController](https://wiki.facepunch.com/gmod/Entity:AddToMotionController) and [Entity:RemoveFromMotionController](https://wiki.facepunch.com/gmod/Entity:RemoveFromMotionController).
---
--- **NOTE**: Only works on a scripted [Entity](https://wiki.facepunch.com/gmod/Entity) of anim type.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:StartMotionController
function Entity:StartMotionController() end

---Starts a schedule previously created by [ai_schedule.New](https://wiki.facepunch.com/gmod/ai_schedule.New).
---
--- Not to be confused with [ENTITY:StartEngineSchedule](https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule) or [NPC:SetSchedule](https://wiki.facepunch.com/gmod/NPC:SetSchedule) which start an Engine-based schedule.
---
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook StartSchedule
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:StartSchedule
---@param sched Schedule Schedule to start.
function Entity:StartSchedule(sched) end

---Called once when a LUA schedule has started a task.
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---@hook StartTask
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:StartTask
---@param task Task The task to start, created by ai_task.New.
function Entity:StartTask(task) end

---Called when the entity starts touching another entity.
---
--- See [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch) and [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch) for related hooks.
---
--- **WARNING**: This only works for **brush** entities and for entities that have [Entity:SetTrigger](https://wiki.facepunch.com/gmod/Entity:SetTrigger) set to true.
---@hook StartTouch
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:StartTouch
---@param entity Entity The entity that we started touching for the first time.
function Entity:StartTouch(entity) end

---Stops all particle effects parented to the entity and immediately destroys them.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:StopAndDestroyParticles
function Entity:StopAndDestroyParticles() end

---Stops a sound created by [Entity:StartLoopingSound](https://wiki.facepunch.com/gmod/Entity:StartLoopingSound).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:StopLoopingSound
---@param id number The sound ID returned by Entity:StartLoopingSound
function Entity:StopLoopingSound(id) end

---Stops the motion controller created with [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:StopMotionController
function Entity:StopMotionController() end

---Stops all particle effects parented to the entity.
---
--- This is ran automatically on every client by [Entity:StopParticles](https://wiki.facepunch.com/gmod/Entity:StopParticles) if called on the server.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:StopParticleEmission
function Entity:StopParticleEmission() end

---Stops any attached to the entity .pcf particles using [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach) or [Global.ParticleEffect](https://wiki.facepunch.com/gmod/Global.ParticleEffect).
---
--- On client, this is the same as [Entity:StopParticleEmission](https://wiki.facepunch.com/gmod/Entity:StopParticleEmission). ( and you should use StopParticleEmission instead )
---
--- On server, this is the same as running [Entity:StopParticleEmission](https://wiki.facepunch.com/gmod/Entity:StopParticleEmission) on every client.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:StopParticles
function Entity:StopParticles() end

---Stops all particle effects parented to the entity with given name.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:StopParticlesNamed
---@param name string The name of the particle to stop.
function Entity:StopParticlesNamed(name) end

---Stops all particle effects parented to the entity with given name on given attachment.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:StopParticlesWithNameAndAttachment
---@param name string The name of the particle to stop.
---@param attachment number The attachment of the entity to stop particles on.
function Entity:StopParticlesWithNameAndAttachment(name, attachment) end

---Stops emitting the given sound from the entity, especially useful for looping sounds.
---
--- Internally plays the sound with the [SND_STOP](https://wiki.facepunch.com/gmod/Enums/SND#SND_STOP) flag to stop the sound.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:StopSound
---@param sound string The name of the sound script or the filepath to stop playback of.
function Entity:StopSound(sound) end

---Used to store an output so it can be triggered with [ENTITY:TriggerOutput](https://wiki.facepunch.com/gmod/ENTITY:TriggerOutput).
--- Outputs compiled into a map are passed to entities as key/value pairs through [ENTITY:KeyValue](https://wiki.facepunch.com/gmod/ENTITY:KeyValue).
---
--- TriggerOutput will do nothing if this function has not been called first.
---@hook StoreOutput
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:StoreOutput
---@param name string Name of output to store
---@param info string Output info
function Entity:StoreOutput(name, info) end

---Applies the specified amount of damage to the entity with [DMG_GENERIC](https://wiki.facepunch.com/gmod/Enums/DMG) flag.
---
--- **WARNING**: Calling this function on the victim entity in [ENTITY:OnTakeDamage](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage) can cause infinite loops.
---
--- **WARNING**: This function does not seem to do any damage if you apply it to a player who is driving a prop_vehicle_jeep or prop_vehicle_jeep_old vehicle. You need to call it on the vehicle instead.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:TakeDamage
---@param damageAmount number The amount of damage to be applied.
---@param attacker? Entity The entity that initiated the attack that caused the damage.
---@param inflictor? Entity The entity that applied the damage, eg. a weapon.
function Entity:TakeDamage(damageAmount, attacker, inflictor) end

---Applies the damage specified by the damage info to the entity.
---
--- **WARNING**: Calling this function on the victim entity in [ENTITY:OnTakeDamage](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage) can cause infinite loops.
---
--- **WARNING**: This function does not seem to do any damage if you apply it to a player who is driving a prop_vehicle_jeep or prop_vehicle_jeep_old vehicle. You need to call it on the vehicle instead.
---
--- **NOTE**: This function does not apply damage to [func_breakable_surf](https://developer.valvesoftware.com/wiki/Func_breakable_surf) entities correctly. To do this, you will need to use [Entity:DispatchTraceAttack](https://wiki.facepunch.com/gmod/Entity:DispatchTraceAttack) instead.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo
---@param damageInfo CTakeDamageInfo The damage to apply.
function Entity:TakeDamageInfo(damageInfo) end

---Applies forces to our physics object in response to damage.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:TakePhysicsDamage
---@param dmginfo CTakeDamageInfo The damageinfo to apply. Only CTakeDamageInfo:GetDamageForce and CTakeDamageInfo:GetDamagePosition are used.
function Entity:TakePhysicsDamage(dmginfo) end

---Returns true if the current running [Task](https://wiki.facepunch.com/gmod/Task) is finished.
--- Tasks finish whenever [NPC:TaskComplete](https://wiki.facepunch.com/gmod/NPC:TaskComplete) is called, which sets `TASKSTATUS_COMPLETE` for all NPCs, also sets `self.bTaskComplete` for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook TaskFinished
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:TaskFinished
---@return boolean # Is the current running Task is finished or not.
function Entity:TaskFinished() end

---Returns how many seconds we've been doing this current task
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@hook TaskTime
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:TaskTime
---@return number # How many seconds we've been doing this current task
function Entity:TaskTime() end

---Allows you to override trace result when a trace hits the entity.
---
--- Your entity **must** have [Entity:EnableCustomCollisions](https://wiki.facepunch.com/gmod/Entity:EnableCustomCollisions) enabled for this hook to work.
---
--- Your entity must also be otherwise "hit-able" with a trace, so it should have [SOLID_OBB](https://wiki.facepunch.com/gmod/Enums/SOLID#SOLID_OBB) or [SOLID_VPHYSICS](https://wiki.facepunch.com/gmod/Enums/SOLID#SOLID_VPHYSICS) be set (as an example), and it must have its [collision bounds](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds) be set accordingly.
---
--- **NOTE**: This hook is called for `anim` type only.
---@hook TestCollision
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:TestCollision
---@param startpos Vector Start position of the trace.
---@param delta Vector Offset from startpos to the endpos of the trace.
---@param isbox boolean Is the trace a hull trace?
---@param extents Vector Size of the hull trace, with the center of the Bounding Box being `0, 0, 0`, so mins are `-extents`, and maxs are `extents`.
---@param mask number The Enums/CONTENTS mask.
---@return table # Returning a `table` will allow you to override trace results. Table should contain the following keys: (All keys fallback to the original trace value)
--- * Vector `HitPos` - The new hit position of the trace.
--- * number `Fraction` - A number from `0` to `1`, describing how far the trace went from its origin point, `1` = did not hit.
---   * Could be calculated like so : `Fraction = ( startpos + delta ):Length() / myCustomHitPos:Length()`
--- * Vector `Normal` - A unit vector (length=1) describing the direction perpendicular to the hit surface.
---
--- Returning `true` will allow "normal" collisions to happen for `SOLID_VPHYSICS` and `SOLID_OBB` entities.
--- Returning `nothing` or `false` allows the trace to ignore the entity completely.
function Entity:TestCollision(startpos, delta, isbox, extents, mask) end

---Check if the given position or entity is within this entity's [PVS(Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community").
---
--- See also [Entity:IsDormant](https://wiki.facepunch.com/gmod/Entity:IsDormant).
---
--- **NOTE**: The function won't take in to account [Global.AddOriginToPVS](https://wiki.facepunch.com/gmod/Global.AddOriginToPVS) and the like.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:TestPVS
---@param testPoint Vector|Entity Entity or Vector to test against. If an entity is given, this function will test using its bounding box.
---@return boolean # `true` if the testPoint is within our PVS.
function Entity:TestPVS(testPoint) end

---Called every frame on the client.
--- Called about 5-6 times per second on the server.
---
--- **NOTE**: You may need to call [Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn) to get this hook to run server side.
---
--- You can force it to run at servers tickrate using the example below.
---@hook Think
---@realm shared
---@source https://wiki.facepunch.com/gmod/ENTITY:Think
---@return boolean # Return `true` if you used Entity:NextThink to override the next execution time. Otherwise it will be reset to `CurTime() + 0.2`.
function Entity:Think() end

---Called every tick for every entity being "touched". Touching is usually detected via AABB intersection checks using entity's [collision bounds](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds).
---
--- Entities like triggers would be using the touch hooks for their function.
---
--- See [Entity:PhysicsCollide](https://wiki.facepunch.com/gmod/Entity:PhysicsCollide) for physics based collision events.
---
--- See also [ENTITY:StartTouch](https://wiki.facepunch.com/gmod/ENTITY:StartTouch) and [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch).
---
--- **NOTE**: For physics enabled entities, this hook will **not** be ran while the entity's physics is asleep. See [PhysObj:Wake](https://wiki.facepunch.com/gmod/PhysObj:Wake).
---@hook Touch
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:Touch
---@param entity Entity The entity that touched it.
function Entity:Touch(entity) end

---Called by the engine to alter NPC activities, if desired by the NPC.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---@hook TranslateActivity
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:TranslateActivity
---@param oldAct ACT The activity to translate.
---@return ACT # The activity that should override the incoming activity.
---
--- Not returning anything, or returning a non value will perform the [default action](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/ai_basenpc.cpp#L5976).
function Entity:TranslateActivity(oldAct) end

---Returns the ID of a [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) attached to the given bone.
---
--- See [Entity:TranslatePhysBoneToBone](https://wiki.facepunch.com/gmod/Entity:TranslatePhysBoneToBone) for reverse function.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:TranslateBoneToPhysBone
---@param boneID number The ID of a bone to look up the "physics root" bone of.
---@return number # The PhysObj ID of the given bone to be used with Entity:GetPhysicsObjectNum or `-1` if we cannot translate for some reason, such as a model bone having no physics object associated with it.
function Entity:TranslateBoneToPhysBone(boneID) end

---Called by the engine to alter NPC's final position to reach its enemy or target. This is called twice for `GOALTYPE_PATHCORNER`; first is for the first path_corner and second for the next connected path_corner.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---@hook TranslateNavGoal
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:TranslateNavGoal
---@param target? NPC|Entity The enemy being chased or the path_corner in query.
---@param currentGoal? Vector The target's origin.
---@return Vector # The actual point that NPC will move to reach its enemy or target. For the path to get updated, the new move path must be away from the current NPC:GetGoalPos by 120 units.
---
--- Not returning anything, or returning a non vector will perform the [default action](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/ai_basenpc_schedule.cpp#L4251).
function Entity:TranslateNavGoal(target, currentGoal) end

---Returns the boneID of the bone the given [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) is attached to.
---
--- See [Entity:TranslateBoneToPhysBone](https://wiki.facepunch.com/gmod/Entity:TranslateBoneToPhysBone) for reverse function.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:TranslatePhysBoneToBone
---@param physNum number The PhysObj number on the entity
---@return number # The boneID of the bone the PhysObj is attached to.
function Entity:TranslatePhysBoneToBone(physNum) end

---Called by the engine to alter NPC schedules, if desired by the NPC.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---@hook TranslateSchedule
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:TranslateSchedule
---@param schedule SCHED The schedule to translate. See Enums/SCHED.
---@return SCHED # The schedule that should override the incoming schedule.
---
--- Not returning anything, or returning a non value will perform the [default action](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/ai_default.cpp#L253).
function Entity:TranslateSchedule(schedule) end

---Triggers all outputs stored using [ENTITY:StoreOutput](https://wiki.facepunch.com/gmod/ENTITY:StoreOutput).
---@hook TriggerOutput
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:TriggerOutput
---@param output string Name of output to fire
---@param activator Entity Activator entity
---@param data? string The data to give to the output.
function Entity:TriggerOutput(output, activator, data) end

---Updates positions of bone followers created by [Entity:CreateBoneFollowers](https://wiki.facepunch.com/gmod/Entity:CreateBoneFollowers).
---
--- This should be called every tick.
---
--- **NOTE**: This function only works on `anim`, `nextbot` and `ai` type entities.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:UpdateBoneFollowers
function Entity:UpdateBoneFollowers() end

---Marks the render-to-texture (RTT) shadow of this entity as dirty, as well as any potential projected texture shadows related to this entity, so they will be updated as soon as possible.
---@realm client
---@source https://wiki.facepunch.com/gmod/Entity:UpdateShadow
function Entity:UpdateShadow() end

---Called whenever the transmit state should be updated.
---@hook UpdateTransmitState
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:UpdateTransmitState
---@return number # Transmit state to set, see Enums/TRANSMIT.
function Entity:UpdateTransmitState() end

---Called when an entity "uses" this entity, for example a player pressing their `+use` key (default E) on this entity.
---
--- To change how often the hook is called, see [Entity:SetUseType](https://wiki.facepunch.com/gmod/Entity:SetUseType).
---
--- **NOTE**: This hook only works for `nextbot`, `ai` and `anim` scripted entity types.
---@hook Use
---@realm server
---@source https://wiki.facepunch.com/gmod/ENTITY:Use
---@param activator Entity The entity that caused this input. This will usually be the player who pressed their use key.
---@param caller Entity The entity responsible for the input. This will typically be the same as `activator` unless some other entity is acting as a proxy.
---@param useType USE Use type, see Enums/USE.
---@param value number Any passed value.
function Entity:Use(activator, caller, useType, value) end

---Simulates a `+use` action on an entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Use(function)
---@param activator Entity The entity that caused this input. This will usually be the player who pressed their use key
---@param caller? Entity The entity responsible for the input. This will typically be the same as `activator` unless some other entity is acting as a proxy
---@param useType? USE Use type, see Enums/USE.
---@param value? number Any value.
function Entity:Use(activator, caller, useType, value) end

---**NOTE**: Does nothing on server.
---
--- Animations will be handled purely clientside instead of a fixed animtime, enabling interpolation. This does not affect layers and gestures.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:UseClientSideAnimation
function Entity:UseClientSideAnimation() end

---Enables or disables trigger bounds.
---
--- This will give the entity a "trigger box" that extends around its bounding box by boundSize units in X/Y and (boundSize / 2) in +Z (-Z remains the same).
--- The trigger box is world aligned and will work regardless of the object's solidity and collision group.
---
--- Valve use trigger boxes for all pickup items. Their bloat size is 24, a surprisingly large figure.
---
--- **NOTE**: The trigger boxes can be made visible as a light blue box by using the **ent_bbox** console command while looking at the entity. Alternatively a classname or entity index can be used as the first argument.
---
--- This requires **developer** to be set to **1**.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:UseTriggerBounds
---@param enable boolean Enable or disable the bounds.
---@param boundSize? number The distance/size of the trigger bounds.
function Entity:UseTriggerBounds(enable, boundSize) end

---Returns the index of this view model, it can be used to identify which one of the player's view models this entity is.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:ViewModelIndex
---@return number # View model index, ranges from 0 to 2, nil if the entity is not a view model
function Entity:ViewModelIndex() end

---Returns whether the target/given entity is visible from the this entity.
---
--- This is meant to be used only with NPCs.
---
--- Differences from a simple trace include:
--- * If target has `FL_NOTARGET`, returns `false`
--- * If `ai_ignoreplayers` is turned on and target is a player, returns `false`
--- * Reacts to `ai_LOS_mode`:
--- * * If `1`, does a simple trace with `COLLISION_GROUP_NONE` and `MASK_BLOCKLOS`
--- * * If not, does a trace with `MASK_BLOCKLOS_AND_NPCS` (- `CONTENTS_BLOCKLOS` is target is player) and a custom LOS filter (`CTraceFilterLOS`)
--- * Returns `true` if hits a vehicle the target is driving
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:Visible
---@param target Entity Entity to check for visibility to.
---@return boolean # If the entities can see each other.
function Entity:Visible(target) end

---Returns true if supplied vector is visible from the entity's line of sight.
---
--- This is achieved similarly to a trace.
---@realm server
---@source https://wiki.facepunch.com/gmod/Entity:VisibleVec
---@param pos Vector The position to check for visibility
---@return boolean # Within line of sight
function Entity:VisibleVec(pos) end

---Returns an integer that represents how deep in water the entity is.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:WaterLevel
---@return number # The water level.
--- * **0** - The entity isn't in water.
--- * **1** - Slightly submerged (at least to the feet).
--- * **2** - The majority of the entity is submerged (at least to the waist).
--- * **3** - Completely submerged.
function Entity:WaterLevel() end

---Sets the activity of the entity's active weapon.
---
--- **NOTE**: This does nothing on the client.
---
--- **NOTE**: Only works for CBaseCombatCharacter entities, which includes players and NPCs.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:Weapon_SetActivity
---@param act number Activity number. See Enums/ACT.
---@param duration number How long the animation should take in seconds.
function Entity:Weapon_SetActivity(act, duration) end

---Calls and returns [WEAPON:TranslateActivity](https://wiki.facepunch.com/gmod/WEAPON:TranslateActivity) on the weapon the entity (player or NPC) carries.
---
--- **NOTE**: Doesn't return anything on client, despite existing there.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:Weapon_TranslateActivity
---@param act number The NPC activity to translate
---@return number # The translated activity. Defaults to `act` input when a translation doesn't exist.
function Entity:Weapon_TranslateActivity(act) end

---Returns two vectors representing the minimum and maximum extent of the entity's axis-aligned bounding box (which is calculated from entity's collision bounds.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:WorldSpaceAABB
---@return Vector # The minimum vector for the entity's bounding box in world space.
---@return Vector # The maximum vector for the entity's bounding box in world space.
function Entity:WorldSpaceAABB() end

---Returns the center of the entity according to its collision model.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:WorldSpaceCenter
---@return Vector # The center of the entity
function Entity:WorldSpaceCenter() end

---Translates a worldspace vector into a vector relative to the entity's coordinate system.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:WorldToLocal
---@param wpos Vector A worldspace vector.
---@return Vector # The corresponding local space vector.
function Entity:WorldToLocal(wpos) end

---Translates a worldspace angle into an angle relative to the entity's coordinate system.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Entity:WorldToLocalAngles
---@param ang Angle A worldspace angle.
---@return Angle # The corresponding local space angle.
function Entity:WorldToLocalAngles(ang) end
