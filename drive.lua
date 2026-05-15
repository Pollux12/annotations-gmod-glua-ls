---@meta

--- The drive library is for adding custom control modes to the new "remote control" entity piloting system in Garry's Mod 13. See [Entity Driving](https://wiki.facepunch.com/gmod/Entity_Driving).
drive = {}

--- Represents a drive mode or "method" to be registered with [drive.Register](https://wiki.facepunch.com/gmod/drive.Register).
---
--- This page lists all possible fields and hooks a drive mode can have.
---@source https://wiki.facepunch.com/gmod/DRIVE_Hooks
---@class (partial) DRIVE
DRIVE = {}

---Optionally alter the player's view if they are using this [drive](https://wiki.facepunch.com/gmod/drive) mode.
---
--- This hook is called from the default implementation of [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView) which is [here](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/base/gamemode/cl_init.lua#L387-L395). Therefore, it will not be called if any other hook added to `CalcView` returns any value, or if the current gamemode overrides the default hook and does not call [drive.CalcView](https://wiki.facepunch.com/gmod/drive.CalcView).
---@hook CalcView
---@realm client
---@source https://wiki.facepunch.com/gmod/DRIVE:CalcView
---@param view_in CamData The view, see Structures/CamData. Modify this table.
function DRIVE:CalcView(view_in) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to make [DRIVE:CalcView](https://wiki.facepunch.com/gmod/DRIVE:CalcView) work, called by default from `base` gamemode's [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView) hook.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.CalcView
---@param ply Player The player.
---@param view ViewData The view, see Structures/ViewData.
---@return boolean # True if succeeded.
function drive.CalcView(ply, view) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Clientside, the client creates the cmd (usercommand) from their input device (mouse, keyboard) and then it's sent to the server. Restrict view angles here.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.CreateMove
---@param cmd CUserCmd The user command.
---@return boolean # True if succeeded.
function drive.CreateMove(cmd) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Destroys players current driving method.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.DestroyMethod
---@param ply Player The player to affect.
function drive.DestroyMethod(ply) end

---Player has stopped driving the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.End
---@param ply Player The player.
---@param ent Entity The entity.
function drive.End(ply, ent) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- The move is finished. Copy mv back into the target.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.FinishMove
---@param ply Player The player.
---@param mv CMoveData The move data.
---@return boolean # True if succeeded.
function drive.FinishMove(ply, mv) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns ( or creates if inexistent ) a driving method.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.GetMethod
---@param ply Player The player.
---@return table # A method object.
function drive.GetMethod(ply) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- The move is executed here.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.Move
---@param ply Player The player.
---@param mv CMoveData The move data.
---@return boolean # True if succeeded.
function drive.Move(ply, mv) end

---Starts driving for the player.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.PlayerStartDriving
---@param ply Player The player to affect.
---@param ent Entity The entity to drive.
---@param mode string The driving mode.
function drive.PlayerStartDriving(ply, ent, mode) end

---Stops the player from driving anything. ( For example a prop in sandbox )
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.PlayerStopDriving
---@param ply Player The player to affect.
function drive.PlayerStopDriving(ply) end

---Registers a new entity drive mode/method.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.Register
---@param name string The name of the drive mode/method.
---@param data table The data required to create the drive mode/method. This includes the functions used by the drive. See DRIVE_Hooks.
---@param base? string The name of a drive mode/method to inherit code from.
function drive.Register(name, data, base) end

---Called when the player first starts driving this entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.Start
---@param ply Player The player.
---@param ent Entity The entity.
function drive.Start(ply, ent) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- The user command is received by the server and then converted into a move. This is also run clientside when in multiplayer, for prediction to work.
---@realm shared
---@source https://wiki.facepunch.com/gmod/drive.StartMove
---@param ply Player The player.
---@param mv CMoveData The move data.
---@param cmd CUserCmd The user command.
---@return boolean # True if succeeded.
function drive.StartMove(ply, mv, cmd) end
