---Called by the toolgun SWEP to build a tool trace.
---
--- This is specific to the Sandbox toolgun implementation, but is declared on
--- `Weapon` so `SWEP:DoToolTrace` overrides inherit the owner-valid callback
--- metadata without changing the global `Weapon:GetOwner` return type.
---@hook DoToolTrace
---@realm shared
---@[self_call_valid("GetOwner")]
function Weapon:DoToolTrace() end
