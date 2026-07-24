---Called when [WEAPON:Deploy](https://wiki.facepunch.com/gmod/WEAPON:Deploy) of the toolgun is called.
---
--- This is also called when switching from another tool on the server.
---@hook Deploy
---@realm shared
---@source https://wiki.facepunch.com/gmod/TOOL:Deploy
---@param skip? boolean True when the toolgun wrapper is switching tool modes internally.
---@return boolean? # Return true to allow switching away from the toolgun using lastinv command.
function Tool:Deploy(skip) end
