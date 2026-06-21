---@meta

--- The mesh library allows you to create meshes. A mesh is a set of vertices that define a 3D shape, for constant meshes you should use the [IMesh](https://wiki.facepunch.com/gmod/IMesh) object instead.
mesh = {}

---Pushes the currently set vertex data (via other `mesh.*` functions) into the mesh stack. See example on [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.AdvanceVertex
function mesh.AdvanceVertex() end

---Begins creating or modifying a 3D mesh constructed from a given quantity and type of primitive 3D shapes such as triangles and quads.
---
--- The resulting mesh can be stored in an [IMesh](https://wiki.facepunch.com/gmod/IMesh) if it is intended to be drawn multiple times or on multiple frames.
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.Begin
---@overload fun(primitiveType: number, primitiveCount: number)
---@param mesh IMesh The IMesh that the created mesh will be stored in.
---
--- If the mesh has already been built, it will instead have its existing vertices modified but cannot have the quantity of vertices changed.
---@param primitiveType number An enum that indicates what the format of the mesh's primitives will be.
--- For a full list of the available options, see the Enums/MATERIAL.
---@param primitiveCount number The quantity of primitives this mesh will contain as a whole integer number.
---
--- The total number of vertices must not exceed the limit of `65535`.
--- The number of vertices created by each primitive will depend on the type of primitive used to construct the mesh.
---
--- The expected value of this argument is dependent on the primitive type used.
--- For a full list of the primitive counts expected by each primitive type, see Enums/MATERIAL.
function mesh.Begin(mesh, primitiveType, primitiveCount) end

---Sets the bone matrix ID and bone weight to be used for the next vertex. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.BoneData
---@param index number The slot index for the vertex, either 0 or 1.
---@param matrixId number The matrix index for the vertex, in the range of 0 -> 52. This is the index into IMesh:DrawSkinned's ``bones`` argument, minus 1.
---@param weight number How much influence that matrix will have on this vertex, in the range of 0 -> 1.
function mesh.BoneData(index, matrixId, weight) end

---Sets the color to be used for the next vertex. This is `COLOR0` semantic of
--- Vertex Shader. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.Color
---@param r number Red component.
---@param g number Green component.
---@param b number Blue component.
---@param a number Alpha component.
function mesh.Color(r, g, b, a) end

---Ends the mesh (Started with [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin)) and renders it.
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.End
function mesh.End() end

---Sets the normal to be used for the next vertex. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.Normal
---@overload fun(x: number, y: number, z: number)
---@param normal Vector The normal of the vertex.
function mesh.Normal(normal) end

---Sets the position to be used for the next vertex. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.Position
---@overload fun(x: number, y: number, z: number)
---@param position Vector The position of the vertex.
function mesh.Position(position) end

---Adds a quad (4 vertices) to the currently built mesh. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.Quad
---@param vertex1 Vector The first vertex.
---@param vertex2 Vector The second vertex.
---@param vertex3 Vector The third vertex.
---@param vertex4 Vector The fourth vertex.
---@param color Color The Color for the vertices.
function mesh.Quad(vertex1, vertex2, vertex3, vertex4, color) end

---Adds a quad (4 vertices) to the currently built mesh, by using position, normal and sizes. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
--- See also [mesh.Quad](https://wiki.facepunch.com/gmod/mesh.Quad).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.QuadEasy
---@param position Vector The center of the quad.
---@param normal Vector The normal of the quad.
---@param sizeX number X size in pixels.
---@param sizeY number Y size in pixels.
---@param color Color The Color for the vertices.
function mesh.QuadEasy(position, normal, sizeX, sizeY, color) end

---Sets the specular map values. This is `COLOR1` semantic of Vertex Shader. Allows to blend textures of [Lightmapped_4WayBlend](https://developer.valvesoftware.com/wiki/Lightmapped_4WayBlend). Requires the `VERTEX_SPECULAR` flag to be set in the C++ code of a shader.
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.Specular
---@param r number The red channel multiplier of the specular map.
---@param g number The green channel multiplier of the specular map.
---@param b number The blue channel multiplier of the specular map.
---@param a number The alpha channel multiplier of the specular map.
function mesh.Specular(r, g, b, a) end

---Sets the `S` tangent to be used, also known as "binormal".
---
--- Tangents and binormals are using in bumpmap rendering.
---
--- See also [mesh.TangentT](https://wiki.facepunch.com/gmod/mesh.TangentT) and [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.TangentS
---@overload fun(x: number, y: number, z: number)
---@param tangentS Vector The S tangent.
function mesh.TangentS(tangentS) end

---Sets the `T` tangent to be used.
---
--- Tangents and binormals are using in bumpmap rendering.
---
--- See also [mesh.TangentS](https://wiki.facepunch.com/gmod/mesh.TangentS) and [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.TangentT
---@overload fun(x: number, y: number, z: number)
---@param tangentT Vector The T tangent.
function mesh.TangentT(tangentT) end

---Sets the texture coordinates for the next vertex for the current mesh. (See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin))
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.TexCoord
---@param set number The texture coordinate set, 0 to 7.
---
--- Non-zero values require the currently bound material to support it. For example, any `LightmappedGeneric` material supports sets 1 and 2 (lightmap texture coordinates and bump map texture coords?).
---@param s number S coordinate.
---@param t number T coordinate. Will be optional in the next update.
---@param u? number U coordinate.
---@param v? number V coordinate.
function mesh.TexCoord(set, s, t, u, v) end

---A set of four numbers that can be used for arbitrary purposes by [Material](https://wiki.facepunch.com/gmod/Material) shaders.
--- This is most commonly used to provide tangent information about each vertex to the Material's shader.
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.UserData
---@param tangentX number
---@param tangentY number
---@param tangentZ number
---@param tangentHandedness number
function mesh.UserData(tangentX, tangentY, tangentZ, tangentHandedness) end

---Returns the amount of vertices that have been pushed via [mesh.AdvanceVertex](https://wiki.facepunch.com/gmod/mesh.AdvanceVertex).
---@realm client
---@source https://wiki.facepunch.com/gmod/mesh.VertexCount
---@return number # The amount of vertices.
function mesh.VertexCount() end
