---@meta

--- The widgets library.
---
--- Widgets allow the player to have mouse interaction with entities, such as being able to manipulate the [bones of an NPC](https://www.youtube.com/watch?v=O3gG0t39-pQ).
widgets = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Automatically called to update all widgets.
---@realm shared
---@source https://wiki.facepunch.com/gmod/widgets.PlayerTick
---@param ply Player The player
---@param mv CMoveData Player move data
function widgets.PlayerTick(ply, mv) end

---Renders a widget. Normally you won't need to call this.
---@realm client
---@source https://wiki.facepunch.com/gmod/widgets.RenderMe
---@param ent Entity Widget entity to render
function widgets.RenderMe(ent) end
