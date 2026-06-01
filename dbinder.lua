---@meta

--- Input which can bind a command to a key. Used for binding inputs and outputs of TOOLs.
---@class (partial) DBinder : DButton
local DBinder = {}

---Gets the code of the key currently bound by the DBinder. Same as [DBinder:GetValue](https://wiki.facepunch.com/gmod/DBinder:GetValue). An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@realm client
---@source https://wiki.facepunch.com/gmod/DBinder:GetSelectedNumber
---@return number # The key code of the bound key. See Enums/KEY.
function DBinder:GetSelectedNumber() end

---Gets the code of the key currently bound by the DBinder. Same as [DBinder:GetSelectedNumber](https://wiki.facepunch.com/gmod/DBinder:GetSelectedNumber).
---@realm client
---@source https://wiki.facepunch.com/gmod/DBinder:GetValue
---@return number # The key code of the bound key. See Enums/KEY.
function DBinder:GetValue() end

---Sets the current key bound by the [DBinder](https://wiki.facepunch.com/gmod/DBinder), and updates the button's text as well as the [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---@realm client
---@source https://wiki.facepunch.com/gmod/DBinder:SetSelectedNumber
---@param keyCode number The key code of the key to bind. See Enums/KEY.
function DBinder:SetSelectedNumber(keyCode) end

---Alias of [DBinder:SetSelectedNumber](https://wiki.facepunch.com/gmod/DBinder:SetSelectedNumber).
---@realm client
---@source https://wiki.facepunch.com/gmod/DBinder:SetValue
---@param keyCode number The key code of the key to bind. See Enums/KEY.
function DBinder:SetValue(keyCode) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used to set the text of the DBinder to the current key binding, or `NONE`.
---@realm client
---@source https://wiki.facepunch.com/gmod/DBinder:UpdateText
function DBinder:UpdateText() end
