---@meta

---Runtime drive mode table returned by drive.GetMethod.
---
--- Source: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/drive/drive_base.lua
---@class DriveMethod
---@field Entity Entity Driven entity.
---@field Player Player Driving player.
---@field ModeID number Network string ID of the active drive mode.
---@field StopDriving? boolean Set by DriveMethod:Stop to stop driving after FinishMove.
---@field Init fun(self: DriveMethod, cmd?: CUserCmd)
---@field SetupControls fun(self: DriveMethod, cmd: CUserCmd)
---@field StartMove fun(self: DriveMethod, mv: CMoveData, cmd: CUserCmd)
---@field Move fun(self: DriveMethod, mv: CMoveData)
---@field FinishMove fun(self: DriveMethod, mv: CMoveData)
---@field CalcView fun(self: DriveMethod, view: ViewData)
---@field CalcView_ThirdPerson fun(self: DriveMethod, view: ViewData, dist: number, hullsize: number, entityfilter: Entity)
local DriveMethod = {}

---Call this in your drive method at any point to stop driving.
function DriveMethod:Stop() end
