---@meta

---@class DHTMLControls : Panel
---@field AddressBar DTextEntry
---@field BackButton DButton
---@field ForwardButton DButton
---@field RefreshButton DButton
---@field StopButton DButton
local DHTMLControls = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTMLControls:FinishedLoading
function DHTMLControls:FinishedLoading() end

---Sets the color of the navigation buttons.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTMLControls:SetButtonColor
---@param clr Color A Color
function DHTMLControls:SetButtonColor(clr) end

---Sets the [DHTML](https://wiki.facepunch.com/gmod/DHTML) element to control with these [DHTMLControls](https://wiki.facepunch.com/gmod/DHTMLControls).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTMLControls:SetHTML
---@param dhtml Panel The HTML panel
function DHTMLControls:SetHTML(dhtml) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTMLControls:StartedLoading
function DHTMLControls:StartedLoading() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Basically adds an URL to the history.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTMLControls:UpdateHistory
---@param url string
function DHTMLControls:UpdateHistory(url) end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTMLControls:UpdateNavButtonStatus
function DHTMLControls:UpdateNavButtonStatus() end
