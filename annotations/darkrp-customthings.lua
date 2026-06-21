---@meta

DarkRP = DarkRP or {}
GM = GM or {}
GAMEMODE = GAMEMODE or GM

---@class DarkRPJobDefinition
---@field command? string
---@field category? string|DarkRPCategoryKind
---@field color? Color
---@field model? string|string[]
---@field description? string
---@field weapons? string[]
---@field max? integer|number
---@field salary? integer|number
---@field admin? integer
---@field vote? boolean
---@field hasLicense? boolean
---@field NeedToChangeFrom? integer|integer[]
---@field customCheck? fun(ply: Player): boolean
---@field CustomCheckFailMsg? string|fun(ply: Player, job: DarkRPJobDefinition): string?
---@field canStartVote? fun(ply: Player): boolean
---@field canStartVoteReason? string|fun(ply: Player, job: DarkRPJobDefinition): string?
---@field CanPlayerSuicide? fun(ply: Player): boolean
---@field PlayerCanPickupWeapon? fun(ply: Player, weapon: Weapon): boolean
---@field PlayerDeath? fun(ply: Player, weapon: Weapon?, killer: Entity?): nil
---@field PlayerLoadout? fun(ply: Player): boolean?
---@field PlayerSelectSpawn? fun(ply: Player, spawn: Entity): Entity?
---@field PlayerSetModel? fun(ply: Player): string?
---@field PlayerSpawn? fun(ply: Player): nil
---@field PlayerSpawnProp? fun(ply: Player, model: string): boolean?
---@field RequiresVote? fun(ply: Player, team: integer): boolean
---@field ShowSpare1? fun(ply: Player): nil
---@field ShowSpare2? fun(ply: Player): nil
---@field OnPlayerChangedTeam? fun(ply: Player, oldTeam: integer, newTeam: integer): nil
---@field playerClass? string
---@field modelScale? number
---@field maxpocket? integer
---@field maps? string[]
---@field candemote? boolean
---@field mayor? boolean
---@field chief? boolean
---@field medic? boolean
---@field cook? boolean
---@field hobo? boolean
---@field ammo? table<string, integer>
---@field sortOrder? integer
---@field buttonColor? Color
---@field label? string

---@class DarkRPShipmentDefinition
---@field model string
---@field entity string
---@field name? string
---@field amount integer
---@field price? integer
---@field pricesep? integer
---@field separate? boolean
---@field seperate? boolean
---@field noship? boolean
---@field allowed? integer|integer[]
---@field shipmodel? string
---@field shipmentClass? string
---@field spareammo? integer
---@field clip1? integer
---@field clip2? integer
---@field weight? number
---@field onBought? fun(ply: Player, shipment: DarkRPShipmentDefinition, ent: Entity): nil
---@field getPrice? fun(ply: Player, price: integer): integer
---@field spawn? fun(shipment_ent: Entity, shipment_data: DarkRPShipmentDefinition): Entity?
---@field category? string|DarkRPCategoryKind
---@field customCheck? fun(ply: Player): boolean
---@field CustomCheckFailMsg? string|fun(ply: Player, shipment: DarkRPShipmentDefinition): string?
---@field allowPurchaseWhileDead? boolean
---@field sortOrder? integer
---@field buttonColor? Color
---@field label? string

---@class DarkRPEntityDefinition
---@field ent string
---@field model string
---@field price? integer
---@field max? integer
---@field cmd? string
---@field category? string|DarkRPCategoryKind
---@field allowed? integer|integer[]
---@field customCheck? fun(ply: Player): boolean
---@field CustomCheckFailMsg? string|fun(ply: Player, entTable: DarkRPEntityDefinition): string?
---@field getPrice? fun(ply: Player, price: integer): integer
---@field getMax? fun(ply: Player): integer
---@field spawn? fun(ply: Player, tr: TraceResult, tbl: DarkRPEntityDefinition): Entity
---@field delay? number
---@field allowPurchaseWhileDead? boolean
---@field sortOrder? integer
---@field allowTools? boolean

---@class DarkRPAmmoDefinition
---@field ammoType string
---@field name string
---@field model string
---@field amountGiven integer
---@field price integer
---@field category? string|DarkRPCategoryKind
---@field customCheck? fun(ply: Player): boolean
---@field CustomCheckFailMsg? string|fun(ply: Player, ammo: DarkRPAmmoDefinition): string?
---@field allowPurchaseWhileDead? boolean
---@field sortOrder? integer

