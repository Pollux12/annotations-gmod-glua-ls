---@meta

--- The player_manager library lets you manage players, such as setting their models or creating player classes.
player_manager = {}

---Assigns view model hands to player model.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.AddValidHands
---@param name string Player model name.
---@param model string Hands model.
---@param skin? number Skin to apply to the hands.
---@param bodygroups? string Bodygroups to apply to the hands. See Entity:SetBodyGroups for help with the format.
---@param matchBodySkin? boolean If set to `true`, the skin of the hands will be set to the skin of the playermodel.
---  This is useful when player models have multiple user-selectable skins.
function player_manager.AddValidHands(name, model, skin, bodygroups, matchBodySkin) end

---Associates a simplified name with a path to a valid player model.
---
--- Only used internally.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.AddValidModel
---@param name string Simplified name.
---@param model string Valid PlayerModel path.
function player_manager.AddValidModel(name, model) end

---Returns the entire list of valid player models.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.AllValidModels
---@return table # List of all valid player models.
function player_manager.AllValidModels() end

---Clears a player's class association by setting their ClassID to 0.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.ClearPlayerClass
---@param ply Player Player to clear class from.
function player_manager.ClearPlayerClass(ply) end

---Gets a players class.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.GetPlayerClass
---@param ply Player Player to get class.
---@return string # The players class.
function player_manager.GetPlayerClass(ply) end

---Retrieves a copy of all registered player classes.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.GetPlayerClasses
---@return table # A copy of all registered player classes.
function player_manager.GetPlayerClasses() end

---Gets a players' class table.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.GetPlayerClassTable
---@param ply Player Player to get class of.
---@return table # The players class table.
function player_manager.GetPlayerClassTable(ply) end

---Applies basic class variables when the player spawns.
---
--- Called from [GM:PlayerSpawn](https://wiki.facepunch.com/gmod/GM:PlayerSpawn) in the base gamemode.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.OnPlayerSpawn
---@param ply Player Player to setup.
---@param transition boolean If true, the player just spawned from a map transition. You probably want to not touch player's weapons or position if this is set to `true`.
function player_manager.OnPlayerSpawn(ply, transition) end

---Register a class metatable to be assigned to players later.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.RegisterClass
---@param name string Class name.
---@param table PLAYER Class metatable, see Structures/PLAYER.
---@param base? string Base class name.
function player_manager.RegisterClass(name, table, base) end

---Execute a named function within the player's set class.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.RunClass
---@param ply Player Player to execute function on.
---@param funcName string Name of function.
---@param ... any Optional arguments. Can be of any type.
---@return any ... # The values returned by the called function.
function player_manager.RunClass(ply, funcName, ...) end

---Sets a player's class.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.SetPlayerClass
---@param ply Player Player to set class.
---@param className string Name of class to set.
function player_manager.SetPlayerClass(ply, className) end

---Retrieves correct hands for given player model. By default returns citizen hands.
---
--- **NOTE**: See [player_manager.AddValidHands](https://wiki.facepunch.com/gmod/player_manager.AddValidHands) for defining/linking hands to a model - this must be defined somewhere otherwise the model will return citizen hands here.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.TranslatePlayerHands
---@param name string Player model name.
---@return table # A table with following contents:
--- * string model - Model of hands.
--- * number skin - Skin of hands.
--- * string body - Bodygroups of hands.
function player_manager.TranslatePlayerHands(name) end

---Returns the valid model path for a simplified name.
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.TranslatePlayerModel
---@param shortName string The short name of the model.
---@return string # The valid model path for the short name.
function player_manager.TranslatePlayerModel(shortName) end

---Returns the simplified name for a valid model path of a player model.
---
--- Opposite of [player_manager.TranslatePlayerModel](https://wiki.facepunch.com/gmod/player_manager.TranslatePlayerModel).
---@realm shared
---@source https://wiki.facepunch.com/gmod/player_manager.TranslateToPlayerModelName
---@param model string The model path to a player model.
---@return string # The simplified name for that model.
function player_manager.TranslateToPlayerModelName(model) end
