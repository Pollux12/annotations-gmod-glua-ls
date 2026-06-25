---@class PostProcessConVarState
---@field on string Value written when the post-process effect is enabled.
---@field off? string Value written when the post-process effect is disabled.

---@class (partial) PostProcessIcon : ContentIcon
---@field ConVars table<string, PostProcessConVarState> Console variables controlled by this post-process icon.
---@field PP table Runtime post-process metadata from `list.GetEntry("PostProcess", name)`.
---@field checkbox DCheckBox The optional enable/disable checkbox.
---@field cp ControlPanel? Lazily-created control panel for this post-process entry.
local PostProcessIcon = {}
