---@meta

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by the engine before [GM:OnEntityCreated](https://wiki.facepunch.com/gmod/GM:OnEntityCreated) and after [GM:EntityRemoved](https://wiki.facepunch.com/gmod/GM:EntityRemoved) hooks are called.
--- Internally used to clear the [player.Iterator](https://wiki.facepunch.com/gmod/player.Iterator) or [ents.Iterator](https://wiki.facepunch.com/gmod/ents.Iterator) cache
---@realm shared
---@source https://wiki.facepunch.com/gmod/InvalidateInternalEntityCache
---@param isPly boolean Reset the player.Iterator cache
function _G.InvalidateInternalEntityCache(isPly) end
