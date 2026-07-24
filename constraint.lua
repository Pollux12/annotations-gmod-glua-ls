---@meta

--- The constraint library allows you to control the constraint system built into the physics engine (rope, weld, ballsockets, etc).
constraint = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Stores the constraint entity in the constrained entity's `Constraints` table.
---
--- This will make the `constrt` entity be removed if any of the other entities `ent1`, `ent2`, `ent3` or `ent4` are removed by any means.
--- To prevent this, [constraint.AddConstraintTableNoDelete](https://wiki.facepunch.com/gmod/constraint.AddConstraintTableNoDelete) can be used instead.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.AddConstraintTable
---@param ent1 Entity The entity to store the information on.
---@param constrt Entity The constraint to store in the entity's table.
---@param ent2? Entity Optional. If different from `ent1`, the info will also be stored in the table for this entity.
---@param ent3? Entity Optional. Same as `ent2`.
---@param ent4? Entity Optional. Same as `ent2`.
function constraint.AddConstraintTable(ent1, constrt, ent2, ent3, ent4) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Stores info about the constraints on the entity's table.
---
--- The only difference between this and [constraint.AddConstraintTable](https://wiki.facepunch.com/gmod/constraint.AddConstraintTable) is that the constraint does not get deleted when any of the constrained entities are removed.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.AddConstraintTableNoDelete
---@param ent1 Entity The entity to store the information on.
---@param constrt Entity The constraint to store in the entity's table.
---@param ent2? Entity Optional. If different from `ent1`, the info will also be stored in the table for this entity.
---@param ent3? Entity Optional. Same as `ent2`.
---@param ent4? Entity Optional. Same as `ent2`.
function constraint.AddConstraintTableNoDelete(ent1, constrt, ent2, ent3, ent4) end

---Creates an advanced ballsocket (ragdoll) constraint. See [constraint.Ballsocket](https://wiki.facepunch.com/gmod/constraint.Ballsocket) for the simpler version.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.AdvBallsocket
---@param ent1 Entity First entity.
---@param ent2 Entity Second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param localPos1 Vector Position relative to the the first physics object to constrain to.
---@param localPos2? Vector Position relative to the the second physics object to constrain to.
--- 			Does nothing!
---@param forceLimit? number Amount of force until it breaks (0 = unbreakable).
---@param torqueLimit? number Amount of torque (rotation speed) until it breaks (0 = unbreakable).
---@param xMin number Minimum angle in rotations around the X axis local to the constraint.
---@param yMin number Minimum angle in rotations around the Y axis local to the constraint.
---@param zMin number Minimum angle in rotations around the Z axis local to the constraint.
---@param xMax number Maximum angle in rotations around the X axis local to the constraint.
---@param yMax number Maximum angle in rotations around the Y axis local to the constraint.
---@param zMax number Maximum angle in rotations around the Z axis local to the constraint.
---@param xFric? number Rotational friction in the X axis local to the constraint.
---@param yFric? number Rotational friction in the Y axis local to the constraint.
---@param zFric? number Rotational friction in the Z axis local to the constraint.
---@param onlyRotation? number Only limit rotation, free movement.
---@param noCollide? number Whether the entities should be no-collided.
---@return Entity # A [phys_ragdollconstraint](https://developer.valvesoftware.com/wiki/Phys_ragdollconstraint) entity. Will return `false` if the constraint could not be created.
function constraint.AdvBallsocket(
	ent1,
	ent2,
	bone1,
	bone2,
	localPos1,
	localPos2,
	forceLimit,
	torqueLimit,
	xMin,
	yMin,
	zMin,
	xMax,
	yMax,
	zMax,
	xFric,
	yFric,
	zFric,
	onlyRotation,
	noCollide
)
end

---Creates an axis constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Axis
---@param ent1 Entity First entity.
---@param ent2 Entity Second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param localPos1 Vector Position relative to the the first physics object to constrain to.
---@param localPos2 Vector Position relative to the the second physics object to constrain to.
---@param forceLimit? number Amount of force until it breaks (0 = unbreakable).
---@param torqueLimit? number Amount of torque (rotational force) until it breaks (0 = unbreakable).
---@param friction? number Constraint friction.
---@param noCollide? number Whether the entities should be no-collided.
---@param localAxis? Vector If you include the LocalAxis then LPos2 will not be used in the final constraint. However, LPos2 is still a required argument.
---@param dontAddTable? boolean Whether or not to add the constraint info on the entity table. See constraint.AddConstraintTable.
---@return Entity # The created constraint. ([phys_hinge](https://developer.valvesoftware.com/wiki/Phys_hinge)) Will return `false` if the constraint could not be created.
function constraint.Axis(
	ent1,
	ent2,
	bone1,
	bone2,
	localPos1,
	localPos2,
	forceLimit,
	torqueLimit,
	friction,
	noCollide,
	localAxis,
	dontAddTable
)
end

---Creates a ballsocket joint. See See [constraint.AdvBallsocket](https://wiki.facepunch.com/gmod/constraint.AdvBallsocket) if you also wish to limit rotation angles in some way.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Ballsocket
---@param ent1 Entity First entity.
---@param ent2 Entity Second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param localPos Vector Center position of the joint, relative to the **second** entity's physics object.
---@param forceLimit? number Amount of force until it breaks (0 = unbreakable).
---@param torqueLimit? number Amount of torque (rotational force) until it breaks (0 = unbreakable).
---@param nocollide? number Whether the constrained entities should collided with each other or not.
---@return Entity # The created constraint. ([phys_ballsocket](https://developer.valvesoftware.com/wiki/Phys_ballsocket)) Will return `false` if the constraint could not be created.
function constraint.Ballsocket(ent1, ent2, bone1, bone2, localPos, forceLimit, torqueLimit, nocollide) end

---Basic checks to make sure that the specified entity and bone are valid. Returns false if we should not be constraining the entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.CanConstrain
---@param ent Entity The entity to check.
---@param bone number The bone of the entity to check (use 0 for mono boned ents).
---@return boolean # Whether a constraint can or should be created.
function constraint.CanConstrain(ent, bone) end

---Creates a rope without any constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.CreateKeyframeRope
---@param pos Vector Position for the rope entity. Unknown effect, probably none.
---@param width number Width of the rope.
---@param material? string Material of the rope. If unset, will be solid black.
---@param constraint? Entity Constraint for the rope. If set, the rope will be deleted when the constraint entity is.
---@param ent1 Entity First entity.
---@param localPos1 Vector Position relative to the the first physics object to constrain to.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param ent2 Entity Second entity.
---@param localPos2 Vector Position relative to the the second physics object to constrain to.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param keyValues? table Any additional key/values to be set on the rope.
---@return Entity # The created rope ([keyframe_rope](https://developer.valvesoftware.com/wiki/Keyframe_rope)), or `nil` or failure.
function constraint.CreateKeyframeRope(
	pos,
	width,
	material,
	constraint,
	ent1,
	localPos1,
	bone1,
	ent2,
	localPos2,
	bone2,
	keyValues
)
end

---Creates an invisible, non-moveable anchor point in the world to which things can be attached.
--- 	**NOTE**: The entity used internally by this function (`gmod_anchor`) only exists in Sandbox derived gamemodes, meaning this function will only work in these gamemodes.
---
--- 	To use this in other gamemodes, you may need to create your own [gmod_anchor](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/entities/entities/gmod_anchor.lua) entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.CreateStaticAnchorPoint
---@param pos Vector The position to spawn the anchor at
---@return Entity # The anchor entity. (`gmod_anchor`)
---@return PhysObj # The achor entity's physics object. (Entity:GetPhysicsObject)
---@return number # Always `0`.
---@return Vector # Always `vector_zero`.
function constraint.CreateStaticAnchorPoint(pos) end

---Creates an elastic rope constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Elastic
---@param ent1 Entity First entity.
---@param ent2 Entity Second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
--- See Entity:TranslateBoneToPhysBone.
---@param localPos1 Vector Position relative to the the first physics object to constrain to.
---@param localPos2 Vector Position relative to the the second physics object to constrain to.
---@param constant number Stiffness of the elastic. The larger the number the less the elastic will stretch.
---@param damping number How much energy the elastic loses. The larger the number, the less bouncy the elastic.
---@param relDamping number The amount of energy the elastic loses proportional to the relative velocity of the two objects the elastic is attached to.
---@param material? string The material of the rope. If unset, will be solid black.
---@param width number Width of rope.
---@param stretchOnly? boolean|number Apply physics forces only on stretch.
---@param color? Color The color of the rope. See Color.
---@return Entity|false|nil # The created constraint. ([phys_spring](https://developer.valvesoftware.com/wiki/Phys_spring)) Returns `false` for invalid inputs and `nil` when no spring is created.
---@return Entity? # The created rope. ([keyframe_rope](https://developer.valvesoftware.com/wiki/Keyframe_rope)) Returns `nil` if no rope was created.
function constraint.Elastic(
	ent1,
	ent2,
	bone1,
	bone2,
	localPos1,
	localPos2,
	constant,
	damping,
	relDamping,
	material,
	width,
	stretchOnly,
	color
)
end

---Returns the constraint of a specified type between two entities, if it exists
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Find
---@param ent1 Entity The first entity to check.
---@param ent2 Entity The second entity to check.
---@param type string The type of constraint, case sensitive. List of default constrains is as follows:
--- * `Weld`
--- * `Axis`
--- * `AdvBallsocket`
--- * `Rope`
--- * `Elastic`
--- * `NoCollide`
--- * `Motor`
--- * `Pulley`
--- * `Ballsocket`
--- * `Winch`
--- * `Hydraulic`
--- * `Muscle`
--- * `Keepupright`
--- * `Slider`
---@param bone1 number The bone number for the first entity (0 for monoboned entities).
---@param bone2 number The bone number for the second entity.
---@return Entity # The constraint found.
function constraint.Find(ent1, ent2, type, bone1, bone2) end

---Returns the first constraint of a specific type directly connected to the entity found.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.FindConstraint
---@param ent Entity The entity to check.
---@param type string The type of constraint, case sensitive. List of default constrains is as follows:
--- * `Weld`
--- * `Axis`
--- * `AdvBallsocket`
--- * `Rope`
--- * `Elastic`
--- * `NoCollide`
--- * `Motor`
--- * `Pulley`
--- * `Ballsocket`
--- * `Winch`
--- * `Hydraulic`
--- * `Muscle`
--- * `Keepupright`
--- * `Slider`
---@return table # The constraint table, set with constraint.AddConstraintTable
function constraint.FindConstraint(ent, type) end

---Returns the other entity involved in the first constraint of a specific type directly connected to the entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.FindConstraintEntity
---@param ent Entity The entity to check.
---@param type string The type of constraint, case sensitive. List of default constrains is as follows:
--- * `Weld`
--- * `Axis`
--- * `AdvBallsocket`
--- * `Rope`
--- * `Elastic`
--- * `NoCollide`
--- * `Motor`
--- * `Pulley`
--- * `Ballsocket`
--- * `Winch`
--- * `Hydraulic`
--- * `Muscle`
--- * `Keepupright`
--- * `Slider`
---@return Entity # The other entity.
function constraint.FindConstraintEntity(ent, type) end

---Returns a table of all constraints of a specific type directly connected to the entity.
---
--- If you are looking for a list of all constraints, use [constraint.GetTable](https://wiki.facepunch.com/gmod/constraint.GetTable).
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.FindConstraints
---@param ent Entity The entity to check.
---@param type string The type of constraint, case sensitive. List of default constrains is as follows:
--- * `Weld`
--- * `Axis`
--- * `AdvBallsocket`
--- * `Rope`
--- * `Elastic`
--- * `NoCollide`
--- * `Motor`
--- * `Pulley`
--- * `Ballsocket`
--- * `Winch`
--- * `Hydraulic`
--- * `Muscle`
--- * `Keepupright`
--- * `Slider`
---@return table # All the constraints of this entity.
function constraint.FindConstraints(ent, type) end

---Make this entity forget any constraints it knows about. Note that this will not actually remove the constraints.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.ForgetConstraints
---@param ent Entity The entity that will forget its constraints.
function constraint.ForgetConstraints(ent) end

---Returns a table of all entities recursively constrained to an entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.GetAllConstrainedEntities
---@param ent Entity The entity to check.
---@param resultTable? table Table used to return result. Optional.
---@return table # A table containing all of the constrained entities. This includes all entities constrained to entities constrained to the supplied entity, etc.
function constraint.GetAllConstrainedEntities(ent, resultTable) end

---Returns a table of all constraints directly connected to the entity.
---
--- If you are looking for a list of specific constraint(s), use [constraint.FindConstraints](https://wiki.facepunch.com/gmod/constraint.FindConstraints).
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.GetTable
---@param ent Entity The entity to check.
---@return table # A list of all constraints connected to the entity.
function constraint.GetTable(ent) end

---Returns true if the entity has constraints attached to it
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.HasConstraints
---@param ent Entity The entity to check.
---@return boolean # Whether the entity has any constraints or not.
function constraint.HasConstraints(ent) end

---Creates a Hydraulic constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Hydraulic
---@param pl Player The player creating the constraint.
---@param ent1 Entity First entity to constrain.
---@param ent2 Entity Second entity to constrain.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---@param localPos1 Vector Position relative to the first physics object to constrain to.
---@param localPos2 Vector Position relative to the second physics object to constrain to.
---@param lengthMin number Minimum length of the hydraulic spring constraint.
---@param lengthMax number Maximum length of the hydraulic spring constraint.
---@param width number Width of the rope.
---@param key number Numpad key binding for the hydraulic controller.
---@param fixed number Whether the hydraulic is fixed (1) or not (0).
---@param speed number Speed of movement.
---@param material string The material of the rope.
---@param toggle boolean Toggle behavior flag.
---@param color Color The color of the rope. See Color.
---@return Entity|false|nil # The created spring constraint. Returns `false` for invalid inputs.
---@return Entity? # The created rope entity (`keyframe_rope`). Returns `nil` if no rope was created.
---@return gmod_winch_controller? # The created winch controller.
---@return Entity? # The created slider constraint if `fixed` is 1.
function constraint.Hydraulic(
	pl,
	ent1,
	ent2,
	bone1,
	bone2,
	localPos1,
	localPos2,
	lengthMin,
	lengthMax,
	width,
	key,
	fixed,
	speed,
	material,
	toggle,
	color
)
end

---Creates a keep upright constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Keepupright
---@param ent Entity The entity to keep upright.
---@param ang Angle The angle defined as "upright".
---@param bone number The bone of the entity to constrain (0 for boneless).
---@param angularLimit number Basically, the strength of the constraint. Must be above 0.
---@return Entity # The created constraint, if any or false if the constraint failed to set.
function constraint.Keepupright(ent, ang, bone, angularLimit) end

---Creates a motor constraint, a player controllable [constraint.Axis](https://wiki.facepunch.com/gmod/constraint.Axis).
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Motor
---@param ent1 Entity First entity.
---@param ent2 Entity Second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls). Must be different from `bone1`.
---
--- See Entity:TranslateBoneToPhysBone.
---@param localPos1 Vector Position relative to the the first physics object to constrain to.
---@param localPos2 Vector Position relative to the the second physics object to constrain to.
---@param friction number Motor friction.
---@param torque number Motor torque.
---@param forcetime number Automatic shut-off after this time has passed. A value of 0 means to stay on forever or until deactivated.
---@param nocollide? number Whether the entities should be no-collided.
---@param toggle? boolean|number Whether the constraint is on toggle.
---@param player? Player The player that will control the motor. Used to to call numpad.OnDown and numpad.OnUp.
---@param forcelimit? number Amount of force until it breaks (0 = unbreakable).
---@param key_fwd? number The key binding for "forward", corresponding to an Enums/KEY.
---@param key_bwd? number The key binding for "backwards", corresponding to an Enums/KEY.
---@param direction? number Either `1` or `-1` signifying which direction the motor should spin.
---@param localAxis? Vector Overrides axis of rotation?
---@return Entity|false # The created constraint. ([phys_torque](https://developer.valvesoftware.com/wiki/Phys_torque)) Will return `false` if the constraint could not be created.
---@return Entity? # The created axis constraint. ([phys_hinge](https://developer.valvesoftware.com/wiki/Phys_hinge)) Will return `nil` if the constraint could not be created.
function constraint.Motor(
	ent1,
	ent2,
	bone1,
	bone2,
	localPos1,
	localPos2,
	friction,
	torque,
	forcetime,
	nocollide,
	toggle,
	player,
	forcelimit,
	key_fwd,
	key_bwd,
	direction,
	localAxis
)
end

---Creates a Muscle constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Muscle
---@param pl Player The player creating the constraint.
---@param ent1 Entity First entity to constrain.
---@param ent2 Entity Second entity to constrain.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---@param localPos1 Vector Position relative to the first physics object to constrain to.
---@param localPos2 Vector Position relative to the second physics object to constrain to.
---@param length1 number Min/Max length 1.
---@param length2 number Min/Max length 2.
---@param width number Width of the rope.
---@param key number Numpad key binding for the muscle controller.
---@param fixed number Whether the muscle is fixed (1) or not (0).
---@param period number Pulse frequency period/periodical adjustment.
---@param amplitude number Pulse range amplitude.
---@param starton boolean Whether the muscle starts relaxed or active.
---@param material string The material of the rope.
---@param color Color The color of the rope. See Color.
---@return Entity|false|nil # The created spring constraint. Returns `false` for invalid inputs.
---@return Entity? # The created rope entity (`keyframe_rope`). Returns `nil` if no rope was created.
---@return gmod_winch_controller? # The created winch controller.
---@return Entity? # The created slider constraint if `fixed` is 1.
function constraint.Muscle(
	pl,
	ent1,
	ent2,
	bone1,
	bone2,
	localPos1,
	localPos2,
	length1,
	length2,
	width,
	key,
	fixed,
	period,
	amplitude,
	starton,
	material,
	color
)
end

---Creates an no-collide "constraint". Disables collision between two entities.
--- **NOTE**: Does not work with players.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.NoCollide
---@param ent1 Entity First entity.
---@param ent2 Entity Second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param disableOnRemove? boolean If set, the nocollide will be reversed if the constraint is removed.
---@return Entity # The created constraint. ([logic_collision_pair](https://developer.valvesoftware.com/wiki/Logic_collision_pair)) Will return `false` if the constraint could not be created.
function constraint.NoCollide(ent1, ent2, bone1, bone2, disableOnRemove) end

---Creates a pulley constraint.
---
--- It consists of 3 rope segments, 2 of which have variable length, visually connected by a 3rd. Reducing length of one end will increase the length of the other end.
---
--- You can visualize the pulley like so:
--- ```
--- WPos2 --- WPos3
---   |			|
---   |			|
---  Ent1	   Ent4
--- ```
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Pulley
---@param ent1 Entity First entity to constrain.
---@param ent4 Entity The other entity to attach to.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param bone4 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param localPos1 Vector Position relative to the the first physics object to constrain to.
---@param localPos4 Vector Position relative to the the second physics object to constrain to.
---@param worldPos2 Vector World position constrain the first entity to. This point will be static.
---@param worldPos3 Vector World position constrain the second entity to. This point will be static.
---@param forceLimit number Amount of force until it breaks (0 = unbreakable).
---@param rigid? boolean Whether the constraint is rigid, i.e. cannot bend.
---@param width number Width of the rope. If below or at `0`, visual rope segments will not be created.
---@param material? string Material of the rope. If unset, will be solid black.
---@param color? Color The color of the rope.
---@return Entity # The created constraint. ([phys_pulleyconstraint](https://developer.valvesoftware.com/wiki/Phys_pulleyconstraint)) Will return `false` if the constraint could not be created.
---@return Entity # The first rope segment. ([keyframe_rope](https://developer.valvesoftware.com/wiki/Keyframe_rope)) Will return `nil` if the constraint or this rope segment could not be created.
---@return Entity # The second rope segment. ([keyframe_rope](https://developer.valvesoftware.com/wiki/Keyframe_rope)) Will return `nil` if the constraint or this rope segment could not be created.
---@return Entity # The third rope segment. ([keyframe_rope](https://developer.valvesoftware.com/wiki/Keyframe_rope)) Will return `nil` if the constraint or this rope segment could not be created.
function constraint.Pulley(
	ent1,
	ent4,
	bone1,
	bone4,
	localPos1,
	localPos4,
	worldPos2,
	worldPos3,
	forceLimit,
	rigid,
	width,
	material,
	color
)
end

---Attempts to remove all constraints associated with an entity.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.RemoveAll
---@param ent Entity The entity to remove constraints from.
---@return boolean # Whether any constraints were removed.
---@return number # Number of constraints removed.
function constraint.RemoveAll(ent) end

---Attempts to remove all constraints of a specified type associated with an entity
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.RemoveConstraints
---@param ent Entity The entity to check.
---@param type string The constraint type to remove (eg. `"Weld"`, `"Elastic"`, `"NoCollide"`).
---@return boolean # Whether we removed any constraints or not.
---@return number # The amount of constraints removed.
function constraint.RemoveConstraints(ent, type) end

---Creates a simple rope (length) based constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Rope
---@param ent1 Entity First entity.
---@param ent2 Entity Second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param localPos1 Vector Position relative to the the first physics object to constrain to.
---@param localPos2 Vector Position relative to the the second physics object to constrain to.
---@param length number Length of the rope.
---@param addLength? number Amount to add to the length of the rope. Works as it does in the Rope tool.
---@param forceLimit? number Amount of force until it breaks (0 = unbreakable).
---@param width number Width of the rope.
---@param material? string Material of the rope. If unset, will be solid black.
---@param rigid? boolean Whether the constraint is rigid.
---@param color? Color The color of the rope.
---@return Entity # The constraint entity ([phys_lengthconstraint](https://developer.valvesoftware.com/wiki/Phys_lengthconstraint)).
---
--- Will be a `keyframe_rope` if you are roping to the same bone on the same entity. Will return `false` if the constraint could not be created.
---@return Entity # The rope entity. Will return `nil` if `constraint` return value is a [keyframe_rope](https://developer.valvesoftware.com/wiki/Keyframe_rope) or if the constraint could not be created.
function constraint.Rope(
	ent1,
	ent2,
	bone1,
	bone2,
	localPos1,
	localPos2,
	length,
	addLength,
	forceLimit,
	width,
	material,
	rigid,
	color
)
end

---Creates a slider constraint. A slider is like a rope, but allows the constrained object to move only in 1 direction.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Slider
---@param ent1 Entity First entity.
---@param ent2 Entity Second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---
--- See Entity:TranslateBoneToPhysBone.
---@param localPos1 Vector Position relative to the the first physics object to constrain to.
---@param localPos2 Vector Position relative to the the second physics object to constrain to.
---@param width number The width of the rope.
---@param material? string The material of the rope. If unset, will be solid black.
---@param color? Color The color of the rope. See Color.
---@return Entity # The created constraint entity. ([phys_slideconstraint](https://developer.valvesoftware.com/wiki/Phys_slideconstraint)) Will return `false` if the constraint could not be created.
---@return Entity # The created rope. ([keyframe_rope](https://developer.valvesoftware.com/wiki/Keyframe_rope)) Will return `nil` if the constraint or the rope could not be created.
function constraint.Slider(ent1, ent2, bone1, bone2, localPos1, localPos2, width, material, color) end

---Creates a weld constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Weld
---@param ent1 Entity The first entity.
---@param ent2 Entity The second entity.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
--- See Entity:TranslateBoneToPhysBone.
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
--- See Entity:TranslateBoneToPhysBone.
---@param forceLimit? number The amount of force appliable to the constraint before it will break (0 is never).
---@param noCollide? boolean|number Should `ent1` be nocollided to `ent2` via this constraint.
---@param deleteEnt1OnBreak? boolean|number If true, when `ent2` is removed, `ent1` will also be removed.
---@return Entity|false # The created constraint entity, or false if the constraint failed. ([phys_constraint](https://developer.valvesoftware.com/wiki/Phys_constraint))
function constraint.Weld(ent1, ent2, bone1, bone2, forceLimit, noCollide, deleteEnt1OnBreak) end

---Creates a Winch constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Winch
---@param pl Player The player creating the constraint.
---@param ent1 Entity First entity to constrain.
---@param ent2 Entity Second entity to constrain.
---@param bone1 number PhysObj number of first entity to constrain to. (0 for non-ragdolls).
---@param bone2 number PhysObj number of second entity to constrain to. (0 for non-ragdolls).
---@param localPos1 Vector Position relative to the first physics object to constrain to.
---@param localPos2 Vector Position relative to the second physics object to constrain to.
---@param width number Width of the rope.
---@param fwd_bind number Numpad key binding for forward action.
---@param bwd_bind number Numpad key binding for backward action.
---@param fwd_speed number Speed of forward movement.
---@param bwd_speed number Speed of backward movement.
---@param material string The material of the rope.
---@param toggle boolean Toggle behavior flag.
---@param color Color The color of the rope. See Color.
---@return Entity|false|nil # The created spring constraint. Returns `false` for invalid inputs.
---@return Entity? # The created rope entity (`keyframe_rope`). Returns `nil` if no rope was created.
---@return gmod_winch_controller? # The created winch controller.
function constraint.Winch(
	pl,
	ent1,
	ent2,
	bone1,
	bone2,
	localPos1,
	localPos2,
	width,
	fwd_bind,
	bwd_bind,
	fwd_speed,
	bwd_speed,
	material,
	toggle,
	color
)
end
