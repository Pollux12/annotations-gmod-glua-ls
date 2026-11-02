---**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [motionsensor.BuildSkeleton](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using_The_Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect_developing).
---@realm shared
---@source https://wiki.facepunch.com/gmod/motionsensor.ProcessAnglesTable
---@param translator table 
---@param sensor table<number, Vector> 
---@param pos table<number, Vector> 
---@param rotation Angle 
---@return table<number, Angle> # Ang. If `!translator.AnglesTable` then `return {}`
function motionsensor.ProcessAnglesTable(translator, sensor, pos, rotation) end
