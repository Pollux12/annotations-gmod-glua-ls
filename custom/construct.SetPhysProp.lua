---Sets props physical properties.
---@realm server
---@source https://wiki.facepunch.com/gmod/construct.SetPhysProp
---@param ply Player The player. This variable is not used and can be left out.
---@param ent Entity The entity to apply properties to.
---@param physObjID number You can use this or the argument below. This will be used in case you don't provide argument below.
---@param physObj PhysObj? The physics object to apply the properties to.
---@param data PhysProperties The table containing properties to apply. See Structures/PhysProperties.
function construct.SetPhysProp(ply, ent, physObjID, physObj, data) end
