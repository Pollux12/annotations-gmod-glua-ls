---@meta

--- The DHTML control wraps the internal web engine, supports calling Javascript functions from Lua,
--- as well as running Lua from within the HTML. Running Lua code is disabled by default.
---@class (partial) DHTML : HTML
DHTML = {}

---Defines a Javascript function that when called will call a Lua callback.
--- **NOTE**: Must be called after the HTML document has fully loaded.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTML:AddFunction
---@param library string Library name of the JS function you are defining.
---@param name string Name of the JS function you are defining.
---@param callback function Function called when the JS function is called. Arguments passed to the JS function will be passed here.
function DHTML:AddFunction(library, name, callback) end

---Runs/Executes a string as JavaScript code in a panel.
--- **NOTE**: This function does **NOT** evaluate expression (i.e. allow you to pass variables from JavaScript (JS) to Lua context).Because a return value is nil/no value (a.k.a. void).If you wish to pass/return values from JS to Lua, you may want to use [DHTML:AddFunction](https://wiki.facepunch.com/gmod/DHTML:AddFunction) function to accomplish that job.
---
--- **NOTE**: This function is an alias of [DHTML:QueueJavascript](https://wiki.facepunch.com/gmod/DHTML:QueueJavascript) ([source](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/vgui/dhtml.lua#L62)).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTML:Call
---@param js string Specify JavaScript code to be executed.
function DHTML:Call(js) end

---Returns if the loaded page can run Lua code, set by [DHTML:SetAllowLua](https://wiki.facepunch.com/gmod/DHTML:SetAllowLua)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTML:GetAllowLua
---@return boolean # Whether or not Lua code can be called from the loaded page.
function DHTML:GetAllowLua() end

---Returns the value set by [DHTML:SetScrollbars](https://wiki.facepunch.com/gmod/DHTML:SetScrollbars).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTML:GetScrollbars
---@return boolean # True if scrollbars should be visible.
---@deprecated Broken. Use the CSS `overflow` rule instead.
function DHTML:GetScrollbars() end

---Runs/Executes a string as JavaScript code in a panel.
---
--- **NOTE**: This function does **NOT** evaluate expression (i.e. allow you to pass variables from JavaScript (JS) to Lua context).Because a return value is nil/no value (a.k.a. void).If you wish to pass/return values from JS to Lua, you may want to use [DHTML:AddFunction](https://wiki.facepunch.com/gmod/DHTML:AddFunction) function to accomplish that job.
---
--- **NOTE**: If [Panel:IsVisible](https://wiki.facepunch.com/gmod/Panel:IsVisible) is `false`, [PANEL:Think](https://wiki.facepunch.com/gmod/PANEL:Think) will **NOT** run, meaning the Javascript Queue will not be processed.Consider overriding [PANEL:Paint](https://wiki.facepunch.com/gmod/PANEL:Paint) to stop the panel from drawing instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTML:QueueJavascript
---@param js string Specify JavaScript code to be executed.
function DHTML:QueueJavascript(js) end

---Determines whether the loaded page can run Lua code or not. See [DHTML](https://wiki.facepunch.com/gmod/DHTML) for how to run Lua from a DHTML window.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTML:SetAllowLua
---@param allow? boolean Whether or not to allow Lua.
function DHTML:SetAllowLua(allow) end

---Sets if the loaded window should display scrollbars when the webpage is larger than the viewing window. This is similar to the CSS `overflow` rule.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTML:SetScrollbars
---@param show boolean True if scrollbars should be visible.
---@deprecated Broken. Use the CSS `overflow` rule instead.
function DHTML:SetScrollbars(show) end
