---@meta

--- A progressbar, works with a fraction between 0 and 1 where 0 is 0% and 1 is 100%.
---@class (partial) DProgress : Panel
local DProgress = {}

---Returns the progress bar's fraction. 0 is 0% and 1 is 100%.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DProgress:GetFraction
---@return number # Current fraction of the progress bar.
function DProgress:GetFraction() end

---Sets the fraction of the progress bar. 0 is 0% and 1 is 100%.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/DProgress:SetFraction
---@param fraction number Fraction of the progress bar. Range is 0 to 1 (0% to 100%).
function DProgress:SetFraction(fraction) end
