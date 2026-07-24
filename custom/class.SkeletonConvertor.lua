---@meta

---@class ModelEntity
---@field GetModel fun(self: ModelEntity): string

---@class SkeletonConvertor
---@field IsApplicable fun(self: SkeletonConvertor, ent: ModelEntity): boolean
---@field PrePosition? fun(self: SkeletonConvertor, sensor: table<integer, any>)
---@field PositionTable? table<integer, any>
---@field AnglesTable? table<integer, any>
---@field SpecialVectorTable? table<integer, any>
---@field Complete? fun(self: SkeletonConvertor, ply: Player, sensor: table<integer, any>, rotation: Angle, pos: table<integer, any>, ang: table<integer, Angle>)
