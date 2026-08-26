---@meta

--- Missing description.
util = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- 	Determines whether a player is currently speaking.
---
--- Alias : [Player:IsSpeaking](https://wiki.facepunch.com/gmod/Player:IsSpeaking) (clientside).
---@realm client
---@source https://wiki.facepunch.com/gmod/IsPlayerSpeaking
---@param UserID number
---@return boolean # Returns true if the player is currently speaking, false otherwise.
function util.IsPlayerSpeaking(UserID) end
