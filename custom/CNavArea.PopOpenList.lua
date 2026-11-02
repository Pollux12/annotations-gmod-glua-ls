---Removes a CNavArea from the Open List with the lowest cost to traverse to from the starting node, and returns it.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavArea:PopOpenList
---@return CNavArea # The CNavArea from the Open List with the lowest cost to traverse to from the starting node.
---@[fresh_result]
function CNavArea:PopOpenList() end
