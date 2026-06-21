---@meta

--- Source: https://wiki.facepunch.com/gmod/Global_Variables

--[[
  Global Tables
--]]

---@type GM
GAMEMODE = nil

---@alias GPlayer Player

--- Contains a list of all modules loaded from /modules/.
---@type table<string, any>
_MODULES = nil

--[[
  Global Non Constants
--]]

---@type boolean
---This is true whenever the current script is executed on the client. ( client and menu states ) See States. Always present.
CLIENT = nil

---@type boolean
---This is true whenever the current script is executed on the client state. See States.
CLIENT_DLL = nil

---@type boolean
---This is true whenever the current script is executed on the server state. See States. Always present.
SERVER = nil

---@type boolean
---This is true whenever the current script is executed on the server state.
GAME_DLL = nil

---@type boolean
---This is true when the script is being executed in the menu state. See States.
MENU_DLL = nil

---@type string
---Contains the name of the current active gamemode.
GAMEMODE_NAME = nil

---@class NULL : Entity

---@alias EntityOrNULL Entity|NULL

---@type NULL
---Represents a non-existent entity. It is not nil; use IsValid before calling Entity methods.
NULL = nil

---@type string
---Contains the version number of GMod. Example: "201211"
VERSION = nil

---@type string
---Contains a nicely formatted version of GMod. Example: "2020.12.11"
VERSIONSTR = nil

---@type string
---Contains the current networking version. Menu state only. Example: "2023.06.28"
NETVERSIONSTR = nil

---@type string
---The branch the game is running on. This will be "unknown" on main branch.
BRANCH = nil

---@type string
---Current Lua version. This contains "Lua 5.1" in GMod at the moment.
_VERSION = nil

---@type number
---Contains the maximum number of bits needed to network any entity.
MAX_EDICT_BITS = nil

---@type number
---Contains the maximum number of bits needed to network player. Depends on the maximum slots count on the server
MAX_PLAYER_BITS = nil

