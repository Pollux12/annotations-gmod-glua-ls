---Sends the current net message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to the server. The player object must exist on the server for the net message to be received successfully by the server.
---
--- **WARNING**: Each net message has a length limit of 65,533 bytes (approximately 64 KiB) and your net message will error and fail to send if it is larger than this.
---
--- The message name must be pooled with [util.AddNetworkString](https://wiki.facepunch.com/gmod/util.AddNetworkString) beforehand!
---@realm client
---@source https://wiki.facepunch.com/gmod/net.SendToServer
---@[net_send("server")]
function net.SendToServer() end
