---Effect prop shipped by the base gamemode: a small physics handle carrying the visible model.
---@source garrysmod/gamemodes/base/entities/entities/prop_effect.lua
---@class prop_effect : base_anim
---@field AttachedEntity? Entity The `prop_dynamic` that renders the effect's model, parented to this entity. Set when the server spawns it; on the client, only once that child is found.
local prop_effect = {}
