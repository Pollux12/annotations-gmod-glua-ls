---@meta

--- The frame blending library.
frame_blend = {}

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Adds a frame to the blend. Calls [frame_blend.CompleteFrame](https://wiki.facepunch.com/gmod/frame_blend.CompleteFrame) once enough frames have passed since last [frame_blend.CompleteFrame](https://wiki.facepunch.com/gmod/frame_blend.CompleteFrame) call.
---@realm client
---@source https://wiki.facepunch.com/gmod/frame_blend.AddFrame
function frame_blend.AddFrame() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Blends the frame(s).
---@realm client
---@source https://wiki.facepunch.com/gmod/frame_blend.BlendFrame
function frame_blend.BlendFrame() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Renders the frame onto internal render target.
---@realm client
---@source https://wiki.facepunch.com/gmod/frame_blend.CompleteFrame
function frame_blend.CompleteFrame() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Actually draws the frame blend effect.
---@realm client
---@source https://wiki.facepunch.com/gmod/frame_blend.DrawPreview
function frame_blend.DrawPreview() end

---Returns whether frame blend post processing effect is enabled or not.
---@realm client
---@source https://wiki.facepunch.com/gmod/frame_blend.IsActive
---@return boolean # Is frame blend enabled or not.
function frame_blend.IsActive() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns whether the current frame is the last frame?
---@realm client
---@source https://wiki.facepunch.com/gmod/frame_blend.IsLastFrame
---@return boolean # Whether the current frame is the last frame?
function frame_blend.IsLastFrame() end

---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns amount of frames needed to render?
---@realm client
---@source https://wiki.facepunch.com/gmod/frame_blend.RenderableFrames
---@return number # Amount of frames needed to render?
function frame_blend.RenderableFrames() end

---Returns whether we should skip frame or not.
---@realm client
---@source https://wiki.facepunch.com/gmod/frame_blend.ShouldSkipFrame
---@return boolean # Should the frame be skipped or not.
function frame_blend.ShouldSkipFrame() end
