---Called by the spawnmenu when the Weapons tab is generated
--- 	**WARNING**: Creating an error in this Hook will result in a completely broken Weapons Tab
---@hook PopulateWeapons
---@realm client
---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateWeapons
---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel
---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel
---@param node DTree_Node The old Spawnlists
function SANDBOX:PopulateWeapons(pnlContent, tree, node) end
