---Returns whether an object is valid or not. (Such as entities, Panels, custom table objects and more).
---
--- Checks that an object is not nil, has an `IsValid` method and if this method returns `true`. If the object has no `IsValid` method, it will return `false`.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.IsValid
---@param ent any The table or object to be validated.
---@return TypeGuard<Entity> isValid # True if the object is valid.
function _G.IsValid(ent) end
