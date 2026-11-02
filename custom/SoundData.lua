---@realm shared
---@source https://wiki.facepunch.com/gmod/Structures/SoundData
---@class SoundData
local SoundData = {}

---Path to the sound file to be used in this sound effect, relative to `sound/` directory (so exclude the `sound/` part).
---
--- Can be a table of sound files, in which case the sound will be chosen randomly every time from the provided list.
---
--- Each sound path can be prepended with a special character for special effects. You can learn more about this [here](https://developer.valvesoftware.com/wiki/Soundscripts#Sound_Characters).
---@type string|string[]
SoundData.sound = nil

---The name of the soundscript, to be referenced by in functions such as Entity:EmitSound.
---@type string
SoundData.name = nil

---The sound channel to play in. See Enums/CHAN
---@type CHAN?
SoundData.channel = CHAN_AUTO

---The soundlevel of the sound in dB. See Enums/SNDLVL. This will affect how far the sound can be heard.
---@type SNDLVL?
SoundData.level = SNDLVL_NORM

---The volume of the sound as a decimal between `0` and `1`. Can be a table of two numbers, a minimum and a maximum value.
---
--- **Warning:** Volume of `0` will act as volume of `1`
---@type number?
SoundData.volume = 1.0

---The pitch of the sound. Can be a table of two numbers, a minimum and a maximum value.
---@type number|number[]?
SoundData.pitch = 100

---@deprecated Use pitch instead.
---The initial pitch.
--- Use pitch instead.
---@type number?
SoundData.pitchstart = 100

---@deprecated Use pitch instead.
---The pitch end.
--- Use pitch instead.
---@type number?
SoundData.pitchend = 100
