---@meta

--- A single AI task. Returned by [ai_task.New](https://wiki.facepunch.com/gmod/ai_task.New).
---@source https://wiki.facepunch.com/gmod/Task
---@class (partial) Task
local Task = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Initialises the AI task. Called by [ai_task.New](https://wiki.facepunch.com/gmod/ai_task.New).
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:Init
function Task:Init() end

---Initialises the AI task as an engine task.
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:InitEngine
---@param taskname string The name of the task.
---@param taskdata number
function Task:InitEngine(taskname, taskdata) end

---Initialises the AI task as NPC method-based.
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:InitFunctionName
---@param startname string The name of the NPC method to call on task start.
---@param runname string The name of the NPC method to call on task run.
---@param taskdata number
function Task:InitFunctionName(startname, runname, taskdata) end

---Determines if the task is an engine task (`TYPE_ENGINE`, 1).
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:IsEngineType
function Task:IsEngineType() end

---Determines if the task is an NPC method-based task (`TYPE_FNAME`, 2).
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:IsFNameType
function Task:IsFNameType() end

---Runs the AI task.
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:Run
---@param target NPC The NPC to run the task on.
function Task:Run(target) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Runs the AI task as an NPC method. This requires the task to be of type `TYPE_FNAME`.
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:Run_FName
---@param target NPC The NPC to run the task on.
function Task:Run_FName(target) end

---Starts the AI task.
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:Start
---@param target NPC The NPC to start the task on.
function Task:Start(target) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Starts the AI task as an NPC method.
---@realm server
---@source https://wiki.facepunch.com/gmod/Task:Start_FName
---@param target NPC The NPC to start the task on.
function Task:Start_FName(target) end
