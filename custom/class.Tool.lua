---
--- The **TOOL** table is used in Sandbox tool creation. You can find a list of callbacks on the  page and a list of methods on the  page. Do note that some of the fields below have no effect on server-side operations.
---
--- The tool information box drawn on the HUD while your tool is selected has 2 values that are set by [language.Add](https://wiki.facepunch.com/gmod/language.Add).
--- * `tool.[tool mode].name` - The tool name (Note this is NOT the same as TOOL.Name)
--- * `tool.[tool mode].desc` - The tool description
---
--- Ensure that all tool file names are entirely lowercase.  Including capital letters can lead to unintended behavior.

--- One slot in the tool's object array (set via Tool:SetObject).
---@class ToolObjectSlot
---@field Ent Entity The entity stored in this slot.
---@field Phys PhysObj|nil The physics object for this slot (nil for world entity).
---@field Bone number The physics bone index.
---@field Pos Vector The local-space hit position (world-space for world entity).
---@field Normal Vector The local-space hit normal (world-space for world entity).

--- The Objects array on a tool. Named class with a non-nil index operator so that
--- direct `self.Objects[i]` accesses inside tool methods (GetPos, GetEnt, SetObject, etc.)
--- do not generate spurious unchecked-nil-access diagnostics.
--- Callers must guarantee the index is valid before calling any getter.
---@class ToolObjects
---@operator index(integer): ToolObjectSlot

---@class Tool
---@field Mode string The tool mode string (e.g. "weld", "balloon").
---@field SWEP Weapon The weapon entity this tool belongs to.
---@field Weapon Weapon Alias for SWEP; the weapon entity this tool belongs to.
---@field Owner Player The player who owns this tool.
---@field Objects ToolObjects Array of stored constraint objects indexed 1-based.
---@field Stage number The current stage of the tool.
---@field Message string The current message/hint string.
---@field LastMessage number CurTime of the last displayed message.
---@field AllowedCVar ConVar ConVar controlling whether this tool is allowed (toolmode_allow_<mode>).
---@field ClientConVar table<string, string> Default client convar name → value pairs.
---@field ServerConVar table<string, string> Default server convar name → value pairs.
---@field ClientConVars table<string, ConVar> Instantiated client ConVar objects keyed by name.
---@field ServerConVars table<string, ConVar> Instantiated server ConVar objects keyed by name.
---@field GhostEntity Entity|nil The current ghost entity, or nil if none.
---@field GhostEntities table<any, Entity>? Legacy ghost entity table (unused in base code).
---@field GhostOffset table? Legacy ghost offset table (unused in base code).
---@field BuildCPanel fun(panel: ControlPanel) Called to populate the tool's control panel. Override to add your controls.
---@field Information (string | {name: string, stage: number?, op: number?, icon: string?, icon2: string?})[]? Array of stage-information descriptors. Each element is either a plain string key or a table descriptor with optional stage/op/icon fields.
---@field AddToMenu? boolean Whether to add this tool to the spawn menu tool list. Default true.
---@field Category? string The tool category in the spawn menu (e.g. "Construction"). Default "New Category".
---@field Tab? string The spawn menu tab to place the tool in. Default "Main".
---@field Name? string Display name of the tool shown in the spawn menu.
---@field Command? string The console command to switch to this tool. Default "gmod_tool <mode>".
---@field ConfigName? string The name used for convar config storage. Default is the tool mode.
---@field LeftClickAutomatic? boolean If true, LeftClick fires continuously while held.
---@field RightClickAutomatic? boolean If true, RightClick fires continuously while held.
---@field RequiresTraceHit? boolean If true, tool only fires when the trace hits something.
---@field Init? fun(self: Tool) Called on tool initialization after Create().
Tool = Tool or {}

---Returns the Tool Gun (`gmod_tool`) Scripted Weapon. Never nil at runtime after Init.
---@return Weapon # The tool gun weapon. (`gmod_tool`)
function Tool:GetWeapon() end

---Initializes a ghost entity from the given entity's model/pos/angles.
--- This is the plural-named alias called from SWEP:StartGhostEntities; behaviour is identical to Tool:StartGhostEntity.
---@param ent Entity The entity to copy ghost parameters from.
function Tool:StartGhostEntities(ent) end

---@class TOOL : Tool
TOOL = {}
