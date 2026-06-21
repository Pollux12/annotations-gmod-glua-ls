---@meta

--- CtrlNumPad is a [VGUI](https://wiki.facepunch.com/gmod/VGUI) element designed primarily for [SpawnMenu](https://wiki.facepunch.com/gmod/SpawnMenu) and [ControlPanel](https://wiki.facepunch.com/gmod/ControlPanel). It is used to create a [DBinder](https://wiki.facepunch.com/gmod/DBinder) with at least one [DLabel](https://wiki.facepunch.com/gmod/DLabel). Each change made by the player in the `CtrlNumPad` acts on a previously defined [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
--- To retrieve the panels associated with this panel:
--- * To retrieve the [DBinder](https://wiki.facepunch.com/gmod/DBinder) created, you can use this variable associated with the panel: `PANEL.NumPad1`
--- * To retrieve the first [DLabel](https://wiki.facepunch.com/gmod/DLabel) created, you can use this variable associated with the panel: `PANEL.Label1`
--- * To retrieve the second [DLabel](https://wiki.facepunch.com/gmod/DLabel) created, you can use this variable associated with the panel: `PANEL.Label2`
---
--- By default, the [DLabel:SetDark](https://wiki.facepunch.com/gmod/DLabel:SetDark) function is activated on both DLabels.
---
--- To retrieve the value of the `CtrlNumPad` you can use these functions : [Player:GetInfoNum](https://wiki.facepunch.com/gmod/Player:GetInfoNum), [CtrlNumPad:GetValue1](https://wiki.facepunch.com/gmod/CtrlNumPad:GetValue1) or [CtrlNumPad:GetValue2](https://wiki.facepunch.com/gmod/CtrlNumPad:GetValue2)
---@class (partial) CtrlNumPad
local CtrlNumPad = {}

---The value (key bind) of the first [DBinder](https://wiki.facepunch.com/gmod/DBinder).
---@realm client
---@source https://wiki.facepunch.com/gmod/CtrlNumPad:GetValue1
---@return KEY # The key bind or `KEY_NONE`.
function CtrlNumPad:GetValue1() end

---The value (key bind) of the second [DBinder](https://wiki.facepunch.com/gmod/DBinder), if it's enabled.
---@realm client
---@source https://wiki.facepunch.com/gmod/CtrlNumPad:GetValue2
---@return KEY # The key bind or `KEY_NONE`.
function CtrlNumPad:GetValue2() end

---The name of the convar that will store the key code for player selected key of the left key binder.
---@realm client
---@source https://wiki.facepunch.com/gmod/CtrlNumPad:SetConVar1
---@param cvar string The convar that will be used in the event of a key change by a player.
function CtrlNumPad:SetConVar1(cvar) end

---If set and label2 is set, the name of the convar that will store the key code for player selected key of the right key binder.
---@realm client
---@source https://wiki.facepunch.com/gmod/CtrlNumPad:SetConVar2
---@param cvar string The convar that will be used in the event of a key change by a player.
function CtrlNumPad:SetConVar2(cvar) end

---The label for the left key binder.
---@realm client
---@source https://wiki.facepunch.com/gmod/CtrlNumPad:SetLabel1
---@param txt string The label for the left key binder.
function CtrlNumPad:SetLabel1(txt) end

---If set and convar2 is set, the label for the right key binder.
---@realm client
---@source https://wiki.facepunch.com/gmod/CtrlNumPad:SetLabel2
---@param txt string The label for the right key binder.
function CtrlNumPad:SetLabel2(txt) end
