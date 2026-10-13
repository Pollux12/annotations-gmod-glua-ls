---Called when a file is selected.
---@hook OnSelect
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:OnSelect
---@param filePath string The path to the file that was selected.
---@param selectedPanel DListView_Line|SpawnIcon The panel that was clicked to select this file.This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser:SetModels.
function DFileBrowser:OnSelect(filePath, selectedPanel) end
