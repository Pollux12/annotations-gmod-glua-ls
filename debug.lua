---@meta

--- The debug library is intended to help you debug your scripts, however it also has several other powerful uses. Some builtin debug function were removed in GMod due to security reasons
debug = {}

---**NOTE**: This only works on the source dedicated server.
---
--- Enters an interactive mode with the user, running each string that the user enters. Using simple commands and other debug facilities, the user can inspect global and local variables, change their values, evaluate expressions, and so on. A line containing only the word cont finishes this function, so that the caller continues its execution.
---
--- * Commands for debug.debug are not lexically nested within any function, and so have no direct access to local variables.
--- * To exit this interactive mode, you can press Ctrl + Z then Enter OR type the word 'cont' on a single line and press enter.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.debug
function debug.debug() end

---Returns the environment of the passed object. This can be set with [debug.setfenv](https://wiki.facepunch.com/gmod/debug.setfenv).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.getfenv
---@param object table Object to get environment of.
---@return table # The environment.
function debug.getfenv(object) end

---Returns the current hook settings of the passed thread. The thread argument can be omitted. This is completely different to gamemode hooks. More information on hooks can be found at http://www.lua.org/pil/23.2.html. This function will simply return the function, mask, and count of the last called [debug.sethook](https://wiki.facepunch.com/gmod/debug.sethook).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.gethook
---@param thread? thread Which thread to retrieve it's hook from, doesn't seem to actually work.
---@return function # Hook function.
---@return string # Hook mask. This is reversed of the debug.sethook mask ("clr" would be "rlc").
---@return number # Hook count.
function debug.gethook(thread) end

---@class debuglib.DebugInfo
---@field name            string
---@field namewhat        string
---@field source          string
---@field short_src       string
---@field linedefined     integer
---@field lastlinedefined integer
---@field what            string
---@field currentline     integer
---@field istailcall      boolean
---@field nups            integer
---@field nparams         integer
---@field isvararg        boolean
---@field func            function
---@field ftransfer       integer
---@field ntransfer       integer
---@field activelines     table

---@alias debuglib.InfoWhat
---|+"n"     # `name`, `namewhat`
---|+"S"     # `source`, `short_src`, `linedefined`, `lastlinedefined`, `what`
---|+"l"     # `currentline`
---|+"t"     # `istailcall`
---|+"u"     # `nups`, `nparams`, `isvararg`
---|+"f"     # `func`
---|+"r"     # `ftransfer`, `ntransfer`
---|+"L"     # `activelines`
---| string

---Returns debug information about a function.
---
---Pass either a function or a stack level as `f`.
---Level 0 is the `debug.getinfo` call itself, level 1 is its caller, and so on.
---For out-of-range stack levels, this can return nil.
---@overload fun(f: function, what?: debuglib.InfoWhat): debuglib.DebugInfo
---@overload fun(f: 0, what?: debuglib.InfoWhat): debuglib.DebugInfo
---@overload fun(f: integer, what?: debuglib.InfoWhat): debuglib.DebugInfo?
---@overload fun(thread: thread, f: function, what?: debuglib.InfoWhat): debuglib.DebugInfo
---@overload fun(thread: thread, f: 0, what?: debuglib.InfoWhat): debuglib.DebugInfo
---@param thread thread
---
---Takes either a function or a number representing the stack level as an argument. Stack level 0 always corresponds to the debug.getinfo call, 1 would be the function calling debug.getinfo in most cases, and so on.
--- Returns useful information about that function in a table.
---@param f integer|function
---
--- * `f` - Populates the func field.
--- * `l` - Populates the currentline field.
--- * `L` - Populates the activelines field.
--- * `n` - Populates the name and namewhat fields - only works if stack level is passed rather than function pointer.
--- * `S` - Populates the location fields (lastlinedefined, linedefined, short_src, source and what).
--- * `u` - Populates the argument and upvalue fields (isvararg, nparams, nups).
--- * `>` - Causes this function to use the last argument to get the data from.
---@param what? debuglib.InfoWhat
---
---Function to use. (Only used by the `>` field)
---@return debuglib.DebugInfo?
---
--- A table as a Structures/DebugInfo containing information about the function you passed. Can return nil if the stack level didn't point to a valid stack frame.
---@nodiscard
function debug.getinfo(thread, f, what) end

---Gets the name and value of a local variable indexed from the level.
--- 	**WARNING**: When a function has a tailcall return, you cannot access the locals of this function.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.getlocal
---@param thread? thread The thread.
---@param level number The level above the thread.
--- * 0 = the function that was called (most always this function)'s arguments.
--- * 1 = the thread that had called this function.
--- * 2 = the thread that had called the function that started the thread that called this function.
---
--- A function defined in Lua can also be passed as the level. The index will specify the parameter's name to be returned (a parameter will have a value of nil).
---@param index number The variable's index you want to get.
--- * 1 = the first local defined in the thread.
--- * 2 = the second local defined in the thread.
--- * etc...
---@return string # The name of the variable.
---
--- Sometimes this will be `(*temporary)` if the local variable had no name.
---
--- Variables with names starting with **(** are **internal variables**.
---@return any # The value of the local variable.
function debug.getlocal(thread, level, index) end

---Returns the metatable of the specified value. Can return any value.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.getmetatable
---@generic T : table
---@param object `T` The value to get the metatable of.
---@return (definition) `T` # The metatable of the value.
function debug.getmetatable(object) end

---Returns the internal Lua registry table.
---
--- The Lua registry is used by the engine and binary modules to create references to Lua values. The registry contains every global ran and used in the Lua environment. Avoid creating entries into the registry with a number as the key, as they are reserved for the reference system.
---
--- **WARNING**: Improper editing of the registry can result in unintended side effects, including crashing the game.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.getregistry
---@return table # The Lua registry.
---@deprecated This function now returns a table that serves as a proxy to Global.FindMetaTable and Global.RegisterMetaTable. If you previously used the registry to get/add metatables, you should use those functions directly instead.
function debug.getregistry() end

---Used for getting variable values in an index from the passed function. This does nothing for C functions.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.getupvalue
---@param func function Function to get the upvalue indexed from.
---@param index number The index in the upvalue array. The max number of entries can be found in debug.getinfo's "Structures/DebugInfo" key.
---@return string # Name of the upvalue. Will be nil if the index was out of range (< 1 or > debug.getinfo.nups), or the function was defined in C.
---@return any # Value of the upvalue.
function debug.getupvalue(func, index) end

---Sets the environment of the passed object.
---
--- Unlike [Global.setfenv](https://wiki.facepunch.com/gmod/Global.setfenv), this also works on **any** userdata, allowing you to save data stored to it which can be accessed using [debug.getfenv](https://wiki.facepunch.com/gmod/debug.getfenv).
--- Userdata seem to intentionally support this & setting/changing it does not affect anything (though unused by gmod / Entities and such don't this)
--- This can be useful when trying to store data on a [IGModAudioChannel](https://wiki.facepunch.com/gmod/IGModAudioChannel), [Vector](https://wiki.facepunch.com/gmod/Vector), [Angle](https://wiki.facepunch.com/gmod/Angle) or any other that doesn't already allow you to store data on it.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.setfenv
---@param object any Object to set environment of. Valid types: userdata, thread, function.
---@param env table Environment to set.
---@return table # The object.
function debug.setfenv(object, env) end

---Sets the given function as a Lua hook. This is completely different to gamemode hooks. The thread argument can be completely omitted and calling this function with no arguments will remove the current hook. This is used by default for infinite loop detection. More information on hooks can be found at http://www.lua.org/pil/23.2.html and https://www.gammon.com.au/scripts/doc.php?lua=debug.sethook
---
--- Hooks are not always ran when code that has been compiled by LuaJIT's JIT compiler is being executed, this is due to Intermediate Representation internally storing constantly running bytecode for performance reasons.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.sethook
---@param thread thread Thread to set the hook on. This argument can be omitted.
---@param hook function Function for the hook to call. First argument in this function will be the mask event that called the hook as a full string (not as 'c' but instead as 'call').
---@param mask string The hook's mask. Can be one or more of the following events:
--- * c - Triggers the hook on each function call made from Lua.
--- * r - Triggers the hook on each function return made from Lua.
--- * l - Triggers the hook on each line compiled of code.
---@param count number How often to call the hook (in instructions). 0 for every instruction. Can be omitted.
function debug.sethook(thread, hook, mask, count) end

---This function was removed due to security concerns.
---
--- Sets a local variable's value.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.setlocal
---@param thread? thread The thread.
---@param level number The level above the thread.
---
--- 0 is the function that was called (most always this function)'s arguments.
---
--- 1 is the thread that had called this function.
---
--- 2 is the thread that had called the function that started the thread that called this function.
---@param index number The variable's index you want to get.
---
--- 1 = the first local defined in the thread.
---
--- 2 = the second local defined in the thread.
---@param value? any The value to set the local to.
---@return string # The name of the local variable if the local at the index exists, otherwise nil is returned.
function debug.setlocal(thread, level, index, value) end

---Sets the object's metatable. Unlike [Global.setmetatable](https://wiki.facepunch.com/gmod/Global.setmetatable), this function works regardless of whether the first object passed is a valid table or not; this function even works on primitive datatypes such as numbers, functions, and even nil.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.setmetatable
---@param object any Object to set the metatable for.
---@param metatable table The metatable to set for the object.
--- If this argument is nil, then the object's metatable is removed.
---@return boolean # true if the object's metatable was set successfully.
function debug.setmetatable(object, metatable) end

---This function was removed due to security concerns.
---
--- Sets the variable indexed from func.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.setupvalue
---@param func function The function to index the upvalue from.
---@param index number The index from func.
---@param val? any The value to set the upvalue to.
---@return string # Returns nil if there is no upvalue with the given index, otherwise it returns the upvalue's name.
function debug.setupvalue(func, index, val) end

---Prints out the lua function call stack to the console.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.Trace
function debug.Trace() end

---Returns a full execution stack trace.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.traceback
---@param thread? thread Thread (ie. error object from xpcall error handler) to build traceback for. If this argument is not set to a proper thread it will act as the next argument.
---@param message? string Appended at the beginning of the traceback.
---@param level? number Which level to start the traceback.
---@return string # A dump of the execution stack.
function debug.traceback(thread, message, level) end

---This function was removed due to security concerns.
---
--- Returns an unique identifier for the upvalue indexed from func.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.upvalueid
---@param func function The function to index the upvalue from.
---@param index number The index from func.
---@return number # A unique identifier.
function debug.upvalueid(func, index) end

---This function was removed due to security concerns.
---
--- Makes an upvalue of `func1` refer to an upvalue of `func2`. Both functions provided must be Lua-defined, otherwise an error is thrown.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/debug.upvaluejoin
---@param func1 function
---@param upvalueIndex1 number The index of the upvalue in `func1`.
---@param func2 function
---@param upvalueIndex2 number The index of the upvalue in `func2`.
function debug.upvaluejoin(func1, upvalueIndex1, func2, upvalueIndex2) end
