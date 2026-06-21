---@meta

--- The chat library's purpose is to interface with the default chatbox.
chat = {}

---Adds text to the local player's chat box (which only they can read).
---@realm client
---@source https://wiki.facepunch.com/gmod/chat.AddText
---@param ... any The message to be added to the chat box.
---
--- Arguments can be:
--- * Color - Will set the color for all following strings until the next Color argument.
--- * string - Text to be added to the chat box.
--- * Player - Adds the name of the player in the player's team color to the chat box.
--- * any - Any other type, such as Entity will be converted to string and added as text.
---
--- These argument types can be combined to create formatted messages.
function chat.AddText(...) end

---Closes the chat window.
---@realm client
---@source https://wiki.facepunch.com/gmod/chat.Close
function chat.Close() end

---Returns the chatbox position.
---@realm client
---@source https://wiki.facepunch.com/gmod/chat.GetChatBoxPos
---@return number # The X coordinate of the chatbox's position.
---@return number # The Y coordinate of the chatbox's position.
function chat.GetChatBoxPos() end

---Returns the chatbox size.
---@realm client
---@source https://wiki.facepunch.com/gmod/chat.GetChatBoxSize
---@return number # The width of the chatbox.
---@return number # The height of the chatbox.
function chat.GetChatBoxSize() end

---Opens the chat window.
---@realm client
---@source https://wiki.facepunch.com/gmod/chat.Open
---@param mode number If equals 1, opens public chat, otherwise opens team chat.
function chat.Open(mode) end

---Plays the chat "tick" sound.
---@realm client
---@source https://wiki.facepunch.com/gmod/chat.PlaySound
function chat.PlaySound() end
