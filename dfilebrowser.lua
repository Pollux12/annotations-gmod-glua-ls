---@meta

--- A tree and list-based file browser.
---
--- It allows filtering by folder (directory) name and file extension, and can display models as [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon)s.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser
---@class DFileBrowser : Panel
--- The horizontal divider separating the tree and file list.
---@field Divider DHorizontalDivider
--- The directory tree panel.
---@field Tree DTree
--- The root folder node created when the tree is set up.
---@field FolderNode? DTree_Node
--- The file list panel, created on demand as icons in model mode or rows otherwise.
---@field Files? DIconBrowser|DListView
--- The current path search string.
---@field m_strSearch string
--- The base folder path to browse from.
---@field m_strBaseFolder string
--- The current folder path being viewed.
---@field m_strCurrentFolder string
--- The file extension filter string.
---@field m_strFilter string
--- The virtual file path root (e.g. "GAME", "DATA").
---@field m_strPath string
--- The display name of this file browser.
---@field m_strName string
--- Whether to show models instead of files.
---@field m_bModels? boolean
--- Whether the browser is currently expanded/open.
---@field m_bOpen? boolean
local DFileBrowser = {}

---Clears the file tree and list, and resets all values.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:Clear
function DFileBrowser:Clear() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the root directory/folder of the file tree.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetBaseFolder
---@return string # The path to the root folder.
function DFileBrowser:GetBaseFolder() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the current directory/folder being displayed.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetCurrentFolder
---@return string # The directory the file list is currently displaying.
function DFileBrowser:GetCurrentFolder() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the current file type filter on the file list.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetFileTypes
---@return string # The current filter applied to the file list.
function DFileBrowser:GetFileTypes() end

