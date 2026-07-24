---@class (partial) SANDBOX : GM
local SANDBOX = {}

---@hook PopulateContent
---@realm client
---@param pnlContent SpawnmenuContentPanel
---@param tree DTree
---@param node DTree_Node
function SANDBOX:PopulateContent(pnlContent, tree, node) end

---@hook PopulateEntities
---@realm client
---@param pnlContent SpawnmenuContentPanel
---@param tree DTree
---@param node DTree_Node
function SANDBOX:PopulateEntities(pnlContent, tree, node) end

---@hook PopulateNPCs
---@realm client
---@param pnlContent SpawnmenuContentPanel
---@param tree DTree
---@param node DTree_Node
function SANDBOX:PopulateNPCs(pnlContent, tree, node) end

---@hook PopulateVehicles
---@realm client
---@param pnlContent SpawnmenuContentPanel
---@param tree DTree
---@param node DTree_Node
function SANDBOX:PopulateVehicles(pnlContent, tree, node) end

---@hook PopulateWeapons
---@realm client
---@param pnlContent SpawnmenuContentPanel
---@param tree DTree
---@param node DTree_Node
function SANDBOX:PopulateWeapons(pnlContent, tree, node) end

---@hook SpawnlistOpenGenericMenu
---@realm client
---@param canvas DDragBase
function SANDBOX:SpawnlistOpenGenericMenu(canvas) end
