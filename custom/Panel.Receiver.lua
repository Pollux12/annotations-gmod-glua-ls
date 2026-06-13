---Allows the panel to receive drag and drop events. Can be called multiple times with different names to receive multiple different draggable panel events.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Panel:Receiver
---@param name string Name of DnD panels to receive. This is set on the drag'n'drop-able panels via Panel:Droppable.
---@param func fun(pnl: Panel, tbl: table, dropped: boolean, command: any, x: number, y: number) This function is called whenever a panel with valid name is hovering above and dropped on this panel.
---@param menu? table<any, string> A table of commands to display as a menu if drag'n'drop was performed with a right click.
function Panel:Receiver(name, func, menu) end
