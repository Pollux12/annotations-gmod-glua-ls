---Opens or closes the file tree.
---
--- The open state is coerced with tobool before it is stored.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetOpen
---@param open any Value to coerce into the open state.
---@param useAnim? boolean If true, the DTree open/close animation is used.
function DFileBrowser:SetOpen(open, useAnim) end

