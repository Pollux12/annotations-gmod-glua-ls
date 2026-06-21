---@meta

--- This is a list of all methods only available for NPCs. It is also possible to call [Entity](https://wiki.facepunch.com/gmod/Entity) functions on NPCs.
---@source https://wiki.facepunch.com/gmod/NPC
---@class (partial) NPC : Entity
NPC = {}

---Makes the NPC like, hate, feel neutral towards, or fear the entity in question. If you want to setup relationship towards a certain entity `class`, use [NPC:AddRelationship](https://wiki.facepunch.com/gmod/NPC:AddRelationship).
---
--- **NOTE**: NPCs do not see [NextBot](https://wiki.facepunch.com/gmod/NextBot)s by default. This can be fixed by adding the [FL_OBJECT](https://wiki.facepunch.com/gmod/Enums/FL) flag to the NextBot.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship
---@param target Entity The entity for the relationship to be applied to.
---@param disposition number A Enums/D representing the relationship type.
---@param priority? number How strong the relationship is. Higher values mean higher priority over relationships with lower priority.
function NPC:AddEntityRelationship(target, disposition, priority) end

---Changes how an NPC feels towards another NPC.  If you want to setup relationship towards a certain `entity`, use [NPC:AddEntityRelationship](https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship).
---
--- **WARNING**: Avoid using this in [GM:OnEntityCreated](https://wiki.facepunch.com/gmod/GM:OnEntityCreated) to prevent crashing due to infinite loops. This function may create an entity with given class and delete it immediately after.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:AddRelationship
---@param relationstring string A string representing how the relationship should be set up.
--- Should be formatted as `"npc_class `Enums/D` numberPriority"`.
function NPC:AddRelationship(relationstring) end

---Advances the NPC on its path to the next waypoint.
--- **WARNING**: Calling this on an NPC without any route will result in an instant crash.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:AdvancePath
function NPC:AdvancePath() end

---Force an NPC to play their Alert sound.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:AlertSound
function NPC:AlertSound() end

---Executes any movement the current sequence may have.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:AutoMovement
---@param interval number This is a good place to use Entity:GetAnimTimeInterval.
---@param target? Entity
---@return boolean # `true` if any movement was performed.
function NPC:AutoMovement(interval, target) end

---Become a ragdoll and remove the entity. Internally handles serverside/clientside ragdoll creation, momentum calculation, triggering ragdoll creation hooks / events and cloning entity's bone transforms to the created ragdoll.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:BecomeRagdoll
---@param info CTakeDamageInfo Damage info passed from an onkilled event
---@return Entity # The created serverside ragdoll, nil if failed or a clientside ragdoll created.
function NPC:BecomeRagdoll(info) end

---Adds a capability to the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:CapabilitiesAdd
---@param capabilities CAP Capabilities to add, see Enums/CAP.
function NPC:CapabilitiesAdd(capabilities) end

---Removes all of Capabilities the NPC has.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:CapabilitiesClear
function NPC:CapabilitiesClear() end

---Returns the NPC's capabilities along the ones defined on its weapon.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:CapabilitiesGet
---@return CAP # The capabilities as a bitflag.
--- See Enums/CAP
function NPC:CapabilitiesGet() end

---Checks whether the NPC has the specified capabilities.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:CapabilitiesHas
---@param capabilities CAP Capabilities to check, see Enums/CAP.
function NPC:CapabilitiesHas(capabilities) end

---Remove a certain capability.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:CapabilitiesRemove
---@param capabilities number Capabilities to remove, see Enums/CAP
function NPC:CapabilitiesRemove(capabilities) end

---Returns the NPC relationship class. This is mostly used to tell NPCs who should be attacking who.
---
--- Do not confuse with [Entity:GetClass](https://wiki.facepunch.com/gmod/Entity:GetClass)!
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:Classify
---@return CLASS # See Enums/CLASS
function NPC:Classify() end

---Resets the [NPC:GetBlockingEntity](https://wiki.facepunch.com/gmod/NPC:GetBlockingEntity).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ClearBlockingEntity
function NPC:ClearBlockingEntity() end

---Clears out the specified [Enums/COND](https://wiki.facepunch.com/gmod/Enums/COND) on this NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ClearCondition
---@param condition number The Enums/COND to clear out.
function NPC:ClearCondition(condition) end

---Clears the Enemy from the NPC's memory, effectively forgetting it until met again with either the NPC vision or with [NPC:UpdateEnemyMemory](https://wiki.facepunch.com/gmod/NPC:UpdateEnemyMemory).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ClearEnemyMemory
---@param enemy? Entity The enemy to mark
function NPC:ClearEnemyMemory(enemy) end

---Clears the NPC's current expression which can be set with [NPC:SetExpression](https://wiki.facepunch.com/gmod/NPC:SetExpression).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ClearExpression
function NPC:ClearExpression() end

---Clears the current NPC goal or target.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ClearGoal
function NPC:ClearGoal() end

---Stops the current schedule that the NPC is doing.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ClearSchedule
function NPC:ClearSchedule() end

---Returns the ID of a given condition by name. Opposite of [NPC:ConditionName](https://wiki.facepunch.com/gmod/NPC:ConditionName).
---
--- This is useful for custom conditions defined by engine NPCs, such as `COND_ZOMBIE_RELEASECRAB` for zombies, and `COND_COMBINE_ON_FIRE` for Combine Soldiers.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ConditionID
---@param conditionName string The condition name.
---@return number # The condition ID, see Enums/COND. Custom conditions will have a "randomly" assigned IDs, which will change with each game session.
function NPC:ConditionID(conditionName) end

---Translates condition ID to a string. For the opposite process, see [NPC:ConditionID](https://wiki.facepunch.com/gmod/NPC:ConditionID).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ConditionName
---@param cond number The NPCs condition ID, see Enums/COND
---@return string # A human understandable string equivalent of that condition.
function NPC:ConditionName(cond) end

---Returns the way the NPC "feels" about a given entity. See [NPC:AddEntityRelationship](https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship).
---
--- **NOTE**: For `ai` type entities, this will return [ENTITY:GetRelationship](https://wiki.facepunch.com/gmod/ENTITY:GetRelationship). If it returns `nil` or for engine NPCs, this will return whatever was last set by [NPC:AddEntityRelationship](https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship). As a last resort, engine will decide on the disposition based on this NPC's [NPC:Classify](https://wiki.facepunch.com/gmod/NPC:Classify).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:Disposition
---@param ent Entity The entity to test our disposition towards.
---@return D # The NPCs disposition, see Enums/D.
---@return number # The NPCs disposition priority.
function NPC:Disposition(ent) end

---Forces the NPC to drop the specified weapon.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:DropWeapon
---@param weapon? Weapon Weapon to be dropped. If unset, will default to the currently equipped weapon.
---@param target? Vector If set, launches the weapon at given position. There is a limit to how far it is willing to throw the weapon. Overrides velocity argument.
---@param velocity? Vector If set and previous argument is unset, launches the weapon with given velocity. If the velocity is higher than 400, it will be clamped to 400.
function NPC:DropWeapon(weapon, target, velocity) end

---Makes an NPC exit a scripted sequence, if one is playing.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ExitScriptedSequence
function NPC:ExitScriptedSequence() end

---Force an NPC to play its Fear sound.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:FearSound
function NPC:FearSound() end

---Force an NPC to play its FoundEnemy sound.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:FoundEnemySound
function NPC:FoundEnemySound() end

---Returns the weapon the NPC is currently carrying, or [NULL](https://wiki.facepunch.com/gmod/Global_Variables).
---@realm shared
---@source https://wiki.facepunch.com/gmod/NPC:GetActiveWeapon
---@return Entity # The NPCs current weapon
function NPC:GetActiveWeapon() end

---Returns the NPC's current activity.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetActivity
---@return number # Current activity, see Enums/ACT.
function NPC:GetActivity() end

---Returns the aim vector of the NPC. NPC alternative of [Player:GetAimVector](https://wiki.facepunch.com/gmod/Player:GetAimVector).
---
--- **NOTE**: If the NPC has both [NPC:GetEnemy](https://wiki.facepunch.com/gmod/NPC:GetEnemy) and [NPC:GetActiveWeapon](https://wiki.facepunch.com/gmod/NPC:GetActiveWeapon), engine will automatically call [ENTITY:GetAttackSpread](https://wiki.facepunch.com/gmod/ENTITY:GetAttackSpread) to add random spread degrees to the return value.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetAimVector
---@return Vector # The aim direction of the NPC, usually a noisy direction to it's NPC:GetEnemy. This will default to Entity:GetForward when there's no enemy. Thus, NPC:GetCurrentWeaponProficiency will be used.
function NPC:GetAimVector() end

---Returns the activity to be played when the NPC arrives at its goal
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetArrivalActivity
---@return number # The arrival activity. See Enums/ACT.
function NPC:GetArrivalActivity() end

---Returns the direction from the NPC origin to its current navigational destination.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetArrivalDirection
---@return Vector # The arrival direction.
function NPC:GetArrivalDirection() end

---Returns NPC arrival distance, set by [NPC:SetArrivalDistance](https://wiki.facepunch.com/gmod/NPC:SetArrivalDistance).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetArrivalDistance
---@return number # The current arrival distance.
function NPC:GetArrivalDistance() end

---Returns the sequence to be played when the NPC arrives at its goal.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetArrivalSequence
---@return number # Sequence ID to be played, or -1 if there's no sequence.
function NPC:GetArrivalSequence() end

---Returns NPC arrival speed, set by [NPC:SetArrivalSpeed](https://wiki.facepunch.com/gmod/NPC:SetArrivalSpeed).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetArrivalSpeed
---@return number # The current arrival peed.
function NPC:GetArrivalSpeed() end

---Returns the most dangerous/closest sound hint based on the NPCs location and the types of sounds it can sense.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetBestSoundHint
---@param types number The types of sounds to choose from. See Enums/SOUND
---@return table # A table with Structures/SoundHintData structure or `nil` if no sound hints are nearby.
function NPC:GetBestSoundHint(types) end

---Returns the entity blocking the NPC along its path.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetBlockingEntity
---@return Entity # Blocking entity
function NPC:GetBlockingEntity() end

---Returns the goal type for current navigation path.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetCurGoalType
---@return number # The goal type. See Enums/GOALTYPE.
function NPC:GetCurGoalType() end

---Returns the NPC's current schedule.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetCurrentSchedule
---@return number # The NPCs schedule, see Enums/SCHED or -1 if we failed for some reason
function NPC:GetCurrentSchedule() end

---Returns how proficient (skilled) an NPC is with its current weapon.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetCurrentWeaponProficiency
---@return number # NPC's proficiency for current weapon. See Enums/WEAPON_PROFICIENCY.
function NPC:GetCurrentWeaponProficiency() end

---Gets the NPC's current waypoint position (where NPC is currently moving towards), if any is available.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetCurWaypointPos
---@return Vector # The position of the current NPC waypoint.
function NPC:GetCurWaypointPos() end

---Returns the entity that this NPC is trying to fight.
---
--- This returns nil if the NPC has no enemy. You should use [Global.IsValid](https://wiki.facepunch.com/gmod/Global.IsValid) (which accounts for nil and NULL) on the return to verify validity of the enemy.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetEnemy
---@return NPC # Enemy NPC.
function NPC:GetEnemy() end

---Returns the first time an NPC's enemy was seen by the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetEnemyFirstTimeSeen
---@param enemy? Entity The enemy to check.
---@return number # First time the given enemy was seen.
function NPC:GetEnemyFirstTimeSeen(enemy) end

---Returns the last known position of an NPC's enemy.
---
--- Similar to [NPC:GetEnemyLastSeenPos](https://wiki.facepunch.com/gmod/NPC:GetEnemyLastSeenPos), but the known position will be a few seconds ahead of the last seen position.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetEnemyLastKnownPos
---@param enemy? Entity The enemy to check.
---@return Vector # The last known position.
function NPC:GetEnemyLastKnownPos(enemy) end

---Returns the last seen position of an NPC's enemy.
---
--- Similar to [NPC:GetEnemyLastKnownPos](https://wiki.facepunch.com/gmod/NPC:GetEnemyLastKnownPos), but the known position will be a few seconds ahead of the last seen position.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetEnemyLastSeenPos
---@param enemy? Entity The enemy to check.
---@return Vector # The last seen position.
function NPC:GetEnemyLastSeenPos(enemy) end

---Returns the last time an NPC's enemy was seen by the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetEnemyLastTimeSeen
---@param enemy? Entity The enemy to check.
---@return number # Last time the given enemy was seen.
function NPC:GetEnemyLastTimeSeen(enemy) end

---Returns the expression file the NPC is currently playing.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetExpression
---@return string # The file path of the expression.
function NPC:GetExpression() end

---Returns the eye direction of the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetEyeDirection
---@return Vector # The eye direction.
function NPC:GetEyeDirection() end

---Returns the Field Of View of the NPC. See [NPC:SetFOV](https://wiki.facepunch.com/gmod/NPC:SetFOV).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetFOV
---@return number # The FOV for the NPC in degrees.
function NPC:GetFOV() end

---Returns the position we are trying to reach, if any.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetGoalPos
---@return Vector # The position we are trying to reach.
function NPC:GetGoalPos() end

---Returns the entity we are trying to reach, if any.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetGoalTarget
---@return Entity # The entity we are trying to reach, or `NULL`.
function NPC:GetGoalTarget() end

---Returns the 2D head direction of the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetHeadDirection
---@return Vector # The head direction.
function NPC:GetHeadDirection() end

---Returns NPCs hull type set by [NPC:SetHullType](https://wiki.facepunch.com/gmod/NPC:SetHullType).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetHullType
---@return number # Hull type, see Enums/HULL
function NPC:GetHullType() end

---Returns the ideal activity the NPC currently wants to achieve.
--- 	**NOTE**: By default, base NPCs will automatically attempt to play a sequence bound to the ideal activity. To prevent ideal activity from overriding NPC's active sequence, set this to `ACT_DO_NOT_DISTURB`.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetIdealActivity
---@return number # The ideal activity. Enums/ACT.
function NPC:GetIdealActivity() end

---Returns the ideal move acceleration of the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetIdealMoveAcceleration
---@return number # The ideal move acceleration.
function NPC:GetIdealMoveAcceleration() end

---Returns the ideal move speed of the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetIdealMoveSpeed
---@return number # The ideal move speed.
function NPC:GetIdealMoveSpeed() end

---Returns the ideal sequence the NPC currently wants to achieve.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetIdealSequence
---@return number # The ideal sequence, specific to the NPCs model.
function NPC:GetIdealSequence() end

---Returns the ideal yaw (left right rotation) for this NPC at this moment.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetIdealYaw
---@return number # The ideal yaw.
function NPC:GetIdealYaw() end

---Returns all known enemies this NPC has. The enemy table is updated with [NPC:UpdateEnemyMemory](https://wiki.facepunch.com/gmod/NPC:UpdateEnemyMemory) and [NPC:ClearEnemyMemory](https://wiki.facepunch.com/gmod/NPC:ClearEnemyMemory), meaning other entities may be in enemies list even though your NPC doesn't hate it.
---
--- See also [NPC:GetKnownEnemyCount](https://wiki.facepunch.com/gmod/NPC:GetKnownEnemyCount)
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetKnownEnemies
---@return table # Table of entities that this NPC knows as enemies.
function NPC:GetKnownEnemies() end

---Returns known enemy count of this NPC.
---
--- See also [NPC:GetKnownEnemies](https://wiki.facepunch.com/gmod/NPC:GetKnownEnemies)
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetKnownEnemyCount
---@return number # Amount of entities that this NPC knows as enemies.
function NPC:GetKnownEnemyCount() end

---Returns the last registered or memorized position of the NPC. When using scheduling, the NPC will focus on navigating to the last position via nodes.
---
--- See [NPC:SetLastPosition](https://wiki.facepunch.com/gmod/NPC:SetLastPosition).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetLastPosition
---@return Vector # Where the NPC's last position was set to.
function NPC:GetLastPosition() end

---Returns [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime) based time since this NPC last received damage from given enemy. The last damage time is set when [NPC:MarkTookDamageFromEnemy](https://wiki.facepunch.com/gmod/NPC:MarkTookDamageFromEnemy) is called.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetLastTimeTookDamageFromEnemy
---@param enemy? Entity The enemy to test. Defaults to currently active enemy (NPC:GetEnemy)
---@return number # Time since this NPC last received damage from given enemy.
function NPC:GetLastTimeTookDamageFromEnemy(enemy) end

---Returns NPCs max view distance. An NPC will not be able to see enemies outside of this distance.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetMaxLookDistance
---@return number # The maximum distance the NPC can see at.
function NPC:GetMaxLookDistance() end

---Returns how far should the NPC look ahead in its route.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetMinMoveCheckDist
---@return number # How far the NPC checks ahead of its route.
function NPC:GetMinMoveCheckDist() end

---Returns how far before the NPC can come to a complete stop.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetMinMoveStopDist
---@param minResult? number The minimum value that will be returned by this function.
---@return number # The minimum stop distance.
function NPC:GetMinMoveStopDist(minResult) end

---Returns the movement delay for given NPC.
---
--- See [NPC:SetMoveDelay](https://wiki.facepunch.com/gmod/NPC:SetMoveDelay).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetMoveDelay
---@return number # The movement delay.
function NPC:GetMoveDelay() end

---Returns the current timestep the internal NPC motor is working on.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetMoveInterval
---@return number # The current timestep.
function NPC:GetMoveInterval() end

---Returns the NPC's current movement activity.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetMovementActivity
---@return number # Current NPC movement activity, see Enums/ACT.
function NPC:GetMovementActivity() end

---Returns the index of the sequence the NPC uses to move.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetMovementSequence
---@return number # The movement sequence index
function NPC:GetMovementSequence() end

---Returns the current move velocity of the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetMoveVelocity
---@return Vector # The current move velocity of the NPC.
function NPC:GetMoveVelocity() end

---Returns the NPC's navigation type.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetNavType
---@return number # The nav type. See Enums/NAV.
function NPC:GetNavType() end

---Returns the nearest member of the squad the NPC is in.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetNearestSquadMember
---@return NPC # The nearest member of the squad the NPC is in.
function NPC:GetNearestSquadMember() end

---Gets the NPC's next waypoint position, where NPC will be moving after reaching current waypoint, if any is available.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetNextWaypointPos
---@return Vector # The position of the next NPC waypoint.
function NPC:GetNextWaypointPos() end

---Returns the NPC's state.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetNPCState
---@return number # The NPC's current state, see Enums/NPC_STATE.
function NPC:GetNPCState() end

---Returns the distance the NPC is from Target Goal.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetPathDistanceToGoal
---@return number # The number of hammer units the NPC is away from the Goal.
function NPC:GetPathDistanceToGoal() end

---Returns the amount of time it will take for the NPC to get to its Target Goal.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetPathTimeToGoal
---@return number # The amount of time to get to the target goal.
function NPC:GetPathTimeToGoal() end

---Returns the shooting position of the NPC, i.e. where their bullets would come from, etc.
---
--- If the NPC does not overwrite this, it will return [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetShootPos
---@return Vector # The NPC's shooting position.
function NPC:GetShootPos() end

---Returns the current squad name of the NPC, as set via [NPC:SetSquad](https://wiki.facepunch.com/gmod/NPC:SetSquad).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetSquad
---@return string # The new squad name to set.
function NPC:GetSquad() end

---Returns NPC step height.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetStepHeight
---@return number # The current step height.
function NPC:GetStepHeight() end

---Returns the NPC's current target set by [NPC:SetTarget](https://wiki.facepunch.com/gmod/NPC:SetTarget).
---
--- This returns nil if the NPC has no target. You should use [Global.IsValid](https://wiki.facepunch.com/gmod/Global.IsValid) (which accounts for nil and NULL) on the return to verify validity of the target.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetTarget
---@return Entity # Target entity
function NPC:GetTarget() end

---Returns the status of the current task.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetTaskStatus
---@return number # The status. See Enums/TASKSTATUS.
function NPC:GetTaskStatus() end

---Returns [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime) based time since the enemy was reacquired, meaning it is currently in Line of Sight of the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetTimeEnemyLastReacquired
---@param enemy? Entity The enemy to test. Defaults to currently active enemy (NPC:GetEnemy)
---@return number # Time enemy was last reacquired.
function NPC:GetTimeEnemyLastReacquired(enemy) end

---Returns the view offset of the NPC. Set by [NPC:SetViewOffset](https://wiki.facepunch.com/gmod/NPC:SetViewOffset).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetViewOffset
---@return Vector # The view offset of the NPC.
function NPC:GetViewOffset() end

---Returns a specific weapon the NPC owns.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetWeapon
---@param class string A classname of the weapon to try to get.
---@return Weapon # The weapon for the specified class, or NULL of the NPC doesn't have given weapon.
function NPC:GetWeapon(class) end

---Returns a table of the NPC's weapons.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:GetWeapons
---@return Weapon[] # A list of the weapons the NPC currently has.
function NPC:GetWeapons() end

---Used to give a weapon to an already spawned NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:Give
---@param weapon string Class name of the weapon to equip to the NPC.
---@return Weapon # The weapon entity given to the NPC.
function NPC:Give(weapon) end

---Returns whether or not the NPC has the given condition.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:HasCondition
---@param condition number The condition index, see Enums/COND.
---@return boolean # True if the NPC has the given condition, false otherwise.
function NPC:HasCondition(condition) end

---Polls the enemy memory to check if the given entity has eluded us or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:HasEnemyEluded
---@param enemy? Entity The enemy to test.
---@return boolean # If the enemy has eluded us.
function NPC:HasEnemyEluded(enemy) end

---Polls the enemy memory to check if the NPC has any memory of given enemy.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:HasEnemyMemory
---@param enemy? Entity The entity to test.
---@return boolean # If we have any memory on given enemy.
function NPC:HasEnemyMemory(enemy) end

---Returns true if the current navigation has an obstacle, this is different from [NPC:GetBlockingEntity](https://wiki.facepunch.com/gmod/NPC:GetBlockingEntity), this is for virtual navigation obstacles put by AI's local navigation system to prevent movement to the marked area, forcing NPC to steer around, [for example](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/server/hl2/npc_playercompanion.cpp#L2897).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:HasObstacles
---@return boolean # `true` if the current navigation has an obstacle.
function NPC:HasObstacles() end

---Force an NPC to play their Idle sound.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IdleSound
function NPC:IdleSound() end

---Makes the NPC ignore given entity/enemy until given time.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IgnoreEnemyUntil
---@param enemy Entity The enemy to ignore.
---@param _until number How long to ignore the enemy for. This will be compared to Global.CurTime, so your value should be based on it.
function NPC:IgnoreEnemyUntil(enemy, _until) end

---Returns whether the NPC is currently crouching or not. Citizens and Combine Soldiers are capable of this behavior by default.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsCrouching
---@return boolean # Whether the NPC is currently crouching.
function NPC:IsCrouching() end

---Returns whether or not the NPC is performing the given schedule.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsCurrentSchedule
---@param schedule number The schedule number, see Enums/SCHED.
---@return boolean # True if the NPC is performing the given schedule, false otherwise.
function NPC:IsCurrentSchedule(schedule) end

---Returns whether the current navigational waypoint is the final one.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsCurWaypointGoal
---@return boolean # Whether the current navigational waypoint is the final one.
function NPC:IsCurWaypointGoal() end

---Returns whether the NPC is facing their ideal yaw. See [NPC:SetIdealYaw](https://wiki.facepunch.com/gmod/NPC:SetIdealYaw), [NPC:GetIdealYaw](https://wiki.facepunch.com/gmod/NPC:GetIdealYaw) and [NPC:SetIdealYawAndUpdate](https://wiki.facepunch.com/gmod/NPC:SetIdealYawAndUpdate).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsFacingIdealYaw
---@return boolean # Whether the NPC is facing their ideal yaw.
function NPC:IsFacingIdealYaw() end

---Returns whether the NPC has an active goal.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsGoalActive
---@return boolean # Whether the NPC has an active goal or not.
function NPC:IsGoalActive() end

---Tests whether a position or an NPC is in the view cone of the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsInViewCone
---@overload fun(ent: Entity): boolean
---@param position Vector The position to test.
---@return boolean # If the given position is in the view cone.
function NPC:IsInViewCone(position) end

---Returns if the current movement is locked on the Yaw axis.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsMoveYawLocked
---@return boolean # Whether the movement is yaw locked or not.
function NPC:IsMoveYawLocked() end

---Returns whether the NPC is moving or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsMoving
---@return boolean # Whether the NPC is moving or not.
function NPC:IsMoving() end

---Checks if the NPC is running an **ai_goal**. ( e.g. An npc_citizen NPC following the Player. )
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsRunningBehavior
---@return boolean # Returns true if running an ai_goal, otherwise returns false.
function NPC:IsRunningBehavior() end

---Returns whether the current NPC is the leader of the squad it is in.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsSquadLeader
---@return boolean # Whether the NPC is the leader of the squad or not.
function NPC:IsSquadLeader() end

---Returns the "forgettable" status for a given enemy, as set by [NPC:SetUnforgettable](https://wiki.facepunch.com/gmod/NPC:SetUnforgettable), or by internal logic of engine NPCs.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsUnforgettable
---@param enemy Entity Enemy entity to check.
---@return boolean # Whether the given enemy is unforgettable (`true`) or not.
function NPC:IsUnforgettable(enemy) end

---Returns true if the entity was remembered as unreachable. The memory is updated automatically from following engine tasks if they failed:
--- * TASK_GET_CHASE_PATH_TO_ENEMY
--- * TASK_GET_PATH_TO_ENEMY_LKP
--- * TASK_GET_PATH_TO_INTERACTION_PARTNER
--- * TASK_ANTLIONGUARD_GET_CHASE_PATH_ENEMY_TOLERANCE
--- * SCHED_FAIL_ESTABLISH_LINE_OF_FIRE - Combine NPCs, also when failing to change their enemy
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:IsUnreachable
---@param testEntity Entity The entity to test.
---@return boolean # If the entity is reachable or not.
function NPC:IsUnreachable(testEntity) end

---Force an NPC to play their LostEnemy sound.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:LostEnemySound
function NPC:LostEnemySound() end

---Tries to achieve our ideal animation state, playing any transition sequences that we need to play to get there.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MaintainActivity
function NPC:MaintainActivity() end

---Causes the NPC to temporarily forget the current enemy and switch on to a better one.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MarkEnemyAsEluded
---@param enemy? Entity The enemy to mark
function NPC:MarkEnemyAsEluded(enemy) end

---Marks the NPC as took damage from given entity.
---
--- See also [NPC:GetLastTimeTookDamageFromEnemy](https://wiki.facepunch.com/gmod/NPC:GetLastTimeTookDamageFromEnemy).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MarkTookDamageFromEnemy
---@param enemy? Entity The enemy to mark. Defaults to currently active enemy (NPC:GetEnemy)
function NPC:MarkTookDamageFromEnemy(enemy) end

---Executes a climb move.
---
--- Related functions are [NPC:MoveClimbStart](https://wiki.facepunch.com/gmod/NPC:MoveClimbStart) and [NPC:MoveClimbStop](https://wiki.facepunch.com/gmod/NPC:MoveClimbStop).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveClimbExec
---@param destination Vector The destination of the climb.
---@param dir Vector The direction of the climb.
---@param distance number The distance.
---@param yaw number The yaw angle.
---@param left number Amount of climb nodes left?
---@return AIMR # The result. See Enums/AIMR.
function NPC:MoveClimbExec(destination, dir, distance, yaw, left) end

---Starts a climb move.
---
--- Related functions are [NPC:MoveClimbExec](https://wiki.facepunch.com/gmod/NPC:MoveClimbExec) and [NPC:MoveClimbStop](https://wiki.facepunch.com/gmod/NPC:MoveClimbStop).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveClimbStart
---@param destination Vector The destination of the climb.
---@param dir Vector The direction of the climb.
---@param distance number The distance.
---@param yaw number The yaw angle.
function NPC:MoveClimbStart(destination, dir, distance, yaw) end

---Stops a climb move.
---
--- Related functions are [NPC:MoveClimbExec](https://wiki.facepunch.com/gmod/NPC:MoveClimbExec) and [NPC:MoveClimbStart](https://wiki.facepunch.com/gmod/NPC:MoveClimbStart).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveClimbStop
function NPC:MoveClimbStop() end

---Similar to other `NPC:Move*` functions, invokes internal code to move the NPC to a given location.
---
--- Meant to be used within [ENTITY:OverrideMove](https://wiki.facepunch.com/gmod/ENTITY:OverrideMove).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveGroundStep
---@param pos Vector The position we want to reach.
---@param targetEntity? Entity Used to test whether we hit the move target when deciding success.
---@param yaw? number Target Yaw angle at the end of the move. -1 to keep original yaw.
---@param asFarAsCan? boolean Whether to move as far as possible.
---@param testZ? boolean Also test the Z axis of the target position and NPC position to decide success.
---@return number # Whether the movement succeeded or not.
---
--- `AIMotorMoveResult_t` enum:
--- * AIM_FAILED = 0
--- * AIM_SUCCESS = 1
--- * AIM_PARTIAL_HIT_NPC = 2
--- * AIM_PARTIAL_HIT_WORLD = 3
--- * AIM_PARTIAL_HIT_TARGET = 4
function NPC:MoveGroundStep(pos, targetEntity, yaw, asFarAsCan, testZ) end

---Executes a jump move.
---
--- Related functions are [NPC:MoveJumpStart](https://wiki.facepunch.com/gmod/NPC:MoveJumpStart) and [NPC:MoveJumpStop](https://wiki.facepunch.com/gmod/NPC:MoveJumpStop).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveJumpExec
---@return AIMR # The result. See Enums/AIMR.
function NPC:MoveJumpExec() end

---Starts a jump move.
---
--- Related functions are [NPC:MoveJumpExec](https://wiki.facepunch.com/gmod/NPC:MoveJumpExec) and [NPC:MoveJumpStop](https://wiki.facepunch.com/gmod/NPC:MoveJumpStop).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveJumpStart
---@param vel Vector The jump velocity.
function NPC:MoveJumpStart(vel) end

---Stops a jump move.
---
--- Related functions are [NPC:MoveJumpExec](https://wiki.facepunch.com/gmod/NPC:MoveJumpExec) and [NPC:MoveJumpStart](https://wiki.facepunch.com/gmod/NPC:MoveJumpStart).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveJumpStop
---@return AIMR # The result. See Enums/AIMR.
function NPC:MoveJumpStop() end

---Makes the NPC walk toward the given position. The NPC will return to the player after amount of time set by **player_squad_autosummon_time** [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
--- Only works on Citizens (npc_citizen) and is a part of the Half-Life 2 squad system.
---
--- The NPC **must** be in the player's squad for this to work.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveOrder
---@param position Vector The target position for the NPC to walk to.
function NPC:MoveOrder(position) end

---Pauses the NPC movement?
---
--- Related functions are [NPC:MoveStart](https://wiki.facepunch.com/gmod/NPC:MoveStart), [NPC:MoveStop](https://wiki.facepunch.com/gmod/NPC:MoveStop) and [NPC:ResetMoveCalc](https://wiki.facepunch.com/gmod/NPC:ResetMoveCalc).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MovePause
function NPC:MovePause() end

---Starts NPC movement?
---
--- Related functions are [NPC:MoveStop](https://wiki.facepunch.com/gmod/NPC:MoveStop), [NPC:MovePause](https://wiki.facepunch.com/gmod/NPC:MovePause) and [NPC:ResetMoveCalc](https://wiki.facepunch.com/gmod/NPC:ResetMoveCalc).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveStart
function NPC:MoveStart() end

---Stops the NPC movement?
---
--- Related functions are [NPC:MoveStart](https://wiki.facepunch.com/gmod/NPC:MoveStart), [NPC:MovePause](https://wiki.facepunch.com/gmod/NPC:MovePause) and [NPC:ResetMoveCalc](https://wiki.facepunch.com/gmod/NPC:ResetMoveCalc).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:MoveStop
function NPC:MoveStop() end

---Picks random node around given vector, around specified length, using dir as search direction start. Works similarly to [NPC:NavSetRandomGoal](https://wiki.facepunch.com/gmod/NPC:NavSetRandomGoal), but you can decide any position you want as a search starting point rather than your NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:NavSetGoal
---@param pos Vector The origin to calculate a path from.
---@param length number The target length of the path to calculate.
---@param dir Vector The direction in which to look for a new path end goal.
---@return boolean # Whether path generation was successful or not.
function NPC:NavSetGoal(pos, length, dir) end

---Creates a path to closest node at given position. This won't actually force the NPC to move.
---
--- **NOTE**: This will call either [NPC:TaskComplete](https://wiki.facepunch.com/gmod/NPC:TaskComplete) or [NPC:TaskFail](https://wiki.facepunch.com/gmod/NPC:TaskFail) for the current schedule and task, forcing the current task to progress to next task or fail.
---
--- See also [NPC:NavSetRandomGoal](https://wiki.facepunch.com/gmod/NPC:NavSetRandomGoal).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:NavSetGoalPos
---@param pos Vector The position to calculate a path to.
---@return boolean # Whether path generation was successful or not.
function NPC:NavSetGoalPos(pos) end

---Set the goal target for an NPC.
---
--- This will call either [NPC:TaskComplete](https://wiki.facepunch.com/gmod/NPC:TaskComplete) or [NPC:TaskFail](https://wiki.facepunch.com/gmod/NPC:TaskFail) for the current schedule and task, forcing the current task to progress to next task or fail.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:NavSetGoalTarget
---@param target Entity The targeted entity to set the goal to.
---@param offset? Vector The offset to apply to the targeted entity's position.
---@return boolean # Whether path generation was successful or not
function NPC:NavSetGoalTarget(target, offset) end

---Creates a random path of specified minimum length between a closest start node and random node in the specified direction. This won't actually force the NPC to move.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:NavSetRandomGoal
---@param minPathLength number Minimum length of path in units
---@param dir Vector Unit vector pointing in the direction of the target random node
---@return boolean # Whether path generation was successful or not
function NPC:NavSetRandomGoal(minPathLength, dir) end

---Sets a goal in x, y offsets for the NPC to wander to
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:NavSetWanderGoal
---@param xOffset number X offset
---@param yOffset number Y offset
---@return boolean # Whether path generation was successful or not
function NPC:NavSetWanderGoal(xOffset, yOffset) end

---Forces the NPC to pickup an existing weapon entity. The NPC will not pick up the weapon if they already own a weapon of given type, or if the NPC could not normally have this weapon in their inventory.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:PickupWeapon
---@param wep Weapon The weapon to try to pick up.
---@return boolean # Whether the NPC succeeded in picking up the weapon or not.
function NPC:PickupWeapon(wep) end

---Forces the NPC to play a sentence from scripts/sentences.txt
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:PlaySentence
---@param sentence string The sentence string to speak.
---@param delay number Delay in seconds until the sentence starts playing.
---@param volume number The volume of the sentence, from 0 to 1.
---@return number # Returns the sentence index, -1 if the sentence couldn't be played.
function NPC:PlaySentence(sentence, delay, volume) end

---Makes the NPC remember an entity or an enemy as unreachable, for a specified amount of time. Use [NPC:IsUnreachable](https://wiki.facepunch.com/gmod/NPC:IsUnreachable) to check if an entity is still unreachable.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:RememberUnreachable
---@param ent Entity The entity to mark as unreachable.
---@param time? number For how long to remember the entity as unreachable. Negative values will act as `3` seconds.
function NPC:RememberUnreachable(ent, time) end

---Removes conditions to ignore for the this NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:RemoveIgnoreConditions
---@param conditions? table Ignore conditions to remove, see Enums/COND. If omitted, removes all ignore conditions.
function NPC:RemoveIgnoreConditions(conditions) end

---Resets the ideal activity of the NPC. See also [NPC:SetIdealActivity](https://wiki.facepunch.com/gmod/NPC:SetIdealActivity).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ResetIdealActivity
---@param act number The new activity. See Enums/ACT.
function NPC:ResetIdealActivity(act) end

---Resets all the movement calculations.
---
--- Related functions are [NPC:MoveStart](https://wiki.facepunch.com/gmod/NPC:MoveStart), [NPC:MovePause](https://wiki.facepunch.com/gmod/NPC:MovePause) and [NPC:MoveStop](https://wiki.facepunch.com/gmod/NPC:MoveStop).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:ResetMoveCalc
function NPC:ResetMoveCalc() end

---Starts an engine task.
---
--- Used internally by the [ai_task](https://wiki.facepunch.com/gmod/ai_task).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:RunEngineTask
---@param taskID number The task ID, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param taskData number The task data.
function NPC:RunEngineTask(taskID, taskData) end

---Forces the NPC to switch to a specific weapon the NPC owns. See [NPC:GetWeapons](https://wiki.facepunch.com/gmod/NPC:GetWeapons).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SelectWeapon
---@param weapon string|Weapon A classname of the weapon or a Weapon entity to switch to.
function NPC:SelectWeapon(weapon) end

---Stops any sounds (speech) the NPC is currently playing.
---
--- Equivalent to `Entity:EmitSound( "AI_BaseNPC.SentenceStop" )`
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SentenceStop
function NPC:SentenceStop() end

---Sets the NPC's current activity.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetActivity
---@param act number The new activity to set, see Enums/ACT.
function NPC:SetActivity(act) end

---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetArrivalActivity
---@param act number See Enums/ACT.
function NPC:SetArrivalActivity(act) end

---Sets the direction from the NPC origin to its current navigational destination.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetArrivalDirection
---@param dir Vector The new arrival direction.
function NPC:SetArrivalDirection(dir) end

---Sets the distance to goal at which the NPC should stop moving and continue to other business such as doing the rest of their tasks in a schedule.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetArrivalDistance
---@param dist number The distance to goal that is close enough for the NPC
function NPC:SetArrivalDistance(dist) end

---Sets the sequence to be played when the NPC arrives at its goal.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetArrivalSequence
---@param seq number See Entity:LookupSequence.
function NPC:SetArrivalSequence(seq) end

---Sets the arrival speed? of the NPC
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetArrivalSpeed
---@param speed number The new arrival speed
function NPC:SetArrivalSpeed(speed) end

---Sets an NPC condition.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetCondition
---@param condition COND The condition index, see Enums/COND.
function NPC:SetCondition(condition) end

---Sets the weapon proficiency of an NPC (how skilled an NPC is with its current weapon).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetCurrentWeaponProficiency
---@param proficiency number The proficiency for the NPC's current weapon. See Enums/WEAPON_PROFICIENCY.
function NPC:SetCurrentWeaponProficiency(proficiency) end

---Sets the target for an NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetEnemy
---@param enemy Entity The enemy that the NPC should target
---@param newenemy? boolean Calls NPC:SetCondition(COND.NEW_ENEMY) if the new enemy is valid and not equal to the last enemy.
function NPC:SetEnemy(enemy, newenemy) end

---Sets the NPC's .vcd expression. Similar to [Entity:PlayScene](https://wiki.facepunch.com/gmod/Entity:PlayScene) except the scene is looped until it's interrupted by default NPC behavior or [NPC:ClearExpression](https://wiki.facepunch.com/gmod/NPC:ClearExpression).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetExpression
---@param m_iszExpressionScene string The expression filepath.
---@return number # Default duration of assigned expression, in seconds.
function NPC:SetExpression(m_iszExpressionScene) end

---Forces given NPC to crouch, if it is able to do so. Only Citizens and Combine Soldiers can by default.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetForceCrouch
---@param force boolean Whether to force the NPC to crouch or not. `false` clears the "force crouch" flag, but does not guarantee to force the NPC to stand back up.
function NPC:SetForceCrouch(force) end

---Sets the Field Of View of the NPC, for use with such functions as [NPC:IsInViewCone](https://wiki.facepunch.com/gmod/NPC:IsInViewCone). it is also used internally by the NPC for enemy detection, etc.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetFOV
---@param fov number The new FOV for the NPC in degrees.
function NPC:SetFOV(fov) end

---Updates the NPC's hull and physics hull in order to match its model scale. [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale) seems to take care of this regardless.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetHullSizeNormal
function NPC:SetHullSizeNormal() end

---Sets the hull type for the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetHullType
---@param hullType number Hull type. See Enums/HULL
function NPC:SetHullType(hullType) end

---Sets the ideal activity the NPC currently wants to achieve. This is most useful for custom SNPCs.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetIdealActivity
---@param number number The ideal activity to set. Enums/ACT.
function NPC:SetIdealActivity(number) end

---Sets the ideal sequence the NPC currently wants to achieve. This is most useful for custom SNPCs.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetIdealSequence
---@param sequenceId number The ideal sequence to set. Entity:LookupSequence.
function NPC:SetIdealSequence(sequenceId) end

---Sets the ideal yaw angle (left-right rotation) for the NPC. Does not actually force the NPC to start turning in that direction. See [NPC:UpdateYaw](https://wiki.facepunch.com/gmod/NPC:UpdateYaw), [NPC:GetIdealYaw](https://wiki.facepunch.com/gmod/NPC:GetIdealYaw) and [NPC:SetIdealYawAndUpdate](https://wiki.facepunch.com/gmod/NPC:SetIdealYawAndUpdate).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetIdealYaw
---@param angle number The aim direction to set, the `yaw` component.
function NPC:SetIdealYaw(angle) end

---Sets the ideal yaw angle (left-right rotation) for the NPC and forces them to turn to that angle.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetIdealYawAndUpdate
---@param angle number The aim direction to set, the `yaw` component.
---@param speed? number The turn speed. Special values are:
--- * `-1` - Calculate automatically
--- * `-2` - Keep the previous yaw speed
function NPC:SetIdealYawAndUpdate(angle, speed) end

---Sets conditions to ignore, which would normally interrupt an Engine-based schedule. Specified conditions will still be set, will call [ENTITY:OnCondition](https://wiki.facepunch.com/gmod/ENTITY:OnCondition) and can be returned by [NPC:HasCondition](https://wiki.facepunch.com/gmod/NPC:HasCondition), but they will no longer interrupt the Engine schedule.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetIgnoreConditions
---@param conditions table Conditions to ignore, see Enums/COND. The table must be sequential, numerical and values must correspond to condition enums.
---@param size number Number of conditions to include in the ignored conditions table. Set this to the size of ignored conditions table to ignore all specified conditions.
function NPC:SetIgnoreConditions(conditions, size) end

---Sets the last registered or memorized position for this NPC. When using scheduling, the NPC will focus on navigating to the last position via nodes.
---
--- **NOTE**: The navigation requires ground nodes to function properly, otherwise the NPC could only navigate in a small area. (https://developer.valvesoftware.com/wiki/Info_node)
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetLastPosition
---@param position Vector Where the NPC's last position will be set.
function NPC:SetLastPosition(position) end

---Sets NPC's max view distance. An NPC will not be able to see enemies outside of this distance.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetMaxLookDistance
---@param dist number New maximum distance the NPC can see at. Default is 2048 and 6000 for long range NPCs such as the sniper.
function NPC:SetMaxLookDistance(dist) end

---Sets how long to try rebuilding path before failing task.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetMaxRouteRebuildTime
---@param time number How long to try rebuilding path before failing task
function NPC:SetMaxRouteRebuildTime(time) end

---Sets the movement delay for given NPC.
---
--- See [NPC:GetMoveDelay](https://wiki.facepunch.com/gmod/NPC:GetMoveDelay).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetMoveDelay
---@param delay number The amount of time in seconds to delay movement by.
function NPC:SetMoveDelay(delay) end

---Sets the timestep the internal NPC motor is working on.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetMoveInterval
---@param time number The new timestep.
function NPC:SetMoveInterval(time) end

---Sets the activity the NPC uses when it moves.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetMovementActivity
---@param activity number The movement activity, see Enums/ACT.
function NPC:SetMovementActivity(activity) end

---Sets the sequence the NPC navigation path uses for speed calculation. Doesn't seem to have any visible effect on NPC movement or actively playing sequence.
---
--- To be able to use this, first set [NPC:SetIdealActivity](https://wiki.facepunch.com/gmod/NPC:SetIdealActivity) to `ACT_DO_NOT_DISTURB`, set this to any sequence with root motion data and call [Entity:SetSequence](https://wiki.facepunch.com/gmod/Entity:SetSequence) on your desired sequence. As long as your NPC's [NPC:GetMovementSequence](https://wiki.facepunch.com/gmod/NPC:GetMovementSequence) has root motion data, your NPC will move to navigation point even though your NPC's [Entity:GetSequence](https://wiki.facepunch.com/gmod/Entity:GetSequence) doesn't have any motion.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetMovementSequence
---@param sequenceId number The movement sequence index
function NPC:SetMovementSequence(sequenceId) end

---Sets the move velocity of the NPC
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetMoveVelocity
---@param vel Vector The new movement velocity.
function NPC:SetMoveVelocity(vel) end

---Sets whether the current movement should locked on the Yaw axis or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetMoveYawLocked
---@param lock boolean Whether the movement should yaw locked or not.
function NPC:SetMoveYawLocked(lock) end

---Sets the navigation type of the NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetNavType
---@param navtype number The new nav type. See Enums/NAV.
function NPC:SetNavType(navtype) end

---Sets the state the NPC is in to help it decide on a ideal schedule.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetNPCState
---@param state number New NPC state, see Enums/NPC_STATE
function NPC:SetNPCState(state) end

---Sets the NPC's current schedule.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetSchedule
---@param schedule number The NPC schedule, see Enums/SCHED.
function NPC:SetSchedule(schedule) end

---Assigns the NPC to a new squad. A squad can have up to 16 NPCs. NPCs in a single squad should be friendly to each other.
---
--- See also [ai.GetSquadMembers](https://wiki.facepunch.com/gmod/ai.GetSquadMembers) and [NPC:GetSquad](https://wiki.facepunch.com/gmod/NPC:GetSquad).
---
--- NPCs within the same squad are meant to function more effectively, tactics wise.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetSquad
---@param name? string The new squad name to set. Do not provide this argument to reset the squad.
function NPC:SetSquad(name) end

---Sets the SNPC step height.
---
--- **NOTE**: This only works for [scripted NPCs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetStepHeight
---@param height number The new step height. Default is 18 Hammer Units.
function NPC:SetStepHeight(height) end

---Sets the NPC's target. This is used in some engine schedules.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetTarget
---@param entity Entity The target of the NPC.
function NPC:SetTarget(entity) end

---Sets the status of the current task.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetTaskStatus
---@param status number The status. See Enums/TASKSTATUS.
function NPC:SetTaskStatus(status) end

---Sets given entity as an unforgettable enemy. The state can be retrieved via [NPC:IsUnforgettable](https://wiki.facepunch.com/gmod/NPC:IsUnforgettable).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetUnforgettable
---@param enemy Entity The enemy entity to set.
---@param set? boolean The entity to set.
function NPC:SetUnforgettable(enemy, set) end

---Sets the view offset of the NPC. Player alternative of [Player:SetViewOffset](https://wiki.facepunch.com/gmod/Player:SetViewOffset).
---
--- This affects NPC's [NPC:GetShootPos](https://wiki.facepunch.com/gmod/NPC:GetShootPos).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:SetViewOffset
---@param Vector Vector The view offset to set.
function NPC:SetViewOffset(Vector) end

---Forces the NPC to start an engine task, this has different results for every NPC.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:StartEngineTask
---@param task number The id of the task to start, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param taskData number The task data as a float, not all tasks make use of it.
function NPC:StartEngineTask(task, taskData) end

---Resets the NPC's movement animation and velocity. Does not actually stop the NPC from moving.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:StopMoving
---@param immediate? boolean Whether to stop moving even when currently active goal doesn't want us to.
function NPC:StopMoving(immediate) end

---Cancels [NPC:MoveOrder](https://wiki.facepunch.com/gmod/NPC:MoveOrder) basically.
---
--- Only works on Citizens (npc_citizen) and is a part of the Half-Life 2 squad system.
---
--- The NPC **must** be in the player's squad for this to work.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:TargetOrder
---@param target Entity Must be a player, does nothing otherwise.
function NPC:TargetOrder(target) end

---Marks the current NPC task as completed.
---
--- This is meant to be used alongside [NPC:TaskFail](https://wiki.facepunch.com/gmod/NPC:TaskFail) to complete or fail custom Lua defined tasks. ([Schedule:AddTask](https://wiki.facepunch.com/gmod/Schedule:AddTask))
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:TaskComplete
function NPC:TaskComplete() end

---Marks the current NPC task as failed.
---
--- This is meant to be used alongside [NPC:TaskComplete](https://wiki.facepunch.com/gmod/NPC:TaskComplete) to complete or fail custom Lua defined tasks. ([Schedule:AddTask](https://wiki.facepunch.com/gmod/Schedule:AddTask))
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:TaskFail
---@param failReason string Fail reason to be passed onto ENTITY:OnTaskFailed. The fail reason can also be seen when the NPC's `ent_text` is active.
function NPC:TaskFail(failReason) end

---Force the NPC to update information on the supplied enemy, as if it had line of sight to it.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UpdateEnemyMemory
---@param enemy Entity The enemy to update.
---@param pos Vector The last known position of the enemy.
function NPC:UpdateEnemyMemory(enemy, pos) end

---Updates the turn activity. Basically applies the turn animations depending on the current turn yaw.
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UpdateTurnActivity
function NPC:UpdateTurnActivity() end

---Forces the NPC to turn to their ideal yaw angle. See [NPC:SetIdealYaw](https://wiki.facepunch.com/gmod/NPC:SetIdealYaw) and [NPC:SetIdealYawAndUpdate](https://wiki.facepunch.com/gmod/NPC:SetIdealYawAndUpdate).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UpdateYaw
---@param speed? number The turn speed. Special values are:
--- * `-1` - Calculate automatically
--- * `-2` - Keep the previous yaw speed
function NPC:UpdateYaw(speed) end

---**NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UseActBusyBehavior
---@return boolean # If we succeeded setting the behavior.
function NPC:UseActBusyBehavior() end

---Enables the AI's [Assault Behavior](https://developer.valvesoftware.com/wiki/Assault "Assault Behavior") when an `ai_goal_assault` is set for this SENT.
--- **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UseAssaultBehavior
---@return boolean # Whether the action succeeded.
function NPC:UseAssaultBehavior() end

---**NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UseFollowBehavior
---@return boolean # If we succeeded setting the behavior.
function NPC:UseFollowBehavior() end

---Orders the SNPC to control any nearby `func_tank`s looking for an NPC to operate itself, if available.
--- **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UseFuncTankBehavior
---@return boolean # Whether the action succeeded.
function NPC:UseFuncTankBehavior() end

---Enables the AI's [Lead Behavior](https://developer.valvesoftware.com/wiki/ai_goal_lead "Lead Behavior") when an `ai_goal_lead` is set for this SENT.
--- **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UseLeadBehavior
---@return boolean # Whether the action succeeded.
function NPC:UseLeadBehavior() end

---Undoes the other `Use*Behavior` functions.
---
--- **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---@realm server
---@source https://wiki.facepunch.com/gmod/NPC:UseNoBehavior
function NPC:UseNoBehavior() end
