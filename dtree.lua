---@meta

--- A tree view element for Derma.
---
--- See also [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree
---@class DTree : DScrollPanel
---@field RootNode DTree_Node
---@field m_pSelectedItem? DTree_Node
local DTree = {}

---Adds a node to the tree.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:AddNode
---@param name string Name of the node.
---@param icon? string The icon shown next to the node.
---@return DTree_Node # The created node.
function DTree:AddNode(name, icon) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Calls directly to [Panel:InvalidateLayout](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout).
--- Called by [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node)s when a sub element has been expanded or collapsed.
---
--- Used as a placeholder function alongside [DTree:ExpandTo](https://wiki.facepunch.com/gmod/DTree:ExpandTo), [DTree:SetExpanded](https://wiki.facepunch.com/gmod/DTree:SetExpanded) and [DTree:MoveChildTo](https://wiki.facepunch.com/gmod/DTree:MoveChildTo).
---
--- The [DTree](https://wiki.facepunch.com/gmod/DTree) acts a root node and methods with the same name in [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node) call to the parent.
---@hook ChildExpanded
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:ChildExpanded
---@param bExpand boolean
function DTree:ChildExpanded(bExpand) end

---@realm client
---@realm menu
---@source garrysmod/lua/vgui/dtree.lua
---@param node DTree_Node The node that was clicked.
---@return boolean # Return true to handle the click.
function DTree:DoClick(node) end

---Called when the any node is right clicked. Called by [DTree_Node:DoRightClick](https://wiki.facepunch.com/gmod/DTree_Node:DoRightClick).
---@hook DoRightClick
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:DoRightClick
---@param node DTree_Node The right clicked node.
---@return boolean #
function DTree:DoRightClick(node) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Does nothing. Used as a placeholder empty function alongside [DTree:MoveChildTo](https://wiki.facepunch.com/gmod/DTree:MoveChildTo), [DTree:SetExpanded](https://wiki.facepunch.com/gmod/DTree:SetExpanded) and [DTree:ChildExpanded](https://wiki.facepunch.com/gmod/DTree:ChildExpanded).
---
--- The [DTree](https://wiki.facepunch.com/gmod/DTree) acts a root node and methods with the same name in [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node) call to the parent.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:ExpandTo
---@param bExpand boolean
function DTree:ExpandTo(bExpand) end

---Returns the status of [DTree:SetClickOnDragHover](https://wiki.facepunch.com/gmod/DTree:SetClickOnDragHover). See that for more info.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:GetClickOnDragHover
---@return boolean #
function DTree:GetClickOnDragHover() end

---Returns the indentation size of the [DTree](https://wiki.facepunch.com/gmod/DTree), the distance between each "level" of the tree is offset on the left from the previous level.
---
--- Currently this feature has no effect on the [DTree](https://wiki.facepunch.com/gmod/DTree) element.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:GetIndentSize
---@return number # The indentation size.
function DTree:GetIndentSize() end

---Returns the height of each [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node) in the tree.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:GetLineHeight
---@return number # The height of each DTree_Node in the tree.
function DTree:GetLineHeight() end

---Returns the currently selected node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:GetSelectedItem
---@return Panel # Curently selected DTree_Node.
function DTree:GetSelectedItem() end

---Returns whether or not the [Silkicons](https://wiki.facepunch.com/gmod/Silkicons) next to each node of the DTree will be displayed.
---
--- Individual icons can be set with [DTree_Node:SetIcon](https://wiki.facepunch.com/gmod/DTree_Node:SetIcon) or passed as the second argument in [DTree:AddNode](https://wiki.facepunch.com/gmod/DTree:AddNode).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:GetShowIcons
---@return boolean # Whether or not the silkicons next to each node will be displayed.
function DTree:GetShowIcons() end

---Does nothing.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:LayoutTree
function DTree:LayoutTree() end

---Moves given node to the top of [DTree](https://wiki.facepunch.com/gmod/DTree)s children. (Makes it the topmost mode)
---
--- Used as a placeholder function alongside [DTree:ExpandTo](https://wiki.facepunch.com/gmod/DTree:ExpandTo), [DTree:SetExpanded](https://wiki.facepunch.com/gmod/DTree:SetExpanded) and [DTree:ChildExpanded](https://wiki.facepunch.com/gmod/DTree:ChildExpanded).
---
--- The [DTree](https://wiki.facepunch.com/gmod/DTree) acts a root node and methods with the same name in [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node) call to the parent.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:MoveChildTo
---@param child Panel The node to move
---@param pos number Unused, does nothing.
function DTree:MoveChildTo(child, pos) end

---This function is called when a node within a tree is selected.
---
---@hook OnNodeSelected
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:OnNodeSelected
---@param node DTree_Node The node that was selected.
function DTree:OnNodeSelected(node) end

---Returns the root node for this tree.
---@realm client
---@realm menu
---@return DTree_Node # The root tree node.
function DTree:Root() end

---Enables the "click when drag-hovering" functionality.
---
--- If enabled, when hovering over any [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node) of this [DTree](https://wiki.facepunch.com/gmod/DTree) while dragging a panel, the node will be automatically clicked on (and subsequently [DTree:OnNodeSelected](https://wiki.facepunch.com/gmod/DTree:OnNodeSelected) will be called) to open any attached panels, such as spawnlists in spawnmenu.
---
--- See also: [PANEL:DragHoverClick](https://wiki.facepunch.com/gmod/PANEL:DragHoverClick).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:SetClickOnDragHover
---@param enable boolean
function DTree:SetClickOnDragHover(enable) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Does nothing. Is not called by the [DTree](https://wiki.facepunch.com/gmod/DTree) itself.
---
--- Used as a placeholder empty function alongside [DTree:ExpandTo](https://wiki.facepunch.com/gmod/DTree:ExpandTo), [DTree:MoveChildTo](https://wiki.facepunch.com/gmod/DTree:MoveChildTo) and [DTree:ChildExpanded](https://wiki.facepunch.com/gmod/DTree:ChildExpanded) to prevent errors when [DTree_Node:SetExpanded](https://wiki.facepunch.com/gmod/DTree_Node:SetExpanded) is incorrectly used on a [DTree](https://wiki.facepunch.com/gmod/DTree).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:SetExpanded
---@param bExpand boolean
function DTree:SetExpanded(bExpand) end

---Sets the indentation size of the [DTree](https://wiki.facepunch.com/gmod/DTree), the distance between each "level" of the tree is offset on the left from the previous level.
---
--- Currently this feature has no effect on the [DTree](https://wiki.facepunch.com/gmod/DTree) element.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:SetIndentSize
---@param size number The new indentation size.
function DTree:SetIndentSize(size) end

---Sets the height of each [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node) in the tree.
---
--- The default value is 17.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:SetLineHeight
---@param h number The height to set.
function DTree:SetLineHeight(h) end

---Set the currently selected top-level node.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:SetSelectedItem
---@param node Panel DTree_Node to select.
function DTree:SetSelectedItem(node) end

---Sets whether or not the [Silkicons](https://wiki.facepunch.com/gmod/Silkicons) next to each node of the DTree will be displayed.
---
--- Individual icons can be set with [DTree_Node:SetIcon](https://wiki.facepunch.com/gmod/DTree_Node:SetIcon) or passed as the second argument in [DTree:AddNode](https://wiki.facepunch.com/gmod/DTree:AddNode).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:SetShowIcons
---@param show boolean Whether or not to show icons.
function DTree:SetShowIcons(show) end

---Returns whether or not the [Silkicons](https://wiki.facepunch.com/gmod/Silkicons) next to each node of the DTree will be displayed.
---
--- Alias of [DTree:GetShowIcons](https://wiki.facepunch.com/gmod/DTree:GetShowIcons).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree:ShowIcons
---@return boolean # Whether or not the silkicons next to each node will be displayed.
function DTree:ShowIcons() end

---@realm client
---@realm menu
---@source garrysmod/lua/vgui/dtree.lua
---@param node DTree_Node The node that was right-clicked.
---@return boolean # Return true to handle the right-click.
function DTree:DoRightClick(node) end
