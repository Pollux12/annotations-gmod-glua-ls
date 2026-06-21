---We're being dropped on something
--- We can create a new panel here and return it, so that instead of dropping us - it drops the new panel instead! We remain where we are!
--- Only works for panels derived from [DDragBase](https://wiki.facepunch.com/gmod/DDragBase).
---@hook OnDrop
---@realm client
---@source https://wiki.facepunch.com/gmod/PANEL:OnDrop
---@param target Panel The panel being dropped onto.
---@return Panel # The panel to drop instead of us. By default you should return self.
function Panel:OnDrop(target) end
