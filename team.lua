---@meta

--- The team library gives you access to the team system built into the Source engine, and allows you to create custom teams and get information about them.
team = {}

---Increases the score of the given team
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.AddScore
---@param index number Index of the team
---@param increment number Amount to increase the team's score by
function team.AddScore(index, increment) end

---Returns the team index of the team with the least players. Falls back to TEAM_UNASSIGNED
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.BestAutoJoinTeam
---@return number # Team index
function team.BestAutoJoinTeam() end

---Returns the real table consisting of information on every defined team
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.GetAllTeams
---@return table # Team info
function team.GetAllTeams() end

---Returns the selectable classes for the given team. This can be added to with [team.SetClass](https://wiki.facepunch.com/gmod/team.SetClass)
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.GetClass
---@param index number Index of the team
---@return table # Selectable classes
function team.GetClass(index) end

---Returns the team's color.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.GetColor
---@param teamIndex number The team index.
---@return Color # The team's color as a Color.
function team.GetColor(teamIndex) end

---Returns the name of the team.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.GetName
---@param teamIndex number The team index.
---@return string # The team name. If the team is not defined, returns an empty string.
function team.GetName(teamIndex) end

---Returns a table with all player of the specified team.
--- **NOTE**: This function returns a sequential table, meaning it should be looped with [Global.ipairs](https://wiki.facepunch.com/gmod/Global.ipairs) instead of [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs) for efficiency reasons.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.GetPlayers
---@param teamIndex number The team index.
---@return table # A sequential table of Players that belong to the requested team.
function team.GetPlayers(teamIndex) end

---Returns the score of the team.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.GetScore
---@param teamIndex number The team index.
---@return number # score
function team.GetScore(teamIndex) end

---Returns a table of valid spawnpoint classes the team can use. These are set with [team.SetSpawnPoint](https://wiki.facepunch.com/gmod/team.SetSpawnPoint).
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.GetSpawnPoint
---@param index number Index of the team
---@return table # Valid spawnpoint classes
function team.GetSpawnPoint(index) end

---Returns a table of valid spawnpoint entities the team can use. These are set with  [team.SetSpawnPoint](https://wiki.facepunch.com/gmod/team.SetSpawnPoint).
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.GetSpawnPoints
---@param index number Index of the team
---@return table # Valid spawnpoint entities
function team.GetSpawnPoints(index) end

---Returns if a team is joinable or not. This is set in [team.SetUp](https://wiki.facepunch.com/gmod/team.SetUp).
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.Joinable
---@param index number The index of the team.
---@return boolean # True if the team is joinable. False otherwise.
function team.Joinable(index) end

---Returns the amount of players in a team.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.NumPlayers
---@param teamIndex number The team index.
---@return number # playerCount
function team.NumPlayers(teamIndex) end

---Sets valid classes for use by a team. Classes can be created using [player_manager.RegisterClass](https://wiki.facepunch.com/gmod/player_manager.RegisterClass)
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.SetClass
---@param index number Index of the team
---@param classes any A class ID or table of class IDs
function team.SetClass(index, classes) end

---Sets the team's color.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.SetColor
---@param teamIndex number The team index.
---@param color Color The team's new color as a Color.
function team.SetColor(teamIndex, color) end

---Sets the score of the given team
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.SetScore
---@param index number Index of the team
---@param score number The team's new score
function team.SetScore(index, score) end

---Sets valid spawnpoint classes for use by a team.
---
--- **NOTE**: GM.TeamBased must be set to true for this to work
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.SetSpawnPoint
---@param index number Index of the team
---@param classes any A spawnpoint classname or table of spawnpoint classnames
function team.SetSpawnPoint(index, classes) end

---Creates a new team. See [GM:CreateTeams](https://wiki.facepunch.com/gmod/GM:CreateTeams) for the hook to call this in.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.SetUp
---@param teamIndex number The team index.
---@param teamName string The team name.
---@param teamColor Color The team color. Uses the Color.
---@param isJoinable? boolean Whether the team is joinable or not.
function team.SetUp(teamIndex, teamName, teamColor, isJoinable) end

---Returns the total number of deaths of all players in the team.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.TotalDeaths
---@param index number The team index.
---@return number # Total deaths in team.
function team.TotalDeaths(index) end

---Get's the total frags in a team.
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.TotalFrags
---@param entityOrNumber Entity Entity or number.
---@return number # index
function team.TotalFrags(entityOrNumber) end

---Returns true if the given team index is valid
---@realm shared
---@source https://wiki.facepunch.com/gmod/team.Valid
---@param index number Index of the team
---@return boolean # Is valid
function team.Valid(index) end
