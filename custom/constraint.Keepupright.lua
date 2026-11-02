---Creates a keep upright constraint.
---@realm server
---@source https://wiki.facepunch.com/gmod/constraint.Keepupright
---@param ent Entity The entity to keep upright.
---@param ang Angle The angle defined as "upright".
---@param bone number The bone of the entity to constrain (0 for boneless).
---@param angularLimit number Basically, the strength of the constraint. Must be above 0.
---@return ConstraintEntity|false|nil # The created constraint, if any or false if the constraint failed to set.
function constraint.Keepupright(ent, ang, bone, angularLimit) end
