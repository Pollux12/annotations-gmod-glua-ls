---Current local mouse X position tracked by dragndrop while dispatching receivers.
---@type number
dragndrop.m_MouseLocalX = nil

---Current local mouse Y position tracked by dragndrop while dispatching receivers.
---@type number
dragndrop.m_MouseLocalY = nil

---@source garrysmod/lua/includes/extensions/client/panel/dragdrop.lua
---@type { Name: string, Func: fun(receiver: Panel, panels: Panel[], drop: boolean, command: number, x: number, y: number) }?
dragndrop.m_ReceiverSlot = nil
