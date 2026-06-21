--- A taunt camera object returned by [TauntCamera](https://wiki.facepunch.com/gmod/Global.TauntCamera).
--- Used by player classes to drive a third-person taunt view.
--- Source: garrysmod/gamemodes/base/gamemode/player_class/taunt_camera.lua
---@class TauntCamera
local TauntCamera = {}

---Returns whether the local player should be drawn while the taunt camera is active.
---@param ply Player The player the camera is following.
---@param on boolean Whether the taunt camera is currently active.
---@return boolean # True if the local player should be drawn.
function TauntCamera:ShouldDrawLocalPlayer(ply, on) end

---Adjusts the player's view for the taunt camera.
---@param view table The view table (see Structures/CamData).
---@param ply Player The player the camera is following.
---@param on boolean Whether the taunt camera is currently active.
---@return boolean # True if the view was modified.
function TauntCamera:CalcView(view, ply, on) end

---Processes the player's movement command for the taunt camera.
---@param cmd CUserCmd The movement command to adjust.
---@param ply Player The player the camera is following.
---@param on boolean Whether the taunt camera is currently active.
---@return boolean # True if the command was handled.
function TauntCamera:CreateMove(cmd, ply, on) end
