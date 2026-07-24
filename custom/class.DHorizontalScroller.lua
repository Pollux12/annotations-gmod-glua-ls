---@class DHorizontalScroller : Panel
---@field Panels Panel[]
---@field OffsetX number
---@field FrameTime number
---@field pnlCanvas DDragBase
---@field btnLeft DButton
---@field btnRight DButton
local DHorizontalScroller = {}

---Returns the internal canvas panel where the content of DHorizontalScroller are placed on.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DHorizontalScroller:GetCanvas
---@return DDragBase
function DHorizontalScroller:GetCanvas()
	return self.pnlCanvas
end