---@type ENT
---The active env_skypaint entity. [(View Source)](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/base/entities/entities/env_skypaint.lua#L131)
g_SkyPaint = nil

---@type PANEL
---Base panel used for context menus. [(View Source)](https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/contextmenu.lua#L143)
g_ContextMenu = nil

---@type PANEL
---Base panel for displaying incoming/outgoing voice messages. [(View Source)](https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/gamemode/cl_voice.lua#L135)
g_VoicePanelList = nil

---@type PANEL
---Base panel for the spawn menu. [(View Source)](https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/spawnmenu.lua#L207)
g_SpawnMenu = nil

---@type PANEL
---Main menu of Gmod. Only available in the menu state. [(View Source)](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/menu/mainmenu.lua#L481)
pnlMainMenu = nil

--[[
  Global Constants
--]]

---@type Vector
---A vector with all values set to 0.
vector_origin = Vector(0, 0, 0)

---@type Vector
---A vector with the z value set to 1.
vector_up = Vector(0, 0, 1)

---@type Angle
---An Angle with all values set to 0.
angle_zero = Angle(0, 0, 0)

---@type Color
---A color with all values set to 255.
color_white = Color(255, 255, 255, 255)

---@type Color
---A color with all values set to 0 except alpha which is set to 255.
color_black = Color(0, 0, 0, 255)

---@type Color
---A color with only the alpha value set to 0.
color_transparent = Color(255, 255, 255, 0)

--[[
  Derma Panel Globals
  These are derma classes defined via derma.DefineControl
--]]

---@type DIconLayout
DIconLayout = nil

---@type DMenuOptionCVar
DMenuOptionCVar = nil

---@type DPanelList
DPanelList = nil

---@type DListView_Line
DListView_Line = nil

---@type DNumSlider
DNumSlider = nil

---@type DPanelOverlay
DPanelOverlay = nil

---@type DListView_ColumnPlain
DListView_ColumnPlain = nil

---@type DDragBase
DDragBase = nil

---@type DIconBrowser
DIconBrowser = nil

---@type DHTML
DHTML = nil

---@type DCategoryList
DCategoryList = nil

---@type DImage
DImage = nil

---@type DTextEntry
DTextEntry = nil

---@type DListView_DraggerBar
DListView_DraggerBar = nil

---@type DColorMixer
DColorMixer = nil

---@type DFrame
DFrame = nil

---@type DCheckBox
DCheckBox = nil

---@type DColorCombo
DColorCombo = nil

---@type DScrollBarGrip
DScrollBarGrip = nil

---@type Slider
Slider = nil

---@type DHorizontalDivider
DHorizontalDivider = nil

---@type DSlider
DSlider = nil

---@type DForm
DForm = nil

---@type DNumPad
DNumPad = nil

---@type DListViewLine
DListViewLine = nil

---@type DPanelSelect
DPanelSelect = nil

---@type DListView_Column
DListView_Column = nil

---@type DListViewHeaderLabel
DListViewHeaderLabel = nil

---@type DDrawer
DDrawer = nil

---@type DScrollPanel
DScrollPanel = nil

---@type DListBoxItem
DListBoxItem = nil

---@type DListView
DListView = nil

---@type DCollapsibleCategory
DCollapsibleCategory = nil

---@type DImageButton
DImageButton = nil

---@type DListLayout
DListLayout = nil

---@type DBinder
DBinder = nil

---@type DNotify
DNotify = nil

---@type DColorButton
DColorButton = nil

---@type VoiceNotify
VoiceNotify = nil

---@type DColorPalette
DColorPalette = nil

---@type DNumberScratch
DNumberScratch = nil

---@type DPanel
DPanel = nil

---@type DListViewLabel
DListViewLabel = nil

---@type DProperty_Int
DProperty_Int = nil

---@type DProperty_VectorColor
DProperty_VectorColor = nil

---@type DPropertySheet
DPropertySheet = nil

---@type DProperty_Entity
DProperty_Entity = nil

---@type DProperty_Float
DProperty_Float = nil

---@type DProperty_Combo
DProperty_Combo = nil

---@type DHScrollBar
DHScrollBar = nil

---@type DEntityProperties
DEntityProperties = nil

---@type DProperty_Boolean
DProperty_Boolean = nil

---@type DVScrollBar
DVScrollBar = nil

---@type DVerticalDivider
DVerticalDivider = nil

---@type DHTMLControls
DHTMLControls = nil

---@type DVerticalDividerBar
DVerticalDividerBar = nil

---@type DTree_Node_Button
DTree_Node_Button = nil

---@type DNumberWang
DNumberWang = nil

---@type DTree_Node
DTree_Node = nil

---@type DLabelEditable
DLabelEditable = nil

---@type DGrid
DGrid = nil

---@type DTooltip
DTooltip = nil

---@type DLabel
DLabel = nil

---@type DExpandButton
DExpandButton = nil

---@type DKillIcon
DKillIcon = nil

---@type DMenu
DMenu = nil

---@type DCategoryHeader
DCategoryHeader = nil

---@type DTileLayout
DTileLayout = nil

---@type DSprite
DSprite = nil

---@type DModelSelect
DModelSelect = nil

---@type DSizeToContents
DSizeToContents = nil

---@type DShape
DShape = nil

---@type DRGBPicker
DRGBPicker = nil

---@type DModelSelectMulti
DModelSelectMulti = nil

---@type DMenuOption
DMenuOption = nil

---@type DProperty_Generic
DProperty_Generic = nil

---@type DMenuBar
DMenuBar = nil

---@type DCheckBoxLabel
DCheckBoxLabel = nil

---@type DTab
DTab = nil

---@type DProperties
DProperties = nil

---@type DProgress
DProgress = nil

---@type DAlphaBar
DAlphaBar = nil

---@type DPanPanel
DPanPanel = nil

---@type DModelPanel
DModelPanel = nil

---@type DFileBrowser
DFileBrowser = nil

---@type DColorCube
DColorCube = nil

---@type Button
Button = nil

---@type DListBox
DListBox = nil

---@type DAdjustableModelPanel
DAdjustableModelPanel = nil

---@type DComboBox
DComboBox = nil

---@type DColumnSheet
DColumnSheet = nil

---@type DButton
DButton = nil

---@type DHorizontalDividerBar
DHorizontalDividerBar = nil

---@type DBubbleContainer
DBubbleContainer = nil

---@type DTree
DTree = nil

---@type DLabelURL
DLabelURL = nil

---@type DHorizontalScroller
DHorizontalScroller = nil
