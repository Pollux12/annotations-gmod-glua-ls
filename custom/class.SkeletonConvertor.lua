---@meta

---@class ModelEntity
---@field GetModel fun(self: ModelEntity): string

---@class SkeletonConvertor
---@field IsApplicable fun(self: SkeletonConvertor, ent: ModelEntity): boolean
---@field PositionTable? table
---@field AnglesTable? table
---@field SpecialVectorTable? table
---@field Complete? fun(self: SkeletonConvertor, sensor: table, ply: Player, rotation: Angle)
