---@meta

--- A Material object. It represents a game material, similarly to how a `.vmt` file does, which are in fact loaded into an **IMaterial** object.
---
--- In most cases the game works with materials as far as file paths go. Materials then point to different [ITexture](https://wiki.facepunch.com/gmod/ITexture)s (`.vtf` files) they might be using.
--- They are not the same and cannot be interchanged.
---
--- A material object can be created with [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) or [Global.CreateMaterial](https://wiki.facepunch.com/gmod/Global.CreateMaterial).
---@source https://wiki.facepunch.com/gmod/IMaterial
---@class (partial) IMaterial
local IMaterial = {}

---Returns the color of the specified pixel of the `$basetexture`, only works for materials created from PNG files.
---
--- Basically identical to [ITexture:GetColor](https://wiki.facepunch.com/gmod/ITexture:GetColor) used on [IMaterial:GetTexture](https://wiki.facepunch.com/gmod/IMaterial:GetTexture)`( "$basetexture" )`.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetColor
---@param x number The X coordinate.
---@param y number The Y coordinate.
---@return Color # The color of the pixel as a Color.
function IMaterial:GetColor(x, y) end

---Returns the specified material value as a float, or nil if the value is not set.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetFloat
---@param materialFloat string The name of the material value.
---@return number # float
function IMaterial:GetFloat(materialFloat) end

---Returns the specified material value as a int, rounds the value if its a float, or nil if the value is not set.
---
--- **NOTE**: Please note that certain material flags such as `$model` are stored in the `$flags` variable and cannot be directly retrieved with this function. See the full list here: [Material Flags](https://wiki.facepunch.com/gmod/Material_Flags)
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetInt
---@param materialInt string The name of the material integer.
---@return number # The retrieved value as an integer
function IMaterial:GetInt(materialInt) end

---Gets all the key values defined for the material.
---@realm shared
---@source https://wiki.facepunch.com/gmod/IMaterial:GetKeyValues
---@return table<string, any> # The material's key values.
function IMaterial:GetKeyValues() end

---Returns the specified material matrix as a int, or nil if the value is not set or is not a matrix.
---@realm shared
---@source https://wiki.facepunch.com/gmod/IMaterial:GetMatrix
---@param materialMatrix string The name of the material matrix.
---@return VMatrix # matrix
function IMaterial:GetMatrix(materialMatrix) end

---Returns the name of the material, in most cases the path.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetName
---@return string # Material name/path
function IMaterial:GetName() end

---Returns the name of the materials shader.
---
--- This function does not work serverside on Linux SRCDS and always returns `shader_error`.
---
--- This bug is fixed on `dev` beta and in the next update.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetShader
---@return string # Name of the currently loaded shader for this material, or `shader_error` if the material has no loaded shader.
---
--- It is not guaranteed to be in any specific capitalization, so case insensitive checks are advised.
function IMaterial:GetShader() end

---Returns the specified material string, or nil if the value is not set or if the value can not be converted to a string.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetString
---@param materialString string The name of the material string.
---@return string # The value as a string
function IMaterial:GetString(materialString) end

---Returns an [ITexture](https://wiki.facepunch.com/gmod/ITexture) based on the passed shader parameter.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetTexture
---@param param string The [shader parameter](https://developer.valvesoftware.com/wiki/Category:List_of_Shader_Parameters) to retrieve. This should normally be `$basetexture`.
---@return ITexture # The value of the shader parameter. Returns nothing if the param doesn't exist.
function IMaterial:GetTexture(param) end

---Returns the specified material vector, or nil if the value is not set.
---
--- See also [IMaterial:GetVectorLinear](https://wiki.facepunch.com/gmod/IMaterial:GetVectorLinear)
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetVector
---@param materialVector string The name of the material vector.
---@return Vector # The color vector
function IMaterial:GetVector(materialVector) end

---Returns the specified material vector as a 4 component vector.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetVector4D
---@param name string The name of the material vector to retrieve.
---@return number # The x component of the vector.
---@return number # The y component of the vector.
---@return number # The z component of the vector.
---@return number # The w component of the vector.
function IMaterial:GetVector4D(name) end

---Returns the specified material linear color vector, or nil if the value is not set.
---
--- See https://en.wikipedia.org/wiki/Gamma_correction
---
--- See also [IMaterial:GetVector](https://wiki.facepunch.com/gmod/IMaterial:GetVector)
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:GetVectorLinear
---@param materialVector string The name of the material vector.
---@return Vector # The linear color vector
function IMaterial:GetVectorLinear(materialVector) end

---Returns the height of the member texture set for `$basetexture`.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:Height
---@return number # Height of the base texture.
function IMaterial:Height() end

---Returns whenever the material is valid, i.e. whether it was not loaded successfully from disk or not.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:IsError
---@return boolean # Is this material the error material? (___error)
function IMaterial:IsError() end

---Recomputes the material's snapshot. This needs to be called if you have changed variables on your material and it isn't changing.
---
--- Be careful though - this function is slow - so try to call it only when needed!
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:Recompute
function IMaterial:Recompute() end

---Changes the Material into the give Image.
--- **INTERNAL**: This is used by the Background to change the Image.
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetDynamicImage
---@param path string The path to a Image.
function IMaterial:SetDynamicImage(path) end

---Sets the specified material float to the specified float, does nothing on a type mismatch.
---
--- Unlike [IMaterial:SetInt](https://wiki.facepunch.com/gmod/IMaterial:SetInt), this function **does not** call [IMaterial:Recompute](https://wiki.facepunch.com/gmod/IMaterial:Recompute) internally.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetFloat
---@param materialFloat string The name of the material float.
---@param float number The new float value.
function IMaterial:SetFloat(materialFloat, float) end

---Sets the specified material value to the specified int, does nothing on a type mismatch.
---
--- Calls [IMaterial:Recompute](https://wiki.facepunch.com/gmod/IMaterial:Recompute) internally.
---
--- **NOTE**: Please note that certain material flags such as `$model` are stored in the `$flags` variable and cannot be directly set with this function. See the full list here: [Material Flags](https://wiki.facepunch.com/gmod/Material_Flags)
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetInt
---@param materialInt string The name of the material int.
---@param int number The new int value.
function IMaterial:SetInt(materialInt, int) end

---Sets the specified material value to the specified matrix, does nothing on a type mismatch.
---@realm shared
---@source https://wiki.facepunch.com/gmod/IMaterial:SetMatrix
---@param materialMatrix string The name of the material int.
---@param matrix VMatrix The new matrix.
function IMaterial:SetMatrix(materialMatrix, matrix) end

---The functionality of this function was removed due to the amount of crashes it caused.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetShader
---@param shaderName string Name of the shader
---@deprecated This function does nothing
function IMaterial:SetShader(shaderName) end

---Sets the specified material value to the specified string, does nothing on a type mismatch.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetString
---@param materialString string The name of the material string.
---@param string string The new string.
function IMaterial:SetString(materialString, string) end

---Sets the specified material texture to the specified texture, does nothing on a type mismatch.
---
--- Calls [IMaterial:Recompute](https://wiki.facepunch.com/gmod/IMaterial:Recompute) internally.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetTexture
---@param materialTexture string The name of the keyvalue on the material to store the texture on.
---@param texture ITexture The new texture. This can also be a string, the name of the new texture.
function IMaterial:SetTexture(materialTexture, texture) end

---Unsets the value for the specified material value.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetUndefined
---@param materialValueName string The name of the material value to be unset.
function IMaterial:SetUndefined(materialValueName) end

---Sets the specified material vector to the specified vector, does nothing on a type mismatch.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetVector
---@param MaterialVector string The name of the material vector.
---@param vec Vector The new vector.
function IMaterial:SetVector(MaterialVector, vec) end

---Sets the specified material vector to the specified 4 component vector, does nothing on a type mismatch.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetVector4D
---@param name string The name of the material vector.
---@param x number The x component of the new vector.
---@param y number The y component of the new vector.
---@param z number The z component of the new vector.
---@param w number The w component of the new vector.
function IMaterial:SetVector4D(name, x, y, z, w) end

---Returns the width of the member texture set for `$basetexture`.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:Width
---@return number # Width of the base texture.
function IMaterial:Width() end
