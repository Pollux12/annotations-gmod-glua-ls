---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---Called automatically from [DTree_Node:SetExpanded](https://wiki.facepunch.com/gmod/DTree_Node:SetExpanded) to populate the node with sub-nodes from the filesystem if this was enabled via [DTree_Node:MakeFolder](https://wiki.facepunch.com/gmod/DTree_Node:MakeFolder).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DTree_Node:PopulateChildrenAndSelf
---@param expand? boolean Expand self once population process is finished.
function DTree_Node:PopulateChildrenAndSelf(expand) end
