---Returns the Tool Gun (`gmod_tool`) Scripted Weapon.
--- At runtime this is always set after tool initialization; this override
--- removes the spurious nil-return diagnostic that the LS infers from
--- ToolObj:Create() initialising SWEP to nil.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Tool:GetWeapon
---@return gmod_tool # The tool gun weapon. Always valid after Init.
function Tool:GetWeapon() end
