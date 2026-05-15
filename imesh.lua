---@meta

--- Renderable mesh object, can be used to create models on the fly.
--- The only way to create your own IMesh object is to call [Global.Mesh](https://wiki.facepunch.com/gmod/Global.Mesh).
---
--- **NOTE**: IMeshes only respond to one projected texture.
--- 	See the [render.RenderFlashlights](https://wiki.facepunch.com/gmod/render.RenderFlashlights) function and example that solves this problem.
---@source https://wiki.facepunch.com/gmod/IMesh
---@class (partial) IMesh
local IMesh = {}

---Builds the mesh from a table mesh vertexes.
---
--- When modifying a previously built mesh, your new mesh must match the vertex count!
---
--- See [Global.Mesh](https://wiki.facepunch.com/gmod/Global.Mesh) and [util.GetModelMeshes](https://wiki.facepunch.com/gmod/util.GetModelMeshes) for examples.
---
--- **WARNING**: [IMesh](https://wiki.facepunch.com/gmod/IMesh) appears to have a limit of 65535 vertices. You should split your mesh into multiple meshes when above this limit.
---
--- Exceeding the limit may lead to undefined rendering behavior.
---@realm client
---@source https://wiki.facepunch.com/gmod/IMesh:BuildFromTriangles
---@param vertexes table A table consisting of Structures/MeshVertexs.
function IMesh:BuildFromTriangles(vertexes) end

---Deletes the mesh and frees the memory used by it.
---@realm client
---@source https://wiki.facepunch.com/gmod/IMesh:Destroy
function IMesh:Destroy() end

---Renders the mesh with the active matrix.
---@realm client
---@source https://wiki.facepunch.com/gmod/IMesh:Draw
function IMesh:Draw() end

---Renders the mesh with the active matrix and given bone matrices.
---@realm client
---@source https://wiki.facepunch.com/gmod/IMesh:DrawSkinned
---@param bones VMatrix[] A list of matrices to use as bones. Up to 52 of them.
---@param multiply? boolean If set, multiplies given matrices with currently active model matrix (cam.GetModelMatrix). This incurs a performance hit.
function IMesh:DrawSkinned(bones, multiply) end

---Returns whether this [IMesh](https://wiki.facepunch.com/gmod/IMesh) is valid or not.
---@realm client
---@source https://wiki.facepunch.com/gmod/IMesh:IsValid
---@return boolean # Whether this IMesh is valid or not.
function IMesh:IsValid() end
