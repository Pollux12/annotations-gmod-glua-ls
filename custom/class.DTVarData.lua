--- Data table `Entity:DTVar` returns for a registered data table variable.
---@class DTVarData
---@field index number The slot of the variable within its type.
---@field name string The name the variable is accessed by.
---@field SetFunc fun(ent: Entity, index: number, value: any) The `Entity:SetDT*` setter for the type.
---@field GetFunc fun(ent: Entity, index: number, name?: string): any The `Entity:GetDT*` getter for the type.
---@field typename string The type name the variable was registered with.
---@field Notify (fun(ent: Entity, name: string, old: any, new: any))[] Callbacks run when the value changes.
---@field element? string The vector or angle component the variable exposes, set by `Entity:NetworkVarElement`.
local DTVarData = {}
