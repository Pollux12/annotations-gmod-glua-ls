---@meta

---Common Admin Mod Interface, shared between admin mods and the addons that query them.
---@class CAMI
---@field Version number The version of the loaded CAMI library.
CAMI = CAMI or {}

---Defines the characteristics of a usergroup.
---@class CAMIUsergroup
---@field Name string The name of the usergroup.
---@field Inherits string The name of the usergroup this usergroup inherits from.
---@field CAMI_Source string? The source specified by the admin mod which registered this usergroup (if any, converted to a string).

---Defines the characteristics of a privilege.
---@class CAMIPrivilege
---@field Name string The name of the privilege.
---@field MinAccess "user"|"admin"|"superadmin" Default group that should have this privilege.
---@field Description string? Optional text describing the purpose of the privilege.
---@field HasAccess (fun(self: CAMIPrivilege, actor: Player, target: Player?): boolean, string?)? Optional function to check if a player has access to this privilege (and optionally execute it on another player). May not be called by all admin mods.

---Extra information for an access query.
---@class CAMIAccessExtraInfo
---@field Fallback ("user"|"admin"|"superadmin")? Fallback status for if the privilege doesn't exist. Defaults to `admin`.
---@field IgnoreImmunity boolean? Ignore any immunity mechanisms an admin mod might have.
---@field CommandArguments table? Extra arguments that were given to the privilege command.

---Extra information for a SteamID access query.
---@class CAMISteamAccessExtraInfo
---@field IgnoreImmunity boolean? Ignore any immunity mechanisms an admin mod might have.
---@field CommandArguments table? Extra arguments that were given to the privilege command.

---Registers a usergroup with CAMI.
---
---Use the source parameter to make sure CAMI.RegisterUsergroup and the CAMI.OnUsergroupRegistered hook don't cause an infinite loop.
---@param usergroup CAMIUsergroup The structure for the usergroup you want to register.
---@param source? any Identifier for your own admin mod. Can be anything.
---@return CAMIUsergroup # The usergroup given as an argument.
function CAMI.RegisterUsergroup(usergroup, source) end

---Unregisters a usergroup from CAMI. This will call a hook that will notify all other admin mods of the removal.
---
---Call only when the usergroup is to be permanently removed.
---@param usergroupName string The name of the usergroup.
---@param source? any Identifier for your own admin mod. Can be anything.
---@return boolean # Whether the unregistering succeeded.
function CAMI.UnregisterUsergroup(usergroupName, source) end

---Retrieves all registered usergroups.
---@return table<string, CAMIUsergroup> # Usergroups indexed by their names.
function CAMI.GetUsergroups() end

---Receives information about a usergroup.
---@param usergroupName string
---@return CAMIUsergroup? # Returns nil when the usergroup does not exist.
function CAMI.GetUsergroup(usergroupName) end

---Checks to see if potentialAncestor is an ancestor of usergroupName. All usergroups are ancestors of themselves.
---@param usergroupName string The usergroup to query.
---@param potentialAncestor string The ancestor to query.
---@return boolean # Whether usergroupName inherits potentialAncestor.
function CAMI.UsergroupInherits(usergroupName, potentialAncestor) end

---Finds the base group a usergroup inherits from. All usergroups must eventually inherit either user, admin or superadmin.
---@param usergroupName string The name of the usergroup.
---@return ("user"|"admin"|"superadmin")? # The name of the root usergroup, or nil when the usergroup does not exist.
function CAMI.InheritanceRoot(usergroupName) end

---Registers an addon privilege with CAMI.
---
---This should only be used by addons. Admin mods must not register their privileges using this function.
---@param privilege CAMIPrivilege
---@return CAMIPrivilege # The privilege given as argument.
function CAMI.RegisterPrivilege(privilege) end

---Unregisters a privilege from CAMI. This will call a hook that will notify any admin mods of the removal.
---
---Call only when the privilege is to be permanently removed.
---@param privilegeName string The name of the privilege.
---@return boolean # Whether the unregistering succeeded.
function CAMI.UnregisterPrivilege(privilegeName) end

---Retrieves all registered privileges.
---@return table<string, CAMIPrivilege> # All privileges indexed by their names.
function CAMI.GetPrivileges() end

---Receives information about a privilege.
---@param privilegeName string
---@return CAMIPrivilege? # Returns nil when the privilege does not exist.
function CAMI.GetPrivilege(privilegeName) end

---Checks if a player has access to a privilege (and optionally can execute it on targetPly).
---
---This function is designed to be asynchronous but is invoked synchronously if no callback is passed. If the installed admin mod does not support synchronous queries, a synchronous call throws an error.
---@param actorPly Player The player to query.
---@param privilegeName string The privilege to query.
---@param callback? fun(hasAccess: boolean, reason: string?) Callback to receive the answer, or nil for synchronous.
---@param targetPly? Player Optional target for if the privilege affects another player (eg kick/ban).
---@param extraInfoTbl? CAMIAccessExtraInfo Table of extra information for the admin mod.
---@return boolean? # Synchronous only: whether the player has the privilege.
---@return string? # Synchronous only: optional reason from the admin mod.
function CAMI.PlayerHasAccess(actorPly, privilegeName, callback, targetPly, extraInfoTbl) end

---Gets all the players on the server with a certain privilege (and optionally who can execute it on targetPly). This function is asynchronous.
---@param privilegeName string The privilege to query.
---@param callback fun(players: Player[]) Callback to receive the answer.
---@param targetPly? Player Optional target for if the privilege affects another player (eg kick/ban).
---@param extraInfoTbl? CAMIAccessExtraInfo Table of extra information for the admin mod.
function CAMI.GetPlayersWithAccess(privilegeName, callback, targetPly, extraInfoTbl) end

---Checks if a (potentially offline) SteamID has access to a privilege (and optionally if they can execute it on a target SteamID). This function is asynchronous.
---@param actorSteam string? The SteamID to query.
---@param privilegeName string The privilege to query.
---@param callback fun(hasAccess: boolean, reason: string?) Callback to receive the answer.
---@param targetSteam? string Optional target SteamID for if the privilege affects another player (eg kick/ban).
---@param extraInfoTbl? CAMISteamAccessExtraInfo Table of extra information for the admin mod.
function CAMI.SteamIDHasAccess(actorSteam, privilegeName, callback, targetSteam, extraInfoTbl) end

---Signifies that your admin mod has changed the usergroup of a player, communicating to other admin mods what it thinks the usergroup of the player should be.
---@param ply Player The player for which the usergroup is changed.
---@param old string The previous usergroup of the player.
---@param new string The new usergroup of the player.
---@param source? any Identifier for your own admin mod. Can be anything.
function CAMI.SignalUserGroupChanged(ply, old, new, source) end

---Signifies that your admin mod has changed the usergroup of a disconnected player, communicating to other admin mods what it thinks the usergroup of the player should be.
---@param steamId string The SteamID of the player for which the usergroup is changed.
---@param old string The previous usergroup of the player.
---@param new string The new usergroup of the player.
---@param source? any Identifier for your own admin mod. Can be anything.
function CAMI.SignalSteamIDUserGroupChanged(steamId, old, new, source) end
