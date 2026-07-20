---Registry of entity modifier callbacks populated by `duplicator.RegisterEntityModifier`.
---
---The callback data is modifier-defined and may be `nil` when a modifier is removed.
---@realm server
---@source https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/includes/modules/duplicator.lua#L406-L410
---@type table<string, fun(ply: Player, ent: Entity, data: any)>
duplicator.EntityModifiers = {}

