---@meta

--- The concommand library is used to create console commands which can be used to network (basic) information & events between the client and the server.
concommand = {}

---Creates a console command that runs the supplied callback.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/concommand.Add
---@[call_arg("gmod.concommand", "define")]
---@param name string Name of the console command.
---@[call_arg("gmod.concommand", "callback")]
---@param callback fun(ply: Player, cmd: string, args: string[], argStr: string) Callback run when the command is executed.
---@param autoComplete? function
---@param helpText? string
---@param flags? FCVAR|number[]
function concommand.Add(name, callback, autoComplete, helpText, flags) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used by the engine to call the autocomplete function for a console command, and retrieve returned options.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/concommand.AutoComplete
---@param command string Name of command.
---@param arguments string Arguments given to the command.
---@return table # Possibilities for auto-completion. This is the return value of the auto-complete callback.
function concommand.AutoComplete(command, arguments) end

---Returns the tables of all console command callbacks, and autocomplete functions, that were added to the game with [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/concommand.GetTable
---@return table<string,function> # Table of command callback functions.
---@return table<string,function> # Table of command autocomplete functions.
function concommand.GetTable() end

---Removes a console command.
---
--- [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add) will fail if the concommand was previously removed with this function in a different realm (creating a command on the client that was removed from the server and vice-versa).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/concommand.Remove
---@param name string The name of the command to be removed.
function concommand.Remove(name) end

---**INTERNAL**: You might be looking for [Global.RunConsoleCommand](https://wiki.facepunch.com/gmod/Global.RunConsoleCommand) or [Player:ConCommand](https://wiki.facepunch.com/gmod/Player:ConCommand).
---
--- Used by the engine to run a console command's callback function. This will only be called for commands that were added with [Global.AddConsoleCommand](https://wiki.facepunch.com/gmod/Global.AddConsoleCommand), which [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add) calls internally. An error is sent to the player's console if no callback is found.
---
--- This will still be called for concommands removed with [concommand.Remove](https://wiki.facepunch.com/gmod/concommand.Remove) but will return false. This will not be called for concommands added by the engine, only those made from Lua.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/concommand.Run
---@param ply Player Player to run concommand on.
---@param cmd string Command name.
---@param args any Command arguments.
--- Can be table or string.
---@param argumentString string string of all arguments sent to the command.
---@return boolean # `true` if the console command with the given name exists, and `false` if it doesn't.
function concommand.Run(ply, cmd, args, argumentString) end
