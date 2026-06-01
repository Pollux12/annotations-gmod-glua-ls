---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This panel is created whenever you add a node to a [DTree](https://wiki.facepunch.com/gmod/DTree).
--- The root node of a [DTree](https://wiki.facepunch.com/gmod/DTree) is also a [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node) and controls much of its action. it can be accessed with [DTree:Root](https://wiki.facepunch.com/gmod/DTree:Root).
---@class (partial) DTree_Node : DPanel
local DTree_Node = {}

---A helper function that adds a new node and calls to [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder) on it.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:AddFolder
---@param name string The name of the new node
---@param folder string The folder in the filesystem to use, relative to the garrysmod/ folder.
---@param path string The path to search in. See File Search Paths
---@param showFiles? boolean Should files be added as nodes (true) or folders only (false)
---@param wildcard? string The wildcard to use when searching for files.
---@param bDontForceExpandable? boolean
---@return Panel # The created DTree_Node
function DTree_Node:AddFolder(name, folder, path, showFiles, wildcard, bDontForceExpandable) end

---Add a child node to the DTree_Node
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:AddNode
---@param name string Name of the node.
---@param icon? string The icon that will show next to the node in the DTree.
---@return Panel # Returns the created DTree_Node panel.
function DTree_Node:AddNode(name, icon) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Adds the given panel to the child nodes list, a [DListLayout](https://wiki.facepunch.com/gmod/DListLayout).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:AddPanel
---@param pnl Panel The panel to add.
function DTree_Node:AddPanel(pnl) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function that handles the expand/collapse animations.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:AnimSlide
---@param anim table
---@param delta number
---@param data table
function DTree_Node:AnimSlide(anim, delta, data) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called when a child node is expanded or collapsed to propagate this event to parent nodes to update layout.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:ChildExpanded
---@param expanded boolean
function DTree_Node:ChildExpanded(expanded) end

---Cleans up the internal table of items (sub-nodes) of this node from invalid panels or sub-nodes that were moved from this node to another.
---
--- Appears the be completely unused by the game on its own.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:CleanList
function DTree_Node:CleanList() end

---Create and returns a copy of this node, including all the sub-nodes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:Copy
---@return Panel # The copied DTree_Node.
function DTree_Node:Copy() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Creates the container [DListLayout](https://wiki.facepunch.com/gmod/DListLayout) for the [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node)s.
---
--- This is called automatically so you don't have to.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:CreateChildNodes
function DTree_Node:CreateChildNodes() end

---Expands or collapses this node, as well as ALL child nodes of this node.
---
--- Works opposite of [DTree_Node:ExpandTo](https://wiki.facepunch.com/gmod/DTree_Node:ExpandTo).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:ExpandRecurse
---@param expand boolean Whether to expand (true) or collapse (false)
function DTree_Node:ExpandRecurse(expand) end

---Collapses or expands all nodes from the topmost-level node to this one.
---
--- Works opposite of [DTree_Node:ExpandRecurse](https://wiki.facepunch.com/gmod/DTree_Node:ExpandRecurse).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:ExpandTo
---@param expand boolean Whether to expand (true) or collapse (false)
function DTree_Node:ExpandTo(expand) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called automatically from [DTree_Node:PopulateChildrenAndSelf](https://wiki.facepunch.com/gmod/DTree_Node:PopulateChildrenAndSelf) and [DTree_Node:PopulateChildren](https://wiki.facepunch.com/gmod/DTree_Node:PopulateChildren) to populate this node with child nodes of files and folders.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:FilePopulate
---@param bAndChildren boolean Does nothing. Set to true if called from DTree_Node:PopulateChildren.
---@param bExpand boolean Expand self once population process is finished.
function DTree_Node:FilePopulate(bAndChildren, bExpand) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called automatically from [DTree_Node:FilePopulate](https://wiki.facepunch.com/gmod/DTree_Node:FilePopulate) to actually fill the node with sub-nodes based on set preferences like should files be added, etc.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:FilePopulateCallback
---@param files table A list of files in this folder
---@param folders table A list of folder in this folder.
---@param foldername string The folder name/path this node represents
---@param path string The Path ID search was performed with. See File Search Paths
---@param bAndChildren boolean Inherited from the **FilePopulate** call. Does nothing
---@param wildcard string The wildcard that was given
function DTree_Node:FilePopulateCallback(files, folders, foldername, path, bAndChildren, wildcard) end

---Returns n-th child node.
---
--- Basically an alias of [Panel:GetChild](https://wiki.facepunch.com/gmod/Panel:GetChild).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetChildNode
---@param num number The number of the child to get, starting with 0
---@return Panel # The child panel, if valid ID is given
function DTree_Node:GetChildNode(num) end

---Returns the number of child nodes this node has. For use with [DTree_Node:GetChildNode](https://wiki.facepunch.com/gmod/DTree_Node:GetChildNode)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetChildNodeCount
---@return number # Number of child nodes.
function DTree_Node:GetChildNodeCount() end

---Returns a table containing all child nodes of this node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetChildNodes
---@return table # A list of all child nodes.
function DTree_Node:GetChildNodes() end

---Returns value set by [DTree_Node:SetDirty](https://wiki.facepunch.com/gmod/DTree_Node:SetDirty).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetDirty
---@return boolean #
function DTree_Node:GetDirty() end

---Returns whether the double clock to collapse/expand functionality is enabled on this node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetDoubleClickToOpen
---@return boolean #
function DTree_Node:GetDoubleClickToOpen() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns what is set by [DTree_Node:SetDraggableName](https://wiki.facepunch.com/gmod/DTree_Node:SetDraggableName).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetDraggableName
---@return string #
function DTree_Node:GetDraggableName() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns whether or not this node is drawing lines
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetDrawLines
---@return boolean #
function DTree_Node:GetDrawLines() end

---Returns whether the node is expanded or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetExpanded
---@return boolean # Expanded or not.
function DTree_Node:GetExpanded() end

---Returns the filepath of the file attached to this node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetFileName
---@return string #
function DTree_Node:GetFileName() end

---Returns the folder path to search in, set by [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetFolder
---@return string # The folder path.
function DTree_Node:GetFolder() end

---Returns whether the expand/collapse button is shown on this node regardless of whether or not it has sub-nodes.
---
--- See also [DTree_Node:SetForceShowExpander](https://wiki.facepunch.com/gmod/DTree_Node:SetForceShowExpander).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetForceShowExpander
---@return boolean #
function DTree_Node:GetForceShowExpander() end

---Returns whether the expand button (little + button) should be shown or hidden.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetHideExpander
---@return boolean # Цhether the expand button should be shown or hidden.
function DTree_Node:GetHideExpander() end

---Returns the image path to the icon of this node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetIcon
---@return string # The path to the image
function DTree_Node:GetIcon() end

---Returns the indentation level of the [DTree](https://wiki.facepunch.com/gmod/DTree) this node belongs to.
---
--- Alias of [DTree:GetIndentSize](https://wiki.facepunch.com/gmod/DTree:GetIndentSize), see it for more info.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetIndentSize
---@return number # The indentation level.
function DTree_Node:GetIndentSize() end

---Returns whether this node is the last child on this level or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetLastChild
---@return boolean # Whether this node is the last child on this level or not.
function DTree_Node:GetLastChild() end

---The height of a single [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node) of the [DTree](https://wiki.facepunch.com/gmod/DTree) this node belongs to.
---
--- Alias of [DTree:GetLineHeight](https://wiki.facepunch.com/gmod/DTree:GetLineHeight).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetLineHeight
---@return number # The height of a single DTree_Node.
function DTree_Node:GetLineHeight() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Returns whether the node still needs a filesystem search for sub-nodes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetNeedsChildSearch
---@return boolean # Whether the node still needs a filesystem search.
---@deprecated Seems to be unused entirely.
function DTree_Node:GetNeedsChildSearch() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns whether or not the node is set to be populated from the filesystem.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetNeedsPopulating
---@return boolean #
function DTree_Node:GetNeedsPopulating() end

---Returns the parent [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node). Note that [Panel:GetParent](https://wiki.facepunch.com/gmod/Panel:GetParent) will not be the same!
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetParentNode
---@return Panel # The parent node.
function DTree_Node:GetParentNode() end

---Returns the path ID ([File Search Paths](https://wiki.facepunch.com/gmod/File_Search_Paths)) used in populating the [DTree](https://wiki.facepunch.com/gmod/DTree) from the filesystem.
---
--- See [DTree_Node:SetPathID](https://wiki.facepunch.com/gmod/DTree_Node:SetPathID) and [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetPathID
---@return string # The Path ID
function DTree_Node:GetPathID() end

---Returns the root node, the [DTree](https://wiki.facepunch.com/gmod/DTree) this node is under.
---
--- See also [DTree_Node:GetParentNode](https://wiki.facepunch.com/gmod/DTree_Node:GetParentNode).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetRoot
---@return Panel # The root node
function DTree_Node:GetRoot() end

---Returns whether or not nodes for files should/will be added when populating the node from filesystem.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetShowFiles
---@return boolean #
function DTree_Node:GetShowFiles() end

---Returns the wildcard set by [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:GetWildCard
---@return string # The search wildcard
function DTree_Node:GetWildCard() end

---Inserts a sub-node into this node before or after the given node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:Insert
---@param node Panel The DTree_Node to insert.
---@param nodeNextTo Panel The node to insert the node above before or after.
---@param before boolean true to insert before, false to insert after.
function DTree_Node:Insert(node, nodeNextTo, before) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Inserts an existing node as a "child" or a sub-node of this node.
--- Used internally by the drag'n'drop functionality.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:InsertNode
---@param node Panel Has to be DTree_Node
function DTree_Node:InsertNode(node) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called automatically internally.
---
--- Makes the target node compatible with this node's drag'n'drop.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:InstallDraggable
---@param node Panel The DTree_Node.
function DTree_Node:InstallDraggable(node) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- See [DTree_Node:DoClick](https://wiki.facepunch.com/gmod/DTree_Node:DoClick)
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:InternalDoClick
function DTree_Node:InternalDoClick() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- See [DTree_Node:DoRightClick](https://wiki.facepunch.com/gmod/DTree_Node:DoRightClick).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:InternalDoRightClick
function DTree_Node:InternalDoRightClick() end

---Returns true if [DTree_Node:GetRoot](https://wiki.facepunch.com/gmod/DTree_Node:GetRoot) is the same as [DTree_Node:GetParentNode](https://wiki.facepunch.com/gmod/DTree_Node:GetParentNode) of this node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:IsRootNode
---@return boolean # If this is a root node.
function DTree_Node:IsRootNode() end

---Removes given node as a sub-node of this node.
---
--- It doesn't actually remove or unparent the panel, just removes it from the internal [DListView](https://wiki.facepunch.com/gmod/DListView).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:LeaveTree
---@param pnl Panel The node to remove
function DTree_Node:LeaveTree(pnl) end

---Makes this node a folder in the filesystem. This will make it automatically populated.
---
--- See also [DTree_Node:AddFolder](https://wiki.facepunch.com/gmod/DTree_Node:AddFolder).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder
---@param folder string The folder in the filesystem to use, relative to the garrysmod/ folder.
---@param path string The path to search in. See File Search Paths
---@param showFiles? boolean Should files be added as nodes (true) or folders only (false)
---@param wildcard? string The wildcard to use when searching for files.
---@param dontForceExpandable? boolean If set to true, don't show the expand buttons on empty nodes.
function DTree_Node:MakeFolder(folder, path, showFiles, wildcard, dontForceExpandable) end

---Moves given panel to the top of the children of this node.
---
--- Despite name of this function, it cannot move the children to any position but the topmost.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:MoveChildTo
---@param node Panel The node to move.
function DTree_Node:MoveChildTo(node) end

---Moves this node to the top of the level.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:MoveToTop
function DTree_Node:MoveToTop() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called automatically to perform layout on this node if this node [DTree_Node:IsRootNode](https://wiki.facepunch.com/gmod/DTree_Node:IsRootNode).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:PerformRootNodeLayout
function DTree_Node:PerformRootNodeLayout() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called automatically from [DTree_Node:PopulateChildrenAndSelf](https://wiki.facepunch.com/gmod/DTree_Node:PopulateChildrenAndSelf).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:PopulateChildren
function DTree_Node:PopulateChildren() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called automatically from [DTree_Node:SetExpanded](https://wiki.facepunch.com/gmod/DTree_Node:SetExpanded) (or when user manually expands the node) to populate the node with sub-nodes from the filesystem if this was enabled via [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:PopulateChildrenAndSelf
---@param expand boolean Expand self once population process is finished.
function DTree_Node:PopulateChildrenAndSelf(expand) end

---Appears to have no effect on the [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetDirty
---@param dirty boolean
function DTree_Node:SetDirty(dirty) end

---Sets whether double clicking the node should expand/collapse it or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetDoubleClickToOpen
---@param enable boolean true to enable, false to disable this functionality.
function DTree_Node:SetDoubleClickToOpen(enable) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used to store name for sub elements for a [Panel:Droppable](https://wiki.facepunch.com/gmod/Panel:Droppable) call.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetDraggableName
---@param name string
function DTree_Node:SetDraggableName(name) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether or not this node should draw visual lines.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetDrawLines
---@param draw boolean
function DTree_Node:SetDrawLines(draw) end

---Expands or collapses this node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetExpanded
---@param expand boolean Whether to expand (true) or collapse (false)
---@param surpressAnimation? boolean Whether to play animation (false) or not (true)
function DTree_Node:SetExpanded(expand, surpressAnimation) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the file full filepath to the file attached to this node
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetFileName
---@param filename string
function DTree_Node:SetFileName(filename) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the folder to search files and folders in.
---
--- Use [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder) instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetFolder
---@param folder string
function DTree_Node:SetFolder(folder) end

---Sets whether or not the expand/collapse button (+/- button) should be shown on this node regardless of whether it has sub-elements or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetForceShowExpander
---@param forceShow boolean
function DTree_Node:SetForceShowExpander(forceShow) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether the expand button (little + button) should be shown or hidden.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetHideExpander
---@param hide boolean
function DTree_Node:SetHideExpander(hide) end

---Sets the material for the icon of the [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetIcon
---@param path string The path to the material to be used. Do not include "materials/". .pngs are supported.
function DTree_Node:SetIcon(path) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called automatically to set whether this node is the last child on this level or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetLastChild
---@param last boolean
function DTree_Node:SetLastChild(last) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether the node still needs a filesystem search for sub-nodes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetNeedsChildSearch
---@param newState boolean New state.
---@deprecated Seems to be unused entirely.
function DTree_Node:SetNeedsChildSearch(newState) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether or not the node needs populating from the filesystem.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetNeedsPopulating
---@param needs boolean Whether or not the node needs populating
function DTree_Node:SetNeedsPopulating(needs) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the parent node of this node. Not the same as [Panel:SetParent](https://wiki.facepunch.com/gmod/Panel:SetParent).
---
--- This is set automatically, you shouldn't use this.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetParentNode
---@param parent Panel The panel to set as a parent node for this node
function DTree_Node:SetParentNode(parent) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the path ID ([File Search Paths](https://wiki.facepunch.com/gmod/File_Search_Paths)) for populating the tree from the filesystem.
---
--- Use [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder) instead.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetPathID
---@param path string The path ID to set.
function DTree_Node:SetPathID(path) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the root node (the [DTree](https://wiki.facepunch.com/gmod/DTree)) of this node.
---
--- This is set automatically, you shouldn't use this.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetRoot
---@param root Panel The panel to set as root node.
function DTree_Node:SetRoot(root) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called automatically to update the "selected" status of this node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetSelected
---@param selected boolean Whether this node is currently selected or not.
function DTree_Node:SetSelected(selected) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether or not nodes for files should be added when populating the node from filesystem.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetShowFiles
---@param showFiles boolean
function DTree_Node:SetShowFiles(showFiles) end

---Currently does nothing, not implemented.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetupCopy
function DTree_Node:SetupCopy() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the search wildcard.
---
--- Use [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder) instead
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:SetWildCard
---@param wildcard string The wildcard to set
function DTree_Node:SetWildCard(wildcard) end

---Returns whether or not the [DTree](https://wiki.facepunch.com/gmod/DTree) this node is in has icons enabled.
---
--- See [DTree:ShowIcons](https://wiki.facepunch.com/gmod/DTree:ShowIcons) for more info.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:ShowIcons
---@return number # Whether the icons are shown or not
function DTree_Node:ShowIcons() end
