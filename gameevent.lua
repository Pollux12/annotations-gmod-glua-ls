---@meta

--- Used to interface with the built-in game events system.
---
--- **NOTE**: All Serverside gameevents are networked and called clientside. It could happen that a gameevent is called twice because of this like [OnRequestFullUpdate](https://wiki.facepunch.com/gmod/gameevent/OnRequestFullUpdate).
---
--- The following is a list of all available game events.
gameevent = {}

--- Called when a player earns an achievement.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/achievement_earned
---@class (partial) achievement_earned
---The achievement ID.
---@field achievement number
---The Player:UserID of the player.
---@field player number

local achievement_earned = {}

--- Called when a player makes progress on an achievement.
---
--- **NOTE**: Only called clientside for the player who made progress.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/achievement_event
---@class (partial) achievement_event
---the name of the achievement.
---@field achievement_name string
---amount of steps toward achievement.
---@field cur_val number
---total amount of steps in achievement.
---@field max_val number

local achievement_event = {}

--- Called when a func_break is broken by a player.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/break_breakable
---@class (partial) break_breakable
---The Entity:EntIndex of the broken prop.
---@field entindex number
---The Player:UserID of the connected player.
---@field userid number
---Material index of the broken entity.
---@field material number

local break_breakable = {}

--- Called when a prop_dynamic or prop_physics is broken by a player.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/break_prop
---@class (partial) break_prop
---The Entity:EntIndex of the broken prop.
---@field entindex number
---The Player:UserID of the connected player. Seems to be 0 every time.
---@field userid number

local break_prop = {}

--- Called when trying to connect to a Server.
---
--- **NOTE**: This is only available in the Menu state because this is called before the Client State has even started.
--- 	When this is event is called, it will reset [engine.TickCount](https://wiki.facepunch.com/gmod/engine.TickCount) back to **1**.
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/client_beginconnect
---@class (partial) client_beginconnect
---The Server address. Will be `localhost:27015` in hosted games.
---@field address string
---The IP of the Server. Will be `16777343` in hosted games. Use the `address` instead of this.
---@field ip number
---The port of the Server. Will be `27015` in hosted games.
---@field port number
---The Source why the client is trying to connect to the Server.
--- 			If you use `connect [IP:Port]` to connect to a Server, this will be an empty string.
---@field source string

local client_beginconnect = {}

--- Called when the connection to a Server has been established.
---
--- **NOTE**: This is only available in the Menu state because this is called before the Client State has even started.
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/client_connected
---@class (partial) client_connected
---The Server address. Will be **loopback** in hosted games.
---@field address string
---The IP of the Server. Will be **0** in hosted games. Use the **address** instead of this.
---@field ip number
---The port of the Server. Will be **0** in hosted games.
---@field port number

local client_connected = {}

--- Called when the client is disconnecting from the server.
---
--- **NOTE**: Only called clientside for the disconnecting Player.
--- 	message - will be an empty String if the client intentionally disconnects from the server.
--- 	This is called multiple times in the **Menu state** when connecting to a server.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/client_disconnect
---@class (partial) client_disconnect
---The disconnecting reason. Can be an empty String.
---@field message string

local client_disconnect = {}

--- Called when an entity dies.
---
--- **NOTE**: This is not called when a player dies using [Player:KillSilent](https://wiki.facepunch.com/gmod/Player:KillSilent).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/entity_killed
---@class (partial) entity_killed
---The Entity:EntIndex of the inflictor.
---@field entindex_inflictor number
---The Entity:EntIndex of the attacker.
---@field entindex_attacker number
---Damage type(s), a combination of Enums/DMG.
---@field damagebits number
---The Entity:EntIndex of the victim.
---@field entindex_killed number

local entity_killed = {}

--- Called when a flare sets an NPC on fire.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/flare_ignite_npc
---@class (partial) flare_ignite_npc
---The Entity:EntIndex of the ignited NPC.
---@field entindex number

local flare_ignite_npc = {}

--- Called when the freeze cam starts spectating something.
--- Example cause:
--- ```
--- local ply = Entity( 1 )
--- ply:Spectate( OBS_MODE_FREEZECAM )
---
--- ply:SpectateEntity( ply )
--- ```
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/freezecam_started
---@class (partial) freezecam_started
local freezecam_started = {}

--- Called when a map is loaded.
---
--- **NOTE**: This is only available in the Menu state because this is called before the Client State has even started.
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/game_newmap
---@class (partial) game_newmap
---The Map name.
---@field mapname string

local game_newmap = {}

--- Called when the freeze cam is finished.
--- Example cause:
--- ```
--- local ply = Entity( 1 )
--- ply:Spectate( OBS_MODE_FREEZECAM )
---
--- timer.Simple( 1, function()
--- 	ply:UnSpectate()
--- end )
--- ```
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hide_freezepanel
---@class (partial) hide_freezepanel
local hide_freezepanel = {}

--- Called when a Client becomes the Cameraman.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_cameraman
---@class (partial) hltv_cameraman
---The Entity:EntIndex of the new Cameraman.
---@field index number

local hltv_cameraman = {}

--- Called when the HLTV observer mode changes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_changed_mode
---@class (partial) hltv_changed_mode
---The new Enums/OBS_MODE.
---@field newmode number
---The Entity:EntIndex of our Target.
---@field obs_target number
---The old Enums/OBS_MODE.
---@field oldmode number

local hltv_changed_mode = {}

--- Called when the HLTV observer target changes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_changed_target
---@class (partial) hltv_changed_target
---The Enums/OBS_MODE.
---@field mode number
---The Entity:EntIndex of the new Target.
---@field obs_target number
---The Entity:EntIndex of the old Target.
---@field old_target number

local hltv_changed_target = {}

--- Called when the view changes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_chase
---@class (partial) hltv_chase
---The distance from the Target.
---@field distance number
---The inertia.
---@field inertia number
---`1` if we should use Enums/OBS_MODE. else, we use Enums/OBS_MODE.
---@field ineye number
---The phi.
---@field phi number
---The Entity:EntIndex of the Primary target.
---@field target1 number
---The Entity:EntIndex of the Secondary target.
---@field target2 number
---The theta.
---@field theta number

local hltv_chase = {}

--- Called when the fixed view changes.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_fixed
---@class (partial) hltv_fixed
---The X position.
---@field posx number
---The Y position.
---@field posy number
---The Z position.
---@field posz number
---The phi.
---@field phi number
---The Entity:EntIndex of the target.
---@field target number
---The theta.
---@field theta number
---The FOV.
---@field fov number

local hltv_fixed = {}

--- Called when a message is sent with `tv_msg`.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_message
---@class (partial) hltv_message
---The Text.
---@field text string

local hltv_message = {}

--- Called when the HLTV ranks all cameras.
---@realm server
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_rank_camera
---@class (partial) hltv_rank_camera
---The id of the Camera.
---@field index number
---The rank.
---@field rank number
---The Entity:EntIndex of the Target.
---@field target number

local hltv_rank_camera = {}

--- Called when the HLTV ranks all players.
---@realm server
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_rank_entity
---@class (partial) hltv_rank_entity
---The Entity:EntIndex of the Entity.
---@field index number
---The rank.
---@field rank number
---The Entity:EntIndex of the Target.
---@field target number

local hltv_rank_entity = {}

--- Called when the HLTVServer stats are updated.
--- They should be updated every 8 seconds.
--- All of these stats are global and shared by the master server.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_status
---@class (partial) hltv_status
---The address of the master.
---@field master string
---The number of total clients.
---@field clients number
---The number of total slots.
---@field slots number
---The number of total proxies.
---@field proxies number

local hltv_status = {}

--- Called when the SourceTV client is spawned.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/hltv_title
---@class (partial) hltv_title
---The SourceTV Name.
---@field text string

local hltv_title = {}

--- Called **only** in the specific realm when the game is existing.
---
--- **NOTE**: This is not called reliable serverside.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/host_quit
---@class (partial) host_quit
local host_quit = {}

---Adds a [game event](https://wiki.facepunch.com/gmod/gameevent) listener, creating a new hook using the [hook](https://wiki.facepunch.com/gmod/hook) library, which can be listened to via [hook.Add](https://wiki.facepunch.com/gmod/hook.Add) with the given `eventName` as event.
--- **NOTE**: All gameevents are called in the **Menu State**, but if you want to use them you need to use some DLL(like [this](https://github.com/RaphaelIT7/gmod-gameevent) one) or you need to create your own.
---@realm shared
---@source https://wiki.facepunch.com/gmod/gameevent.Listen
---@param eventName string The event to listen to. List of valid events (with examples) can be found [here](https://wiki.facepunch.com/gmod/gameevent).
function gameevent.Listen(eventName) end

--- Called when a player requests a full update from the server.
--- Called Clientside when the Update is received or when another player requested a full update.
---
--- **NOTE**: When this event is called the first time for a client, [net](https://wiki.facepunch.com/gmod/net) messages will be reliably received by the client.
--- 	This gameevent is called twice for the player, because it is first called serverside and networked, but then also called clientside.
---
---
--- 	If `sv_parallel_sendsnapshot` is enabled, then this gameevent **won't** be called reliably since currently gmod discards of gameevents from other threads.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/OnRequestFullUpdate
---@class (partial) OnRequestFullUpdate
---The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@field networkid string
---The Player:Nick the player has.
---@field name string
---The Player:UserID the player has.
---@field userid number
---The Entity:EntIndex of the player, minus one.
---@field index number

local OnRequestFullUpdate = {}

--- Called when a player has entered the game (connected and loaded).
--- From this point you can use [Global.Player](https://wiki.facepunch.com/gmod/Global.Player)(userid) (serverside or in singleplayer).
---
--- **NOTE**: This is called almost directly after [GM:PlayerInitialSpawn](https://wiki.facepunch.com/gmod/GM:PlayerInitialSpawn) in the same tick, so you could just use that hook serverside.
---
--- **WARNING**: Just like [GM:PlayerInitialSpawn](https://wiki.facepunch.com/gmod/GM:PlayerInitialSpawn), players may not have finished loading when its called. See the warning in [GM:PlayerInitialSpawn](https://wiki.facepunch.com/gmod/GM:PlayerInitialSpawn) for more details about possible issues
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_activate
---@class (partial) player_activate
---The Player:UserID of the Player.
---@field userid number

local player_activate = {}

--- Called when a player changes their Steam name.
--- **NOTE**: Functions like [Player:Nick](https://wiki.facepunch.com/gmod/Player:Nick) return the old name here.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_changename
---@class (partial) player_changename
---The Player:UserID of the Player.
---@field userid number
---The old Name.
---@field oldname string
---The new Name.
---@field newname string

local player_changename = {}

--- Called when a player connects to the server.
---
--- **NOTE**: This is only called serverside AND clientside for the listen server host. In other cases it's called serverside.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_connect
---@class (partial) player_connect
---0 if the player isn't a bot, 1 if they are.
---@field bot number
---The Player:SteamID the player has.
--- Will be `BOT` for bots, `STEAM_0:0:0` or `STEAM_ID_PENDING` in single-player, and `STEAM_ID_LAN` when using the `-multirun` client option.
---@field networkid string
---The Player:Nick the player has.
---@field name string
---The Player:UserID the player has.
---@field userid number
---The Entity:EntIndex of the player, minus one.
---@field index number
---The Player:IPAddress of the connecting player.
--- Will be `none` for bots and `loopback` for listen server and single-player hosts.
---@field address string

local player_connect = {}

--- Called when a player connects to the server.
---
--- **NOTE**: This is not called clientside for the local player or in single-player.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_connect_client
---@class (partial) player_connect_client
---0 if the player isn't a bot, 1 if they are.
---@field bot number
---The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@field networkid string
---The Player:Nick the player has.
---@field name string
---The Player:UserID the player has.
---@field userid number
---The Entity:EntIndex of the player, minus one.
---@field index number

local player_connect_client = {}

--- Called when a player disconnects from the server.
---
--- **NOTE**: This is also called when a player cancels connecting to the server.
--- 	This is not called clientside for the local player or in single-player.
--- 	When this gameevent is called on the client side, the player will be NULL!. so you cannot use `Player(data.userid)`!
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_disconnect
---@class (partial) player_disconnect
---0 if the player isn't a bot, 1 if they are.
---@field bot number
---The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@field networkid string
---The Player:Nick the player has.
---@field name string
---The Player:UserID the player has.
---@field userid number
---The disconnect reason.
---@field reason string

local player_disconnect = {}

--- Called when the player takes damage.
---
--- 		**NOTE**: This is called after [GM:EntityTakeDamage](https://wiki.facepunch.com/gmod/GM:EntityTakeDamage) so you could just use that hook serverside.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_hurt
---@class (partial) player_hurt
---The new health after being damaged.
---@field health number
---Event priority number used by HLTV.
---@field priority number
---The Player:UserID of the victim.
---@field userid number
---The Player:UserID of the attacker.
---@field attacker number

local player_hurt = {}

--- Called when a player's info has changed over the network.
--- When a Client joins the Server, this gameevent is called for each player on the server for the client.
--- So if 32 Players are on the Server, this gameevent is called 32 times on the Client.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_info
---@class (partial) player_info
---The Player:AccountID of the Player.
---@field friendsid number
---The Entity:EntIndex of the Player minus one.
---@field index number
---1 or 0 if it is a bot or not.
---@field bot number
---The Player:UserID of the Player.
---@field userid number
---The Player:Name of the Player.
---@field name string
---The Player:SteamID of the Player.
---@field networkid string

local player_info = {}

--- Called when the player says a message.
---
--- 		**NOTE**: This is called after [GM:PlayerSay](https://wiki.facepunch.com/gmod/GM:PlayerSay) so you could just use that hook serverside.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_say
---@class (partial) player_say
---Event priority number used by HLTV. Hardcoded to be 1.
---@field priority number
---The Player:UserID of the Player. For Console the UserID is 0.
---@field userid number
---The text that was said.
---@field text string
---`1` If it's only for the team, else `0`.
---@field teamonly number

local player_say = {}

--- Called when a player spawns.
---
--- 		**NOTE**: This is not called clientside for the local player or in single-player.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/player_spawn
---@class (partial) player_spawn
---The Player:UserID the player has.
---@field userid number

local player_spawn = {}

--- Called when a Ragdoll is going to be Dissolved.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/ragdoll_dissolved
---@class (partial) ragdoll_dissolved
---The Entity:EntIndex of the disolved Ragdoll.
---@field entindex number

local ragdoll_dissolved = {}

--- Called when a Player is banned using [Player:Ban](https://wiki.facepunch.com/gmod/Player:Ban), **banip** or the **banid** command.
---
--- **NOTE**: If **banip** was used the networkid will be an empty string.
--- 	If **banid** was used the ip will be an empty string.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/server_addban
---@class (partial) server_addban
---The Player:SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@field networkid string
---The Player:Nick the player has.
---@field name string
---The Player:UserID the player has.
---@field userid number
---The Player:IPAddress of the player.
---@field ip string
---The Duration of the Ban (in minutes).
---@field duration string
---The name of the Person who Banned the Player or Console.
---@field by string
---whether the player was also kicked.
---@field kicked boolean

local server_addban = {}

--- Called when a convar with FCVAR_NOTIFY is changed on the server.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/server_cvar
---@class (partial) server_cvar
---The convar name. e.g "sv_cheats".
---@field cvarname string
---The new value. Always a string. e.g "1".
---@field cvarvalue string

local server_cvar = {}

--- Called when a Player is unbanned using the **removeid** or **removeip** command.
---
--- **NOTE**: If the player was banned using **banip** was used the networkid will be an empty string.
--- 	If the player was banned using **banid** was used the ip will be an empty string.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/server_removeban
---@class (partial) server_removeban
---The Player:SteamID of the banned Player.
---@field networkid string
---The Player:IPAddress of the banned Player.
---@field ip string
---The Person who unbanned the Player. Can be Console.
---@field by string

local server_removeban = {}

--- Called when joining a Server or when a Server spawned.
---
--- **NOTE**: This is only available in the Menu state because this is called before the Client or Server State has even started.
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/server_spawn
---@class (partial) server_spawn
---The hostname of the Server.
---@field hostname string
---The Server address. Will be **loopback** in hosted games.
---@field address string
---The IP of the Server. Will be **0** in hosted games. Use the **address** instead of this.
---@field ip number
---The port of the Server. Will be **0** in hosted games.
---@field port number
---The Game the Server is hosting. Will be **garrysmod**.
---@field game string
---The mapname the Server is currently on.
---@field mapname string
---The amount of slots the server has.
---@field maxplayers number
---The OS of the Server. **W**(WIN32), **L**(LINUX) or **O**(OSX).
---@field os string
---true if it's a dedicated server.
---@field dedicated boolean
---true if the Server is password protected.
---@field password boolean

local server_spawn = {}

--- Called when the freeze cam is started.
--- Example cause:
--- ```
--- Player:Spectate(OBS_MODE_FREEZECAM)
--- ```
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/show_freezepanel
---@class (partial) show_freezepanel
---The Index of the Entity that is being spectated or `0`.
---@field killer number

local show_freezepanel = {}

--- Called when the Achievement Manager received the steam user stat data.
--- As soon as this is called, all achievement data should be valid.
--- Trying to access any achievement data before this may return in inaccurate data.
---@realm menu
---@source https://wiki.facepunch.com/gmod/gameevent/user_data_downloaded
---@class (partial) user_data_downloaded
local user_data_downloaded = {}
