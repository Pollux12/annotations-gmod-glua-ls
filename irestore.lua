---@meta

--- The object used in the [saverestore](https://wiki.facepunch.com/gmod/saverestore), mainly in [saverestore.AddRestoreHook](https://wiki.facepunch.com/gmod/saverestore.AddRestoreHook).
---
--- It allows you to read blocks directly from the save game files used by Half-Life 2 save system when such save is loaded.
---@source https://wiki.facepunch.com/gmod/IRestore
---@class (partial) IRestore
local IRestore = {}

---Ends current data block started with [IRestore:StartBlock](https://wiki.facepunch.com/gmod/IRestore:StartBlock) and returns to the parent block.
---
--- To avoid all sorts of errors, you **must** end all blocks you start.
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:EndBlock
function IRestore:EndBlock() end

---Reads next bytes from the restore object as an [Angle](https://wiki.facepunch.com/gmod/Angle).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:ReadAngle
---@return Angle # The angle that has been read
function IRestore:ReadAngle() end

---Reads next bytes from the restore object as a [boolean](https://wiki.facepunch.com/gmod/boolean).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:ReadBool
---@return boolean # The boolean that has been read
function IRestore:ReadBool() end

---Reads next bytes from the restore object as an [Entity](https://wiki.facepunch.com/gmod/Entity).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:ReadEntity
---@return Entity # The entity that has been read.
function IRestore:ReadEntity() end

---Reads next bytes from the restore object as a floating point [number](https://wiki.facepunch.com/gmod/number).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:ReadFloat
---@return number # The read floating point number.
function IRestore:ReadFloat() end

---Reads next bytes from the restore object as an integer [number](https://wiki.facepunch.com/gmod/number).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:ReadInt
---@return number # The read integer number.
function IRestore:ReadInt() end

---Reads next bytes from the restore object as a [string](https://wiki.facepunch.com/gmod/string).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:ReadString
---@return string # The read string.
function IRestore:ReadString() end

---Reads next bytes from the restore object as a [Vector](https://wiki.facepunch.com/gmod/Vector).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:ReadVector
---@return Vector # The read vector.
function IRestore:ReadVector() end

---Loads next block of data to be read inside current block. Blocks **must** be ended with [IRestore:EndBlock](https://wiki.facepunch.com/gmod/IRestore:EndBlock).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:StartBlock
---@return string # The name of the next data block to be read.
function IRestore:StartBlock() end
