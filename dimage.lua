---@meta

--- [DImage](https://wiki.facepunch.com/gmod/DImage) is an advanced, more robust version of the [Material](https://wiki.facepunch.com/gmod/Material) panel.
---
--- See [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) for a click-able version of this panel.
---@class (partial) DImage : DPanel
local DImage = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Actually loads the [IMaterial](https://wiki.facepunch.com/gmod/IMaterial) to render it. Called from [DImage:LoadMaterial](https://wiki.facepunch.com/gmod/DImage:LoadMaterial).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:DoLoadMaterial
function DImage:DoLoadMaterial() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- "Fixes" the current material of the [DImage](https://wiki.facepunch.com/gmod/DImage) if it has VertexLit shader by creating a new one with the same name and a prefix of "_DImage" and automatically calling [DImage:SetMaterial](https://wiki.facepunch.com/gmod/DImage:SetMaterial) with the new material.
---
--- This fixes the problem where using materials using shaders that expect lighting information causing "weird" flickering when displayed in 2D/Unlit environment.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:FixVertexLitMaterial
function DImage:FixVertexLitMaterial() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the texture path set by [DImage:SetFailsafeMatName](https://wiki.facepunch.com/gmod/DImage:SetFailsafeMatName).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:GetFailsafeMatName
---@return string #
function DImage:GetFailsafeMatName() end

---Returns the image loaded in the image panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:GetImage
---@return string # The path to the image that is loaded.
function DImage:GetImage() end

---Returns the color override of the image panel.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:GetImageColor
---@return Color # The color override of the image. Uses Color.
function DImage:GetImageColor() end

---Returns whether the [DImage](https://wiki.facepunch.com/gmod/DImage) should keep the aspect ratio of its image when being resized.
---
--- See [DImage:SetKeepAspect](https://wiki.facepunch.com/gmod/DImage:SetKeepAspect) for more info on how it works.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:GetKeepAspect
---@return boolean # Whether the DImage should keep the aspect ratio of its image when being resized.
function DImage:GetKeepAspect() end

---Returns the current [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) of the [DImage](https://wiki.facepunch.com/gmod/DImage).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:GetMaterial
---@return IMaterial #
function DImage:GetMaterial() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the texture path set by [DImage:SetMatName](https://wiki.facepunch.com/gmod/DImage:SetMatName).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:GetMatName
---@return string #
function DImage:GetMatName() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Initializes the loading process of the material to render if it is not loaded yet.
---
--- You do not need to call this function. It is done for you automatically.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:LoadMaterial
function DImage:LoadMaterial() end

---Paints a ghost copy of the DImage panel at the given position and dimensions. This function overrides [Panel:PaintAt](https://wiki.facepunch.com/gmod/Panel:PaintAt).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:PaintAt
---@param posX number The x coordinate to draw the panel from.
---@param posY number The y coordinate to draw the panel from.
---@param width? number The width of the panel image to be drawn.
---@param height? number The height of the panel image to be drawn.
function DImage:PaintAt(posX, posY, width, height) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the backup material to be loaded when the image is first rendered. Used by [DImage:SetOnViewMaterial](https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:SetFailsafeMatName
---@param backupMat string
function DImage:SetFailsafeMatName(backupMat) end

---Sets the image to load into the frame. If the first image can't be loaded and `strBackup` is set, that image will be loaded instead.
---
--- This eventually calls [DImage:SetMaterial](https://wiki.facepunch.com/gmod/DImage:SetMaterial).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:SetImage
---@param strImage string The path of the image to load, relative to the `materials/` folder. When no file extension is supplied the `.vmt` file extension is assumed.
---@param strBackup? string The path of the backup image.
function DImage:SetImage(strImage, strBackup) end

---Sets the image's color override.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:SetImageColor
---@param col Color The color override of the image. Uses Color.
function DImage:SetImageColor(col) end

---Sets whether the [DImage](https://wiki.facepunch.com/gmod/DImage) should keep the aspect ratio of its image when being resized.
---
--- Note that this will not try to fit the image inside the button, but instead it will fill the button with the image.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:SetKeepAspect
---@param keep boolean true to keep the aspect ratio, false not to
function DImage:SetKeepAspect(keep) end

---Sets a [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) directly as an image.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:SetMaterial
---@param mat IMaterial The material to set
function DImage:SetMaterial(mat) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the material to be loaded when the image is first rendered. Used by [DImage:SetOnViewMaterial](https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:SetMatName
---@param mat string
function DImage:SetMatName(mat) end

---Similar to [DImage:SetImage](https://wiki.facepunch.com/gmod/DImage:SetImage), but will only do the expensive part of actually loading the textures/material if the material is about to be rendered/viewed.
---
--- Useful for cases like [DIconBrowser](https://wiki.facepunch.com/gmod/DIconBrowser), where there are hundreds of small icons in 1 panel in a list that do not need all to be loaded at the same time.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial
---@param mat string
---@param backupMat string
function DImage:SetOnViewMaterial(mat, backupMat) end

---Returns true if the image is **not** yet loaded.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImage:Unloaded
---@return boolean #
function DImage:Unloaded() end
