---Called by the spawnmenu when the NPCs tab is generated
--- 	**WARNING**: Creating an error in this Hook will result in a completely broken NPCs Tab
---@hook PopulateNPCs
---@realm client
---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateNPCs
---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel
---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel
---@param node DTree_Node The old Spawnlists
function SANDBOX:PopulateNPCs(pnlContent, tree, node) end
