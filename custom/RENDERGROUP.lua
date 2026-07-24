---Enumerations used by `ClientsideModel`, `ENT.RenderGroup`, and `Entity:GetRenderGroup`.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/RENDERGROUP
---@readonly
RENDERGROUP_STATIC_HUGE = 0
---@readonly
RENDERGROUP_OPAQUE_HUGE = 1
---@readonly
RENDERGROUP_NONE = 5
---@readonly
RENDERGROUP_STATIC = 6
---@readonly
RENDERGROUP_OPAQUE = 7
---@readonly
RENDERGROUP_TRANSLUCENT = 8
---@readonly
RENDERGROUP_BOTH = 9
---@readonly
RENDERGROUP_VIEWMODEL = 10
---@readonly
RENDERGROUP_VIEWMODEL_TRANSLUCENT = 11
---@readonly
RENDERGROUP_OPAQUE_BRUSH = 12
---@readonly
RENDERGROUP_OTHER = 13

---@alias RENDERGROUP
---| number # Raw numeric enum value
---| 0 # RENDERGROUP_STATIC_HUGE
---| 1 # RENDERGROUP_OPAQUE_HUGE
---| 5 # RENDERGROUP_NONE
---| 6 # RENDERGROUP_STATIC
---| 7 # RENDERGROUP_OPAQUE
---| 8 # RENDERGROUP_TRANSLUCENT
---| 9 # RENDERGROUP_BOTH
---| 10 # RENDERGROUP_VIEWMODEL
---| 11 # RENDERGROUP_VIEWMODEL_TRANSLUCENT
---| 12 # RENDERGROUP_OPAQUE_BRUSH
---| 13 # RENDERGROUP_OTHER
