
---Performs a query on the local SQLite database with proper type handling and parameter binding, returns a table as result set, empty table if no results, and false on error. Unlike [sql.Query](https://wiki.facepunch.com/gmod/sql.Query), this function properly handles SQLite data types and allows safe parameter binding to prevent SQL injection attacks.
--- **WARNING**: * This function only executes a single SQL statement, unlike [sql.Query](https://wiki.facepunch.com/gmod/sql.Query) which can execute multiple statements separated by semicolons.
---
--- * Large INTEGER values (beyond ±9,007,199,254,740,991) are returned as strings to preserve exact values. This is because Lua represents all numbers as doubles, which lose precision for integers larger than 2⁵³-1. Returning them as strings prevents data corruption from rounding errors.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/sql.QueryTyped
---@param query string The query to execute with optional `?` parameter placeholders.
---
---
--- * Always use parameter binding with `?` placeholders instead of string concatenation to prevent SQL injection vulnerabilities.
---@param ... any Parameters to bind to the query placeholders. Supports nil, boolean, number, and string types.
---
--- The number of query parameters must match the number of `?` placeholders, or the query will fail. See examples.
---@return table|false # `false` is returned if there is an error (See sql.LastError), otherwise a table with properly typed column values (empty table if no results).
function sql.QueryTyped(query, ...) end
