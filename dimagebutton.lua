---@meta

---@class DImageButton : DButton
---@field m_Image DImage The internal DImage panel used to render the image.
local DImageButton = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to briefly scale the image when clicked.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:DepressImage
function DImageButton:DepressImage() end

---Returns whether [DImageButton:DepressImage](https://wiki.facepunch.com/gmod/DImageButton:DepressImage) is functional or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:GetDepressImage
---@return boolean # `true` to enable image depressing when clicked.
function DImageButton:GetDepressImage() end

---Returns the "image" of the [DImageButton](https://wiki.facepunch.com/gmod/DImageButton). Equivalent of [DImage:GetImage](https://wiki.facepunch.com/gmod/DImage:GetImage).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:GetImage
---@return string # The path to the image that is loaded.
function DImageButton:GetImage() end

---Returns whether the image inside the button should be stretched to fit it or not
---
--- See [DImageButton:SetStretchToFit](https://wiki.facepunch.com/gmod/DImageButton:SetStretchToFit)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:GetStretchToFit
---@return boolean #
function DImageButton:GetStretchToFit() end

---Sets the color of the image. Equivalent of [DImage:SetImageColor](https://wiki.facepunch.com/gmod/DImage:SetImageColor)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetColor
---@param color Color The Color to set
function DImageButton:SetColor(color) end

---Controls whether [DImageButton:DepressImage](https://wiki.facepunch.com/gmod/DImageButton:DepressImage) is functional or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetDepressImage
---@param enable boolean `true` to enable image depressing when clicked.
function DImageButton:SetDepressImage(enable) end

---Alias of [DImageButton:SetImage](https://wiki.facepunch.com/gmod/DImageButton:SetImage).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetIcon
---@param strImage string
---@param strBackup? string
function DImageButton:SetIcon(strImage, strBackup) end

---Sets the "image" of the [DImageButton](https://wiki.facepunch.com/gmod/DImageButton). Equivalent of [DImage:SetImage](https://wiki.facepunch.com/gmod/DImage:SetImage).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetImage
---@param strImage string The path of the image to load, relative to the `materials/` folder. When no file extension is supplied the `.vmt` file extension is assumed.
---@param strBackup? string The path of the backup image.
function DImageButton:SetImage(strImage, strBackup) end

---Hides or shows the image of the image button. Internally this calls [Panel:SetVisible](https://wiki.facepunch.com/gmod/Panel:SetVisible) on the internal [DImage](https://wiki.facepunch.com/gmod/DImage).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetImageVisible
---@param visible boolean Set true to make it visible ( default ), or false to hide the image
function DImageButton:SetImageVisible(visible) end

---Sets whether the [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) should keep the aspect ratio of its image. Equivalent of [DImage:SetKeepAspect](https://wiki.facepunch.com/gmod/DImage:SetKeepAspect).
---
--- Note that this will not try to fit the image inside the button, but instead it will fill the button with the image.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetKeepAspect
---@param keep boolean true to keep the aspect ratio, false not to
function DImageButton:SetKeepAspect(keep) end

---Sets a [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) directly as an image. Equivalent of [DImage:SetMaterial](https://wiki.facepunch.com/gmod/DImage:SetMaterial).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetMaterial
---@param mat IMaterial The material to set
function DImageButton:SetMaterial(mat) end

---See [DImage:SetOnViewMaterial](https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetOnViewMaterial
---@param mat string
---@param backup string
function DImageButton:SetOnViewMaterial(mat, backup) end

---Sets whether the image inside the [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) should be stretched to fill the entire size of the button, without preserving aspect ratio.
---
--- If set to false, the image will not be resized at all.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DImageButton:SetStretchToFit
---@param stretch boolean True to stretch, false to not to stretch
function DImageButton:SetStretchToFit(stretch) end
