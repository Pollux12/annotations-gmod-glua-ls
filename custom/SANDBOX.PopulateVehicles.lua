---Called by the spawnmenu when the Vehicles tab is generated
--- 	**WARNING**: Creating an error in this Hook will result in a completely broken vehicles Tab
---@hook PopulateVehicles
---@realm client
---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateVehicles
---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel
---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel
---@param node DTree_Node The old Spawnlists
function SANDBOX:PopulateVehicles(pnlContent, tree, node) end