---@class DarkRPVehicleDefinition
---@field name? string
---@field model string
---@field price integer
---@field allowed? integer|integer[]
---@field customCheck? fun(ply: Player): boolean
---@field CustomCheckFailMsg? string|fun(ply: Player, vehicle: DarkRPVehicleDefinition): string?
---@field category? string|DarkRPCategoryKind
---@field allowPurchaseWhileDead? boolean
---@field distance? number
---@field angle? Angle
---@field sortOrder? integer

---@class DarkRPFoodDefinition
---@field name? string
---@field model string
---@field price integer
---@field energy integer
---@field requiresCook? boolean
---@field onEaten? fun(ply: Player)
---@field customCheck? fun(ply: Player): boolean
---@field customCheckMessage? string

---@class DarkRPCategoryCreateDefinition: DarkRPCategoryDefinition
---@field color Color
---@field startExpanded boolean
---@field canSee? fun(ply: Player): boolean
---@field sortOrder? integer

---@type DarkRPJobDefinition[]
RPExtraTeams = RPExtraTeams or {}

---@type DarkRPShipmentDefinition[]
CustomShipments = CustomShipments or {}

---@type DarkRPEntityDefinition[]
DarkRPEntities = DarkRPEntities or {}

---@type DarkRPVehicleDefinition[]
CustomVehicles = CustomVehicles or {}

---@type DarkRPFoodDefinition[]
FoodItems = FoodItems or {}

---@type DarkRPAmmoDefinition[]
GM.AmmoTypes = GM.AmmoTypes or {}

---@param name string
---@param tbl DarkRPJobDefinition
---@return integer
---@overload fun(name: string, color: Color, model: string|string[], description: string, weapons: string[]?, command: string, max: number, salary: number, admin?: integer, vote?: boolean, hasLicense?: boolean, needToChangeFrom?: integer|integer[], customCheck?: fun(ply: Player): boolean): integer
function DarkRP.createJob(name, tbl) end

---@param name string
---@param tbl DarkRPShipmentDefinition
---@overload fun(name: string, model: string, entity: string, price: number, amount: integer, separate: boolean, priceSeparate: number, noShipment: boolean, classes: integer|integer[], shipModel?: string, customCheck?: fun(ply: Player): boolean)
function DarkRP.createShipment(name, tbl) end

---@param name string
---@param tbl DarkRPEntityDefinition
---@overload fun(name: string, entity: string, model: string, price: number, max: number, command: string, classes: integer|integer[], customCheck?: fun(ply: Player): boolean)
function DarkRP.createEntity(name, tbl) end

---@param tbl DarkRPCategoryCreateDefinition
function DarkRP.createCategory(tbl) end

---@param ammoType string
---@param tbl DarkRPAmmoDefinition
---@overload fun(ammoType: string, name: string, model: string, price: number, amountGiven: integer, customCheck?: fun(ply: Player): boolean)
function DarkRP.createAmmoType(ammoType, tbl) end

---@param tbl DarkRPVehicleDefinition
---@overload fun(name: string, model: string, price: number, jobsThatCanBuyIt: integer|integer[], customCheck?: fun(ply: Player): boolean)
function DarkRP.createVehicle(tbl) end

---@param name string
---@param tbl DarkRPFoodDefinition
---@overload fun(name: string, model: string, energy: integer, price: integer)
function DarkRP.createFood(name, tbl) end

---@param name string
---@param ... integer
function DarkRP.createEntityGroup(name, ...) end

---@param title string
---@param manager integer|integer[]
---@param listeners integer[]
function DarkRP.createAgenda(title, manager, listeners) end

---@param funcOrTeam (fun(ply: Player): boolean)|integer
---@param ... integer
function DarkRP.createGroupChat(funcOrTeam, ...) end

---@param name string
---@param members integer[]
function DarkRP.createDemoteGroup(name, members) end

AddExtraTeam = DarkRP.createJob
AddCustomShipment = DarkRP.createShipment
AddCustomVehicle = DarkRP.createVehicle
AddEntity = DarkRP.createEntity
AddDoorGroup = DarkRP.createEntityGroup
AddAgenda = DarkRP.createAgenda
AddFoodItem = DarkRP.createFood
GM.AddGroupChat = DarkRP.createGroupChat
GM.AddAmmoType = DarkRP.createAmmoType
