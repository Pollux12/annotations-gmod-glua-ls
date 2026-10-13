---Called by the spawnmenu when the Entities tab is generated
--- 	**WARNING**: Creating an error in this Hook will result in a completely broken Entites Tab
---@hook PopulateEntities
---@realm client
---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateEntities
---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel
---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel
---@param node DTree_Node The old Spawnlists
function SANDBOX:PopulateEntities(pnlContent, tree, node) end
