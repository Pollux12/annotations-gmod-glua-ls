---Called when a player switches the tabs.
---
--- Source code states that this is meant to be overridden.
---@hook OnActiveTabChanged
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DPropertySheet:OnActiveTabChanged
---@param old DTab? The previously active DTab
---@param new DTab? The newly active DTab
function DPropertySheet:OnActiveTabChanged(old, new) end
