---Adds the specified object to the panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Panel:Add
---@generic T : Panel
---@overload fun(self: Panel, panelTable: table): Panel # Creates a panel from a PANEL table and parents it to this panel.
---@[call_arg("gmod.vgui_panel", "reference")]
---@param object `T`|T The panel to add, or a panel class name to create and add.
---@return (instance) T # The added or created panel
function Panel:Add(object) end
