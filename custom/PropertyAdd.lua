---Structure used for [properties.Add](https://wiki.facepunch.com/gmod/properties.Add).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Structures/PropertyAdd
---@class (partial) PropertyAdd
---@field Type? string|"simple"|"toggle" Can be set to "toggle" to make this property a toggle property.
---@field MenuLabel string Label to show on opened menu.
---@field MenuIcon? string Icon to show on opened menu for this item. Optional for simple properties and unused for toggle properties.
---@field Order number Where in the list this property should be positioned, relative to other properties.
---@field PrependSpacer? boolean Whether to add a spacer before this property.
---@field InternalName? string Internal lower-case property name assigned by properties.Add.
---@field Filter fun(self: PropertyAddRuntime, ent: Entity, player: Player):(check: boolean) Used clientside to decide whether this property should be shown for an entity.
---@field Checked? fun(self: PropertyAddRuntime, ent: Entity, tr: table):(check: boolean) Required only for toggle properties.
---@field Action fun(self: PropertyAddRuntime, ent: Entity, tr: table) Called clientside when the property is clicked.
---@field Receive? fun(self: PropertyAddRuntime, len: number, ply: Player) Called serverside if the client sends a message in the Action function.
---@field MenuOpen? fun(self: PropertyAddRuntime, option: DMenuOption, ent: Entity, tr: table) Called clientside when the property option has been created in the right-click menu.
---@field OnCreate? fun(self: PropertyAddRuntime, menu: DMenu, option: DMenuOption) Called clientside after the property option has been created.
local PropertyAdd = {}

---@class (partial) PropertyAddRuntime : PropertyAdd
---@field [string] any Additional property-specific data or helper methods.
---@field InternalName string Internal lower-case property name assigned by properties.Add.
---@field MsgStart fun(self: PropertyAddRuntime) Starts a properties net message for this property.
---@field MsgEnd fun(self: PropertyAddRuntime) Sends the current properties net message to the server.
local PropertyAddRuntime = {}
