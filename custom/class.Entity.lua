--- For a list of possible members of [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities) see [ENT Structure](https://wiki.facepunch.com/gmod/Structures/ENT).
---@class Entity
---@field BaseClass Entity? The base class table of this entity, used for inheritance in the scripted entity system.
---@field EntityMods table? A table of entity modifications stored by the duplicator system via Entity:SetEntityMods.
local Entity = {}
---@class ENTITY : Entity
ENTITY = Entity

--- Base class name for inheritance (e.g. "base_entity").
---@field Base string
--- Entity type (e.g. "anim", "ai", "nextbot", "point").
---@field Type string
--- Whether the entity can be spawned from the spawn menu.
---@field Spawnable boolean
--- Whether only admins can spawn this entity.
---@field AdminOnly boolean
--- Display name shown in the spawn menu.
---@field PrintName string
--- Author name shown in the spawn menu.
---@field Author string
--- Contact info shown in the spawn menu.
---@field Contact string
--- Purpose description shown in the spawn menu.
---@field Purpose string
--- Usage instructions shown in the spawn menu.
---@field Instructions string
--- Whether the entity animates automatically.
---@field AutomaticFrameAdvance boolean

---Returns a table containing all key-value pairs stored on this entity's Lua table.
---The returned table contains all fields but method calls via `:` are not supported.
---@return tableof<self>
function Entity:GetTable() end
