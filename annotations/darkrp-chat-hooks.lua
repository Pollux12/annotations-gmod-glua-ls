---@meta

DarkRP = DarkRP or {}

---@alias DarkRPDoSayFunc fun(text: string)
---@alias DarkRPChatCommandResult string?

---@alias DarkRPDefineChatCommandCallback fun(ply: Player, args: string|string[], ...: any): DarkRPChatCommandResult, DarkRPDoSayFunc?
---@alias DarkRPChatCommandCanRun fun(ply: Player): boolean
---@alias DarkRPChatCommandDelay number

---@class DarkRPChatCommandDefinition
---@field command string
---@field description string
---@field delay DarkRPChatCommandDelay
---@field condition? DarkRPChatCommandCanRun
---@field callback? DarkRPDefineChatCommandCallback
---@field tableArgs? boolean
---@field [string] any

---@param tbl DarkRPChatCommandDefinition
function DarkRP.declareChatCommand(tbl) end

---@param command string
---@param callback DarkRPDefineChatCommandCallback
function DarkRP.defineChatCommand(command, callback) end

---@param command string
function DarkRP.removeChatCommand(command) end
