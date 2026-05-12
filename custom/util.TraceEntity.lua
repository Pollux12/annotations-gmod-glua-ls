---Runs a trace using the entity's collisionmodel between two points. This does not take the entity's angles into account and will trace its unrotated collisionmodel.
---@realm shared
---@source https://wiki.facepunch.com/gmod/util.TraceEntity
---@outparam tracedata.output TraceResult
---@param tracedata Trace Trace data. See Structures/Trace
---@param ent Entity The entity to use
---@return TraceResult # Trace result. See Structures/TraceResult
function util.TraceEntity(tracedata, ent) end
