---@class ContentSidebar : DPanel
---@field Tree DTree The tree panel listing spawnlist categories and nodes.
---@field Search? Panel The search panel, present after EnableSearch() is called.
---@field Toolbox? ContentSidebarToolbox The toolbox drawer, present after EnableModify() is called.
local ContentSidebar = {}

---Enables search functionality on this sidebar.
---@param stype? string The search type identifier passed to the search panel.
---@param hookname? string The hook name to populate content. Defaults to "PopulateContent".
function ContentSidebar:EnableSearch(stype, hookname) end

---Creates and attaches the save/revert notification bar.
function ContentSidebar:CreateSaveNotification() end

---Enables full modify mode: calls EnableSearch(), CreateSaveNotification(), and adds the toolbox drawer.
function ContentSidebar:EnableModify() end
