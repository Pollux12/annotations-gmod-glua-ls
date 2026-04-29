---Retrieves a member of entity's table.
---@realm shared
---@source https://wiki.facepunch.com/gmod/scripted_ents.GetMember
---@generic T : table, K
---@param classname `T` Entity's class name
---@param name std.ConstTpl<K> Name of member to retrieve
---@return std.RawGet<T, K> # The member or nil if failed
function scripted_ents.GetMember(classname, name) end
