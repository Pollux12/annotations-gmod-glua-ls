---Creates an entity. This function will fail and return `NULL` if the networked-edict limit is hit (around **8176**), or the provided entity class doesn't exist.
--- **WARNING**: Do not use before GM:InitPostEntity has been called, otherwise the server will crash!
--- If you need to perform entity creation when the game starts, create a hook for GM:InitPostEntity and do it there.
---@realm server
---@source https://wiki.facepunch.com/gmod/ents.Create
---@generic T : Entity
---@param class `T` The classname of the entity to create.
---@return (instance) T|NULL # The created entity, or `NULL` if failed.
function ents.Create(class) end
