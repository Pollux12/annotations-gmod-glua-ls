---@meta

--- The gui library is similar to the [input](https://wiki.facepunch.com/gmod/input) but features functions that are more focused on the mouse's interaction with GUI panels.
gui = {}

---Opens the game menu overlay.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.ActivateGameUI
function gui.ActivateGameUI() end

---Pushes text to the closed caption box.
--- **WARNING**: The function will not work, if the console command variable `closecaption` is set to 0.
---@realm client
---@source https://wiki.facepunch.com/gmod/gui.AddCaption
---@param captionStream string The caption to emit. See [Closed Captions](https://developer.valvesoftware.com/wiki/Closed_Captions) for more info.
---
--- Note the ability to add special commands to captions, such as `` to mark the caption as a sound effect caption, which would be hidden if `cc_subtitles` is set to 1. (To only show dialogue subtitles)
---@param duration number How long the caption should stay for
---@param fromPlayer? boolean Is this caption coming from the player?
---
--- This is used to give different colors to the caption to differentiate, for example, whether the SMG is fired by the player or an NPC.
function gui.AddCaption(captionStream, duration, fromPlayer) end

---Enables the mouse cursor without restricting player movement, like using Sandbox's context menu. See [vgui.CursorVisible](https://wiki.facepunch.com/gmod/vgui.CursorVisible) for a function to see if the cursor is visible or not.
---
--- **NOTE**: Some [CUserCmd](https://wiki.facepunch.com/gmod/CUserCmd) functions will return incorrect values when this function is active because [the user input is getting overtaken by the vgui system](https://github.com/Facepunch/garrysmod-issues/issues/982#issuecomment-505671531).
---@realm client
---@source https://wiki.facepunch.com/gmod/gui.EnableScreenClicker
---@param enabled boolean Whether the cursor should be enabled or not. (true = enable, false = disable)
function gui.EnableScreenClicker(enabled) end

---Hides the game menu overlay.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.HideGameUI
---@deprecated Will be disabled in a future patch. Use GM:OnPauseMenuShow instead.
function gui.HideGameUI() end

---Simulates a mouse move with the given deltas.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalCursorMoved
---@param deltaX number The movement delta on the x axis.
---@param deltaY number The movement delta on the y axis.
function gui.InternalCursorMoved(deltaX, deltaY) end

---Simulates a key press for the given key.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalKeyCodePressed
---@param key number The key, see Enums/KEY.
function gui.InternalKeyCodePressed(key) end

---Simulates a key release for the given key.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalKeyCodeReleased
---@param key number The key, see Enums/KEY.
function gui.InternalKeyCodeReleased(key) end

---Simulates a key type typing to the specified key.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalKeyCodeTyped
---@param key number The key, see Enums/KEY.
function gui.InternalKeyCodeTyped(key) end

---Simulates an ASCII symbol writing.
--- Use to write text in the chat or in VGUI.
--- Doesn't work while the main menu is open!
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalKeyTyped
---@param code number ASCII code of symbol, see [this chart](https://files.facepunch.com/wiki/files/ab571/8dc389806d65b98.gif).
function gui.InternalKeyTyped(code) end

---Simulates a double mouse key press for the given mouse key.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalMouseDoublePressed
---@param key number The key, see Enums/MOUSE.
function gui.InternalMouseDoublePressed(key) end

---Simulates a mouse key press for the given mouse key.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalMousePressed
---@param key number The key, see Enums/MOUSE.
function gui.InternalMousePressed(key) end

---Simulates a mouse key release for the given mouse key.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalMouseReleased
---@param key number The key, see Enums/MOUSE.
function gui.InternalMouseReleased(key) end

---Simulates a mouse wheel scroll with the given delta.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.InternalMouseWheeled
---@param delta number The amount of scrolling to simulate.
function gui.InternalMouseWheeled(delta) end

---Returns whether the console is visible or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.IsConsoleVisible
---@return boolean # Whether the console is visible or not.
function gui.IsConsoleVisible() end

---Returns whether the game menu overlay ( main menu ) is open or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.IsGameUIVisible
---@return boolean # Whether the game menu overlay ( main menu ) is open or not
function gui.IsGameUIVisible() end

---Returns the cursor's position on the screen, or 0, 0 if cursor is not visible.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.MousePos
---@return number # mouseX
---@return number # mouseY
---@deprecated Use input.GetCursorPos instead.
function gui.MousePos() end

---Returns x component of the mouse position.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.MouseX
---@return number # mouseX
function gui.MouseX() end

---Returns y component of the mouse position.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.MouseY
---@return number # mouseY
function gui.MouseY() end

---Opens specified URL in the steam overlay browser.
---
--- **NOTE**: When called clientside, user will be asked for confirmation before the website will open.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.OpenURL
---@param url string URL to open, it has to start with either `http://` or `https://`.
function gui.OpenURL(url) end

---Converts the specified screen position to a **direction** vector local to the player's view. A related function is [Vector:ToScreen](https://wiki.facepunch.com/gmod/Vector:ToScreen), which translates a 3D position to a screen coordinate.
---
--- [util.AimVector](https://wiki.facepunch.com/gmod/util.AimVector) is a more generic version of this, using a custom view instead of the player's current view.
---@realm client
---@source https://wiki.facepunch.com/gmod/gui.ScreenToVector
---@param x number X coordinate on the screen.
---@param y number Y coordinate on the screen.
---@return Vector # Direction
function gui.ScreenToVector(x, y) end

---Sets the cursor's position on the screen, relative to the topleft corner of the window
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.SetMousePos
---@param mouseX number The X coordinate to move the cursor to.
---@param mouseY number The Y coordinate to move the cursor to.
---@deprecated Use input.SetCursorPos instead.
function gui.SetMousePos(mouseX, mouseY) end

---Shows console in the game UI.
---@realm menu
---@source https://wiki.facepunch.com/gmod/gui.ShowConsole
function gui.ShowConsole() end
