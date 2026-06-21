---@meta

--- A helper panel that will automatically resize itself to fit all its children using [Panel:SizeToChildren](https://wiki.facepunch.com/gmod/Panel:SizeToChildren).
---@class (partial) DSizeToContents : Panel
local DSizeToContents = {}

---Returns whether the [DSizeToContents](https://wiki.facepunch.com/gmod/DSizeToContents) panel should size to contents horizontally.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DSizeToContents:GetSizeX
---@return boolean # Whether the panel should size to contents horizontally.
function DSizeToContents:GetSizeX() end

---Returns whether the [DSizeToContents](https://wiki.facepunch.com/gmod/DSizeToContents) panel should size to contents vertically.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DSizeToContents:GetSizeY
---@return boolean # Whether the panel should size to contents vertically.
function DSizeToContents:GetSizeY() end

---Sets whether the [DSizeToContents](https://wiki.facepunch.com/gmod/DSizeToContents) panel should size to contents horizontally. This is `true` by default.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DSizeToContents:SetSizeX
---@param sizeX boolean Whether the panel should size to contents horizontally.
function DSizeToContents:SetSizeX(sizeX) end

---Sets whether the [DSizeToContents](https://wiki.facepunch.com/gmod/DSizeToContents) panel should size to contents vertically. This is `true` by default.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DSizeToContents:SetSizeY
---@param sizeY boolean Whether the panel should size to contents vertically.
function DSizeToContents:SetSizeY(sizeY) end
