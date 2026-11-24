---Draws the texturize shader, which replaces each pixel on your screen with a different part of the texture depending on its brightness. See [g_texturize](https://wiki.facepunch.com/gmod/Shaders/g_texturize) for information on making the texture.
---@realm client
---@source https://wiki.facepunch.com/gmod/Global.DrawTexturize
---@param Scale number Scale of the texture. A smaller number creates a larger texture.
---@param BaseTexture IMaterial This will be the texture to use in the effect. Make sure you use Global.Material to get the material.
function _G.DrawTexturize(Scale, BaseTexture) end
