---Sets the specified material texture to the specified texture, does nothing on a type mismatch.
---
---Calls [IMaterial:Recompute](https://wiki.facepunch.com/gmod/IMaterial:Recompute) internally.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/IMaterial:SetTexture
---@param materialTexture string The name of the keyvalue on the material to store the texture on.
---@param texture ITexture|string The new texture. This can also be a string, the name of the new texture.
function IMaterial:SetTexture(materialTexture, texture) end
