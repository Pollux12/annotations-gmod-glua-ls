---@meta

--- An object representing game texture, such as those loaded from a `.vtf` file.
---
--- Do not confuse with [IMaterial](https://wiki.facepunch.com/gmod/IMaterial). Materials use textures. Game uses materials.
---
--- Returned by [IMaterial:GetTexture](https://wiki.facepunch.com/gmod/IMaterial:GetTexture)
---@source https://wiki.facepunch.com/gmod/ITexture
---@class (partial) ITexture
local ITexture = {}

---Invokes the generator of the texture. Reloads file based textures from disk and clears render target textures.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:Download
function ITexture:Download() end

---Returns the color of the specified pixel, only works for textures created from PNG files.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:GetColor
---@param x number The X coordinate.
---@param y number The Y coordinate.
---@return Color # The color of the pixel as a Color.
function ITexture:GetColor(x, y) end

---Returns the true unmodified height of the texture.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:GetMappingHeight
---@return number # height
function ITexture:GetMappingHeight() end

---Returns the true unmodified width of the texture.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:GetMappingWidth
---@return number # width
function ITexture:GetMappingWidth() end

---Returns the name of the texture, in most cases the path.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:GetName
---@return string # name
function ITexture:GetName() end

---Returns the number of animation frames in this texture.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:GetNumAnimationFrames
---@return number # The number of animation frames in this texture.
function ITexture:GetNumAnimationFrames() end

---Returns the modified height of the texture, this value may be affected by mipmapping and other factors.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:Height
---@return number # height
function ITexture:Height() end

---Returns whenever the texture is valid. (i.e. was loaded successfully or not)
---
--- **NOTE**: The "error" texture is a valid texture, and therefore this function will return false when used on it. Use [ITexture:IsErrorTexture](https://wiki.facepunch.com/gmod/ITexture:IsErrorTexture), instead.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:IsError
---@return boolean # Whether the texture was loaded successfully or not.
function ITexture:IsError() end

---Returns whenever the texture is the error texture (pink and black checkerboard pattern).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:IsErrorTexture
---@return boolean # Whether the texture is the error texture or not.
function ITexture:IsErrorTexture() end

---Returns the modified width of the texture, this value may be affected by mipmapping and other factors.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/ITexture:Width
---@return number # width
function ITexture:Width() end
