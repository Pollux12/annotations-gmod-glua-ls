---Called when [WEAPON:Holster](https://wiki.facepunch.com/gmod/WEAPON:Holster) of the toolgun is called.
---@hook Holster
---@realm shared
---@source https://wiki.facepunch.com/gmod/TOOL:Holster
---@param skip? boolean True when the toolgun wrapper is switching tool modes internally.
---@return boolean?
function Tool:Holster(skip) end
