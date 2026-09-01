---@meta

--- The language library is used for translation.
language = {}

---Adds a language item. Language placeholders preceded with "#" are replaced with full text in Garry's Mod once registered with this function.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/language.Add
---@param placeholder string The key for this phrase, without the preceding "#".
---@param fulltext string The phrase that should be displayed whenever this key is used.
function language.Add(placeholder, fulltext) end

---A convenience function that formats a localization phrase. See [language.GetPhrase](https://wiki.facepunch.com/gmod/language.GetPhrase).
---
--- This is exactly the same as doing `string.format( langauge.GetPhrase( "string" ), arg1, arg2, etc)`.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/language.FormatPhrase
---@param phrase string The phrase to translate.
---@return string # The formatted, translated phrase, or the input string if no translation was found.
function language.FormatPhrase(phrase) end

---Retrieves the translated version of inputted string. Useful for joining multiple translated strings into one.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/language.GetPhrase
---@param phrase string The phrase to translate.
---
--- If it starts with a `#` symbol, this function automatically skips it, but it is not necessary to include it.
---@return string # The translated phrase, or the input string if no translation was found. There is a limit of 4000 bytes for the returned string.
function language.GetPhrase(phrase) end
