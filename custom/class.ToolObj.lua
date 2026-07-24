---@meta

--- The prototype object for Sandbox tools. All tools are created from this object
--- via `ToolObj:Create()`, which returns a fresh `TOOL` instance that individual
--- stool files then configure.
---
--- `ToolObj` shares most behavior with `Tool`; it only differs in the factory
--- method used to spawn a new `TOOL` table.
---@class ToolObj : Tool
---@field Create fun(self: ToolObj): TOOL Factory method that returns a new `TOOL` instance.
---@field Objects ToolObjects Array of stored constraint objects indexed 1-based.
ToolObj = ToolObj or {}

---Stores a selected object in `Objects`.
---@param id number
---@param ent Entity
---@param pos Vector
---@param phys PhysObj|nil
---@param bone number
---@param normal Vector
function ToolObj:SetObject(id, ent, pos, phys, bone, normal) end
