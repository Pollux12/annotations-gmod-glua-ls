---@meta

--- A panel that draws a sprite on the player's HUD with the given [IMaterial](https://wiki.facepunch.com/gmod/IMaterial), [Global.Color](https://wiki.facepunch.com/gmod/Global.Color) and rotation.
---
--- A shortcut for this is [Global.CreateSprite](https://wiki.facepunch.com/gmod/Global.CreateSprite)().
---@class (partial) DSprite : DPanel
local DSprite = {}

---Gets the color the sprite is using as a modifier.
---@realm client
---@source https://wiki.facepunch.com/gmod/DSprite:GetColor
---@return Color # The Color being used.
function DSprite:GetColor() end

---Returns the value set by [DSprite:SetHandle](https://wiki.facepunch.com/gmod/DSprite:SetHandle)
---@realm client
---@source https://wiki.facepunch.com/gmod/DSprite:GetHandle
---@return Vector #
function DSprite:GetHandle() end

---Gets the material the sprite is using.
---@realm client
---@source https://wiki.facepunch.com/gmod/DSprite:GetMaterial
---@return IMaterial # The material in use.
function DSprite:GetMaterial() end

---Gets the 2D rotation angle of the sprite, in the plane of the screen.
---@realm client
---@source https://wiki.facepunch.com/gmod/DSprite:GetRotation
---@return number # The anti-clockwise rotation in degrees.
function DSprite:GetRotation() end

---Sets the color modifier for the sprite.
---@realm client
---@source https://wiki.facepunch.com/gmod/DSprite:SetColor
---@param color Color The Color to use.
function DSprite:SetColor(color) end

---Seems to be an unused feature. Does nothing.
---@realm client
---@source https://wiki.facepunch.com/gmod/DSprite:SetHandle
---@param vec Vector
function DSprite:SetHandle(vec) end

---Sets the source material for the sprite.
---@realm client
---@source https://wiki.facepunch.com/gmod/DSprite:SetMaterial
---@param material IMaterial The material to use. This will ideally be an [UnlitGeneric](https://developer.valvesoftware.com/wiki/UnlitGeneric).
function DSprite:SetMaterial(material) end

---Sets the 2D rotation angle of the sprite, in the plane of the screen.
---@realm client
---@source https://wiki.facepunch.com/gmod/DSprite:SetRotation
---@param ang number The anti-clockwise rotation in degrees.
function DSprite:SetRotation(ang) end
