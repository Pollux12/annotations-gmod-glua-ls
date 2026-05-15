---@meta

--- This is returned from [video.Record](https://wiki.facepunch.com/gmod/video.Record).
---@source https://wiki.facepunch.com/gmod/IVideoWriter
---@class (partial) IVideoWriter
local IVideoWriter = {}

---Adds the current framebuffer to the video stream.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/IVideoWriter:AddFrame
---@param frameTime number Usually set to what Global.FrameTime is, or simply 1/fps.
---@param downsample boolean If true it will downsample the whole screenspace to the videos width and height, otherwise it will just record from the top left corner to the given width and height and therefore not the whole screen.
function IVideoWriter:AddFrame(frameTime, downsample) end

---Ends the video recording and dumps it to disk.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/IVideoWriter:Finish
function IVideoWriter:Finish() end

---Returns the height of the video stream.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/IVideoWriter:Height
---@return number # height
function IVideoWriter:Height() end

---Sets whether to record sound or not.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/IVideoWriter:SetRecordSound
---@param record boolean Record.
function IVideoWriter:SetRecordSound(record) end

---Returns the width of the video stream.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/IVideoWriter:Width
---@return number # width
function IVideoWriter:Width() end
