---Gets the value of a cookie stored by the panel object.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Panel:GetCookie
---@param cookieName string The name of the cookie from which to retrieve the value.
---@param default? string The default value to return if the cookie does not exist.
---@return string|nil # The value of the stored cookie, the default value, or nil if neither exists.
function Panel:GetCookie(cookieName, default) end

