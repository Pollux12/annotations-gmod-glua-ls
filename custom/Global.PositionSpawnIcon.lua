---Moves the given model to the given position and calculates appropriate camera parameters for rendering the model to an icon.
---
--- The output table interacts nicely with [Panel:RebuildSpawnIconEx](https://wiki.facepunch.com/gmod/Panel:RebuildSpawnIconEx) with a few key renames.
---@realm client
---@source https://wiki.facepunch.com/gmod/Global.PositionSpawnIcon
---@param model Entity Model that is being rendered to the spawn icon
---@param position Vector Position that the model is being rendered at
---@param noAngles? boolean If true the function won't reset the angles to 0 for the model.
---@return table # Table of information of the view which can be used for rendering
function _G.PositionSpawnIcon(model, position, noAngles) end
