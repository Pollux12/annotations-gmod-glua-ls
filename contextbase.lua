---@meta

--- A base for all context menu panels ( The ones used for tool options in sandbox )
---@class (partial) ContextBase : Panel
local ContextBase = {}

---Called by spawnmenu functions (when creating a context menu) to fill this control with data.
---@realm client
---@source https://wiki.facepunch.com/gmod/ContextBase:ControlValues
---@param contextData table A two-membered table:
--- * string convar - The console variable to use. Calls ContextBase:SetConVar.
--- * string label - The text to display inside the control's label.
function ContextBase:ControlValues(contextData) end

---Returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) for the panel to change/handle, set by [ContextBase:SetConVar](https://wiki.facepunch.com/gmod/ContextBase:SetConVar)
---@realm client
---@source https://wiki.facepunch.com/gmod/ContextBase:ConVar
---@return string # The ConVar for the panel to change.
function ContextBase:ConVar() end

---Sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) for the panel to change/handle.
---@realm client
---@source https://wiki.facepunch.com/gmod/ContextBase:SetConVar
---@param cvar string The ConVar for the panel to change.
function ContextBase:SetConVar(cvar) end

---You should override this function and use it to check whether your convar value changed.
---@realm client
---@source https://wiki.facepunch.com/gmod/ContextBase:TestForChanges
function ContextBase:TestForChanges() end
