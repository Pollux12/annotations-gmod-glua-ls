--- Source:
--- - garrysmod/gamemodes/base/gamemode/shared.lua
--- - garrysmod/gamemodes/sandbox/gamemode/shared.lua
---@class GM
---@field Name string Gamemode display name.
---@field Author string Gamemode author.
---@field Email string Gamemode contact email.
---@field Website string Gamemode website.
---@field TeamBased boolean Whether the gamemode uses teams.
---@field IsSandboxDerived? boolean True for Sandbox and Sandbox-derived gamemodes.
GM = {}

---Adds a tool menu option to the sandbox spawn menu. Sandbox calls this as a
---gamemode method from `GM:AddSTOOL` even though the helper is not defined in
---the shipped Lua files as a standalone `GM` method.
---@realm client
---@param tab string The spawn menu tab name.
---@param category string The tool category.
---@param class string The tool class/name.
---@param name string The display name.
---@param cmd string The console command.
---@param config string|nil The config name.
---@param cpanel fun(panel: ControlPanel)|nil Callback used to populate the control panel.
---@param data table|nil Additional tool menu option data.
function GM:AddToolMenuOption(tab, category, class, name, cmd, config, cpanel, data) end
