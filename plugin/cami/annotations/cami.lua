---@meta

---@class CAMI
CAMI = CAMI or {}

---@class CAMIPrivilege
---@field Name string
---@field MinAccess string

---@param actor Player
---@param privilege string
---@param callback fun(allowed: boolean, reason: string?)
---@param target? Player
function CAMI.PlayerHasAccess(actor, privilege, callback, target) end

---@param privilege CAMIPrivilege
---@param source string
function CAMI.RegisterPrivilege(privilege, source) end
