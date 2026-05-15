---@meta

--- The file library provides functions for finding, reading and writing to files.
--- The following path values are most commonly used:
--- * `LUA` searches the lua files (in /lua/, in your gamemodes, in all the addons).
--- * `GAME` searches all the mounted content (main folder, addons, mounted games etc).
--- * `MOD` searches only the garrysmod folder.
--- * `DATA` searches in the data folder.
---
--- See [File Search Paths](https://wiki.facepunch.com/gmod/File_Search_Paths) for the descriptive list of path values.
--- For the full list of path values, type `path` in the console.
file = {}

---Appends data to a file in the `data/` folder.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Append
---@param name string The file's name.
---@param content string The content which should be appended to the file.
---@return boolean # If the operation was successful.
function file.Append(name, content) end

---Returns the content of a file asynchronously.
---
--- All limitations of [file.Read](https://wiki.facepunch.com/gmod/file.Read) also apply.
---@realm shared
---@source https://wiki.facepunch.com/gmod/file.AsyncRead
---@param fileName string The name of the file.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@param callback fun(fileName: string, gamePath: string, status: number, data: string) A callback function that will be called when the file read operation finishes.
---
--- Function argument(s):
--- * string `fileName` - The `fileName` argument above.
--- * string `gamePath` - The `gamePath` argument above.
--- * number `status` - The status of the operation. The list can be found in Enums/FSASYNC.
--- * string `data` - The entirety of the data of the file.
---@param sync? boolean If `true` the file will be read synchronously.
---@return FSASYNC # Enums/FSASYNC on success, Enums/FSASYNC on failure.
function file.AsyncRead(fileName, gamePath, callback, sync) end

---@class (partial) File
local File = {}

---@class (partial) file_class : File

---Dumps the file changes to disk and closes the file handle which makes the handle useless.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:Close
function File:Close() end

---Creates a directory that is relative to the `data` folder.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.CreateDir
---@param name string The directory's name.
function file.CreateDir(name) end

---Deletes a file or `empty` folder that is relative to the **data** folder. You can't remove any files outside of **data** folder.
--- **NOTE**: You are able to delete **any** file in the Menu state.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Delete
---@param name string The file name.
---@param path? string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
--- This is only available in the menu state.
---@return boolean #
function file.Delete(name, path) end

---Returns whether the [File](https://wiki.facepunch.com/gmod/File) object has reached the end of file or not.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:EndOfFile
---@return boolean # Whether the file has reached end or not.
function File:EndOfFile() end

---Returns a boolean of whether the file or directory exists or not.
--- If you want to check for a directory, [file.IsDir](https://wiki.facepunch.com/gmod/file.IsDir) will be faster since it won't check for files.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Exists
---@param name string The file or directory's name. ( You must include the file extension for files, for example "data.txt" )
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return boolean # Returns `true` if the file exists and `false` if it does not.
function file.Exists(name, gamePath) end

---Returns a list of files and directories inside a single folder.
--- **WARNING**: It seems that paths with capital letters (e.g. lua/MyFolder/*) don't work as expected on Linux.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Find
---@param name string The wildcard to search for. `models/*.mdl` will list **.mdl** files in the `models/` folder.
---@param path string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@param sorting? string The sorting to be used, **optional**.
---
--- * `nameasc` sort the files ascending by name.
--- * `namedesc` sort the files descending by name.
--- * `dateasc` sort the files ascending by date.
--- * `datedesc` sort the files descending by date.
---@return table # A table of found files, or `nil` if the path is invalid.
---@return table # A table of found directories, or `nil` if the path is invalid.
function file.Find(name, path, sorting) end

---Dumps the file changes to disk and saves the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:Flush
function File:Flush() end

---Returns whether the given file is a directory or not.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.IsDir
---@param fileName string The file or directory's name.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return boolean # `true` if the given path is a directory or `false` if it's a file.
function file.IsDir(fileName, gamePath) end

---Attempts to open a file with the given mode.
--- 		**WARNING**: When trying to open files with the following characteristics, it returns nil:
---
--- the file extension is ".db; .mdmp; .dmp" or
--- the file is "server.cfg; autoexec.cfg; config.cfg; listenserver.cfg; mount.cfg"
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Open
---@param fileName string The files name. See file.Write for details on filename restrictions when writing to files.
---@param fileMode string The mode to open the file in. Possible values are:
--- * **r** - read mode.
--- * **w** - write mode.
--- * **a** - append mode.
--- * **rb** - binary read mode.
--- * **wb** - binary write mode.
--- * **ab** - binary append mode.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return file_class # The opened file object, or `nil` if it failed to open due to it not existing or being used by another process.
function file.Open(fileName, fileMode, gamePath) end

---Reads the specified amount of chars and returns them as a binary string.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:Read
---@param length? number Reads the specified amount of chars. If not set, will read the entire file.
---@return string # The read data.
function File:Read(length) end

---Returns the content of a file.
---
--- **WARNING**: Beware of casing -- some filesystems are case-sensitive. SRCDS on Linux seems to force file/directory creation to lowercase, but will not modify read operations.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Read
---@param fileName string The name of the file.
---@param gamePath? string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return string # The data from the file as a string, or `nil` if the file isn't found.
function file.Read(fileName, gamePath) end

---Reads one byte of the file and returns whether that byte was not 0.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadBool
---@return boolean # val
function File:ReadBool() end

---Reads one unsigned 8-bit integer from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadByte
---@return number # The unsigned 8-bit integer from the file.
function File:ReadByte() end

---Reads an 8-byte little-endian IEEE-754 floating point double from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadDouble
---@return number # The double-precision floating point value read from the file.
function File:ReadDouble() end

---Reads an IEEE 754 little-endian 4-byte float from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadFloat
---@return number # The read value
function File:ReadFloat() end

---Returns the contents of the file from the current position up until the end of the current line.
---
--- **NOTE**: This function will look specifically for `Line Feed` characters `\n` and will **completely ignore `Carriage Return` characters** `\r`.
---
--- It will also stop at a `\0` or `NULL` character, but will add a new line instead.
---
--- This function will not return more than 8192 characters. The return value will include the `\n` character.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadLine
---@return string # The string of data from the read line.
function File:ReadLine() end

---Reads a signed little-endian 32-bit integer from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadLong
---@return number # A signed 32-bit integer
function File:ReadLong() end

---Reads a signed little-endian 16-bit integer from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadShort
---@return number # int16
function File:ReadShort() end

---Reads an unsigned 64-bit integer from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadUInt64
---@return string # An unsigned 64-bit integer.
--- Since Lua cannot store full 64-bit integers, this function returns a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).
function File:ReadUInt64() end

---Reads an unsigned little-endian 32-bit integer from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadULong
---@return number # An unsigned 32-bit integer
function File:ReadULong() end

---Reads an unsigned little-endian 16-bit integer from the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:ReadUShort
---@return number # The 16-bit integer
function File:ReadUShort() end

---Attempts to rename a file with the given name to another given name.
---
--- This function is constrained to the `data/` folder.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Rename
---@param orignalFileName string The original file or folder name. See file.Write for details on filename restrictions when writing to files.
---
--- **This argument will be forced lowercase.**
---@param targetFileName string The target file or folder name. See file.Write for details on filename restrictions when writing to files.
---
--- **This argument will be forced lowercase.**
---@return boolean # `true` on success, `false` otherwise.
function file.Rename(orignalFileName, targetFileName) end

---Sets the file pointer to the specified position.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:Seek
---@param pos number Pointer position, in bytes.
function File:Seek(pos) end

---Returns the size of the file in bytes.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:Size
---@return number #
function File:Size() end

---Returns the file's size in bytes.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Size
---@param fileName string The file's name.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return number # The file size in bytes, or `-1` if the file is not found.
function file.Size(fileName, gamePath) end

---Moves the file pointer by the specified amount of chars.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:Skip
---@param amount number The amount of chars to skip, can be negative to skip backwards.
---@return number # amount
function File:Skip(amount) end

---Returns the current position of the file pointer.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:Tell
---@return number # pos
function File:Tell() end

---Returns when the file or folder was last modified in Unix time.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Time
---@param path string The **file** or **folder** path.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return number # Seconds passed since Unix epoch, or `0` if the file is not found.
function file.Time(path, gamePath) end

---Writes the given string into the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:Write
---@param data string Binary data to write to the file.
function File:Write(data) end

---Writes the given string to a file. Erases all previous data in the file. To add data without deleting previous data, use [file.Append](https://wiki.facepunch.com/gmod/file.Append).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/file.Write
---@param fileName string The name of the file being written into. The path is relative to the `data/` folder.
---
--- This argument will be forced lowercase.
---
--- The filename **must** end with one of the following:
--- * .txt
--- * .dat
--- * .json
--- * .xml
--- * .csv
--- * .dem
--- * .vcd
--- * .gma
--- * .mdl
--- * .phy
--- * .vvd
--- * .vtx
--- * .ani
--- * .vtf
--- * .vmt
--- * .png
--- * .jpg
--- * .jpeg
--- * .mp3
--- * .wav
--- * .ogg
---
--- Restricted symbols are: `":`, and multiple consecutive spaces, as well as pretty much every other non Latin (a-Z) character
---@param content string The content that will be written into the file.
---@return boolean # If the operation was successful.
function file.Write(fileName, content) end

---Writes a boolean value to the file as one **byte**.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteBool
---@param bool boolean The bool to be written to the file.
function File:WriteBool(bool) end

---Write an 8-bit unsigned integer to the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteByte
---@param uint8 number The 8-bit unsigned integer to be written to the file.
function File:WriteByte(uint8) end

---Writes an 8-byte little-endian IEEE-754 floating point double to the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteDouble
---@param double number The double to be written to the file.
function File:WriteDouble(double) end

---Writes an IEEE 754 little-endian 4-byte float to the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteFloat
---@param float number The float to be written to the file.
function File:WriteFloat(float) end

---Writes a signed little-endian 32-bit integer to the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteLong
---@param int32 number The 32-bit signed integer to be written to the file.
function File:WriteLong(int32) end

---Writes a signed little-endian 16-bit integer to the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteShort
---@param int16 number The 16-bit signed integer to be written to the file.
function File:WriteShort(int16) end

---Writes an unsigned 64-bit integer to the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteUInt64
---@param uint64 string The unsigned 64-bit integer to be written to the file.
---
--- Since Lua cannot store full 64-bit integers, this function takes a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).
function File:WriteUInt64(uint64) end

---Writes an unsigned little-endian 32-bit integer to the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteULong
---@param uint32 number The unsigned 32-bit integer to be written to the file.
function File:WriteULong(uint32) end

---Writes an unsigned little-endian 16-bit integer to the file.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/File:WriteUShort
---@param uint16 number The unsigned 16-bit integer to the file.
function File:WriteUShort(uint16) end
