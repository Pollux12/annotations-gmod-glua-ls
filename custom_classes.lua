---@meta

---@class ContentContainer : DScrollPanel
---@field IconList DTileLayout The tile layout panel that holds content icons, created in Init.
---@field m_pControllerPanel? Panel The controller panel (AccessorFunc-backed).
---@field m_strCategoryName? string The category name for this content container (AccessorFunc-backed).
---@field m_bTriggerSpawnlistChange? boolean Whether modifications trigger the SpawnlistContentChanged hook (AccessorFunc-backed).
local ContentContainer = {}

---@param trigger boolean
function ContentContainer:SetTriggerSpawnlistChange(trigger) end

---@param pnl Panel
function ContentContainer:Add(pnl) end

---@class CtrlColor : Panel
---@field Mixer DColorMixer The embedded color mixer panel.
local CtrlColor = {}

--- Animation object returned by Derma_Anim(). Drives a timed animation callback on a panel.
---@class DermaAnimation
---@field Name string The name assigned to this animation.
---@field Panel Panel The panel this animation belongs to.
---@field Func fun(panel: Panel, anim: DermaAnimation, delta: number, data: any) The animation callback.
---@field Data? any User data passed to the callback each tick.
---@field Running? boolean Whether the animation is currently running.
---@field Started? boolean Set true on the first tick; cleared after first call.
---@field Finished? boolean Set true on the final tick.
---@field Length? number Total duration in seconds.
---@field StartTime? number SysTime() when the animation began.
---@field EndTime? number SysTime() when the animation will end.
local DermaAnimation = {}

function DermaAnimation:Run() end
---@param length number
---@param data? any
function DermaAnimation:Start(length, data) end
function DermaAnimation:Stop() end
---@return boolean?
function DermaAnimation:Active() end

---@meta

---Runtime drive mode table returned by drive.GetMethod.
---
--- Source: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/drive/drive_base.lua
---@class DriveMethod
---@field Entity Entity Driven entity.
---@field Player Player Driving player.
---@field ModeID number Network string ID of the active drive mode.
---@field StopDriving? boolean Set by DriveMethod:Stop to stop driving after FinishMove.
---@field Init fun(self: DriveMethod, cmd?: CUserCmd)
---@field SetupControls fun(self: DriveMethod, cmd: CUserCmd)
---@field StartMove fun(self: DriveMethod, mv: CMoveData, cmd: CUserCmd)
---@field Move fun(self: DriveMethod, mv: CMoveData)
---@field FinishMove fun(self: DriveMethod, mv: CMoveData)
---@field CalcView fun(self: DriveMethod, view: ViewData)
---@field CalcView_ThirdPerson fun(self: DriveMethod, view: ViewData, dist: number, hullsize: number, entityfilter: Entity)
local DriveMethod = {}

---Call this in your drive method at any point to stop driving.
function DriveMethod:Stop() end

---Built-in engine entity classes used by base Garry's Mod Lua.
---
---These are created by engine-side entity factories such as `ents.Create`.
---@class gmod_anchor : Entity
---@class gmod_hands : Entity
---@class gmod_winch_controller : Entity
---@class hunter_flechette : Entity
---@class keyframe_rope : Entity
---@class logic_collision_pair : Entity
---@class phys_ballsocket : Entity
---@class phys_bone_follower : Entity
---@class phys_constraint : Entity
---@class phys_constraintsystem : Entity
---@class phys_hinge : Entity
---@class phys_keepupright : Entity
---@class phys_lengthconstraint : Entity
---@class phys_magnet : Entity
---@class phys_pulleyconstraint : Entity
---@class phys_ragdollconstraint : Entity
---@class phys_slideconstraint : Entity
---@class phys_spring : Entity
---@class phys_torque : Entity
---@class point_viewcontrol : Entity
---@class ragdoll_motion : Entity
---@class widget_axis_arrow : Entity
---@class widget_axis_disc : Entity
---@class widget_bone : Entity
---@class widget_bones : Entity
local EngineEntities = {}

---Built-in panel classes missing base-class information in generated docs.
---@class (partial) Chromium : HTML
---@class (partial) ModelImage : Panel
---@class (partial) URLLabel : Label
local EnginePanels = {}

