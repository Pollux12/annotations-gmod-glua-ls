---Checks if a matching hook function exists in the panel's skin, then calls it.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/derma.SkinHook
---@param type string The type of hook to run, usually `Paint`.
---@param name string The name of the hook or panel to run. Example: `Button`.
---@param panel Panel The panel to call the hook for.
---@param ... any Arguments forwarded to the skin hook.
---@return any # The returned variable from the skin hook.
function derma.SkinHook(type, name, panel, ...) end
