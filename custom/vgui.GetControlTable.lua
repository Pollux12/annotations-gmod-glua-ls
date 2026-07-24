---Returns the table of a Lua-defined panel by name. Does not return parent members of the table!
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/vgui.GetControlTable
---@generic T : table
---@param Panelname `T` The name of the panel to get the table of.
---@return (definition) `T`? # The `PANEL` table of the a Lua-defined panel with given name, or `nil` if no Lua-defined panel is registered with that name.
function vgui.GetControlTable(Panelname) end
