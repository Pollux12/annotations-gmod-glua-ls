---**INTERNAL**: Use [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add) instead.
--- Tells the engine to register a console command. If the command was ran, the engine calls [concommand.Run](https://wiki.facepunch.com/gmod/concommand.Run).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.AddConsoleCommand
---@param name string The name of the console command to add.
---@param helpText? string The help text.
---@param flags? FCVAR|number[] Concommand flags using Enums/FCVAR, or a table of them.
function _G.AddConsoleCommand(name, helpText, flags) end
