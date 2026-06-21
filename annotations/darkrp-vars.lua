---@meta

DarkRP = DarkRP or {}

---@alias DarkRPKnownVarName
---| "money"
---| "salary"
---| "rpname"
---| "job"
---| "HasGunlicense"
---| "Arrested"
---| "wanted"
---| "wantedReason"
---| "agenda"
---| "Energy"
---| "AFK"
---| "AFKDemoted"
---| "hasHit"
---| "hitTarget"
---| "hitPrice"
---| "lastHitTime"

---@class DarkRPKnownVarMap
---@field money? number
---@field salary? number
---@field rpname? string
---@field job? string
---@field HasGunlicense? boolean
---@field Arrested? boolean
---@field wanted? boolean
---@field wantedReason? string
---@field agenda? string
---@field Energy? number
---@field AFK? boolean
---@field AFKDemoted? boolean
---@field hasHit? boolean
---@field hitTarget? Player
---@field hitPrice? number
---@field lastHitTime? number
---@field [string] any

---@class PlayerDarkRPVars: DarkRPKnownVarMap
---@field [string] any

---@class Player
---@field DarkRPVars PlayerDarkRPVars

---@generic T
---@alias DarkRPVarWriteFn fun(value: T)

---@generic T
---@alias DarkRPVarReadFn fun(): T

---@generic T
---@param name string
---@param writeFn DarkRPVarWriteFn<T>
---@param readFn DarkRPVarReadFn<T>
function DarkRP.registerDarkRPVar(name, writeFn, readFn) end

---@overload fun(varName: "money", value: number)
---@overload fun(varName: "salary", value: number)
---@overload fun(varName: "rpname", value: string)
---@overload fun(varName: "job", value: string)
---@overload fun(varName: "HasGunlicense", value: boolean)
---@overload fun(varName: "Arrested", value: boolean)
---@overload fun(varName: "wanted", value: boolean)
---@overload fun(varName: "wantedReason", value: string)
---@overload fun(varName: "agenda", value: string)
---@overload fun(varName: "Energy", value: number)
---@overload fun(varName: "AFK", value: boolean)
---@overload fun(varName: "AFKDemoted", value: boolean)
---@overload fun(varName: "hasHit", value: boolean)
---@overload fun(varName: "hitTarget", value: Player)
---@overload fun(varName: "hitPrice", value: number)
---@overload fun(varName: "lastHitTime", value: number)
---@param varName string
---@param value any
function DarkRP.writeNetDarkRPVar(varName, value) end

---@param varName string
function DarkRP.writeNetDarkRPVarRemoval(varName) end

---@return string varName
---@return any value
function DarkRP.readNetDarkRPVar() end

---@return string varName
function DarkRP.readNetDarkRPVarRemoval() end

---@overload fun(self: Player, varName: "money", fallback?: number): number?
---@overload fun(self: Player, varName: "salary", fallback?: number): number?
---@overload fun(self: Player, varName: "rpname", fallback?: string): string?
---@overload fun(self: Player, varName: "job", fallback?: string): string?
---@overload fun(self: Player, varName: "wanted", fallback?: boolean): boolean?
---@overload fun(self: Player, varName: "wantedReason", fallback?: string): string?
---@overload fun(self: Player, varName: "HasGunlicense", fallback?: boolean): boolean?
---@overload fun(self: Player, varName: "Arrested", fallback?: boolean): boolean?
---@overload fun(self: Player, varName: "agenda", fallback?: string): string?
---@overload fun(self: Player, varName: "Energy", fallback?: number): number?
---@overload fun(self: Player, varName: "AFK", fallback?: boolean): boolean?
---@overload fun(self: Player, varName: "AFKDemoted", fallback?: boolean): boolean?
---@overload fun(self: Player, varName: "hasHit", fallback?: boolean): boolean?
---@overload fun(self: Player, varName: "hitTarget", fallback?: Player): Player?
---@overload fun(self: Player, varName: "hitPrice", fallback?: number): number?
---@overload fun(self: Player, varName: "lastHitTime", fallback?: number): number?
---@param varName string
---@param fallback? any
---@return any
function Player:getDarkRPVar(varName, fallback) end

