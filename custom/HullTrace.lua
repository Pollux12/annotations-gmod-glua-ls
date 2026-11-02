--- Table used by [util.TraceHull](https://wiki.facepunch.com/gmod/util.TraceHull).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Structures/HullTrace
---@class HullTrace : Trace
local HullTrace = {}

---The start position of the trace
---@type Vector
HullTrace.start = nil

---The end position of the trace
---@type Vector
HullTrace.endpos = nil

---The 3D vector local to the start/endpos with the highest values. This will represent the corner with the upper bounds of the box.
---@type Vector
HullTrace.maxs = nil

---The 3D vector local to the start/endpos with the lowest (often negative) values. This will represent the corner with the lower bounds of the box.
---@type Vector
HullTrace.mins = nil

---Things the trace should not hit. Can be an entity, a table of entities, a table of entity classes, a mixed table, or a function.
---
--- Using a function here is super slow. Try to avoid it.
---@type any
HullTrace.filter = nil

---The trace mask Enums/MASK. This determines what the trace should hit and what it shouldn't hit.
---@type MASK?
HullTrace.mask = MASK_SOLID

---The collision group Enums/COLLISION_GROUP. This determines what the trace should hit in regards to the entity's collision group.
---@type COLLISION_GROUP?
HullTrace.collisiongroup = COLLISION_GROUP_NONE

---Should the trace ignore world or not.
---@type boolean?
HullTrace.ignoreworld = false

---If set, the trace result will be written to the supplied table instead of returning a new table
---@type TraceResult|table|nil
HullTrace.output = nil

---Turns the `filter` field into a whitelist, if it is a table.
---@type boolean?
HullTrace.whitelist = false

---Enables traces to hit clientside only entities. Keep in mind that most naturally spawned entities are classified as debris, so extra `mask` values might be required.
---@type boolean?
HullTrace.hitclientonly = false
