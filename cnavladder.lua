---@meta

--- An object that represents a ladder for Nextbots.
---@source https://wiki.facepunch.com/gmod/CNavLadder
---@class (partial) CNavLadder
local CNavLadder = {}

---Connects this ladder to a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) with a one way connection. ( From this ladder to the target area ).
---
--- See [CNavArea:ConnectTo](https://wiki.facepunch.com/gmod/CNavArea:ConnectTo) for making the connection from area to ladder.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:ConnectTo
---@param area CNavArea The area this ladder leads to.
function CNavLadder:ConnectTo(area) end

---Disconnects this ladder from given area in a single direction.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:Disconnect
---@param area CNavArea The CNavArea this to disconnect from.
function CNavLadder:Disconnect(area) end

---Returns the bottom most position of the ladder.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetBottom
---@return Vector # The bottom most position of the ladder.
function CNavLadder:GetBottom() end

---Returns the bottom area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetBottomArea
---@return CNavArea #
function CNavLadder:GetBottomArea() end

---Returns this [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder)s unique ID.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetID
---@return number # The unique ID.
function CNavLadder:GetID() end

---Returns the length of the ladder.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetLength
---@return number # The length of the ladder.
function CNavLadder:GetLength() end

---Returns the direction of this [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder). ( The direction in which players back will be facing if they are looking directly at the ladder )
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetNormal
---@return Vector # The direction of this CNavLadder.
function CNavLadder:GetNormal() end

---Returns the world position based on given height relative to the ladder.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetPosAtHeight
---@param height number The Z position in world space coordinates.
---@return Vector # The closest point on the ladder to that height.
function CNavLadder:GetPosAtHeight(height) end

---Returns the topmost position of the ladder.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetTop
---@return Vector # The topmost position of the ladder.
function CNavLadder:GetTop() end

---Returns the top behind [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetTopBehindArea
---@return CNavArea # The top behind CNavArea of the CNavLadder.
function CNavLadder:GetTopBehindArea() end

---Returns the top forward [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetTopForwardArea
---@return CNavArea # The top forward CNavArea of the CNavLadder.
function CNavLadder:GetTopForwardArea() end

---Returns the top left [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetTopLeftArea
---@return CNavArea # The top left CNavArea of the CNavLadder.
function CNavLadder:GetTopLeftArea() end

---Returns the top right [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetTopRightArea
---@return CNavArea # The top right CNavArea of the CNavLadder.
function CNavLadder:GetTopRightArea() end

---Returns the width of the ladder in Hammer Units.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:GetWidth
---@return number # The width of the ladder in Hammer Units.
function CNavLadder:GetWidth() end

---Returns whether this [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder) has an outgoing ( one or two way ) connection **to** given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) in given direction.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:IsConnectedAtSide
---@param navArea CNavArea The CNavArea to test against.
---@param navDirType number The direction, in which to look for the connection. See Enums/NavDir
---@return boolean # Whether this CNavLadder has an outgoing ( one or two way ) connection **to** given CNavArea in given direction.
function CNavLadder:IsConnectedAtSide(navArea, navDirType) end

---Returns whether this [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder) is valid or not.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:IsValid
---@return boolean # Whether this CNavLadder is valid or not.
function CNavLadder:IsValid() end

---Removes the given nav ladder.
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:Remove
function CNavLadder:Remove() end

---Sets the bottom area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:SetBottomArea
---@param area CNavArea
function CNavLadder:SetBottomArea(area) end

---Sets the top behind area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:SetTopBehindArea
---@param area CNavArea
function CNavLadder:SetTopBehindArea(area) end

---Sets the top forward area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:SetTopForwardArea
---@param area CNavArea
function CNavLadder:SetTopForwardArea(area) end

---Sets the top left area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:SetTopLeftArea
---@param area CNavArea
function CNavLadder:SetTopLeftArea(area) end

---Sets the top right area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---@realm server
---@source https://wiki.facepunch.com/gmod/CNavLadder:SetTopRightArea
---@param area CNavArea
function CNavLadder:SetTopRightArea(area) end
