---@meta

--- The prototype object for Sandbox tools. All tools are created from this object
--- via `ToolObj:Create()`, which returns a fresh `TOOL` instance that individual
--- stool files then configure.
---
--- `ToolObj` shares most behavior with `Tool`; it only differs in the factory
--- method used to spawn a new `TOOL` table.
---@class ToolObj : Tool
---@field Create fun(self: ToolObj): TOOL Factory method that returns a new `TOOL` instance.
ToolObj = ToolObj or {}
