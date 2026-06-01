---@meta

--- A brush surface object returned by [Entity:GetBrushSurfaces](https://wiki.facepunch.com/gmod/Entity:GetBrushSurfaces).
---
--- Brush surfaces are a part of what makes up the map geometry aside from displacements. Any primitive brush model, including most breakable windows, can be represented by this object.
---
--- **NOTE**: This object internally uses the `SurfaceHandle_t` class, which is an alias for `msurface2_t*`.
---@source https://wiki.facepunch.com/gmod/SurfaceInfo
---@class (partial) SurfaceInfo
local SurfaceInfo = {}

---Returns the brush surface's material.
---@realm shared
---@source https://wiki.facepunch.com/gmod/SurfaceInfo:GetMaterial
---@return IMaterial # Material of one portion of a brush model.
function SurfaceInfo:GetMaterial() end

---Returns a list of vertices the brush surface is built from.
---@realm shared
---@source https://wiki.facepunch.com/gmod/SurfaceInfo:GetVertices
---@return Vector[] # A list of Vector points. This will usually be 4 corners of a quadrilateral in counter-clockwise order.
function SurfaceInfo:GetVertices() end

---Checks if the brush surface is a nodraw surface, meaning it will not be drawn by the engine.
---
--- **NOTE**: This internally checks the SURFDRAW_NODRAW flag.
---@realm shared
---@source https://wiki.facepunch.com/gmod/SurfaceInfo:IsNoDraw
---@return boolean # Returns true if this surface won't be drawn.
function SurfaceInfo:IsNoDraw() end

---Checks if the brush surface is displaying the skybox.
---
--- **NOTE**: This internally checks the SURFDRAW_SKY flag.
---@realm shared
---@source https://wiki.facepunch.com/gmod/SurfaceInfo:IsSky
---@return boolean # Returns true if the surface is the sky.
function SurfaceInfo:IsSky() end

---Checks if the brush surface is water.
---
--- **NOTE**: This internally checks the SURFDRAW_WATER flag.
---@realm shared
---@source https://wiki.facepunch.com/gmod/SurfaceInfo:IsWater
---@return boolean # Returns true if the surface is water.
function SurfaceInfo:IsWater() end
