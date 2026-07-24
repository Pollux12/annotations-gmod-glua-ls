---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- A VGUI base panel providing drag/drop functionality. Used by [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout), [DListLayout](https://wiki.facepunch.com/gmod/DListLayout) and [DTileLayout](https://wiki.facepunch.com/gmod/DTileLayout).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase
---@class (partial) DDragBase : DPanel
local DDragBase = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function used in DDragBase:MakeDroppable.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:DropAction_Copy
---@param drops Panel[] The list of panels being dropped.
---@param bDoDrop boolean Whether this is an actual drop or just a hover preview.
---@param command string The drop command string.
---@param x number Cursor X position.
---@param y number Cursor Y position.
function DDragBase:DropAction_Copy(drops, bDoDrop, command, x, y) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function used in DDragBase:MakeDroppable. Handles the normal drop action with positional drop targeting.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:DropAction_Normal
---@param drops Panel[] The list of panels being dropped.
---@param bDoDrop boolean Whether this is an actual drop or just a hover preview.
---@param command string The drop command string ("copy", "move", etc.)
---@param x number Cursor X position relative to the panel.
---@param y number Cursor Y position relative to the panel.
function DDragBase:DropAction_Normal(drops, bDoDrop, command, x, y) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function used in DDragBase:DropAction_Normal. Handles dropping without positional targeting.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:DropAction_Simple
---@param drops Panel[] The list of panels being dropped.
---@param bDoDrop boolean Whether this is an actual drop or just a hover preview.
---@param command string The drop command string.
---@param x number Cursor X position.
---@param y number Cursor Y position.
function DDragBase:DropAction_Simple(drops, bDoDrop, command, x, y) end

---Returns the drag'n'drop group this panel belongs to. See [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable). An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:GetDnD
---@return string # Name of the DnD family.
function DDragBase:GetDnD() end

---Returns whether this panel is read only or not for drag'n'drop purposes. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:GetReadOnly
---@return boolean # Whether this panel is read only or not.
function DDragBase:GetReadOnly() end

---Whether this panel uses live drag'n'drop previews. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:GetUseLiveDrag
---@return boolean #
function DDragBase:GetUseLiveDrag() end

---Makes the panel a receiver for any droppable panel with the same DnD name. Internally calls [Panel:Receiver](https://wiki.facepunch.com/gmod/Panel:Receiver).
---
--- See [Drag and Drop for VGUI](https://wiki.facepunch.com/gmod/Drag_and_Drop_for_VGUI).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable
---@param name string The unique name for the receiver slot. Only droppable panels with the same DnD name as this can be dropped on the panel.
---@param allowCopy boolean Whether or not to allow droppable panels to be copied when the Ctrl key is held down.
function DDragBase:MakeDroppable(name, allowCopy) end

---Called when anything is dropped on or rearranged within the [DDragBase](https://wiki.facepunch.com/gmod/DDragBase). For Override
---@hook OnModified
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:OnModified
function DDragBase:OnModified() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable).
---
--- See also [DDragBase:GetDnD](https://wiki.facepunch.com/gmod/DDragBase:GetDnD)
---
--- An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:SetDnD
---@param name string Name of the DnD family.
function DDragBase:SetDnD(name) end

---Determines where you can drop stuff.
--- "4" for left
--- "5" for center
--- "6" for right
--- "8" for top
--- "2" for bottom
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:SetDropPos
---@param pos? string Where you're allowed to drop things.
function DDragBase:SetDropPos(pos) end

---Sets whether this panel is read only or not for drag'n'drop purposes. If set to `true`, you can only copy from this panel, and cannot modify its contents. This is an [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:SetReadOnly
---@param name boolean Whether this panel should be read only or not.
function DDragBase:SetReadOnly(name) end

---Whether to use live drag'n'drop previews. This is an [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:SetUseLiveDrag
---@param newState boolean
function DDragBase:SetUseLiveDrag(newState) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function used in [DDragBase:DropAction_Normal](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Normal)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDragBase:UpdateDropTarget
---@param drop number
---@param pnl Panel
function DDragBase:UpdateDropTarget(drop, pnl) end
