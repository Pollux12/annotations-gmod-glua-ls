---Updates a panel object's associated console variable. This must first be set up with [Global.Derma_Install_Convar_Functions](https://wiki.facepunch.com/gmod/Global.Derma_Install_Convar_Functions), and have a ConVar set using [Panel:SetConVar](https://wiki.facepunch.com/gmod/Panel:SetConVar).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Panel:ConVarChanged
---@param newValue string|number The new value to set the associated console variable to, run through `tostring`.
---@[replaceable]
function Panel:ConVarChanged(newValue) end
