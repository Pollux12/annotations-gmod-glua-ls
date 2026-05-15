---@meta

--- The umsg (user message) library was previously the most common way of sending information from the server to the client.
---
--- **WARNING**: Usermessages have a limit of only 256 bytes!
---@deprecated You should be using the net library instead
umsg = {}

---Writes an angle to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Angle
---@param angle Angle The angle to be sent.
---@deprecated You should be using the net instead
function umsg.Angle(angle) end

---Writes a bool to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Bool
---@param bool boolean The bool to be sent.
---@deprecated You should be using the net instead
function umsg.Bool(bool) end

---Writes a signed char to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Char
---@param char number The char to be sent.
---@deprecated You should be using the net instead
function umsg.Char(char) end

---Dispatches the usermessage to the client(s).
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.End
---@deprecated You should be using the net instead
function umsg.End() end

---Writes an entity object to the usermessage. (As an entity handle, which means the entity index + its serial number)
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Entity
---@param entity Entity The entity to be sent.
---@deprecated You should be using the net instead
function umsg.Entity(entity) end

---Writes a float to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Float
---@param float number The float to be sent.
---@deprecated You should be using the net instead
function umsg.Float(float) end

---Writes a signed int (32 bit) to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Long
---@param int number The int to be sent.
---@deprecated You should be using the net instead
function umsg.Long(int) end

---The string specified will be networked to the client and receive a identifying number, which will be sent instead of the string to optimize networking.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.PoolString
---@param string string The string to be pooled.
---@deprecated Inferior version of util.AddNetworkString
function umsg.PoolString(string) end

---Writes a signed short (16 bit) to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Short
---@param short number The short to be sent.
---@deprecated You should be using the net instead
function umsg.Short(short) end

---Starts a new usermessage.
---
--- **WARNING**: Usermessages have a limit of only 256 bytes!
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Start
---@param name string The name of the message to be sent.
---@param filter? Player If passed a player object, it will only be sent to the player, if passed a CRecipientFilter of players, it will be sent to all specified players, if passed `nil` (or another invalid value), the message will be sent to all players.
---@deprecated You should be using net instead
function umsg.Start(name, filter) end

---Writes a null terminated string to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.String
---@param string string The string to be sent.
---@deprecated You should be using the net instead
function umsg.String(string) end

---Writes a Vector to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.Vector
---@param vector Vector The vector to be sent.
---@deprecated You should be using the net instead
function umsg.Vector(vector) end

---Writes a vector normal to the usermessage.
---@realm server
---@source https://wiki.facepunch.com/gmod/umsg.VectorNormal
---@param normal Vector The vector normal to be sent.
---@deprecated You should be using the net instead
function umsg.VectorNormal(normal) end
