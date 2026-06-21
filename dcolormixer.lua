---@meta

--- A standard Derma color mixer
---@class (partial) DColorMixer : DPanel
local DColorMixer = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:ConVarThink
function DColorMixer:ConVarThink() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:DoConVarThink
---@param cvar string
function DColorMixer:DoConVarThink(cvar) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns true if alpha bar is shown, false if not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetAlphaBar
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetAlphaBar() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the current selected color.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetColor
---@return Color # The current selected color as a Color.
function DColorMixer:GetColor() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the alpha channel of the color.
---
--- See also:
--- * [DColorMixer:GetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR) - For the red channel
--- * [DColorMixer:GetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG) - For the green channel
--- * [DColorMixer:GetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB) - For the blue channel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA
---@return string # The ConVar name for the alpha channel of the color
function DColorMixer:GetConVarA() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the blue channel of the color.
---
--- See also:
--- * [DColorMixer:GetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR) - For the red channel
--- * [DColorMixer:GetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG) - For the green channel
--- * [DColorMixer:GetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA) - For the alpha channel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB
---@return string # The ConVar name for the blue channel of the color
function DColorMixer:GetConVarB() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the green channel of the color.
---
--- See also:
--- * [DColorMixer:GetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR) - For the red channel
--- * [DColorMixer:GetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB) - For the blue channel
--- * [DColorMixer:GetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA) - For the alpha channel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG
---@return string # The ConVar name for the green channel of the color
function DColorMixer:GetConVarG() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the red channel of the color.
---
--- See also:
--- * [DColorMixer:GetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG) - For the green channel
--- * [DColorMixer:GetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB) - For the blue channel
--- * [DColorMixer:GetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA) - For the alpha channel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR
---@return string # The ConVar name for the red channel of the color
function DColorMixer:GetConVarR() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns true if palette is shown, false if not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetPalette
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetPalette() end

---Returns the color as a normalized [Vector](https://wiki.facepunch.com/gmod/Vector).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetVector
---@return Vector # A vector representing the color of the DColorMixer, each value being in range of 0 to 1. Alpha is not included.
function DColorMixer:GetVector() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns true if the wangs are shown, false if not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:GetWangs
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetWangs() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that show/hide the alpha bar in DColorMixer
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetAlphaBar
---@param show boolean Show / Hide the alpha bar
function DColorMixer:SetAlphaBar(show) end

---Sets the base color of the [DColorCube](https://wiki.facepunch.com/gmod/DColorCube) part of the [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer).
---
--- See also [DColorCube:SetBaseRGB](https://wiki.facepunch.com/gmod/DColorCube:SetBaseRGB)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetBaseColor
---@param clr Color Color
function DColorMixer:SetBaseColor(clr) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the color of the [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer). See also [DColorMixer:GetColor](https://wiki.facepunch.com/gmod/DColorMixer:GetColor)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetColor
---@param color Color The color to set. See Global.Color
function DColorMixer:SetColor(color) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the alpha channel of the color.
---
--- See also:
--- * [DColorMixer:SetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR) - For the red channel
--- * [DColorMixer:SetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG) - For the green channel
--- * [DColorMixer:SetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB) - For the blue channel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA
---@param convar string The ConVar name for the alpha channel of the color
function DColorMixer:SetConVarA(convar) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the blue channel of the color.
---
--- See also:
--- * [DColorMixer:SetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR) - For the red channel
--- * [DColorMixer:SetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG) - For the green channel
--- * [DColorMixer:SetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA) - For the alpha channel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB
---@param convar string The ConVar name for the blue channel of the color
function DColorMixer:SetConVarB(convar) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the green channel of the color.
---
--- See also:
--- * [DColorMixer:SetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR) - For the red channel
--- * [DColorMixer:SetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB) - For the blue channel
--- * [DColorMixer:SetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA) - For the alpha channel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG
---@param convar string The ConVar name for the green channel of the color
function DColorMixer:SetConVarG(convar) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the red channel of the color.
---
--- See also:
--- * [DColorMixer:SetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG) - For the green channel
--- * [DColorMixer:SetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB) - For the blue channel
--- * [DColorMixer:SetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA) - For the alpha channel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR
---@param convar string The ConVar name for the red channel of the color
function DColorMixer:SetConVarR(convar) end

---Sets the label's text to show.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetLabel
---@param text? string Set to non empty string to show the label and its text.
---
--- Give it an empty string or nothing and the label will be hidden.
function DColorMixer:SetLabel(text) end

---Show or hide the palette panel
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetPalette
---@param enabled boolean Show or hide the palette panel?
function DColorMixer:SetPalette(enabled) end

---Sets the color of [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer) from a [Vector](https://wiki.facepunch.com/gmod/Vector). Alpha is not included.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetVector
---@param vec Vector The color to set. It is expected that the vector will have values be from 0 to 1. (i.e. be normalized)
function DColorMixer:SetVector(vec) end

---Show / Hide the colors indicators in DColorMixer
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:SetWangs
---@param show boolean Show / Hide the colors indicators
function DColorMixer:SetWangs(show) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Use [DColorMixer:SetColor](https://wiki.facepunch.com/gmod/DColorMixer:SetColor) instead!
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:UpdateColor
---@param clr Color
function DColorMixer:UpdateColor(clr) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:UpdateConVar
---@param cvar string The ConVar name
---@param part string The color part to set the cvar to. "r", "g", "b" or "a".
---@param clr Color The Color
function DColorMixer:UpdateConVar(cvar, part, clr) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:UpdateConVars
---@param clr Color The Color
function DColorMixer:UpdateConVars(clr) end

---sets the default color of the element to the currently selected color
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorMixer:UpdateDefaultColor
function DColorMixer:UpdateDefaultColor() end
