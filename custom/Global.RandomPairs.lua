---Returns an iterator function that can be used to loop through a table in random order
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Global.RandomPairs
---@generic K, V
---@param table table<K, V> | V[] | {[K]: V} # Table to create iterator for
---@param descending? boolean # Whether the iterator should iterate descending or not
---@return fun(state: table): K, V # Iterator function
---@return table # Internal iterator state, not the source table. It must be passed straight through to the generic for loop; capturing only the first return value and iterating over that will error.
function _G.RandomPairs(table, descending) end
