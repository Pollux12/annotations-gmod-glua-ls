---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_winch_controller.lua
---@class gmod_winch_controller : Entity
---@field constraint gmod_winch_constraint The spring constraint being managed.
---@field rope Entity The rope (keyframe_rope or ents.CreateClientRope) being managed.
---@field direction integer Direction of movement: -1 (DIR_BACKWARD), 0 (DIR_NONE), 1 (DIR_FORWARD).
---@field toggle boolean Toggle behavior flag inherited from constraint.
---@field current_length number Current simulated length of the rope.
---@field min_length number Minimum length limit.
---@field max_length? number Optional maximum length limit.
---@field type integer Controller type: 0 (TYPE_NORMAL), 1 (TYPE_MUSCLE).
---@field ctime number Muscle cycle/timer progress tracker.
---@field isexpanded boolean Expansion limit state flag.
---@field last_time number Real timestamp of the previous think cycle.
---@field init_time number Real timestamp of entity initialization.
local gmod_winch_controller = {}

---@realm server
---@return integer
function gmod_winch_controller:GetDirection() end

---@realm server
---@param n integer
function gmod_winch_controller:SetDirection(n) end

---@realm server
---@return boolean
function gmod_winch_controller:IsExpanded() end