---
--- The **PLAYER** table is the structure used to define a custom player class
--- via [player_manager.RegisterClass](https://wiki.facepunch.com/gmod/player_manager.RegisterClass).
--- Player class methods receive the authoring table as `self`, with the driven
--- [Player](https://wiki.facepunch.com/gmod/Player) entity available as `self.Player`.
---
--- The fields below mirror the shipped `player_default` class
--- (`garrysmod/gamemodes/base/gamemode/player_class/player_default.lua`); the
--- `Player`, `ClassID` and `Func` fields are injected at runtime by
--- `player_manager.lua`'s `LookupPlayerClass`. All fields are optional because a
--- player class only authors the subset it wants to override.
---
---@class PlayerClass
---@field Player Player The Player entity this class instance is driving. Injected at runtime by player_manager. Always present inside class methods.
---@field ClassID? number Network string ID of the active player class. Injected at runtime by player_manager.
---@field Func? fun() Internal no-op placeholder. Injected at runtime by player_manager.
---@field DisplayName? string Human-readable display name for this player class.
---@field SlowWalkSpeed? number Movement speed when slow-walking (+WALK). Default: 200.
---@field WalkSpeed? number Movement speed when walking (not running). Default: 400.
---@field RunSpeed? number Movement speed when running. Default: 600.
---@field CrouchedWalkSpeed? number Multiplier applied to move speed while crouching. Default: 0.3.
---@field DuckSpeed? number Speed of transition from standing to crouching. Default: 0.3.
---@field UnDuckSpeed? number Speed of transition from crouching to standing. Default: 0.3.
---@field JumpPower? number Vertical impulse strength on jump. Default: 200.
---@field CanUseFlashlight? boolean Whether the player can use the flashlight. Default: true.
---@field MaxHealth? number Maximum health the player can have. Default: 100.
---@field MaxArmor? number Maximum armor the player can have. Default: 100.
---@field StartHealth? number Health given to the player on spawn. Default: 100.
---@field StartArmor? number Armor given to the player on spawn. Default: 0.
---@field DropWeaponOnDie? boolean Whether to drop the active weapon on death. Default: false.
---@field TeammateNoCollide? boolean Whether teammates pass through each other. Default: true.
---@field AvoidPlayers? boolean Whether the player auto-swerves around others. Default: true.
---@field UseVMHands? boolean Whether to use viewmodel hands. Default: true.
PlayerClass = {}

---@class PostProcessConVarState
---@field on string Value written when the post-process effect is enabled.
---@field off? string Value written when the post-process effect is disabled.

---@class (partial) PostProcessIcon : ContentIcon
---@field ConVars table<string, PostProcessConVarState> Console variables controlled by this post-process icon.
---@field PP table Runtime post-process metadata from `list.GetEntry("PostProcess", name)`.
---@field checkbox DCheckBox The optional enable/disable checkbox.
---@field cp ControlPanel? Lazily-created control panel for this post-process entry.
local PostProcessIcon = {}

---@meta

--- Source: https://github.com/Facepunch/garrysmod/blob/b2bff902adf7f5b87ec543f873e74e3267e93f26/garrysmod/lua/skins/default.lua

---@class SKINColoursState
---@field Normal Color
---@field Hover Color
---@field Down Color
---@field Disabled Color

---@class SKINColoursWindow
---@field TitleActive Color
---@field TitleInactive Color

---@class SKINColoursTab
---@field Active SKINColoursState
---@field Inactive SKINColoursState

---@class SKINColoursLabel
---@field Default Color
---@field Bright Color
---@field Dark Color
---@field Highlight Color

---@class SKINColoursTree
---@field Lines Color
---@field Normal Color
---@field Hover Color
---@field Selected Color

---@class SKINColoursProperties
---@field Line_Normal Color
---@field Line_Selected Color
---@field Line_Hover Color
---@field Title Color
---@field Column_Normal Color
---@field Column_Selected Color
---@field Column_Hover Color
---@field Column_Disabled Color
---@field Border Color
---@field Label_Normal Color
---@field Label_Selected Color
---@field Label_Hover Color
---@field Label_Disabled Color

---@class SKINColoursCategoryLine
---@field Text Color
---@field Text_Hover Color
---@field Text_Selected Color
---@field Text_Disabled Color
---@field Button Color
---@field Button_Hover Color
---@field Button_Selected Color
---@field Button_Disabled Color

---@class SKINColoursCategory
---@field Header Color
---@field Header_Closed Color
---@field Line SKINColoursCategoryLine
---@field LineAlt SKINColoursCategoryLine

---@class SKINColours
---@field Window SKINColoursWindow
---@field Button SKINColoursState
---@field Tab SKINColoursTab
---@field Label SKINColoursLabel
---@field Tree SKINColoursTree
---@field Properties SKINColoursProperties
---@field Category SKINColoursCategory
---@field TooltipText Color

---@class SKINTexScroller
---@field TrackV fun(x: number, y: number, w: number, h: number, col?: Color) Vertical scrollbar track texture.
---@field ButtonV_Normal fun(x: number, y: number, w: number, h: number, col?: Color) Vertical scroll grip, normal state.
---@field ButtonV_Hover fun(x: number, y: number, w: number, h: number, col?: Color) Vertical scroll grip, hovered.
---@field ButtonV_Down fun(x: number, y: number, w: number, h: number, col?: Color) Vertical scroll grip, pressed.
---@field ButtonV_Disabled fun(x: number, y: number, w: number, h: number, col?: Color) Vertical scroll grip, disabled.
---@field TrackH fun(x: number, y: number, w: number, h: number, col?: Color) Horizontal scrollbar track texture.
---@field ButtonH_Normal fun(x: number, y: number, w: number, h: number, col?: Color) Horizontal scroll grip, normal state.
---@field ButtonH_Hover fun(x: number, y: number, w: number, h: number, col?: Color) Horizontal scroll grip, hovered.
---@field ButtonH_Down fun(x: number, y: number, w: number, h: number, col?: Color) Horizontal scroll grip, pressed.
---@field ButtonH_Disabled fun(x: number, y: number, w: number, h: number, col?: Color) Horizontal scroll grip, disabled.
---@field LeftButton_Normal fun(x: number, y: number, w: number, h: number, col?: Color) Left scroll arrow, normal.
---@field LeftButton_Hover fun(x: number, y: number, w: number, h: number, col?: Color) Left scroll arrow, hovered.
---@field LeftButton_Down fun(x: number, y: number, w: number, h: number, col?: Color) Left scroll arrow, pressed.
---@field LeftButton_Disabled fun(x: number, y: number, w: number, h: number, col?: Color) Left scroll arrow, disabled.
---@field LeftButton_Dead fun(x: number, y: number, w: number, h: number, col?: Color) Left scroll arrow, dead/inactive (alias used by PaintButtonLeft).
---@field UpButton_Normal fun(x: number, y: number, w: number, h: number, col?: Color) Up scroll arrow, normal.
---@field UpButton_Hover fun(x: number, y: number, w: number, h: number, col?: Color) Up scroll arrow, hovered.
---@field UpButton_Down fun(x: number, y: number, w: number, h: number, col?: Color) Up scroll arrow, pressed.
---@field UpButton_Disabled fun(x: number, y: number, w: number, h: number, col?: Color) Up scroll arrow, disabled.
---@field UpButton_Dead fun(x: number, y: number, w: number, h: number, col?: Color) Up scroll arrow, dead/inactive (alias used by PaintButtonUp).
---@field RightButton_Normal fun(x: number, y: number, w: number, h: number, col?: Color) Right scroll arrow, normal.
---@field RightButton_Hover fun(x: number, y: number, w: number, h: number, col?: Color) Right scroll arrow, hovered.
---@field RightButton_Down fun(x: number, y: number, w: number, h: number, col?: Color) Right scroll arrow, pressed.
---@field RightButton_Disabled fun(x: number, y: number, w: number, h: number, col?: Color) Right scroll arrow, disabled.
---@field RightButton_Dead fun(x: number, y: number, w: number, h: number, col?: Color) Right scroll arrow, dead/inactive (alias used by PaintButtonRight).
---@field DownButton_Normal fun(x: number, y: number, w: number, h: number, col?: Color) Down scroll arrow, normal.
---@field DownButton_Hover fun(x: number, y: number, w: number, h: number, col?: Color) Down scroll arrow, hovered.
---@field DownButton_Down fun(x: number, y: number, w: number, h: number, col?: Color) Down scroll arrow, pressed.
---@field DownButton_Disabled fun(x: number, y: number, w: number, h: number, col?: Color) Down scroll arrow, disabled.
---@field DownButton_Dead fun(x: number, y: number, w: number, h: number, col?: Color) Down scroll arrow, dead/inactive (alias used by PaintButtonDown).

---@class SKINTexPanels
---@field Normal fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Bright fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Dark fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Highlight fun(x: number, y: number, w: number, h: number, col?: Color)

---@class SKINTexWindow
---@field Normal fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Inactive fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Close fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Close_Hover fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Close_Down fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Mini fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Mini_Hover fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Mini_Down fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Maxi fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Maxi_Hover fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Maxi_Down fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Restore fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Restore_Hover fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Restore_Down fun(x: number, y: number, w: number, h: number, col?: Color)

---@class SKINTexMenu
---@field RightArrow fun(x: number, y: number, w: number, h: number, col?: Color)

---@class SKINTexState
---@field Normal fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Hover fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Down fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Disabled fun(x: number, y: number, w: number, h: number, col?: Color)

---@class SKINTexComboBox : SKINTexState
---@field Button SKINTexState

---@class SKINTexUpDown
---@field Up SKINTexState
---@field Down SKINTexState

---@class SKINTexSlider
---@field H SKINTexState
---@field V SKINTexState

---@class SKINTexListBox
---@field Background fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Hovered fun(x: number, y: number, w: number, h: number, col?: Color)
---@field EvenLine fun(x: number, y: number, w: number, h: number, col?: Color)
---@field OddLine fun(x: number, y: number, w: number, h: number, col?: Color)
---@field EvenLineSelected fun(x: number, y: number, w: number, h: number, col?: Color)
---@field OddLineSelected fun(x: number, y: number, w: number, h: number, col?: Color)

---@class SKINTexInput
---@field ListBox SKINTexListBox
---@field ComboBox SKINTexComboBox
---@field UpDown SKINTexUpDown
---@field Slider SKINTexSlider

---@class SKINTexProgressBar
---@field Back fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Front fun(x: number, y: number, w: number, h: number, col?: Color)

---@class SKINTexCategoryList
---@field Outer fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Inner fun(x: number, y: number, w: number, h: number, col?: Color)
---@field Header fun(x: number, y: number, w: number, h: number, col?: Color)
---@field InnerH fun(x: number, y: number, w: number, h: number, col?: Color)

---@class SKINTex
---@field Panels SKINTexPanels
---@field Window SKINTexWindow
---@field Menu SKINTexMenu
---@field Input SKINTexInput
---@field ProgressBar SKINTexProgressBar
---@field CategoryList SKINTexCategoryList
---@field Scroller SKINTexScroller

--- Active Derma skin table used by derma and GWEN.
---@class SKIN
---@field Name? string Internal skin registry name assigned by derma.DefineSkin.
---@field Description? string Human-readable skin description assigned by derma.DefineSkin.
---@field Base? string Optional base skin name assigned by derma.DefineSkin.
---@field Colours SKINColours
---@field tex SKINTex
---@field PaintPanel fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintShadow fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintFrame fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintButton fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintTree fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintCheckBox fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintRadioButton fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintExpandButton fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintTextEntry fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintMenu fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintMenuSpacer fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintMenuOption fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintMenuRightArrow fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintPropertySheet fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintTab fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintActiveTab fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintWindowCloseButton fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintWindowMinimizeButton fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintWindowMaximizeButton fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintVScrollBar fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintHScrollBar fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintScrollBarGrip fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintButtonDown fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintButtonUp fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintButtonLeft fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintButtonRight fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintComboDownArrow fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintComboBox fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintListBox fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintNumberUp fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintNumberDown fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintTreeNode fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintTreeNodeButton fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintSelection fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintSliderKnob fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintNumSlider fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintProgress fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintCollapsibleCategory fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintCategoryList fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintCategoryButton fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintListViewLine fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintListView fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintTooltip fun(self: SKIN, panel: Panel, w: number, h: number)
---@field PaintMenuBar fun(self: SKIN, panel: Panel, w: number, h: number)
SKIN = SKIN or {}

SKIN.PrintName = "Default Derma Skin"
SKIN.Author = "Garry Newman"
SKIN.DermaVersion = 1
SKIN.GwenTexture = Material("gwenskin/GModDefault.png")

SKIN.bg_color = Color(101, 100, 105, 255)
SKIN.bg_color_sleep = Color(70, 70, 70, 255)
SKIN.bg_color_dark = Color(55, 57, 61, 255)
SKIN.bg_color_bright = Color(220, 220, 220, 255)
SKIN.frame_border = Color(50, 50, 50, 255)

SKIN.fontFrame = "DermaDefault"

SKIN.control_color = Color(120, 120, 120, 255)
SKIN.control_color_highlight = Color(150, 150, 150, 255)
SKIN.control_color_active = Color(110, 150, 250, 255)
SKIN.control_color_bright = Color(255, 200, 100, 255)
SKIN.control_color_dark = Color(100, 100, 100, 255)

SKIN.bg_alt1 = Color(50, 50, 50, 255)
SKIN.bg_alt2 = Color(55, 55, 55, 255)

SKIN.listview_hover = Color(70, 70, 70, 255)
SKIN.listview_selected = Color(100, 170, 220, 255)

SKIN.text_bright = Color(255, 255, 255, 255)
SKIN.text_normal = Color(180, 180, 180, 255)
SKIN.text_dark = Color(20, 20, 20, 255)
SKIN.text_highlight = Color(255, 20, 20, 255)

SKIN.texGradientUp = Material("gui/gradient_up")
SKIN.texGradientDown = Material("gui/gradient_down")

SKIN.combobox_selected = SKIN.listview_selected

SKIN.panel_transback = Color(255, 255, 255, 50)
SKIN.tooltip = Color(255, 245, 175, 255)

SKIN.colPropertySheet = Color(170, 170, 170, 255)
SKIN.colTab = SKIN.colPropertySheet
SKIN.colTabInactive = Color(140, 140, 140, 255)
SKIN.colTabShadow = Color(0, 0, 0, 170)
SKIN.colTabText = Color(255, 255, 255, 255)
SKIN.colTabTextInactive = Color(0, 0, 0, 200)
SKIN.fontTab = "DermaDefault"

SKIN.colCollapsibleCategory = Color(255, 255, 255, 20)

SKIN.colCategoryText = Color(255, 255, 255, 255)
SKIN.colCategoryTextInactive = Color(200, 200, 200, 255)
SKIN.fontCategoryHeader = "TabLarge"

SKIN.colNumberWangBG = Color(255, 240, 150, 255)
SKIN.colTextEntryBG = Color(240, 240, 240, 255)
SKIN.colTextEntryBorder = Color(20, 20, 20, 255)
SKIN.colTextEntryText = Color(20, 20, 20, 255)
SKIN.colTextEntryTextHighlight = Color(20, 200, 250, 255)
SKIN.colTextEntryTextCursor = Color(0, 0, 100, 255)
SKIN.colTextEntryTextPlaceholder = Color(128, 128, 128, 255)

SKIN.colNumSliderNotch = Color(0, 0, 0, 100)

SKIN.colMenuBG = Color(255, 255, 255, 200)
SKIN.colMenuBorder = Color(0, 0, 0, 200)

SKIN.colButtonText = Color(255, 255, 255, 255)
SKIN.colButtonTextDisabled = Color(255, 255, 255, 55)
SKIN.colButtonBorder = Color(20, 20, 20, 255)
SKIN.colButtonBorderHighlight = Color(255, 255, 255, 50)
SKIN.colButtonBorderShadow = Color(0, 0, 0, 100)

SKIN.tex = {}

SKIN.tex.Selection = GWEN.CreateTextureBorder(384, 32, 31, 31, 4, 4, 4, 4)

SKIN.tex.Panels = {}
SKIN.tex.Panels.Normal = GWEN.CreateTextureBorder(256, 0, 63, 63, 16, 16, 16, 16)
SKIN.tex.Panels.Bright = GWEN.CreateTextureBorder(256 + 64, 0, 63, 63, 16, 16, 16, 16)
SKIN.tex.Panels.Dark = GWEN.CreateTextureBorder(256, 64, 63, 63, 16, 16, 16, 16)
SKIN.tex.Panels.Highlight = GWEN.CreateTextureBorder(256 + 64, 64, 63, 63, 16, 16, 16, 16)

SKIN.tex.Button = GWEN.CreateTextureBorder(480, 0, 31, 31, 8, 8, 8, 8)
SKIN.tex.Button_Hovered = GWEN.CreateTextureBorder(480, 32, 31, 31, 8, 8, 8, 8)
SKIN.tex.Button_Dead = GWEN.CreateTextureBorder(480, 64, 31, 31, 8, 8, 8, 8)
SKIN.tex.Button_Down = GWEN.CreateTextureBorder(480, 96, 31, 31, 8, 8, 8, 8)
SKIN.tex.Shadow = GWEN.CreateTextureBorder(448, 0, 31, 31, 8, 8, 8, 8)

SKIN.tex.Tree = GWEN.CreateTextureBorder(256, 128, 127, 127, 16, 16, 16, 16)
SKIN.tex.Checkbox_Checked = GWEN.CreateTextureNormal(448, 32, 15, 15)
SKIN.tex.Checkbox = GWEN.CreateTextureNormal(464, 32, 15, 15)
SKIN.tex.CheckboxD_Checked = GWEN.CreateTextureNormal(448, 48, 15, 15)
SKIN.tex.CheckboxD = GWEN.CreateTextureNormal(464, 48, 15, 15)
SKIN.tex.RadioButton_Checked = GWEN.CreateTextureNormal(448, 64, 15, 15)
SKIN.tex.RadioButton = GWEN.CreateTextureNormal(464, 64, 15, 15)
SKIN.tex.RadioButtonD_Checked = GWEN.CreateTextureNormal(448, 80, 15, 15)
SKIN.tex.RadioButtonD = GWEN.CreateTextureNormal(464, 80, 15, 15)
SKIN.tex.TreePlus = GWEN.CreateTextureNormal(448, 96, 15, 15)
SKIN.tex.TreeMinus = GWEN.CreateTextureNormal(464, 96, 15, 15)
SKIN.tex.TextBox = GWEN.CreateTextureBorder(0, 150, 127, 21, 4, 4, 4, 4)
SKIN.tex.TextBox_Focus = GWEN.CreateTextureBorder(0, 172, 127, 21, 4, 4, 4, 4)
SKIN.tex.TextBox_Disabled = GWEN.CreateTextureBorder(0, 194, 127, 21, 4, 4, 4, 4)
SKIN.tex.MenuBG_Column = GWEN.CreateTextureBorder(128, 128, 127, 63, 24, 8, 8, 8)
SKIN.tex.MenuBG = GWEN.CreateTextureBorder(128, 192, 127, 63, 8, 8, 8, 8)
SKIN.tex.MenuBG_Hover = GWEN.CreateTextureBorder(128, 256, 127, 31, 8, 8, 8, 8)
SKIN.tex.MenuBG_Spacer = GWEN.CreateTextureNormal(128, 288, 127, 3)
SKIN.tex.Menu_Strip = GWEN.CreateTextureBorder(0, 128, 127, 21, 8, 8, 8, 8)
SKIN.tex.Menu_Check = GWEN.CreateTextureNormal(448, 112, 15, 15)
SKIN.tex.Tab_Control = GWEN.CreateTextureBorder(0, 256, 127, 127, 8, 8, 8, 8)
SKIN.tex.TabB_Active = GWEN.CreateTextureBorder(0, 416, 63, 31, 8, 8, 8, 8)
SKIN.tex.TabB_Inactive = GWEN.CreateTextureBorder(128, 416, 63, 31, 8, 8, 8, 8)
SKIN.tex.TabT_Active = GWEN.CreateTextureBorder(0, 384, 63, 31, 8, 8, 8, 8)
SKIN.tex.TabT_Inactive = GWEN.CreateTextureBorder(128, 384, 63, 31, 8, 8, 8, 8)
SKIN.tex.TabL_Active = GWEN.CreateTextureBorder(64, 384, 31, 63, 8, 8, 8, 8)
SKIN.tex.TabL_Inactive = GWEN.CreateTextureBorder(64 + 128, 384, 31, 63, 8, 8, 8, 8)
SKIN.tex.TabR_Active = GWEN.CreateTextureBorder(96, 384, 31, 63, 8, 8, 8, 8)
SKIN.tex.TabR_Inactive = GWEN.CreateTextureBorder(96 + 128, 384, 31, 63, 8, 8, 8, 8)
SKIN.tex.Tab_Bar = GWEN.CreateTextureBorder(128, 352, 127, 31, 4, 4, 4, 4)

SKIN.tex.Window = {}
SKIN.tex.Window.Normal = GWEN.CreateTextureBorder(0, 0, 127, 127, 8, 24, 8, 8)
SKIN.tex.Window.Inactive = GWEN.CreateTextureBorder(128, 0, 127, 127, 8, 24, 8, 8)
SKIN.tex.Window.Close = GWEN.CreateTextureNormal(32, 448, 31, 24)
SKIN.tex.Window.Close_Hover = GWEN.CreateTextureNormal(64, 448, 31, 24)
SKIN.tex.Window.Close_Down = GWEN.CreateTextureNormal(96, 448, 31, 24)
SKIN.tex.Window.Maxi = GWEN.CreateTextureNormal(32 + 96 * 2, 448, 31, 24)
SKIN.tex.Window.Maxi_Hover = GWEN.CreateTextureNormal(64 + 96 * 2, 448, 31, 24)
SKIN.tex.Window.Maxi_Down = GWEN.CreateTextureNormal(96 + 96 * 2, 448, 31, 24)
SKIN.tex.Window.Restore = GWEN.CreateTextureNormal(32 + 96 * 2, 448 + 32, 31, 24)
SKIN.tex.Window.Restore_Hover = GWEN.CreateTextureNormal(64 + 96 * 2, 448 + 32, 31, 24)
SKIN.tex.Window.Restore_Down = GWEN.CreateTextureNormal(96 + 96 * 2, 448 + 32, 31, 24)
SKIN.tex.Window.Mini = GWEN.CreateTextureNormal(32 + 96, 448, 31, 24)
SKIN.tex.Window.Mini_Hover = GWEN.CreateTextureNormal(64 + 96, 448, 31, 24)
SKIN.tex.Window.Mini_Down = GWEN.CreateTextureNormal(96 + 96, 448, 31, 24)

SKIN.tex.Scroller = {}
SKIN.tex.Scroller.TrackV = GWEN.CreateTextureBorder(384, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonV_Normal = GWEN.CreateTextureBorder(384 + 16, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonV_Hover = GWEN.CreateTextureBorder(384 + 32, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonV_Down = GWEN.CreateTextureBorder(384 + 48, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonV_Disabled = GWEN.CreateTextureBorder(384 + 64, 208, 15, 127, 4, 4, 4, 4)
SKIN.tex.Scroller.TrackH = GWEN.CreateTextureBorder(384, 128, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonH_Normal = GWEN.CreateTextureBorder(384, 128 + 16, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonH_Hover = GWEN.CreateTextureBorder(384, 128 + 32, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonH_Down = GWEN.CreateTextureBorder(384, 128 + 48, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.ButtonH_Disabled = GWEN.CreateTextureBorder(384, 128 + 64, 127, 15, 4, 4, 4, 4)
SKIN.tex.Scroller.LeftButton_Normal = GWEN.CreateTextureBorder(464, 208, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.LeftButton_Hover = GWEN.CreateTextureBorder(480, 208, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.LeftButton_Down = GWEN.CreateTextureBorder(464, 272, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.LeftButton_Disabled = GWEN.CreateTextureBorder(480 + 48, 272, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.UpButton_Normal = GWEN.CreateTextureBorder(464, 208 + 16, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.UpButton_Hover = GWEN.CreateTextureBorder(480, 208 + 16, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.UpButton_Down = GWEN.CreateTextureBorder(464, 272 + 16, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.UpButton_Disabled = GWEN.CreateTextureBorder(480 + 48, 272 + 16, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.RightButton_Normal = GWEN.CreateTextureBorder(464, 208 + 32, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.RightButton_Hover = GWEN.CreateTextureBorder(480, 208 + 32, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.RightButton_Down = GWEN.CreateTextureBorder(464, 272 + 32, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.RightButton_Disabled = GWEN.CreateTextureBorder(480 + 48, 272 + 32, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.DownButton_Normal = GWEN.CreateTextureBorder(464, 208 + 48, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.DownButton_Hover = GWEN.CreateTextureBorder(480, 208 + 48, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.DownButton_Down = GWEN.CreateTextureBorder(464, 272 + 48, 15, 15, 2, 2, 2, 2)
SKIN.tex.Scroller.DownButton_Disabled = GWEN.CreateTextureBorder(480 + 48, 272 + 48, 15, 15, 2, 2, 2, 2)

SKIN.tex.Menu = {}
SKIN.tex.Menu.RightArrow = GWEN.CreateTextureNormal(464, 112, 15, 15)

SKIN.tex.Input = {}
SKIN.tex.Input.ComboBox = {}
SKIN.tex.Input.ComboBox.Normal = GWEN.CreateTextureBorder(384, 336, 127, 31, 8, 8, 32, 8)
SKIN.tex.Input.ComboBox.Hover = GWEN.CreateTextureBorder(384, 336 + 32, 127, 31, 8, 8, 32, 8)
SKIN.tex.Input.ComboBox.Down = GWEN.CreateTextureBorder(384, 336 + 64, 127, 31, 8, 8, 32, 8)
SKIN.tex.Input.ComboBox.Disabled = GWEN.CreateTextureBorder(384, 336 + 96, 127, 31, 8, 8, 32, 8)
SKIN.tex.Input.ComboBox.Button = {}
SKIN.tex.Input.ComboBox.Button.Normal = GWEN.CreateTextureNormal(496, 272, 15, 15)
SKIN.tex.Input.ComboBox.Button.Hover = GWEN.CreateTextureNormal(496, 272 + 16, 15, 15)
SKIN.tex.Input.ComboBox.Button.Down = GWEN.CreateTextureNormal(496, 272 + 32, 15, 15)
SKIN.tex.Input.ComboBox.Button.Disabled = GWEN.CreateTextureNormal(496, 272 + 48, 15, 15)
SKIN.tex.Input.UpDown = {}
SKIN.tex.Input.UpDown.Up = {}
SKIN.tex.Input.UpDown.Up.Normal = GWEN.CreateTextureCentered(384, 112, 7, 7)
SKIN.tex.Input.UpDown.Up.Hover = GWEN.CreateTextureCentered(384 + 8, 112, 7, 7)
SKIN.tex.Input.UpDown.Up.Down = GWEN.CreateTextureCentered(384 + 16, 112, 7, 7)
SKIN.tex.Input.UpDown.Up.Disabled = GWEN.CreateTextureCentered(384 + 24, 112, 7, 7)
SKIN.tex.Input.UpDown.Down = {}
SKIN.tex.Input.UpDown.Down.Normal = GWEN.CreateTextureCentered(384, 120, 7, 7)
SKIN.tex.Input.UpDown.Down.Hover = GWEN.CreateTextureCentered(384 + 8, 120, 7, 7)
SKIN.tex.Input.UpDown.Down.Down = GWEN.CreateTextureCentered(384 + 16, 120, 7, 7)
SKIN.tex.Input.UpDown.Down.Disabled = GWEN.CreateTextureCentered(384 + 24, 120, 7, 7)
SKIN.tex.Input.Slider = {}
SKIN.tex.Input.Slider.H = {}
SKIN.tex.Input.Slider.H.Normal = GWEN.CreateTextureNormal(416, 32, 15, 15)
SKIN.tex.Input.Slider.H.Hover = GWEN.CreateTextureNormal(416, 32 + 16, 15, 15)
SKIN.tex.Input.Slider.H.Down = GWEN.CreateTextureNormal(416, 32 + 32, 15, 15)
SKIN.tex.Input.Slider.H.Disabled = GWEN.CreateTextureNormal(416, 32 + 48, 15, 15)
SKIN.tex.Input.Slider.V = {}
SKIN.tex.Input.Slider.V.Normal = GWEN.CreateTextureNormal(416 + 16, 32, 15, 15)
SKIN.tex.Input.Slider.V.Hover = GWEN.CreateTextureNormal(416 + 16, 32 + 16, 15, 15)
SKIN.tex.Input.Slider.V.Down = GWEN.CreateTextureNormal(416 + 16, 32 + 32, 15, 15)
SKIN.tex.Input.Slider.V.Disabled = GWEN.CreateTextureNormal(416 + 16, 32 + 48, 15, 15)
SKIN.tex.Input.ListBox = {}
SKIN.tex.Input.ListBox.Background = GWEN.CreateTextureBorder(256, 256, 63, 127, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.Hovered = GWEN.CreateTextureBorder(320, 320, 31, 31, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.EvenLine = GWEN.CreateTextureBorder(352, 256, 31, 31, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.OddLine = GWEN.CreateTextureBorder(352, 288, 31, 31, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.EvenLineSelected = GWEN.CreateTextureBorder(320, 256, 31, 31, 8, 8, 8, 8)
SKIN.tex.Input.ListBox.OddLineSelected = GWEN.CreateTextureBorder(320, 288, 31, 31, 8, 8, 8, 8)

SKIN.tex.ProgressBar = {}
SKIN.tex.ProgressBar.Back = GWEN.CreateTextureBorder(384, 0, 31, 31, 8, 8, 8, 8)
SKIN.tex.ProgressBar.Front = GWEN.CreateTextureBorder(384 + 32, 0, 31, 31, 8, 8, 8, 8)

SKIN.tex.CategoryList = {}
SKIN.tex.CategoryList.Outer = GWEN.CreateTextureBorder(256, 384, 63, 63, 8, 8, 8, 8)
SKIN.tex.CategoryList.InnerH = GWEN.CreateTextureBorder(320, 384, 63, 20, 8, 8, 8, 8)
SKIN.tex.CategoryList.Inner = GWEN.CreateTextureBorder(320, 384 + 21, 63, 63 - 21, 8, 0, 8, 8)
SKIN.tex.CategoryList.Header = GWEN.CreateTextureBorder(320, 352, 63, 31, 8, 8, 8, 8)

SKIN.tex.Tooltip = GWEN.CreateTextureBorder(384, 64, 31, 31, 8, 8, 8, 8)

SKIN.Colours = {}
SKIN.Colours.Window = {}
SKIN.Colours.Window.TitleActive = GWEN.TextureColor(4 + 8 * 0, 508)
SKIN.Colours.Window.TitleInactive = GWEN.TextureColor(4 + 8 * 1, 508)

SKIN.Colours.Button = {}
SKIN.Colours.Button.Normal = GWEN.TextureColor(4 + 8 * 2, 508)
SKIN.Colours.Button.Hover = GWEN.TextureColor(4 + 8 * 3, 508)
SKIN.Colours.Button.Down = GWEN.TextureColor(4 + 8 * 2, 500)
SKIN.Colours.Button.Disabled = GWEN.TextureColor(4 + 8 * 3, 500)

SKIN.Colours.Tab = {}
SKIN.Colours.Tab.Active = {}
SKIN.Colours.Tab.Active.Normal = GWEN.TextureColor(4 + 8 * 4, 508)
SKIN.Colours.Tab.Active.Hover = GWEN.TextureColor(4 + 8 * 5, 508)
SKIN.Colours.Tab.Active.Down = GWEN.TextureColor(4 + 8 * 4, 500)
SKIN.Colours.Tab.Active.Disabled = GWEN.TextureColor(4 + 8 * 5, 500)
SKIN.Colours.Tab.Inactive = {}
SKIN.Colours.Tab.Inactive.Normal = GWEN.TextureColor(4 + 8 * 6, 508)
SKIN.Colours.Tab.Inactive.Hover = GWEN.TextureColor(4 + 8 * 7, 508)
SKIN.Colours.Tab.Inactive.Down = GWEN.TextureColor(4 + 8 * 6, 500)
SKIN.Colours.Tab.Inactive.Disabled = GWEN.TextureColor(4 + 8 * 7, 500)

SKIN.Colours.Label = {}
SKIN.Colours.Label.Default = GWEN.TextureColor(4 + 8 * 8, 508)
SKIN.Colours.Label.Bright = GWEN.TextureColor(4 + 8 * 9, 508)
SKIN.Colours.Label.Dark = GWEN.TextureColor(4 + 8 * 8, 500)
SKIN.Colours.Label.Highlight = GWEN.TextureColor(4 + 8 * 9, 500)

SKIN.Colours.Tree = {}
SKIN.Colours.Tree.Lines = GWEN.TextureColor(4 + 8 * 10, 508)
SKIN.Colours.Tree.Normal = GWEN.TextureColor(4 + 8 * 11, 508)
SKIN.Colours.Tree.Hover = GWEN.TextureColor(4 + 8 * 10, 500)
SKIN.Colours.Tree.Selected = GWEN.TextureColor(4 + 8 * 11, 500)

SKIN.Colours.Properties = {}
SKIN.Colours.Properties.Line_Normal = GWEN.TextureColor(4 + 8 * 12, 508)
SKIN.Colours.Properties.Line_Selected = GWEN.TextureColor(4 + 8 * 13, 508)
SKIN.Colours.Properties.Line_Hover = GWEN.TextureColor(4 + 8 * 12, 500)
SKIN.Colours.Properties.Title = GWEN.TextureColor(4 + 8 * 13, 500)
SKIN.Colours.Properties.Column_Normal = GWEN.TextureColor(4 + 8 * 14, 508)
SKIN.Colours.Properties.Column_Selected = GWEN.TextureColor(4 + 8 * 15, 508)
SKIN.Colours.Properties.Column_Hover = GWEN.TextureColor(4 + 8 * 14, 500)
SKIN.Colours.Properties.Column_Disabled = Color(240, 240, 240)
SKIN.Colours.Properties.Border = GWEN.TextureColor(4 + 8 * 15, 500)
SKIN.Colours.Properties.Label_Normal = GWEN.TextureColor(4 + 8 * 16, 508)
SKIN.Colours.Properties.Label_Selected = GWEN.TextureColor(4 + 8 * 17, 508)
SKIN.Colours.Properties.Label_Hover = GWEN.TextureColor(4 + 8 * 16, 500)
SKIN.Colours.Properties.Label_Disabled = GWEN.TextureColor(4 + 8 * 16, 508)

SKIN.Colours.Category = {}
SKIN.Colours.Category.Header = GWEN.TextureColor(4 + 8 * 18, 500)
SKIN.Colours.Category.Header_Closed = GWEN.TextureColor(4 + 8 * 19, 500)
SKIN.Colours.Category.Line = {}
SKIN.Colours.Category.Line.Text = GWEN.TextureColor(4 + 8 * 20, 508)
SKIN.Colours.Category.Line.Text_Hover = GWEN.TextureColor(4 + 8 * 21, 508)
SKIN.Colours.Category.Line.Text_Selected = GWEN.TextureColor(4 + 8 * 20, 500)
SKIN.Colours.Category.Line.Text_Disabled = GWEN.TextureColor(4 + 8 * 16, 508)
SKIN.Colours.Category.Line.Button = GWEN.TextureColor(4 + 8 * 21, 500)
SKIN.Colours.Category.Line.Button_Hover = GWEN.TextureColor(4 + 8 * 22, 508)
SKIN.Colours.Category.Line.Button_Selected = GWEN.TextureColor(4 + 8 * 23, 508)
SKIN.Colours.Category.Line.Button_Disabled = Color(210, 210, 210)
SKIN.Colours.Category.LineAlt = {}
SKIN.Colours.Category.LineAlt.Text = GWEN.TextureColor(4 + 8 * 22, 500)
SKIN.Colours.Category.LineAlt.Text_Hover = GWEN.TextureColor(4 + 8 * 23, 500)
SKIN.Colours.Category.LineAlt.Text_Selected = GWEN.TextureColor(4 + 8 * 24, 508)
SKIN.Colours.Category.LineAlt.Text_Disabled = GWEN.TextureColor(4 + 8 * 16, 508)
SKIN.Colours.Category.LineAlt.Button = GWEN.TextureColor(4 + 8 * 25, 508)
SKIN.Colours.Category.LineAlt.Button_Hover = GWEN.TextureColor(4 + 8 * 24, 500)
SKIN.Colours.Category.LineAlt.Button_Selected = GWEN.TextureColor(4 + 8 * 25, 500)
SKIN.Colours.Category.LineAlt.Button_Disabled = Color(200, 200, 200)

SKIN.Colours.TooltipText = GWEN.TextureColor(4 + 8 * 26, 500)

---@meta

---@class ModelEntity
---@field GetModel fun(self: ModelEntity): string

---@class SkeletonConvertor
---@field IsApplicable fun(self: SkeletonConvertor, ent: ModelEntity): boolean
---@field PrePosition? fun(self: SkeletonConvertor, sensor: table<integer, any>)
---@field PositionTable? table<integer, any>
---@field AnglesTable? table<integer, any>
---@field SpecialVectorTable? table<integer, any>
---@field Complete? fun(self: SkeletonConvertor, ply: Player, sensor: table<integer, any>, rotation: Angle, pos: table<integer, any>, ang: table<integer, Angle>)

---@class SpawnMenu : EditablePanel
---@field HorizontalDivider DHorizontalDivider The central horizontal divider panel.
---@field ToolMenu ToolMenu The right-side tool menu panel.
---@field CreateMenu CreationMenu The left-side creation/content menu panel.
---@field ToolToggle DImageButton The button that toggles the tool menu visibility.
---@field m_bHangOpen boolean Whether the spawn menu stays open (hang-open mode).
---@field CustomizableSpawnlistNode? DTree_Node Injected reference to the customizable spawnlist node (optional).
---@field SearchPropPanel? ContentContainer Injected reference to the search results content panel (optional).
---@field StartupTool? Panel The tool item panel to select and activate on first open (set by toolpanel.lua).
local SpawnMenu = {}

---@class ToolMenu : Panel
local ToolMenu = {}

---Adds an option to the tool menu panel.
---@realm client
---@param tab string The tool tab name.
---@param category string The tool category.
---@param class string The tool class/name.
---@param name string The display name.
---@param cmd string The console command.
---@param config string|nil The config name.
---@param cpanel fun(panel: ControlPanel)|nil Callback used to populate the control panel.
---@param data table|nil Additional tool menu option data.
function ToolMenu:AddToolMenuOption(tab, category, class, name, cmd, config, cpanel, data) end

--- A taunt camera object returned by [TauntCamera](https://wiki.facepunch.com/gmod/Global.TauntCamera).
--- Used by player classes to drive a third-person taunt view.
--- Source: garrysmod/gamemodes/base/gamemode/player_class/taunt_camera.lua
---@class TauntCamera
local TauntCamera = {}

---Returns whether the local player should be drawn while the taunt camera is active.
---@param ply Player The player the camera is following.
---@param on boolean Whether the taunt camera is currently active.
---@return boolean # True if the local player should be drawn.
function TauntCamera:ShouldDrawLocalPlayer(ply, on) end

---Adjusts the player's view for the taunt camera.
---@param view table The view table (see Structures/CamData).
---@param ply Player The player the camera is following.
---@param on boolean Whether the taunt camera is currently active.
---@return boolean # True if the view was modified.
function TauntCamera:CalcView(view, ply, on) end

---Processes the player's movement command for the taunt camera.
---@param cmd CUserCmd The movement command to adjust.
---@param ply Player The player the camera is following.
---@param on boolean Whether the taunt camera is currently active.
---@return boolean # True if the command was handled.
function TauntCamera:CreateMove(cmd, ply, on) end

---@meta

--- The prototype object for Sandbox tools. All tools are created from this object
--- via `ToolObj:Create()`, which returns a fresh `TOOL` instance that individual
--- stool files then configure.
---
--- `ToolObj` shares most behavior with `Tool`; it only differs in the factory
--- method used to spawn a new `TOOL` table.
---@class ToolObj : Tool
---@field Create fun(self: ToolObj): TOOL Factory method that returns a new `TOOL` instance.
---@field Objects ToolObjects Array of stored constraint objects indexed 1-based.
ToolObj = ToolObj or {}

---Stores a selected object in `Objects`.
---@param id number
---@param ent Entity
---@param pos Vector
---@param phys PhysObj|nil
---@param bone number
---@param normal Vector
function ToolObj:SetObject(id, ent, pos, phys, bone, normal) end

---@class VoiceNotify : DPanel
---@field LabelName DLabel
---@field Avatar AvatarImage
---@field Color Color
---@field ply Player
local VoiceNotify = {}

---@param ply Player
function VoiceNotify:Setup(ply) end

---Base scripted AI entity shipped by the base gamemode.
---@source garrysmod/gamemodes/base/entities/entities/base_ai/init.lua
---@class base_ai : NPC
local base_ai = {}

---Base scripted animated entity shipped by the base gamemode.
---@source garrysmod/gamemodes/base/entities/entities/base_anim.lua
---@class base_anim : base_entity
local base_anim = {}

---Base scripted brush entity shipped by the base gamemode.
---@source garrysmod/gamemodes/base/entities/entities/base_brush.lua
---@class base_brush : base_entity
local base_brush = {}

---Root scripted entity base shipped by the base gamemode.
---@source garrysmod/gamemodes/base/entities/entities/base_entity/shared.lua
---@class base_entity : Entity
local base_entity = {}

---Base scripted filter entity shipped by the base gamemode.
---@source garrysmod/gamemodes/base/entities/entities/base_filter.lua
---@class base_filter : base_entity
local base_filter = {}

---Sandbox scripted entity base that stores creator/player ownership metadata.
---@source garrysmod/gamemodes/sandbox/entities/entities/base_gmodentity.lua
---@class base_gmodentity : Entity
local base_gmodentity = {}

---Sets the owning player for Sandbox-derived entities.
---@realm shared
---@param ply? Player|NULL The owning player.
function base_gmodentity:SetPlayer(ply) end

---Returns the owning player for Sandbox-derived entities.
---@realm shared
---@return Player|NULL
function base_gmodentity:GetPlayer() end

---Returns the owning player's unique ID for Sandbox-derived entities.
---@realm shared
---@return number
function base_gmodentity:GetPlayerIndex() end

---Returns the owning player's SteamID64 for Sandbox-derived entities.
---@realm shared
---@return string
function base_gmodentity:GetPlayerSteamID() end

---Returns the owning player's display name for Sandbox-derived entities.
---@realm shared
---@return string
function base_gmodentity:GetPlayerName() end

---Base scripted NextBot entity shipped by the base gamemode.
---@source garrysmod/gamemodes/base/entities/entities/base_nextbot/shared.lua
---@class base_nextbot : NextBot
local base_nextbot = {}

---Base scripted point entity shipped by the base gamemode.
---@source garrysmod/gamemodes/base/entities/entities/base_point.lua
---@class base_point : base_entity
local base_point = {}

---@class env_fire : Entity
local env_fire = {}

---@class env_fog_controller : Entity
local env_fog_controller = {}

---@class env_projectedtexture : Entity
local env_projectedtexture = {}

---@class env_sun : Entity
local env_sun = {}

---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_button.lua
---@class gmod_button : base_gmodentity
local gmod_button = {}

---@realm shared
---@return integer
function gmod_button:GetKey() end

---@realm shared
---@param key integer
function gmod_button:SetKey(key) end

---@realm shared
---@return boolean
function gmod_button:GetOn() end

---@realm shared
---@param on boolean
function gmod_button:SetOn(on) end

---@realm shared
---@return boolean
function gmod_button:GetIsToggle() end

---@realm shared
---@param isToggle boolean
function gmod_button:SetIsToggle(isToggle) end

---@realm shared
---@return string
function gmod_button:GetLabel() end

---@realm shared
---@param label string
function gmod_button:SetLabel(label) end

---@realm shared
---@param bEnable boolean
---@param ply? Player
function gmod_button:Toggle(bEnable, ply) end

---@realm shared
function gmod_button:UpdateLever() end

---@class gmod_cameraprop : Entity
local gmod_cameraprop = {}

---Sets the entity and local position tracked by the camera prop.
---@realm server
---@param ent Entity|NULL The entity to track, or NULL for no target.
---@param localPos Vector The local tracking position.
function gmod_cameraprop:SetTracking(ent, localPos) end

---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_dynamite.lua
---@class gmod_dynamite : base_gmodentity
local gmod_dynamite = {}

---@realm shared
---@return boolean
function gmod_dynamite:GetShouldRemove() end

---@realm shared
---@param shouldRemove boolean
function gmod_dynamite:SetShouldRemove(shouldRemove) end

---@realm shared
---@return number
function gmod_dynamite:GetDamage() end

---@realm shared
---@param damage number
function gmod_dynamite:SetDamage(damage) end

---@realm shared
---@return number
function gmod_dynamite:GetDelay() end

---@realm shared
---@param delay number
function gmod_dynamite:SetDelay(delay) end

---@realm shared
---@param damage number
function gmod_dynamite:Setup(damage) end

---@realm server
function gmod_dynamite:HandleQueuedExplosions() end

---@realm shared
---@param delayOverride? number
---@param ply? Entity Fallbacks to self when no valid attacker entity is supplied.
function gmod_dynamite:Explode(delayOverride, ply) end

---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_hoverball.lua
---@class gmod_hoverball : base_gmodentity
local gmod_hoverball = {}

---@realm shared
---@return boolean
function gmod_hoverball:GetEnabled() end

---@realm shared
---@param enabled boolean
function gmod_hoverball:SetEnabled(enabled) end

---@realm shared
---@return number
function gmod_hoverball:GetTargetZ() end

---@realm shared
---@param z number
function gmod_hoverball:SetTargetZ(z) end

---@realm shared
---@return number
function gmod_hoverball:GetSpeedVar() end

---@realm shared
---@param speed number
function gmod_hoverball:SetSpeedVar(speed) end

---@realm shared
---@return number
function gmod_hoverball:GetAirResistanceVar() end

---@realm shared
---@param resistance number
function gmod_hoverball:SetAirResistanceVar(resistance) end

---@realm shared
---@return number
function gmod_hoverball:GetSpeed() end

---@realm shared
---@param s number
function gmod_hoverball:SetSpeed(s) end

---@realm shared
---@return number
function gmod_hoverball:GetAirResistance() end

---@realm shared
---@param num number
function gmod_hoverball:SetAirResistance(num) end

---@realm shared
---@param z number
function gmod_hoverball:SetZVelocity(z) end

---@realm shared
---@param strength number
function gmod_hoverball:SetStrength(strength) end

---@realm shared
function gmod_hoverball:Toggle() end

---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_lamp.lua
---@class gmod_lamp : base_gmodentity
local gmod_lamp = {}

---@class gmod_lamp.LightInfo
---@field Offset Vector
---@field Angle Angle
---@field NearZ number
---@field Scale number
---@field Skin number

---@realm shared
---@return boolean
function gmod_lamp:GetOn() end

---@realm shared
---@param on boolean
function gmod_lamp:SetOn(on) end

---@realm shared
---@return boolean
function gmod_lamp:GetToggle() end

---@realm shared
---@param toggle boolean
function gmod_lamp:SetToggle(toggle) end

---@realm shared
---@return number
function gmod_lamp:GetLightFOV() end

---@realm shared
---@param fov number
function gmod_lamp:SetLightFOV(fov) end

---@realm shared
---@return number
function gmod_lamp:GetDistance() end

---@realm shared
---@param distance number
function gmod_lamp:SetDistance(distance) end

---@realm shared
---@return number
function gmod_lamp:GetBrightness() end

---@realm shared
---@param brightness number
function gmod_lamp:SetBrightness(brightness) end

---@realm shared
---@param ply? Player Extra arguments are ignored by the entity method but passed by the drive property.
---@return string
function gmod_lamp:GetEntityDriveMode(ply) end

---@realm shared
---@return gmod_lamp.LightInfo
function gmod_lamp:GetLightInfo() end

---@realm server
---@param bOn boolean
function gmod_lamp:Switch(bOn) end

---@realm server
---@param bOn boolean
function gmod_lamp:OnSwitch(bOn) end

---@realm server
function gmod_lamp:Toggle() end

---@realm server
---@param name string
---@param old any
---@param new any
function gmod_lamp:OnUpdateLight(name, old, new) end

---@realm server
function gmod_lamp:UpdateLight() end

---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_thruster.lua
---@class gmod_thruster : base_gmodentity
local gmod_thruster = {}

---@realm shared
---@param name string
function gmod_thruster:SetEffect(name) end

---@realm shared
---@return string
function gmod_thruster:GetEffect() end

---@realm shared
---@param on boolean
function gmod_thruster:SetOn(on) end

---@realm shared
---@return boolean
function gmod_thruster:IsOn() end

---@realm shared
---@param v Vector
function gmod_thruster:SetOffset(v) end

---@realm shared
---@return Vector
function gmod_thruster:GetOffset() end

---@realm server
---@param force? number
---@param mul? number
function gmod_thruster:SetForce(force, mul) end

---@realm server
---@param mul number
---@param bDown boolean
function gmod_thruster:AddMul(mul, bDown) end

---@realm server
---@param on boolean
---@return boolean
function gmod_thruster:Switch(on) end

---@realm server
---@param sound string
function gmod_thruster:SetSound(sound) end

---@realm server
function gmod_thruster:StartThrustSound() end

---@realm server
function gmod_thruster:StopThrustSound() end

---@realm server
---@param tog boolean
function gmod_thruster:SetToggle(tog) end

---@realm server
---@return boolean
function gmod_thruster:GetToggle() end

---@class gmod_wheel : Entity
local gmod_wheel = {}

---@realm server
---@param motor table The wheel constraint motor data.
function gmod_wheel:SetMotor(motor) end

---@realm server
---@param direction number The wheel direction.
function gmod_wheel:SetDirection(direction) end

---@realm server
---@param axis Vector The wheel axis.
function gmod_wheel:SetAxis(axis) end

---@realm server
function gmod_wheel:DoDirectionEffect() end

---@source garrysmod/lua/includes/modules/constraint.lua
---@class gmod_winch_constraint : Entity
---@field Ent1 Entity First constrained entity.
---@field Ent2 Entity Second constrained entity.
---@field Phys1 PhysObj First constrained physics object.
---@field Phys2 PhysObj Second constrained physics object.
---@field LPos1 Vector First local constraint position.
---@field LPos2 Vector Second local constraint position.
---@field fwd_speed number Forward winch/hydraulic speed.
---@field bwd_speed number Backward winch/hydraulic speed.
---@field period number Muscle period.
---@field amplitude number Muscle amplitude.
---@field toggle boolean Toggle behavior flag.
local gmod_winch_constraint = {}

---@source garrysmod/gamemodes/sandbox/entities/entities/gmod_winch_controller.lua
---@class gmod_winch_controller : Entity
---@field constraint gmod_winch_constraint The spring constraint being managed.
---@field rope Entity The rope (keyframe_rope or ents.CreateClientRope) being managed.
---@field direction integer Direction of movement: -1 (DIR_BACKWARD), 0 (DIR_NONE), 1 (DIR_FORWARD).
---@field toggle boolean Toggle behavior flag inherited from constraint.
---@field current_length number Current simulated length of the rope.
---@field min_length number Minimum length limit.
---@field max_length? number Optional maximum length limit.
---@field type integer Controller type: 0 (TYPE_NORMAL), 1 (TYPE_MUSCLE).
---@field ctime number Muscle cycle/timer progress tracker.
---@field isexpanded boolean Expansion limit state flag.
---@field last_time number Real timestamp of the previous think cycle.
---@field init_time number Real timestamp of entity initialization.
local gmod_winch_controller = {}

---@realm server
---@return integer
function gmod_winch_controller:GetDirection() end

---@realm server
---@param n integer
function gmod_winch_controller:SetDirection(n) end

---@realm server
---@return boolean
function gmod_winch_controller:IsExpanded() end

---@class npc_manhack : Entity
local npc_manhack = {}

---@class npc_rollermine : Entity
local npc_rollermine = {}

---@class prop_dynamic : Entity
local prop_dynamic = {}

---@class prop_dynamic_override : Entity
local prop_dynamic_override = {}

---@class prop_physics : Entity
local prop_physics = {}

---@class prop_ragdoll : Entity
local prop_ragdoll = {}

---@class prop_vehicle_prisoner_pod : Vehicle
local prop_vehicle_prisoner_pod = {}
