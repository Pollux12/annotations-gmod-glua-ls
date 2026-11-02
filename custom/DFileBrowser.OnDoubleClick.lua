---Called when a file is double-clicked.
---
--- **NOTE**: Double-clicking a file or icon will trigger **both** this and [DFileBrowser:OnSelect](https://wiki.facepunch.com/gmod/DFileBrowser:OnSelect).
---@hook OnDoubleClick
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:OnDoubleClick
---@param filePath string The path to the file that was double-clicked.
---@param selectedPanel DListView_Line|SpawnIcon The panel that was double-clicked to select this file.This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser:SetModels.
function DFileBrowser:OnDoubleClick(filePath, selectedPanel) end
