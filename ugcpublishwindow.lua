---@meta

--- A window that is used to publish dupes and saves
---@class (partial) UGCPublishWindow : DFrame
local UGCPublishWindow = {}

---Checks if the Tags and Title are valid and if so it enables the publish button.
---@realm menu
---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:CheckInput
function UGCPublishWindow:CheckInput() end

---Displays the given error message.
---@realm menu
---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:DisplayError
---@param err string The error message.
function UGCPublishWindow:DisplayError(err) end

---Publishes the Item or throws an error if the Title or Tags are invalid
---@realm menu
---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:DoPublish
---@param wsid string The workshop id
---@param err string If wsid is nil, this will be the error message
function UGCPublishWindow:DoPublish(wsid, err) end

---Rezises the panel to nicely fit all children
---@realm menu
---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:FitContents
function UGCPublishWindow:FitContents() end

---Returns the name of the current selected tag.
---@realm menu
---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:GetChosenTag
---@return string # The choosen tag, or nil if none is selected.
function UGCPublishWindow:GetChosenTag() end

---Called when the Item was published or if any error occurred while publishing
---@realm menu
---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:OnPublishFinished
---@param wsid string The workshop id
---@param err string If wsid is nil, this will be the error message
function UGCPublishWindow:OnPublishFinished(wsid, err) end

---updated the Workshop items list.
---@realm menu
---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:Setup
---@param ugcType string The type / namespace of the WorkshopFileBase that created this panel
---@param file string The File to publish
---@param imageFile string The Image
---@param handler WorkshopFileBase The WorkshopFileBase that created this panel
function UGCPublishWindow:Setup(ugcType, file, imageFile, handler) end

---updated the Workshop items list.
---@realm menu
---@source https://wiki.facepunch.com/gmod/UGCPublishWindow:UpdateWorkshopItems
function UGCPublishWindow:UpdateWorkshopItems() end
