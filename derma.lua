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
---
--- This calls [vgui.Register](https://wiki.facepunch.com/gmod/vgui.Register) internally, but also does the following:
--- * Adds the control to [derma.GetControlList](https://wiki.facepunch.com/gmod/derma.GetControlList)
--- * Adds a key "Derma" - This is returned by [derma.GetControlList](https://wiki.facepunch.com/gmod/derma.GetControlList)
--- * Makes a global table with the name of the control (This is technically deprecated and should not be relied upon)
--- * If reloading (i.e. called this function with name of an existing panel), updates all existing instances of panels with this name. (Updates functions, calls [PANEL:PreAutoRefresh](https://wiki.facepunch.com/gmod/PANEL:PreAutoRefresh) and [PANEL:PostAutoRefresh](https://wiki.facepunch.com/gmod/PANEL:PostAutoRefresh), etc.)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.DefineControl
---@param name string Name of the newly created control.
---@param description string Description of the control.
---@param tab table Table containing control methods and properties.
---@param base string Derma control to base the new control off of.
---@return table # A table containing the new control's methods and properties.
function derma.DefineControl(name, description, tab, base) end

---Defines a new skin so that it is usable by Derma. The default skin can be found in `garrysmod/lua/skins/default.lua`.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.DefineSkin
---@param name string Name of the skin.
---@param descriptions string Description of the skin.
---@param skin table Table containing skin data.
function derma.DefineSkin(name, descriptions, skin) end

---Returns the [derma.Controls](https://wiki.facepunch.com/gmod/derma.Controls) table, a list of all derma controls registered with [derma.DefineControl](https://wiki.facepunch.com/gmod/derma.DefineControl).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.GetControlList
---@return table # A listing of all available derma-based controls. See derma.Controls for structure and contents.
function derma.GetControlList() end

---Returns the default skin table, which can be changed with the hook [GM:ForceDermaSkin](https://wiki.facepunch.com/gmod/GM:ForceDermaSkin).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.GetDefaultSkin
---@return table # The default skin table.
function derma.GetDefaultSkin() end

---Returns the skin table of the skin with the supplied name.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.GetNamedSkin
---@param name string Name of skin.
---@return table # The skin table.
function derma.GetNamedSkin(name) end

---Returns a copy of the table containing every Derma skin.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.GetSkinTable
---@return table # Table of every Derma skin.
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

---Checks if a matching hook function exists in the skin _(based on the concatenation of type and name args)_, then calls it.
---
--- This function is used dynamically inside [Global.Derma_Hook](https://wiki.facepunch.com/gmod/Global.Derma_Hook).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.SkinHook
---@param type string The type of hook to run, usually `Paint`.
---@param name string The name of the hook/panel to run. Example: `Button`.
---@param panel Panel The panel to call the hook for.
---@param vararg1? any First parameter for the panel hook. i.e. width of the panel for.PANEL:Paint hooks.
---@param vararg2? any Second parameter for the panel hook. i.e. height of the panel for.PANEL:Paint hooks.
---@return any # The returned variable from the skin hook.
function derma.SkinHook(type, name, panel, vararg1, vararg2) end

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
