---@meta

DarkRP = DarkRP or {}
GM = GM or {}
GAMEMODE = GAMEMODE or GM
GM.Config = GM.Config or {}
GAMEMODE.Config = GAMEMODE.Config or GM.Config

---@class DarkRPDisabledDefaults
---@field modules table<string, boolean>
---@field jobs table<string, boolean>
---@field shipments table<string, boolean>
---@field entities table<string, boolean>
---@field vehicles table<string, boolean>
---@field food table<string, boolean>
---@field doorgroups table<string, boolean>
---@field ammo table<string, boolean>
---@field agendas table<string, boolean>
---@field groupchat table<integer, boolean>
---@field hitmen table<string, boolean>
---@field demotegroups table<string, boolean>
---@field workarounds table<string, boolean>

---@class GMConfigCategoryOverride
---@field jobs table<string, string>
---@field entities table<string, string>
---@field shipments table<string, string>
---@field weapons table<string, string>
---@field vehicles table<string, string>
---@field ammo table<string, string>

---@class GMConfig
---@field CategoryOverride GMConfigCategoryOverride

---@type DarkRPDisabledDefaults
DarkRP.disabledDefaults = DarkRP.disabledDefaults or {
  modules = {},
  jobs = {},
  shipments = {},
  entities = {},
  vehicles = {},
  food = {},
  doorgroups = {},
  ammo = {},
  agendas = {},
  groupchat = {},
  hitmen = {},
  demotegroups = {},
  workarounds = {},
}

---@type GMConfigCategoryOverride
GM.Config.CategoryOverride = GM.Config.CategoryOverride or {
  jobs = {},
  entities = {},
  shipments = {},
  weapons = {},
  vehicles = {},
  ammo = {},
}

---@type GMConfigCategoryOverride
GAMEMODE.Config.CategoryOverride = GAMEMODE.Config.CategoryOverride or GM.Config.CategoryOverride
