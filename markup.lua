---@meta

--- The markup library only contains a single function to create a [MarkupObject](https://wiki.facepunch.com/gmod/MarkupObject).
markup = {}

---A convenience function that converts a [Color](https://wiki.facepunch.com/gmod/Color) into its markup ready string representation.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/markup.Color
---@param col Color The Color to convert.
---@return string # The markup color, for example `255,255,255`.
function markup.Color(col) end

---Converts a string to its escaped, markup-safe equivalent.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/markup.Escape
---@param text string The string to sanitize.
---@return string # The parsed markup object ready to be drawn.
function markup.Escape(text) end

---Parses markup into a [MarkupObject](https://wiki.facepunch.com/gmod/MarkupObject). Currently, this only supports fonts and colors as demonstrated in the example.
--- 	**WARNING**: This function is very slow! Always cache its result.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/markup.Parse
---@param markup string The markup to be parsed.
---@param maxWidth? number The max width of the output.
---@return MarkupObject # The parsed markup object ready to be drawn via MarkupObject:Draw.
function markup.Parse(markup, maxWidth) end
