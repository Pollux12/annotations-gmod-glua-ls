---@meta

--- **NOTE**: For more information on Garry's Mod's web rendering, you can consult the following page: [HTML_Web_Engine](https://wiki.facepunch.com/gmod/HTML_Web_Engine)
---
--- The HTML control can be used to display web pages just like an internet browser.
---
--- [DHTML](https://wiki.facepunch.com/gmod/DHTML) has additional functionality for interfacing with the page, such as sending and receiving data.
---
--- ## Blocked URL Extentions
---
--- This means your url cannot end in any of these extensions, e.g.: (http://yourdomain.com/garry.exe)
--- * .exe
--- * .bat
--- * .dll
--- * .zip
--- * .mp3
--- * .swf
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML
---@class (partial) HTML : Panel
HTML = {}

---Called when the page inside the [HTML](https://wiki.facepunch.com/gmod/HTML) window runs the `console.log` javascript function.
---
--- On the x86-64 beta, it's called for all built-in `console.*` javascript functions.
---
--- Overwriting this function in any way will disable default behavior of printing the message to the in-game console.
---@hook ConsoleMessage
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/HTML:ConsoleMessage
---@param msg string The message to be logged (or Lua code to be executed; see above).
---@param file string The message source file, if any.
---@param lineNr number The line number in the file the message was output from.
---@param severity string The severity of the message. Possible values are:
--- * "log"
--- * "warn"
--- * "error"
--- * "debug"
function HTML:ConsoleMessage(msg, file, lineNr, severity) end

---Called when this panel begins loading a page.
---@hook OnBeginLoadingDocument
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML:OnBeginLoadingDocument
---@param url string The URL of the current page.
function HTML:OnBeginLoadingDocument(url) end

---Called by the engine when a callback function is called.
---@hook OnCallback
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML:OnCallback
---@param library string Library name of the JS function that was called.
---@param name string Name of the JS function that was called.
---@param arguments table Table containing all arguments passed to the JS function.
---@return boolean # Return `true` to suppress default engine action.
function HTML:OnCallback(library, name, arguments) end

---Called when this panel's address changes.
---@hook OnChangeAddressBar
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML:OnChangeAddressBar
---@param url string The URL of the new page.
function HTML:OnChangeAddressBar(url) end

---Called by HTML panels when the target URL of the frame has changed, this happens when you hover over a link.
---@hook OnChangeTargetURL
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML:OnChangeTargetURL
---@param url string New target URL.
function HTML:OnChangeTargetURL(url) end

---Called by HTML panels when the title of the loaded page has been changed.
---@hook OnChangeTitle
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML:OnChangeTitle
---@param newTitle string The new title of the page.
function HTML:OnChangeTitle(newTitle) end

---Called by HTML panels when the page attempts to open a new child view (such as a popup or new tab).
---@hook OnChildViewCreated
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML:OnChildViewCreated
---@param sourceURL string The URL of the page requesting to create a child.
---@param targetURL string The URL of the requested child.
---@param isPopup boolean True if the requested view is a popup.
function HTML:OnChildViewCreated(sourceURL, targetURL, isPopup) end

---Called by HTML panels when the panel's DOM has been set up. You can run JavaScript in here.
---@hook OnDocumentReady
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML:OnDocumentReady
---@param url string The URL of the current page.
function HTML:OnDocumentReady(url) end

---Called when this panel successfully loads a page.
---@hook OnFinishLoadingDocument
---@realm client
---@source https://wiki.facepunch.com/gmod/HTML:OnFinishLoadingDocument
---@param url string The URL of the current page.
function HTML:OnFinishLoadingDocument(url) end
