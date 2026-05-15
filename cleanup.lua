---@meta

--- The cleanup library allows you to control what happens to custom entities when the clean-up buttons are pressed in the Utilities tab of the Spawn menu (default Q).
cleanup = {}

---Adds an entity to a player's cleanup list.
---@realm server
---@source https://wiki.facepunch.com/gmod/cleanup.Add
---@param pl Player Who's cleanup list to add the entity to.
---@param type string The type of cleanup.
---@param ent Entity The entity to add to the player's cleanup list.
function cleanup.Add(pl, type, ent) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called by the `gmod_admin_cleanup` console command. Allows admins to clean up the server.
---@realm server
---@source https://wiki.facepunch.com/gmod/cleanup.CC_AdminCleanup
---@param pl Player The player that called the console command.
---@param command string The console command that called this function.
---@param args table First and only arg is the cleanup type.
function cleanup.CC_AdminCleanup(pl, command, args) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called by the `gmod_cleanup` console command. Allows players to cleanup their own props.
---@realm server
---@source https://wiki.facepunch.com/gmod/cleanup.CC_Cleanup
---@param pl Player The player that called the console command.
---@param command string The console command that called this function.
---@param args table First and only argument is the cleanup type.
function cleanup.CC_Cleanup(pl, command, args) end

---Gets the cleanup list.
---@realm server
---@source https://wiki.facepunch.com/gmod/cleanup.GetList
function cleanup.GetList() end

---Gets the table of cleanup types.
---@realm shared
---@source https://wiki.facepunch.com/gmod/cleanup.GetTable
---@return table # A list of cleanup types.
function cleanup.GetTable() end

---Registers a new cleanup type.
---@realm shared
---@source https://wiki.facepunch.com/gmod/cleanup.Register
---@param type string Name of type.
function cleanup.Register(type) end

---Replaces one entity in the cleanup module with another.
---
--- You very likely want to call [undo.ReplaceEntity](https://wiki.facepunch.com/gmod/undo.ReplaceEntity) with the same entities as well.
---@realm server
---@source https://wiki.facepunch.com/gmod/cleanup.ReplaceEntity
---@param from Entity The old entity.
---@param to Entity|nil The new entity. Can be a `NULL` entity to remove the old entity from the cleanup system.
---@return boolean # Whether any action was taken.
function cleanup.ReplaceEntity(from, to) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Repopulates the clients cleanup menu.
---@realm client
---@source https://wiki.facepunch.com/gmod/cleanup.UpdateUI
function cleanup.UpdateUI() end
