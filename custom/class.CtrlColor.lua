---@class CtrlColor : DPanel
---@field Mixer DColorMixer The embedded color mixer panel.
local CtrlColor = {}

---Sets the label of the embedded color mixer.
---@param text? string Set to non empty string to show the label and its text.
function CtrlColor:SetLabel(text) end

---Sets the ConVar the red channel of the embedded color mixer sets.
---@param convar string The ConVar name for the red channel of the color.
function CtrlColor:SetConVarR(convar) end

---Sets the ConVar the green channel of the embedded color mixer sets.
---@param convar string The ConVar name for the green channel of the color.
function CtrlColor:SetConVarG(convar) end

---Sets the ConVar the blue channel of the embedded color mixer sets.
---@param convar string The ConVar name for the blue channel of the color.
function CtrlColor:SetConVarB(convar) end

---Sets the ConVar the alpha channel of the embedded color mixer sets.
---@param convar string The ConVar name for the alpha channel of the color.
function CtrlColor:SetConVarA(convar) end

---The ConVar the red channel of the embedded color mixer sets.
---@return string # The ConVar name for the red channel of the color.
function CtrlColor:GetConVarR() end

---The ConVar the green channel of the embedded color mixer sets.
---@return string # The ConVar name for the green channel of the color.
function CtrlColor:GetConVarG() end

---The ConVar the blue channel of the embedded color mixer sets.
---@return string # The ConVar name for the blue channel of the color.
function CtrlColor:GetConVarB() end

---The ConVar the alpha channel of the embedded color mixer sets.
---@return string # The ConVar name for the alpha channel of the color.
function CtrlColor:GetConVarA() end
