---Saves the color of given button across sessions.  
--- The color is saved as a panel cookie, see [Panel:SetCookie](https://wiki.facepunch.com/gmod/Panel:SetCookie) and [Panel:SetCookieName](https://wiki.facepunch.com/gmod/Panel:SetCookieName).
--- It is expected that the amount of colors per palette ([Panel:SetCookieName](https://wiki.facepunch.com/gmod/Panel:SetCookieName)) is the same every time.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DColorPalette:SaveColor
---@param btn DColorButton The button to save the color of. Used to get the ID of the button.
---@param clr Color The color to save to this button's index
function DColorPalette:SaveColor(btn, clr) end
