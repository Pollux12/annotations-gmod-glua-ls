---Performs a query on the local SQLite database, returns a table as result set, nil if result is empty and false on error.
--- 	**WARNING**: To run SQL queries with this function safely, it is crucial to ensure that the concatenated variables in the query string are safe to avoid vulnerabilities like SQL injections. For this, it is recommended to use the [sql.SQLStr](https://wiki.facepunch.com/gmod/sql.SQLStr), which allows arguments to be escaped correctly.
---
--- It's best to just use [sql.QueryTyped](https://wiki.facepunch.com/gmod/sql.QueryTyped) instead if possible.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/sql.Query
---@param query string The query to execute.
---@return table|false|nil # `false` is returned if there is an error, `nil` if the query returned no data.
function sql.Query(query) end
