---Called by the spawnmenu when the content tab is generated
--- 	**WARNING**: Creating an error in this Hook will result in a completely broken Content Tab
---@hook PopulateContent
---@realm client
---@source https://wiki.facepunch.com/gmod/SANDBOX:PopulateContent
---@param pnlContent SpawnmenuContentPanel The SpawnmenuContentPanel
---@param tree DTree The ContentNavBar tree from the SpawnmenuContentPanel
---@param node DTree_Node The old Spawnlists
function SANDBOX:PopulateContent(pnlContent, tree, node) end
