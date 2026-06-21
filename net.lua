---@meta

--- The net library is one of a number of ways to send data between the client and server.
---
--- The major advantages of the net library are the large size limit (64kb/message) and the ability to send data backwards - from the client to the server.
---
--- Refer to [Net Library Usage](https://wiki.facepunch.com/gmod/Net_Library_Usage) for a short introduction.
net = {}

---Cancels a net message started by [net.Start](https://wiki.facepunch.com/gmod/net.Start), so you can immediately start a new one without any errors.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.Abort
function net.Abort() end

---Sends the currently built net message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to all connected players.
--- More information can be found in [Net Library Usage](https://wiki.facepunch.com/gmod/Net_Library_Usage).
---@realm server
---@source https://wiki.facepunch.com/gmod/net.Broadcast
function net.Broadcast() end

---Returns the amount of data left to read in the current message. Does nothing when sending data.
---
--- **NOTE**: This will include 6 extra bits (or 1 byte rounded-up) used by the engine internally.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.BytesLeft
---@return number # The amount of data left to read in the current net message in **bytes**.
--- Returns `nil` if no net message has been started.
---@return number # The amount of data left to read in the current net message in **bits**.
--- Returns `nil` if no net message has been started.
function net.BytesLeft() end

---Returns the size of the current message.
---
--- **NOTE**: This will include 3 extra bytes (24 bits) used by the engine internally to send the data over the network.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.BytesWritten
---@return number # The amount of **bytes** written to the current net message.
--- Returns `nil` if no net message has been started.
---@return number # The amount of **bits** written to the current net message.
--- Returns `nil` if no net message has been started.
function net.BytesWritten() end

---**INTERNAL**: You may be looking for [net.Receive](https://wiki.facepunch.com/gmod/net.Receive).
---
--- Function called by the engine to tell the Lua state a message arrived.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.Incoming
---@param length number The message length, in **bits**.
---@param client Player The player that sent the message. This will be `nil` in the client state.
function net.Incoming(length, client) end

---Reads an angle from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadAngle
---@return Angle # The read angle, or `Angle( 0, 0, 0 )` if no angle could be read
function net.ReadAngle() end

---Reads a bit from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadBit
---@return number # `0` or `1`, or `0` if the bit could not be read.
function net.ReadBit() end

---Reads a boolean from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadBool
---@return boolean # `true` or `false`, or `false` if the bool could not be read.
function net.ReadBool() end

---Reads a [Color](https://wiki.facepunch.com/gmod/Color) from the current net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadColor
---@param hasAlpha? boolean If the color has alpha written or not. **Must match what was given to net.WriteColor.**
---@return Color # The Color read from the current net message, or `Color( 0, 0, 0, 0 )` if the color could not be read.
function net.ReadColor(hasAlpha) end

---Reads pure binary data from the message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadData
---@param length number The length of the data to be read, in **bytes**.
---@return string # The binary data read, or a string containing one character with a byte of `0` if no data could be read.
function net.ReadData(length) end

---Reads a double-precision number from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadDouble
---@return number # The double-precision number, or `0` if no number could be read.
function net.ReadDouble() end

---Reads an entity from the received net message. You should always check if the specified entity exists as it may have been removed and therefore `NULL` if it is outside of the players [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") or was already removed.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadEntity
---@return Entity # The entity, or `nil` if no entity could be read.
function net.ReadEntity() end

---Reads a floating point number from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadFloat
---@return number # The floating point number, or `0` if no number could be read.
function net.ReadFloat() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Reads a word, basically unsigned short. This is used internally to read the "header" of the message which is an unsigned short which can be converted to the corresponding message name via [util.NetworkIDToString](https://wiki.facepunch.com/gmod/util.NetworkIDToString).
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadHeader
---@return number # The header number
function net.ReadHeader() end

---Reads an integer from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadInt
---@param bitCount number The amount of bits to be read.
---
--- This must be set to what you set to net.WriteInt. Read more information at net.WriteInt.
---@return number # The read integer number, or `0` if no integer could be read.
function net.ReadInt(bitCount) end

---Reads a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) from the received net message.
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadMatrix
---@return VMatrix # The matrix, or an empty matrix if no matrix could be read.
function net.ReadMatrix() end

---Reads a normal vector from the net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadNormal
---@return Vector # The normalized vector ( length = `1` ), or `Vector( 0, 0, 1 )` if no normal could be read.
function net.ReadNormal() end

---Reads a player entity that was written with [net.WritePlayer](https://wiki.facepunch.com/gmod/net.WritePlayer) from the received net message.
---
--- You should always check if the specified entity exists as it may have been removed and therefore `NULL` if it is outside of the local players [PVS](https://developer.valvesoftware.com/wiki/PVS) or was already removed.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadPlayer
---@return Player # The player, or `Entity(0)` if no entity could be read.
function net.ReadPlayer() end

---Reads a [null-terminated string](https://en.wikipedia.org/wiki/Null-terminated_string) from the net stream. The size of the string is 8 bits plus 8 bits for every ASCII character in the string.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadString
---@return string # The read string, or a string with `0` length if no string could be read.
function net.ReadString() end

---Reads a table from the received net message.
---
--- See [net.WriteTable](https://wiki.facepunch.com/gmod/net.WriteTable) for extra info.
---
--- **NOTE**: Sometimes when sending a table through the net library, the order of the keys may be switched.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadTable
---@param sequential? boolean Set to `true` if the input table is sequential. This saves on bandwidth.
---@return table<any, any> # Table received via the net message, or a blank table if no table could be read.
function net.ReadTable(sequential) end

---**INTERNAL**: Used internally by [net.ReadTable](https://wiki.facepunch.com/gmod/net.ReadTable).
---
--- Reads a value from the net message with the specified type, written by [net.WriteType](https://wiki.facepunch.com/gmod/net.WriteType).
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadType
---@param typeID? number The type of value to be read, using Enums/TYPE.
---@return any # The value, or the respective blank value based on the type you're reading if the value could not be read.
function net.ReadType(typeID) end

---Reads an unsigned integer with the specified number of bits from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadUInt
---@param bitCount number The size of the integer to be read, in bits.
---
--- This must be set to what you set to net.WriteUInt. Read more information at net.WriteUInt.
---@return number # The unsigned integer read, or `0` if the integer could not be read.
function net.ReadUInt(bitCount) end

---Reads a unsigned integer with 64 bits from the received net message.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadUInt64
---@return string # The uint64 number.
---
--- Since Lua cannot store full 64-bit integers, this function returns a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).
function net.ReadUInt64() end

---Reads a vector from the received net message. Vectors sent by this function are **compressed**, which may result in precision loss. See [net.WriteVector](https://wiki.facepunch.com/gmod/net.WriteVector) for more information.
---
--- **WARNING**: You **must** read information in same order as you write it.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.ReadVector
---@return Vector # The read vector, or `Vector( 0, 0, 0 )` if no vector could be read.
function net.ReadVector() end

---Registers a callback for a network message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.Receive
---@[call_arg("gmod.net_message", "receive")]
---@param messageName string The message name to hook to.
---@param callback fun(len: number, ply: Player) The function to be called if the specified message was received.
function net.Receive(messageName, callback) end

---Sends the current net message to the specified player(s)
---@realm server
---@source https://wiki.facepunch.com/gmod/net.Send
---@overload fun(plys: Player[])
---@overload fun(filter: CRecipientFilter)
---@param ply Player The player to send the message to.
function net.Send(ply) end

---Sends the current message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to all except the player or players specified.
---@realm server
---@source https://wiki.facepunch.com/gmod/net.SendOmit
---@overload fun(plys: Player[])
---@param ply Player The player to **NOT** send the message to.
function net.SendOmit(ply) end

---Sends current net message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to all players that are in the same [Potentially Audible Set (PAS)](https://developer.valvesoftware.com/wiki/PAS) as the position, or simply said, it adds all players that can potentially hear sounds from this position.
---@realm server
---@source https://wiki.facepunch.com/gmod/net.SendPAS
---@param position Vector PAS position.
function net.SendPAS(position) end

---Sends current net message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to all players in the [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") of the position, or, more simply said, sends the message to players that can potentially see this position.
---@realm server
---@source https://wiki.facepunch.com/gmod/net.SendPVS
---@param position Vector Position that must be in players' visibility set.
function net.SendPVS(position) end

---Sends the current net message (see [net.Start](https://wiki.facepunch.com/gmod/net.Start)) to the server. The player object must exist on the server for the net message to be received successfully by the server.
---
--- **WARNING**: Each net message has a length limit of 65,533 bytes (approximately 64 KiB) and your net message will error and fail to send if it is larger than this.
---
--- The message name must be pooled with [util.AddNetworkString](https://wiki.facepunch.com/gmod/util.AddNetworkString) beforehand!
---@realm client
---@source https://wiki.facepunch.com/gmod/net.SendToServer
function net.SendToServer() end

---Begins a new net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.Start
---@[call_arg("gmod.net_message", "start")]
---@param messageName string The name of the message to send.
---@param unreliable? boolean If set to `true`, the message is not guaranteed to reach its destination.
---@return boolean # `true` if the message has been started.
function net.Start(messageName, unreliable) end

---Writes an angle to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteAngle
---@param angle Angle The angle to be sent.
function net.WriteAngle(angle) end

---Appends a boolean (as `1` or `0`) to the current net message.
---
--- Please note that the bit is written here from a [boolean](https://wiki.facepunch.com/gmod/boolean) (`true/false`) but [net.ReadBit](https://wiki.facepunch.com/gmod/net.ReadBit) returns a number.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteBit
---@param boolean boolean Bit status (false = `0`, true = `1`).
function net.WriteBit(boolean) end

---Appends a boolean to the current net message. Alias of [net.WriteBit](https://wiki.facepunch.com/gmod/net.WriteBit).
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteBool
---@param boolean boolean Boolean value to write.
function net.WriteBool(boolean) end

---Appends a [Color](https://wiki.facepunch.com/gmod/Color) to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteColor
---@param Color Color The Color you want to append to the net message.
---@param writeAlpha? boolean If we should write the alpha of the color or not.
function net.WriteColor(Color, writeAlpha) end

---Writes a chunk of binary data to the message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteData
---@param binaryData string The binary data to be sent.
---@param length? number The length of the binary data to be sent, in bytes.
function net.WriteData(binaryData, length) end

---Appends a double-precision number to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteDouble
---@param double number The double to be sent
function net.WriteDouble(double) end

---Appends an entity to the current net message using its [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex).
---
--- See [net.ReadEntity](https://wiki.facepunch.com/gmod/net.ReadEntity) for the function to read the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteEntity
---@param entity Entity The entity to be sent.
function net.WriteEntity(entity) end

---Appends a float (number with decimals) to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteFloat
---@param float number The float to be sent.
function net.WriteFloat(float) end

---Appends a signed integer - a whole number, positive/negative - to the current net message. Can be read back with [net.ReadInt](https://wiki.facepunch.com/gmod/net.ReadInt) on the receiving end.
---
--- Use [net.WriteUInt](https://wiki.facepunch.com/gmod/net.WriteUInt) to send an unsigned number (that you know will **never** be negative). Use [net.WriteFloat](https://wiki.facepunch.com/gmod/net.WriteFloat) for a non-whole number (e.g. `2.25`).
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteInt
---@param integer number The integer to be sent.
---@param bitCount number The amount of bits the number consists of. This must be **32** or less.
--[[

If you are unsure what to set, just set it to `32`.

Consult the table below to determine the bit count you need:

| Bit Count |  Minimum value |  Maximum value |
|-----------|:--------------:|:--------------:|
| 3 | -4 | 3 |
| 4 | -8 | 7 |
| 5 | -16 | 15 |
| 6 | -32 | 31 |
| 7 | -64 | 63 |
| 8 | -128 | 127 |
| 9 | -256 | 255 |
| 10 | -512 | 511 |
| 11 | -1,024 | 1,023 |
| 12 | -2,048 | 2,047 |
| 13 | -4,096 | 4,095 |
| 14 | -8,192 | 8,191 |
| 15 | -16,384 | 16,383 |
| 16 | -32,768 | 32,767 |
| 17 | -65,536 | 65,535 |
| 18 | -131,072 | 131,071 |
| 19 | -262,144 | 262,143 |
| 20 | -524,288 | 524,287 |
| 21 | -1,048,576 | 1,048,575 |
| 22 | -2,097,152 | 2,097,151 |
| 23 | -4,194,304 | 4,194,303 |
| 24 | -8,388,608 | 8,388,607 |
| 25 | -16,777,216 | 16,777,215 |
| 26 | -33,554,432 | 33,554,431 |
| 27 | -67,108,864 | 67,108,863 |
| 28 | -134,217,728 | 134,217,727 |
| 29 | -268,435,456 | 268,435,455 |
| 30 | -536,870,912 | 536,870,911 |
| 31 | -1,073,741,824 | 1,073,741,823 |
| 32 | -2,147,483,648 | 2,147,483,647 |
--]]
function net.WriteInt(integer, bitCount) end

---Writes a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) to the current net message.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteMatrix
---@param matrix VMatrix The matrix to be sent.
function net.WriteMatrix(matrix) end

---Writes a normalized/direction vector ( Vector with length of 1 ) to the net message.
---
--- This function uses less bandwidth compared to [net.WriteVector](https://wiki.facepunch.com/gmod/net.WriteVector) and will not send vectors with length of > 1 properly.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteNormal
---@param normal Vector The normalized/direction vector to be send.
function net.WriteNormal(normal) end

---Appends a player entity to the current net message using its [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex). This saves a small amount of network bandwidth over [net.WriteEntity](https://wiki.facepunch.com/gmod/net.WriteEntity).
---
--- See [net.ReadPlayer](https://wiki.facepunch.com/gmod/net.ReadPlayer) for the function to read the entity.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WritePlayer
---@param ply Player The player to be sent.
function net.WritePlayer(ply) end

---Appends a string to the current net message. The size of the written data is 8 bits for every ASCII character in the string + 8 bits for the null terminator.
---
--- The maximum allowed length of a single written string is **65532 characters**. (aka the limit of the net message itself)
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteString
---@param string string The string to be sent.
---
--- The input will be terminated at the first null byte if one is present. See net.WriteData if you wish to write binary data.
function net.WriteString(string) end

---Appends a table to the current net message. Adds **16 extra bits** per key/value pair, so you're better off writing each individual key/value as the exact type if possible.
---
--- **WARNING**: All net messages have a **64kb** buffer. This function will not check or error when that buffer is overflown. You might want to consider using [util.TableToJSON](https://wiki.facepunch.com/gmod/util.TableToJSON) and [util.Compress](https://wiki.facepunch.com/gmod/util.Compress) and send the resulting string in **60kb** chunks, doing the opposite on the receiving end.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteTable
---@param table table The table to be sent.
---
--- If the table contains a `nil` key the table may not be read correctly.
---
--- Not all objects can be sent over the network. Things like functions, [IMaterial](https://wiki.facepunch.com/gmod/IMaterial)s, etc will cause errors when reading the table from a net message.
---
--- Each element is also limited by the constraint of the `net.Write` function for the element type.
---@param sequential? boolean Set to `true` if the input table is sequential. This saves on bandwidth, adding **8 extra bits** per key/value pair instead of 16 bits.
---
--- To read the table you need to give [net.ReadTable](https://wiki.facepunch.com/gmod/net.ReadTable) the same value!
function net.WriteTable(table, sequential) end

---**INTERNAL**: Used internally by [net.WriteTable](https://wiki.facepunch.com/gmod/net.WriteTable).
---
--- Appends any type of value to the current net message.
---
--- **NOTE**: An additional 8-bit unsigned integer indicating the type will automatically be written to the packet before the value, in order to facilitate reading with [net.ReadType](https://wiki.facepunch.com/gmod/net.ReadType). If you know the data type you are writing, use a function meant for that specific data type to reduce amount of data sent.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteType
---@param Data any The data to be sent.
function net.WriteType(Data) end

---Appends an unsigned integer with the specified number of bits to the current net message.
---
--- Use [net.WriteInt](https://wiki.facepunch.com/gmod/net.WriteInt) if you want to send negative and positive numbers. Use [net.WriteFloat](https://wiki.facepunch.com/gmod/net.WriteFloat) for a non-whole number (e.g. `2.25`).
---
--- **NOTE**: Unsigned numbers **do not** support negative numbers.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteUInt
---@param unsignedInteger number The unsigned integer to be sent.
---@param bitCount number The size of the integer to be sent, in bits. Acceptable values range from any number `1` to `32` inclusive.
--[[

For reference: `1` = bit, `4` = nibble, `8` = byte, `16` = short, `32` = long.

Consult the table below to determine the bit count you need. The minimum value for all bit counts is `0`.

| Bit Count |  Maximum value |
|-----------|:--------------:|
| 1 | 1  |
| 2 | 3  |
| 3 | 7  |
| 4 | 15 |
| 5 | 31 |
| 6 | 63 |
| 7 | 127 |
| 8 | 255 |
| 9 | 511 |
| 10 | 1,023 |
| 11 | 2,047 |
| 12 | 4,095 |
| 13 | 8,191 |
| 14 | 16,383 |
| 15 | 32,767 |
| 16 | 65,535 |
| 17 | 131,071 |
| 18 | 262,143 |
| 19 | 524,287  |
| 20 | 1,048,575  |
| 21 | 2,097,151  |
| 22 | 4,194,303  |
| 23 | 8,388,607  |
| 24 | 16,777,215  |
| 25 | 33,554,431  |
| 26 | 67,108,863  |
| 27 | 134,217,727  |
| 28 | 268,435,455  |
| 29 | 536,870,911  |
| 30 | 1,073,741,823 |
| 31 | 2,147,483,647 |
| 32 | 4,294,967,295 |
--]]
function net.WriteUInt(unsignedInteger, bitCount) end

---Appends an unsigned integer with 64 bits to the current net message.
---
--- The limit for an uint64 is 18'446'744'073'709'551'615.
--- Everything above the limit will be set to the limit.
---
--- Unsigned numbers **do not** support negative numbers.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteUInt64
---@param uint64 string The 64 bit value to be sent. Can be a number.
---
--- 				Since Lua cannot store full 64-bit integers, this function takes a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).
---
--- 				If your input is a number and not a string, it won't be networked correctly as soon as it has more than 13 digits.
--- 				This is because Lua represents numbers over 13 digits as `1e+14`(`100 000 000 000 000`)
--- 				You can do something like this to convert it to a string: `string.format("%.0f", number)`.
--- 				If you try to use [Global.tostring](https://wiki.facepunch.com/gmod/Global.tostring) it will fail because it will create a result something like `1e+14` which doesn't work.
function net.WriteUInt64(uint64) end

---Appends a vector to the current net message.
--- Vectors sent by this function are compressed, which may result in precision loss. XYZ components greater than `16384` or less than `-16384` are irrecoverably altered (most significant bits are trimmed) and precision after the decimal point is 1 digit (5 bits).
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteVector
---@param vector Vector The vector to be sent.
function net.WriteVector(vector) end
