---Attempts to compile the given file. If successful, returns a function that can be called to perform the actual execution of the script.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Global.CompileFile
---@[call_arg("gmod.load", "compilefile")]
---@param path string Path to the file, relative to the `garrysmod/lua/` directory.
---@param showError? boolean Decides whether or not a non-halting error should be thrown on compile failure.
---@return function? # The function which executes the script, or nil on failure.
function _G.CompileFile(path, showError) end
