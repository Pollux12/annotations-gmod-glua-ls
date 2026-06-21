---@meta

--- GWEN is a system that allows you to load a spritesheet and generate a skin out of it.
GWEN = {}

---This is a utility function that generates a specialized drawing function to render scalable textured borders. This is done with [9-slice scaling](https://en.wikipedia.org/wiki/9-slice_scaling). This is used in derma skins to create a bordered rectangle drawing function from an image.
---
--- The texture is taken from `SKIN.GwenTexture` when the `material` argument is not supplied.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/GWEN.CreateTextureBorder
---@param x number The X coordinate on the texture.
---@param y number The Y coordinate on the texture.
---@param w number Width of the area on texture.
---@param h number Height of the area on texture.
---@param left number Left width of border.
---@param top number Top width of border.
---@param right number Right width of border.
---@param bottom number Bottom width of border.
---@param material? IMaterial If set, given material will be used over the SKIN's default material, which is `SKIN.GwenTexture`.
---@return fun(x: number, y: number, w: number, h: number, clr: Color?) # The drawing function.
---
--- Function argument(s):
--- * number `x` - X coordinate for the box.
--- * number `y` - Y coordinate for the box.
--- * number `w` - Width of the box.
--- * number `h` - Height of the box.
--- * Color `clr` - Optional color, default is color_white.
function GWEN.CreateTextureBorder(x, y, w, h, left, top, right, bottom, material) end

---Used in derma skins to create a fixed scale rectangle drawing function from an image. it will be drawn in the center of the box.
---
--- The texture is taken from `SKIN.GwenTexture` when the `material` is not supplied.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/GWEN.CreateTextureCentered
---@param x number The X coordinate on the texture.
---@param y number The Y coordinate on the texture.
---@param w number Width of the area on texture.
---@param h number Height of the area on texture.
---@param material? IMaterial If set, given material will be used over the SKIN's default material, which is `SKIN.GwenTexture`.
---@return fun(x: number, y: number, w: number, h: number, clr: Color?) # The drawing function.
---
--- Function argument(s):
--- * number `x` - X coordinate for the box.
--- * number `y` - Y coordinate for the box.
--- * number `w` - Width of the box.
--- * number `h` - Height of the box.
--- * Color `clr` - Optional color, default is white.
function GWEN.CreateTextureCentered(x, y, w, h, material) end

---Helper function that returns a specialized drawing function for rendering a texture that scales freely to fit the given area.
---
--- The texture is taken from `SKIN.GwenTexture` when the `material` is not supplied.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/GWEN.CreateTextureNormal
---@param x number The X coordinate on the texture.
---@param y number The Y coordinate on the texture.
---@param w number Width of the area on texture.
---@param h number Height of the area on texture.
---@param material? IMaterial If set, given material will be used over the SKIN's default material, which is `SKIN.GwenTexture`.
---@return fun(x: number, y: number, w: number, h: number, clr: Color?) # The drawing function.
---
--- Function argument(s):
--- * number `x` - X coordinate for the box.
--- * number `y` - Y coordinate for the box.
--- * number `w` - Width of the box.
--- * number `h` - Height of the box.
--- * Color `clr` - Optional color, default is white.
function GWEN.CreateTextureNormal(x, y, w, h, material) end

---Retrieves the color from a materials texture at the provided UV coordinates
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/GWEN.TextureColor
---@param x number X position of the pixel to get the color from.
---@param y number Y position of the pixel to get the color from.
---@return Color # The color of the point on the skin.
function GWEN.TextureColor(x, y) end