---@overload fun(self: Player, varName: "money", value: number, target?: Player|Player[])
---@overload fun(self: Player, varName: "salary", value: number, target?: Player|Player[])
---@overload fun(self: Player, varName: "rpname", value: string, target?: Player|Player[])
---@overload fun(self: Player, varName: "job", value: string, target?: Player|Player[])
---@overload fun(self: Player, varName: "wanted", value: boolean, target?: Player|Player[])
---@overload fun(self: Player, varName: "wantedReason", value: string, target?: Player|Player[])
---@overload fun(self: Player, varName: "HasGunlicense", value: boolean, target?: Player|Player[])
---@overload fun(self: Player, varName: "Arrested", value: boolean, target?: Player|Player[])
---@overload fun(self: Player, varName: "agenda", value: string, target?: Player|Player[])
---@overload fun(self: Player, varName: "Energy", value: number, target?: Player|Player[])
---@overload fun(self: Player, varName: "AFK", value: boolean, target?: Player|Player[])
---@overload fun(self: Player, varName: "AFKDemoted", value: boolean, target?: Player|Player[])
---@overload fun(self: Player, varName: "hasHit", value: boolean, target?: Player|Player[])
---@overload fun(self: Player, varName: "hitTarget", value: Player, target?: Player|Player[])
---@overload fun(self: Player, varName: "hitPrice", value: number, target?: Player|Player[])
---@overload fun(self: Player, varName: "lastHitTime", value: number, target?: Player|Player[])
---@param varName string
---@param value any
---@param target? Player|Player[]
function Player:setDarkRPVar(varName, value, target) end

---@overload fun(self: Player, varName: "money")
---@overload fun(self: Player, varName: "salary")
---@overload fun(self: Player, varName: "rpname")
---@overload fun(self: Player, varName: "job")
---@overload fun(self: Player, varName: "wanted")
---@overload fun(self: Player, varName: "wantedReason")
---@overload fun(self: Player, varName: "HasGunlicense")
---@overload fun(self: Player, varName: "Arrested")
---@overload fun(self: Player, varName: "agenda")
---@overload fun(self: Player, varName: "Energy")
---@overload fun(self: Player, varName: "AFK")
---@overload fun(self: Player, varName: "AFKDemoted")
---@overload fun(self: Player, varName: "hasHit")
---@overload fun(self: Player, varName: "hitTarget")
---@overload fun(self: Player, varName: "hitPrice")
---@overload fun(self: Player, varName: "lastHitTime")
---@param varName string
---@param target? Player|Player[]
function Player:removeDarkRPVar(varName, target) end

---@overload fun(self: Player, varName: "money", value: number)
---@overload fun(self: Player, varName: "salary", value: number)
---@overload fun(self: Player, varName: "rpname", value: string)
---@overload fun(self: Player, varName: "job", value: string)
---@overload fun(self: Player, varName: "wanted", value: boolean)
---@overload fun(self: Player, varName: "wantedReason", value: string)
---@overload fun(self: Player, varName: "HasGunlicense", value: boolean)
---@overload fun(self: Player, varName: "Arrested", value: boolean)
---@overload fun(self: Player, varName: "agenda", value: string)
---@overload fun(self: Player, varName: "Energy", value: number)
---@overload fun(self: Player, varName: "AFK", value: boolean)
---@overload fun(self: Player, varName: "AFKDemoted", value: boolean)
---@overload fun(self: Player, varName: "hasHit", value: boolean)
---@overload fun(self: Player, varName: "hitTarget", value: Player)
---@overload fun(self: Player, varName: "hitPrice", value: number)
---@overload fun(self: Player, varName: "lastHitTime", value: number)
---@param varName string
---@param value any
function Player:setSelfDarkRPVar(varName, value) end

function Player:sendDarkRPVars() end
