--- A tab oriented control where you can create multiple tabs with items within. Used mainly for organization.
---@class DPropertySheet : Panel
---@field tabScroller DHorizontalScroller The internal horizontal scroller that manages tab positioning.
---@field animFade DermaAnimation The fade animation used when switching tabs, created in Init via Derma_Anim.
---@field Items DPropertySheetSheet[] The list of tabs added to this sheet.
local DPropertySheet = {}
