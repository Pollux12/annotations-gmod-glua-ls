---Loads next block of data to be read inside current block. Blocks **must** be ended with [IRestore:EndBlock](https://wiki.facepunch.com/gmod/IRestore:EndBlock).
---@realm shared
---@source https://wiki.facepunch.com/gmod/IRestore:StartBlock
---@return string # The name of the next data block to be read.
---@[fresh_result]
function IRestore:StartBlock() end
