---@class (partial) SpawnIcon : DButton
---@field Icon ModelImage The model image child created in Init.
local SpawnIcon = {}

---Returns the icon name/path stored by the spawn icon.
---@realm client
---@return string # The icon name.
function SpawnIcon:GetIconName() end
