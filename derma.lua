---@meta

--- The derma library allows you to add custom derma controls and create & modify derma skins.
derma = {}

---Gets the color from a Derma skin of a panel and returns default color if not found.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.Color
---@param name string
---@param pnl Panel
---@param default Color The default Color in case of failure.
function derma.Color(name, pnl, default) end

---Defines a new Derma control with an optional base.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.DefineControl
---@generic T: Panel
---@[call_arg("gmod.vgui_panel", "define_control")]
---@param name string Name of the newly created control.
---@param description string Description of the control.
---@[call_arg("gmod.vgui_panel", "table")]
---@param tab T Table containing control methods and properties.
---@[call_arg("gmod.vgui_panel", "base")]
---@param base string Derma control to base the new control off of.
---@return T # A table containing the new control's methods and properties.
function derma.DefineControl(name, description, tab, base) end

---Defines a new skin so that it is usable by Derma.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.DefineSkin
---@[call_arg("gmod.derma_skin", "define")]
---@param name string Name of the skin.
---@param description string Description of the skin.
---@param skin SKIN Table containing skin data.
function derma.DefineSkin(name, description, skin) end

---Returns the [derma.Controls](https://wiki.facepunch.com/gmod/derma.Controls) table, a list of all derma controls registered with [derma.DefineControl](https://wiki.facepunch.com/gmod/derma.DefineControl).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.GetControlList
---@return table # A listing of all available derma-based controls. See derma.Controls for structure and contents.
function derma.GetControlList() end

---Returns the default skin table.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.GetDefaultSkin
---@return SKIN # The default skin table.
function derma.GetDefaultSkin() end

---Returns the skin table of the skin with the supplied name.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.GetNamedSkin
---@[call_arg("gmod.derma_skin", "reference")]
---@param name string Name of skin.
---@return SKIN? # The skin table.
function derma.GetNamedSkin(name) end

---Returns a copy of the table containing every Derma skin.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.GetSkinTable
---@return table<string, SKIN> # Table of every Derma skin.
function derma.GetSkinTable() end

---Clears all cached panels so that they reassess which skin they should be using.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.RefreshSkins
function derma.RefreshSkins() end

---Returns how many times [derma.RefreshSkins](https://wiki.facepunch.com/gmod/derma.RefreshSkins) has been called.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.SkinChangeIndex
---@return number # Amount of times derma.RefreshSkins has been called.
function derma.SkinChangeIndex() end

---Checks if a matching hook function exists in the panel's skin, then calls it.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.SkinHook
---@param type string The type of hook to run, usually `Paint`.
---@param name string The name of the hook or panel to run. Example: `Button`.
---@param panel Panel The panel to call the hook for.
---@param ... any Arguments forwarded to the skin hook.
---@return any # The returned variable from the skin hook.
function derma.SkinHook(type, name, panel, ...) end

---Returns a function to draw a specified texture of panels skin.
---
--- These are usually generated via [GWEN.CreateTextureBorder](https://wiki.facepunch.com/gmod/GWEN.CreateTextureBorder) and similar.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.SkinTexture
---@param name string The identifier of the texture.
---@param pnl Panel Panel to get the skin of.
---@param fallback? function|any What to return if we failed to retrieve the texture.
---@return fun(x: number, y: number, w: number, h: number, clr: Color?) # A function that is created with the GWEN library to draw a texture.
---
--- Function argument(s):
--- * number `x` - X coordinate for the box.
--- * number `y` - Y coordinate for the box.
--- * number `w` - Width of the box.
--- * number `h` - Height of the box.
--- * Color `clr` - Optional color, default is white.
function derma.SkinTexture(name, pnl, fallback) end
