---@meta

---@class DarkRPVarDefinition
---@field nick string
---@field default any
---@field category? string

---@alias DarkRPCategoryKind
---| "jobs"
---| "entities"
---| "shipments"
---| "weapons"
---| "vehicles"
---| "ammo"

---@class DarkRPCategoryDefinition
---@field name string
---@field categorises DarkRPCategoryKind
---@field color Color
---@field startExpanded boolean
---@field canSee? fun(ply: Player): boolean
---@field sortOrder? integer

---@class DarkRP
DarkRP = DarkRP or {}

---@param text string
---@return string
function DarkRP.deLocalise(text) end

---@param lang string
---@param name string
---@param phrase string
function DarkRP.addPhrase(lang, name, phrase) end

---@param name string
---@param tbl table<string, string>
function DarkRP.addLanguage(name, tbl) end

---@param name string
---@param ... any
---@return string?
function DarkRP.getPhrase(name, ...) end

---@param ply Player
---@param name string
---@param ... any
---@return string?
function DarkRP.getPhraseLocalized(ply, name, ...) end
