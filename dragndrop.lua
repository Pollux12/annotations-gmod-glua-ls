---@meta

--- The drag'n'drop library, used internally by certain base panels to allow for drag'n'drop functionality, like spawnmenu's customizations.
dragndrop = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Calls the receiver function of hovered panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.CallReceiverFunction
---@param bDoDrop boolean true if the mouse was released, false if we right clicked.
---@param command number The command value. This should be the ID of the clicked dropdown menu ( if right clicked, or nil ).
---@param mx number The local to the panel mouse cursor X position when the click happened.
---@param my number The local to the panel  mouse cursor Y position when the click happened.
function dragndrop.CallReceiverFunction(bDoDrop, command, mx, my) end

---Clears all the internal drag'n'drop variables.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.Clear
function dragndrop.Clear() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Handles the drop action of drag'n'drop library.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.Drop
function dragndrop.Drop() end

---Returns a table of currently dragged panels.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.GetDroppable
---@param name? string If set, the function will return only the panels with this Panel:Droppable name.
---@return table # A table of all panels that are being currently dragged, if any.
function dragndrop.GetDroppable(name) end

---Allows you to capture the panel that was dropped into the game (dropped onto the root panel). This function is meant to be overridden.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.HandleDroppedInGame
function dragndrop.HandleDroppedInGame() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Handles the hover think. Called from [dragndrop.Think](https://wiki.facepunch.com/gmod/dragndrop.Think).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.HoverThink
function dragndrop.HoverThink() end

---Returns whether the user is dragging something with the drag'n'drop system.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.IsDragging
---@return boolean # True if the user is dragging something with the drag'n'drop system.
function dragndrop.IsDragging() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Starts the drag'n'drop.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.StartDragging
function dragndrop.StartDragging() end

---Stops the drag'n'drop and calls [dragndrop.Clear](https://wiki.facepunch.com/gmod/dragndrop.Clear).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.StopDragging
function dragndrop.StopDragging() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Handles all the drag'n'drop processes. Calls [dragndrop.UpdateReceiver](https://wiki.facepunch.com/gmod/dragndrop.UpdateReceiver) and [dragndrop.HoverThink](https://wiki.facepunch.com/gmod/dragndrop.HoverThink).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.Think
function dragndrop.Think() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the receiver to drop the panels onto. Called from [dragndrop.Think](https://wiki.facepunch.com/gmod/dragndrop.Think).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/dragndrop.UpdateReceiver
function dragndrop.UpdateReceiver() end
