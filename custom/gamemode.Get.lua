---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- This returns the internally stored gamemode table.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gamemode.Get
---@generic T : table
---@param name `T` The name of the gamemode you want to get.
---@return (definition) `T`? # The gamemode's table, or nil if no gamemode is registered with that name.
function gamemode.Get(name) end
