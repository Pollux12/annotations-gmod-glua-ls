---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- The ContentHeader is used internally by the Spawnmenu and only use this if you know
--- what you're doing because you can break a few things with it.
---@realm client
---@source https://wiki.facepunch.com/gmod/ContentHeader
---@class (partial) ContentHeader : DLabelEditable
local ContentHeader = {}

---Creates a DermaMenu with a delete option and opens it. Called internally on right-click.
---@realm client
---@source https://wiki.facepunch.com/gmod/ContentHeader:OpenMenu
function ContentHeader:OpenMenu() end

---
---@realm client
---@source https://wiki.facepunch.com/gmod/ContentHeader:ToTable
---@param bigtable table
function ContentHeader:ToTable(bigtable) end

---Returns the spawnmenu tile layout that owns this content header.
---@realm client
---@return DTileLayout
function ContentHeader:GetParent() end
