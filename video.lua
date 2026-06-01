---@meta

--- The video library.
video = {}

---Attempts to create an [IVideoWriter](https://wiki.facepunch.com/gmod/IVideoWriter).
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/video.Record
---@param config VideoData The video config. See Structures/VideoData.
---@return IVideoWriter # The video object. (returns **false** if there is an error)
---@return string # The error string, if there is an error.
function video.Record(config) end
