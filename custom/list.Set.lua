---@meta

---Defines a desktop window entry registered via `list.Set("DesktopWindows", ...)`.
---@class DesktopWindowEntry
---@field title string The window title shown in the context menu icon label.
---@field icon string The icon material path shown in the context menu.
---@field width number The initial window width in pixels.
---@field height number The initial window height in pixels.
---@field onewindow boolean If true, only one instance of this window may be open at a time.
---@field init fun(widgetIcon: Panel, window: DFrame) Called when the user clicks the context menu icon. `widgetIcon` is the DButton icon that was clicked; `window` is the newly created DFrame.

---@overload fun(identifier: "DesktopWindows", key: string, item: DesktopWindowEntry)
---@overload fun(identifier: "SkeletonConvertor", key: string, item: SkeletonConvertor)
---@param identifier string The identifier for the list.
---@param key any The key in the list.
---@param item any The value to set.
function list.Set(identifier, key, item) end