---Returns the [DTree Node](https://wiki.facepunch.com/gmod/DTree_Node) that the file tree stems from.
---
--- This is a child of the root node of the [DTree](https://wiki.facepunch.com/gmod/DTree).
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetFolderNode
---@return DTree_Node # The DTree_Node used for the tree.
function DFileBrowser:GetFolderNode() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns whether or not the model viewer mode is enabled. In this mode, files are displayed as [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon)s instead of a list.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetModels
---@return boolean # Whether or not files will be displayed using SpawnIcons.
function DFileBrowser:GetModels() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the name being used for the file tree.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetName
---@return string # The name used for the root of the file tree.
function DFileBrowser:GetName() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns whether or not the file tree is open.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetOpen
---@return boolean # Whether or not the file tree is open.
function DFileBrowser:GetOpen() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the access path of the file tree. This is `GAME` unless changed with [DFileBrowser:SetPath](https://wiki.facepunch.com/gmod/DFileBrowser:SetPath).
---
--- See [file.Read](https://wiki.facepunch.com/gmod/file.Read) for how paths work.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetPath
---@return string # The current access path i.e. "GAME", "LUA", "DATA" etc.
function DFileBrowser:GetPath() end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the current search filter on the file tree.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:GetSearch
---@return string # The filter in use on the file tree.
function DFileBrowser:GetSearch() end

---Called when a file is double-clicked.
---
--- **NOTE**: Double-clicking a file or icon will trigger **both** this and [DFileBrowser:OnSelect](https://wiki.facepunch.com/gmod/DFileBrowser:OnSelect).
---@hook OnDoubleClick
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:OnDoubleClick
---@param selectedPanel Panel The panel that was double-clicked to select this file.This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser:SetModels.
---@param filePath string The path to the file that was double-clicked.
function DFileBrowser:OnDoubleClick(selectedPanel, filePath) end

---Called when a file is right-clicked.
---
--- **NOTE**: When not in model viewer mode, [DFileBrowser:OnSelect](https://wiki.facepunch.com/gmod/DFileBrowser:OnSelect) will also be called if the file is not already selected.
---@hook OnRightClick
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:OnRightClick
---@param filePath string The path to the file that was right-clicked.
---@param selectedPanel Panel The panel that was right-clicked to select this file.
---
--- This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser:SetModels.
function DFileBrowser:OnRightClick(filePath, selectedPanel) end

---Called when a file is selected.
---@hook OnSelect
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:OnSelect
---@param selectedPanel Panel The panel that was clicked to select this file.This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser:SetModels.
---@param filePath string The path to the file that was selected.
function DFileBrowser:OnSelect(selectedPanel, filePath) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the root directory/folder of the file tree.
---
--- This needs to be set for the file tree to be displayed.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetBaseFolder
---@param baseDir string The path to the folder to use as the root.
function DFileBrowser:SetBaseFolder(baseDir) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the directory/folder from which to display the file list.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetCurrentFolder
---@param currentDir string The directory to display files from.
function DFileBrowser:SetCurrentFolder(currentDir) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the file type filter for the file list.
---
--- This accepts the same file extension wildcards as [file.Find](https://wiki.facepunch.com/gmod/file.Find).
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetFileTypes
---@param fileTypes? string A list of file types to display, separated by spaces e.g.
--- ```
--- "*.lua *.txt *.mdl"
--- ```
function DFileBrowser:SetFileTypes(fileTypes) end

---Enables or disables the model viewer mode. In this mode, files are displayed as [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon)s instead of a list.
---
--- **NOTE**: This should only be used for `.mdl` files; the spawn icons will display error models for others. See [DFileBrowser:SetFileTypes](https://wiki.facepunch.com/gmod/DFileBrowser:SetFileTypes)
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetModels
---@param showModels? boolean Whether or not to display files using SpawnIcons.
function DFileBrowser:SetModels(showModels) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the name to use for the file tree.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetName
---@param treeName? string The name for the root of the file tree. Passing no value causes this to be the base folder name. See DFileBrowser:SetBaseFolder.
function DFileBrowser:SetName(treeName) end

---Opens or closes the file tree.
---
--- The open state is coerced with tobool before it is stored.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetOpen
---@param open any Value to coerce into the open state.
---@param useAnim? boolean If true, the DTree open/close animation is used.
function DFileBrowser:SetOpen(open, useAnim) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the access path for the file tree. This is set to `GAME` by default.
---
--- See [file.Read](https://wiki.facepunch.com/gmod/file.Read) for how paths work.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetPath
---@param path string The access path i.e. "GAME", "LUA", "DATA" etc.
function DFileBrowser:SetPath(path) end

---An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the search filter for the file tree.
---
--- This accepts the same wildcards as [file.Find](https://wiki.facepunch.com/gmod/file.Find).
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetSearch
---@param filter? string The filter to use on the file tree.
function DFileBrowser:SetSearch(filter) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called to set up the [DTree](https://wiki.facepunch.com/gmod/DTree) and file viewer when a base path has been set.
---
--- Calls [DFileBrowser:SetupTree](https://wiki.facepunch.com/gmod/DFileBrowser:SetupTree) and [DFileBrowser:SetupFiles](https://wiki.facepunch.com/gmod/DFileBrowser:SetupFiles).
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:Setup
---@return boolean # Whether or not the variables needed to set up have been defined.
function DFileBrowser:Setup() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called to set up the [DListView](https://wiki.facepunch.com/gmod/DListView) or [DIconBrowser](https://wiki.facepunch.com/gmod/DIconBrowser) by [DFileBrowser:Setup](https://wiki.facepunch.com/gmod/DFileBrowser:Setup).
---
--- The icon browser is used when in models mode. See [DFileBrowser:SetModels](https://wiki.facepunch.com/gmod/DFileBrowser:SetModels).
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetupFiles
---@return boolean # Whether or not the files pane was set up successfully.
function DFileBrowser:SetupFiles() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called to set up the [DTree](https://wiki.facepunch.com/gmod/DTree) by [DFileBrowser:Setup](https://wiki.facepunch.com/gmod/DFileBrowser:Setup).
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SetupTree
---@return boolean # Whether or not the tree was set up successfully.
function DFileBrowser:SetupTree() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Builds the file or icon list for the current directory.
---
--- You should use [DFileBrowser:SetCurrentFolder](https://wiki.facepunch.com/gmod/DFileBrowser:SetCurrentFolder) to change the directory.
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:ShowFolder
---@param currentDir? string The directory to populate the list from.
function DFileBrowser:ShowFolder(currentDir) end

---Sorts the file list.
---
--- **NOTE**: This is only functional when not using the model viewer. See [DFileBrowser:SetModels](https://wiki.facepunch.com/gmod/DFileBrowser:SetModels)
---@realm client
---@source https://wiki.facepunch.com/gmod/DFileBrowser:SortFiles
---@param descending? boolean The sort order. `true` for descending (z-a), `false` for ascending (a-z).
function DFileBrowser:SortFiles(descending) end
