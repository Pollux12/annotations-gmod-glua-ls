---@meta

--- A simple Derma Drawer
---@class (partial) DDrawer : Panel
local DDrawer = {}

---Closes the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDrawer:Close
function DDrawer:Close() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the Open Size of DDrawer.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDrawer:GetOpenSize
---@return number # Open size.
function DDrawer:GetOpenSize() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the Open Time of DDrawer.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDrawer:GetOpenTime
---@return number # Time in seconds.
function DDrawer:GetOpenTime() end

---Opens the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDrawer:Open
function DDrawer:Open() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the height of DDrawer
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDrawer:SetOpenSize
---@param Value number Height of DDrawer. Default is `100`.
function DDrawer:SetOpenSize(Value) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the time (in seconds) for DDrawer to open.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDrawer:SetOpenTime
---@param value number Length in seconds. Default is 0.3
function DDrawer:SetOpenTime(value) end

---Toggles the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DDrawer:Toggle
function DDrawer:Toggle() end
