---@meta

--- An element providing navigation controls for a [DHTML](https://wiki.facepunch.com/gmod/DHTML) window.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHTMLControls
---@class DHTMLControls : Panel
--- The back navigation button.
---@field BackButton DImageButton
--- The forward navigation button.
---@field ForwardButton DImageButton
--- The refresh/reload button.
---@field RefreshButton DImageButton
--- The home button.
---@field HomeButton DImageButton
--- The stop button.
---@field StopButton DImageButton
--- The address bar text entry.
---@field AddressBar DTextEntry
--- The DHTML panel these controls navigate, assigned by SetHTML.
---@field HTML? DHTML
--- The current navigation history position.
---@field Cur number
--- Whether we are currently navigating via history buttons.
---@field Navigating? boolean
--- The home URL to navigate to.
---@field HomeURL string
---@field History table<integer, string>
---@field BorderSize number
---@field BackgroundColor Color
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
