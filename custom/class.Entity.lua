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
