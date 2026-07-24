---If set to false, the tool won't be added to the tool menu and players will have to access it by other means.
---@type boolean?
TOOL.AddToMenu = true

---The tool menu category under which the tool should be listed.
---@type string?
TOOL.Category = 'New Category'

---The console command to execute upon being selected in the Q menu.
---@type string?
TOOL.Command = 'gmod_toolmode [tool]'

---The name of the tool in the Q menu.
--- Common practice is to set this to "#tool.[lua filename].name" to match the name displayed in the tool information box.
---@type string?
TOOL.Name = '#[tool mode]'

---A key-value ( convar name-default value ) table containing the client-side convars to create. All convars will be prefixed with the filename of the tool.
--- You can later use Tool:GetClientNumber or Tool:GetClientInfo to retrieve these values.
---@type table
TOOL.ClientConVar = nil

---Same as above, but created server-side instead.
---@type table
TOOL.ServerConVar = nil

---A key-value ( string name - ConVar object ) table containing the cached convar objected created from `ClientConVar`.
---@type table
TOOL.ClientConVars = nil

---Same as above, but server-side (`ServerConVar`) instead.
---@type table
TOOL.ServerConVars = nil

---The function that is called to build the context menu for your tool. It has one argument, namely the context menu's base panel to which all of your custom panels are going to be parented to.
---
--- While it might sound like a hook, it isn't - you won't receive a `self` argument inside the function. See TOOL.BuildCPanel.
---@type fun(panel: ControlPanel, ...any)
TOOL.BuildCPanel = nil

---Allows you to override the tool usage information shown when the tool is equipped.
--- See Tool Information Display for more information.
---@type table
TOOL.Information = nil

---Class name of the tool. (name of the .lua file)
---
--- This is set automatically.
---@type string
TOOL.Mode = nil

---The tool tab (spawnmenu.AddToolTab) to add this tool to. (The internal name, first argument)
---@type string
TOOL.Tab = nil

---When enabled the game tries to run the left mouse click as soon as possible
---@type boolean?
TOOL.LeftClickAutomatic = false

---When enabled the game tries to run the right mouse click as soon as possible
---@type boolean?
TOOL.RightClickAutomatic = false
