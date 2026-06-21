---@meta

--- Menu state library to query the master server list.
serverlist = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Adds current server the player is on to their favorites.
---@realm menu
---@source https://wiki.facepunch.com/gmod/serverlist.AddCurrentServerToFavorites
---@param addOrRemove boolean `true` if to add, or `false` if to remove from favorites.
function serverlist.AddCurrentServerToFavorites(addOrRemove) end

---Adds the given server address to their favorites.
---@realm menu
---@source https://wiki.facepunch.com/gmod/serverlist.AddServerToFavorites
---@param address string Server Address. **IP:Port like "127.0.0.1:27015"**
function serverlist.AddServerToFavorites(address) end

---Returns true if the current server address is in their favorites.
---@realm menu
---@source https://wiki.facepunch.com/gmod/serverlist.IsCurrentServerFavorite
---@return boolean # true if the current server is in their favorites
function serverlist.IsCurrentServerFavorite() end

---Returns true if the given server address is in their favorites.
---@realm menu
---@source https://wiki.facepunch.com/gmod/serverlist.IsServerFavorite
---@param address string Server Address. **IP:Port like "127.0.0.1:27015"**
---@return boolean # true if the server address is in their favorites
function serverlist.IsServerFavorite(address) end

---Queries a server for its information/ping.
---@realm menu
---@source https://wiki.facepunch.com/gmod/serverlist.PingServer
---@param ip string The IP address of the server, including the port.
---@param callback function The function to be called if and when the request finishes.
---
--- Callback has arguments described here: Structures/ServerQueryData.
function serverlist.PingServer(ip, callback) end

---Queries a server for its player list.
---@realm menu
---@source https://wiki.facepunch.com/gmod/serverlist.PlayerList
---@param ip string The IP address of the server, including the port.
---@param callback fun(data: table) The function to be called if and when the request finishes.
---
--- Function argument(s):
--- * table `data` -
--- A list of players and their info. Each entry has the following fields:
---   * number **time** - The amount of time the player is playing on the server, in seconds
---   * string **name** - The player name
---   * number **score** - The players score
function serverlist.PlayerList(ip, callback) end

---Queries the master server for server list.
---@realm menu
---@source https://wiki.facepunch.com/gmod/serverlist.Query
---@param data ServerQueryData The information about what kind of servers we want. See Structures/ServerQueryData
function serverlist.Query(data) end

---Removes the given server address from their favorites.
---@realm menu
---@source https://wiki.facepunch.com/gmod/serverlist.RemoveServerFromFavorites
---@param address string Server Address. **IP:Port like "127.0.0.1:27015"**
function serverlist.RemoveServerFromFavorites(address) end
