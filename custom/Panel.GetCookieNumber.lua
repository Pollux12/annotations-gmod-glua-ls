---Gets the value of a cookie stored by the panel object, as a number.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Panel:GetCookieNumber
---@param cookieName string The name of the cookie from which to retrieve the value.
---@param default? number The default value to return if the cookie does not exist.
---@return number|nil # The numeric cookie value, the default value, or nil if neither exists.
function Panel:GetCookieNumber(cookieName, default) end

