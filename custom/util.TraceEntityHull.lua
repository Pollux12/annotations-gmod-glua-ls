---Identical to util.TraceHull but uses an entity's Axis-Aligned Bounding Box (AABB) for `mins`/`maxs` inputs. (These 2 keys will be ignored in the provided table)
---@realm shared
---@source https://wiki.facepunch.com/gmod/util.TraceEntityHull
---@outparam tracedata.output TraceResult
---@param tracedata HullTrace Trace data. See Structures/HullTrace
---@param ent Entity The entity to use mins/maxs of for the hull trace.
---@return TraceResult # Trace result. See Structures/TraceResult
function util.TraceEntityHull(tracedata, ent) end
