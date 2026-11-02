---Enables or disables the mouse input for the panel.
--- 		**NOTE**: Panels parented to the context menu will not be clickable unless [Panel:SetKeyboardInputEnabled](https://wiki.facepunch.com/gmod/Panel:SetKeyboardInputEnabled(lowercase)) is enabled or [Panel:MakePopup](https://wiki.facepunch.com/gmod/Panel:MakePopup) has been called. If you want the panel to have mouse input but you do not want to prevent players from moving, set [Panel:SetKeyboardInputEnabled](https://wiki.facepunch.com/gmod/Panel:SetKeyboardInputEnabled(lowercase)) to false immediately after calling [Panel:MakePopup](https://wiki.facepunch.com/gmod/Panel:MakePopup).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Panel:SetMouseInputEnabled
---@param mouseInput boolean Whenever to enable or disable mouse input.
---@[keeps_children]
function Panel:SetMouseInputEnabled(mouseInput) end
