---@meta

--- Enumerations used by [Entity:SetUseType](https://wiki.facepunch.com/gmod/Entity:SetUseType). Affects when [ENTITY:Use](https://wiki.facepunch.com/gmod/ENTITY:Use) is triggered.
---
--- Not to be confused with [Enums/USE](https://wiki.facepunch.com/gmod/Enums/USE) used for [ENTITY:Use](https://wiki.facepunch.com/gmod/ENTITY:Use) and others.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/_USE
--- Fire a [USE_ON](https://wiki.facepunch.com/gmod/Enums/USE) signal every tick as long as the player holds their use key and aims at the target.
---@readonly
CONTINUOUS_USE = 0
--- Fires a [USE_ON](https://wiki.facepunch.com/gmod/Enums/USE) signal when starting to use an entity, and a [USE_OFF](https://wiki.facepunch.com/gmod/Enums/USE) signal when letting go.
---
--- **WARNING**: There is no guarantee to receive both ON and OFF signals. A signal will only be sent when pushing or letting go of the use key while actually aiming at the entity, so an ON signal might not be followed by an OFF signal if the player is aiming somewhere else when releasing the key, and similarly, an OFF signal may not be preceded by an ON signal if the player started aiming at the entity only after pressing the key.
---
--- Therefore, this method of input is unreliable and should not be used.
---@readonly
ONOFF_USE = 1
--- Like a wheel turning.
---@readonly
DIRECTIONAL_USE = 2
--- Fire a [USE_ON](https://wiki.facepunch.com/gmod/Enums/USE) signal only once when player presses their use key while aiming at the target.
---@readonly
SIMPLE_USE = 3

---@enum _USE : number
---| CONTINUOUS_USE # Fire a [USE_ON](https://wiki.facepunch.com/gmod/Enums/USE) signal every tick as long as the player holds their use key and aims at the target.
---| ONOFF_USE # Fires a [USE_ON](https://wiki.facepunch.com/gmod/Enums/USE) signal when starting to use an entity, and a [USE_OFF](https://wiki.facepunch.com/gmod/Enums/USE) signal when letting go.  **WARNING**: There is no guarantee to receive both ON and OFF signals. A signal will only be sent when pushing or letting go of the use key while actually aiming at the entity, so an ON signal might not be followed by an OFF signal if the player is aiming somewhere else when releasing the key, and similarly, an OFF signal may not be preceded by an ON signal if the player started aiming at the entity only after pressing the key.  Therefore, this method of input is unreliable and should not be used.
---| DIRECTIONAL_USE # Like a wheel turning.
---| SIMPLE_USE # Fire a [USE_ON](https://wiki.facepunch.com/gmod/Enums/USE) signal only once when player presses their use key while aiming at the target.

--- Enumerations used by functions like [Weapon:SendWeaponAnim](https://wiki.facepunch.com/gmod/Weapon:SendWeaponAnim) & [Entity:SelectWeightedSequence](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequence).
---
--- An activity is a code-friendly identifier for an animation, and can point to multiple sequences (animations) depending on the model.
---
--- See [$sequence](https://developer.valvesoftware.com/wiki/$sequence) `.qc` command documentation on Valve Developer Wiki, specifically the `activity` parameter.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/ACT
---@readonly
ACT_INVALID = -1
---@readonly
ACT_RESET = 0
---@readonly
ACT_IDLE = 1
---@readonly
ACT_TRANSITION = 2
---@readonly
ACT_COVER = 3
---@readonly
ACT_COVER_MED = 4
---@readonly
ACT_COVER_LOW = 5
---@readonly
ACT_WALK = 6
---@readonly
ACT_WALK_AIM = 7
---@readonly
ACT_WALK_CROUCH = 8
---@readonly
ACT_WALK_CROUCH_AIM = 9
---@readonly
ACT_RUN = 10
---@readonly
ACT_RUN_AIM = 11
---@readonly
ACT_RUN_CROUCH = 12
---@readonly
ACT_RUN_CROUCH_AIM = 13
---@readonly
ACT_RUN_PROTECTED = 14
---@readonly
ACT_SCRIPT_CUSTOM_MOVE = 15
---@readonly
ACT_RANGE_ATTACK1 = 16
---@readonly
ACT_RANGE_ATTACK2 = 17
---@readonly
ACT_RANGE_ATTACK1_LOW = 18
---@readonly
ACT_RANGE_ATTACK2_LOW = 19
---@readonly
ACT_DIESIMPLE = 20
---@readonly
ACT_DIEBACKWARD = 21
---@readonly
ACT_DIEFORWARD = 22
---@readonly
ACT_DIEVIOLENT = 23
---@readonly
ACT_DIERAGDOLL = 24
---@readonly
ACT_FLY = 25
---@readonly
ACT_HOVER = 26
---@readonly
ACT_GLIDE = 27
---@readonly
ACT_SWIM = 28
---@readonly
ACT_SWIM_IDLE = 29
---@readonly
ACT_JUMP = 30
---@readonly
ACT_HOP = 31
---@readonly
ACT_LEAP = 32
---@readonly
ACT_LAND = 33
---@readonly
ACT_CLIMB_UP = 34
---@readonly
ACT_CLIMB_DOWN = 35
---@readonly
ACT_CLIMB_DISMOUNT = 36
---@readonly
ACT_SHIPLADDER_UP = 37
---@readonly
ACT_SHIPLADDER_DOWN = 38
---@readonly
ACT_STRAFE_LEFT = 39
---@readonly
ACT_STRAFE_RIGHT = 40
---@readonly
ACT_ROLL_LEFT = 41
---@readonly
ACT_ROLL_RIGHT = 42
---@readonly
ACT_TURN_LEFT = 43
---@readonly
ACT_TURN_RIGHT = 44
---@readonly
ACT_CROUCH = 45
---@readonly
ACT_CROUCHIDLE = 46
---@readonly
ACT_STAND = 47
---@readonly
ACT_USE = 48
---@readonly
ACT_SIGNAL1 = 49
---@readonly
ACT_SIGNAL2 = 50
---@readonly
ACT_SIGNAL3 = 51
---@readonly
ACT_SIGNAL_ADVANCE = 52
---@readonly
ACT_SIGNAL_FORWARD = 53
---@readonly
ACT_SIGNAL_GROUP = 54
---@readonly
ACT_SIGNAL_HALT = 55
---@readonly
ACT_SIGNAL_LEFT = 56
---@readonly
ACT_SIGNAL_RIGHT = 57
---@readonly
ACT_SIGNAL_TAKECOVER = 58
---@readonly
ACT_LOOKBACK_RIGHT = 59
---@readonly
ACT_LOOKBACK_LEFT = 60
---@readonly
ACT_COWER = 61
---@readonly
ACT_SMALL_FLINCH = 62
---@readonly
ACT_BIG_FLINCH = 63
---@readonly
ACT_MELEE_ATTACK1 = 64
---@readonly
ACT_MELEE_ATTACK2 = 65
---@readonly
ACT_RELOAD = 66
---@readonly
ACT_RELOAD_START = 67
---@readonly
ACT_RELOAD_FINISH = 68
---@readonly
ACT_RELOAD_LOW = 69
---@readonly
ACT_ARM = 70
---@readonly
ACT_DISARM = 71
---@readonly
ACT_DROP_WEAPON = 72
---@readonly
ACT_DROP_WEAPON_SHOTGUN = 73
---@readonly
ACT_PICKUP_GROUND = 74
---@readonly
ACT_PICKUP_RACK = 75
---@readonly
ACT_IDLE_ANGRY = 76
---@readonly
ACT_IDLE_RELAXED = 77
---@readonly
ACT_IDLE_STIMULATED = 78
---@readonly
ACT_IDLE_AGITATED = 79
---@readonly
ACT_IDLE_STEALTH = 80
---@readonly
ACT_IDLE_HURT = 81
---@readonly
ACT_WALK_RELAXED = 82
---@readonly
ACT_WALK_STIMULATED = 83
---@readonly
ACT_WALK_AGITATED = 84
---@readonly
ACT_WALK_STEALTH = 85
---@readonly
ACT_RUN_RELAXED = 86
---@readonly
ACT_RUN_STIMULATED = 87
---@readonly
ACT_RUN_AGITATED = 88
---@readonly
ACT_RUN_STEALTH = 89
---@readonly
ACT_IDLE_AIM_RELAXED = 90
---@readonly
ACT_IDLE_AIM_STIMULATED = 91
---@readonly
ACT_IDLE_AIM_AGITATED = 92
---@readonly
ACT_IDLE_AIM_STEALTH = 93
---@readonly
ACT_WALK_AIM_RELAXED = 94
---@readonly
ACT_WALK_AIM_STIMULATED = 95
---@readonly
ACT_WALK_AIM_AGITATED = 96
---@readonly
ACT_WALK_AIM_STEALTH = 97
---@readonly
ACT_RUN_AIM_RELAXED = 98
---@readonly
ACT_RUN_AIM_STIMULATED = 99
---@readonly
ACT_RUN_AIM_AGITATED = 100
---@readonly
ACT_RUN_AIM_STEALTH = 101
---@readonly
ACT_CROUCHIDLE_STIMULATED = 102
---@readonly
ACT_CROUCHIDLE_AIM_STIMULATED = 103
---@readonly
ACT_CROUCHIDLE_AGITATED = 104
---@readonly
ACT_WALK_HURT = 105
---@readonly
ACT_RUN_HURT = 106
---@readonly
ACT_SPECIAL_ATTACK1 = 107
---@readonly
ACT_SPECIAL_ATTACK2 = 108
---@readonly
ACT_COMBAT_IDLE = 109
---@readonly
ACT_WALK_SCARED = 110
---@readonly
ACT_RUN_SCARED = 111
---@readonly
ACT_VICTORY_DANCE = 112
---@readonly
ACT_DIE_HEADSHOT = 113
---@readonly
ACT_DIE_CHESTSHOT = 114
---@readonly
ACT_DIE_GUTSHOT = 115
---@readonly
ACT_DIE_BACKSHOT = 116
---@readonly
ACT_FLINCH_HEAD = 117
---@readonly
ACT_FLINCH_CHEST = 118
---@readonly
ACT_FLINCH_STOMACH = 119
---@readonly
ACT_FLINCH_LEFTARM = 120
---@readonly
ACT_FLINCH_RIGHTARM = 121
---@readonly
ACT_FLINCH_LEFTLEG = 122
---@readonly
ACT_FLINCH_RIGHTLEG = 123
---@readonly
ACT_FLINCH_PHYSICS = 124
---@readonly
ACT_IDLE_ON_FIRE = 125
---@readonly
ACT_WALK_ON_FIRE = 126
---@readonly
ACT_RUN_ON_FIRE = 127
---@readonly
ACT_RAPPEL_LOOP = 128
---@readonly
ACT_180_LEFT = 129
---@readonly
ACT_180_RIGHT = 130
---@readonly
ACT_90_LEFT = 131
---@readonly
ACT_90_RIGHT = 132
---@readonly
ACT_STEP_LEFT = 133
---@readonly
ACT_STEP_RIGHT = 134
---@readonly
ACT_STEP_BACK = 135
---@readonly
ACT_STEP_FORE = 136
---@readonly
ACT_GESTURE_RANGE_ATTACK1 = 137
---@readonly
ACT_GESTURE_RANGE_ATTACK2 = 138
---@readonly
ACT_GESTURE_MELEE_ATTACK1 = 139
---@readonly
ACT_GESTURE_MELEE_ATTACK2 = 140
---@readonly
ACT_GESTURE_RANGE_ATTACK1_LOW = 141
---@readonly
ACT_GESTURE_RANGE_ATTACK2_LOW = 142
---@readonly
ACT_MELEE_ATTACK_SWING_GESTURE = 143
---@readonly
ACT_GESTURE_SMALL_FLINCH = 144
---@readonly
ACT_GESTURE_BIG_FLINCH = 145
---@readonly
ACT_GESTURE_FLINCH_BLAST = 146
---@readonly
ACT_GESTURE_FLINCH_BLAST_SHOTGUN = 147
---@readonly
ACT_GESTURE_FLINCH_BLAST_DAMAGED = 148
---@readonly
ACT_GESTURE_FLINCH_BLAST_DAMAGED_SHOTGUN = 149
---@readonly
ACT_GESTURE_FLINCH_HEAD = 150
---@readonly
ACT_GESTURE_FLINCH_CHEST = 151
---@readonly
ACT_GESTURE_FLINCH_STOMACH = 152
---@readonly
ACT_GESTURE_FLINCH_LEFTARM = 153
---@readonly
ACT_GESTURE_FLINCH_RIGHTARM = 154
---@readonly
ACT_GESTURE_FLINCH_LEFTLEG = 155
---@readonly
ACT_GESTURE_FLINCH_RIGHTLEG = 156
---@readonly
ACT_GESTURE_TURN_LEFT = 157
---@readonly
ACT_GESTURE_TURN_RIGHT = 158
---@readonly
ACT_GESTURE_TURN_LEFT45 = 159
---@readonly
ACT_GESTURE_TURN_RIGHT45 = 160
---@readonly
ACT_GESTURE_TURN_LEFT90 = 161
---@readonly
ACT_GESTURE_TURN_RIGHT90 = 162
---@readonly
ACT_GESTURE_TURN_LEFT45_FLAT = 163
---@readonly
ACT_GESTURE_TURN_RIGHT45_FLAT = 164
---@readonly
ACT_GESTURE_TURN_LEFT90_FLAT = 165
---@readonly
ACT_GESTURE_TURN_RIGHT90_FLAT = 166
---@readonly
ACT_BARNACLE_HIT = 167
---@readonly
ACT_BARNACLE_PULL = 168
---@readonly
ACT_BARNACLE_CHOMP = 169
---@readonly
ACT_BARNACLE_CHEW = 170
---@readonly
ACT_DO_NOT_DISTURB = 171
---@readonly
ACT_VM_DRAW = 172
---@readonly
ACT_VM_HOLSTER = 173
---@readonly
ACT_VM_IDLE = 174
---@readonly
ACT_VM_FIDGET = 175
---@readonly
ACT_VM_PULLBACK = 176
---@readonly
ACT_VM_PULLBACK_HIGH = 177
---@readonly
ACT_VM_PULLBACK_LOW = 178
---@readonly
ACT_VM_THROW = 179
---@readonly
ACT_VM_PULLPIN = 180
---@readonly
ACT_VM_PRIMARYATTACK = 181
---@readonly
ACT_VM_SECONDARYATTACK = 182
---@readonly
ACT_VM_RELOAD = 183
---@readonly
ACT_VM_DRYFIRE = 186
---@readonly
ACT_VM_HITLEFT = 187
---@readonly
ACT_VM_HITLEFT2 = 188
---@readonly
ACT_VM_HITRIGHT = 189
---@readonly
ACT_VM_HITRIGHT2 = 190
---@readonly
ACT_VM_HITCENTER = 191
---@readonly
ACT_VM_HITCENTER2 = 192
---@readonly
ACT_VM_MISSLEFT = 193
---@readonly
ACT_VM_MISSLEFT2 = 194
---@readonly
ACT_VM_MISSRIGHT = 195
---@readonly
ACT_VM_MISSRIGHT2 = 196
---@readonly
ACT_VM_MISSCENTER = 197
---@readonly
ACT_VM_MISSCENTER2 = 198
---@readonly
ACT_VM_HAULBACK = 199
---@readonly
ACT_VM_SWINGHARD = 200
---@readonly
ACT_VM_SWINGMISS = 201
---@readonly
ACT_VM_SWINGHIT = 202
---@readonly
ACT_VM_IDLE_TO_LOWERED = 203
---@readonly
ACT_VM_IDLE_LOWERED = 204
---@readonly
ACT_VM_LOWERED_TO_IDLE = 205
---@readonly
ACT_VM_RECOIL1 = 206
---@readonly
ACT_VM_RECOIL2 = 207
---@readonly
ACT_VM_RECOIL3 = 208
---@readonly
ACT_VM_PICKUP = 209
---@readonly
ACT_VM_RELEASE = 210
---@readonly
ACT_VM_ATTACH_SILENCER = 211
---@readonly
ACT_VM_DETACH_SILENCER = 212
---@readonly
ACT_SLAM_STICKWALL_IDLE = 229
---@readonly
ACT_SLAM_STICKWALL_ND_IDLE = 230
---@readonly
ACT_SLAM_STICKWALL_ATTACH = 231
---@readonly
ACT_SLAM_STICKWALL_ATTACH2 = 232
---@readonly
ACT_SLAM_STICKWALL_ND_ATTACH = 233
---@readonly
ACT_SLAM_STICKWALL_ND_ATTACH2 = 234
---@readonly
ACT_SLAM_STICKWALL_DETONATE = 235
---@readonly
ACT_SLAM_STICKWALL_DETONATOR_HOLSTER = 236
---@readonly
ACT_SLAM_STICKWALL_DRAW = 237
---@readonly
ACT_SLAM_STICKWALL_ND_DRAW = 238
---@readonly
ACT_SLAM_STICKWALL_TO_THROW = 239
---@readonly
ACT_SLAM_STICKWALL_TO_THROW_ND = 240
---@readonly
ACT_SLAM_STICKWALL_TO_TRIPMINE_ND = 241
---@readonly
ACT_SLAM_THROW_IDLE = 242
---@readonly
ACT_SLAM_THROW_ND_IDLE = 243
---@readonly
ACT_SLAM_THROW_THROW = 244
---@readonly
ACT_SLAM_THROW_THROW2 = 245
---@readonly
ACT_SLAM_THROW_THROW_ND = 246
---@readonly
ACT_SLAM_THROW_THROW_ND2 = 247
---@readonly
ACT_SLAM_THROW_DRAW = 248
---@readonly
ACT_SLAM_THROW_ND_DRAW = 249
---@readonly
ACT_SLAM_THROW_TO_STICKWALL = 250
---@readonly
ACT_SLAM_THROW_TO_STICKWALL_ND = 251
---@readonly
ACT_SLAM_THROW_DETONATE = 252
---@readonly
ACT_SLAM_THROW_DETONATOR_HOLSTER = 253
---@readonly
ACT_SLAM_THROW_TO_TRIPMINE_ND = 254
---@readonly
ACT_SLAM_TRIPMINE_IDLE = 255
---@readonly
ACT_SLAM_TRIPMINE_DRAW = 256
---@readonly
ACT_SLAM_TRIPMINE_ATTACH = 257
---@readonly
ACT_SLAM_TRIPMINE_ATTACH2 = 258
---@readonly
ACT_SLAM_TRIPMINE_TO_STICKWALL_ND = 259
---@readonly
ACT_SLAM_TRIPMINE_TO_THROW_ND = 260
---@readonly
ACT_SLAM_DETONATOR_IDLE = 261
---@readonly
ACT_SLAM_DETONATOR_DRAW = 262
---@readonly
ACT_SLAM_DETONATOR_DETONATE = 263
---@readonly
ACT_SLAM_DETONATOR_HOLSTER = 264
---@readonly
ACT_SLAM_DETONATOR_STICKWALL_DRAW = 265
---@readonly
ACT_SLAM_DETONATOR_THROW_DRAW = 266
---@readonly
ACT_SHOTGUN_RELOAD_START = 267
---@readonly
ACT_SHOTGUN_RELOAD_FINISH = 268
---@readonly
ACT_SHOTGUN_PUMP = 269
---@readonly
ACT_SMG2_IDLE2 = 270
---@readonly
ACT_SMG2_FIRE2 = 271
---@readonly
ACT_SMG2_DRAW2 = 272
---@readonly
ACT_SMG2_RELOAD2 = 273
---@readonly
ACT_SMG2_DRYFIRE2 = 274
---@readonly
ACT_SMG2_TOAUTO = 275
---@readonly
ACT_SMG2_TOBURST = 276
---@readonly
ACT_PHYSCANNON_UPGRADE = 277
---@readonly
ACT_RANGE_ATTACK_AR1 = 278
---@readonly
ACT_RANGE_ATTACK_AR2 = 279
---@readonly
ACT_RANGE_ATTACK_AR2_LOW = 280
---@readonly
ACT_RANGE_ATTACK_AR2_GRENADE = 281
---@readonly
ACT_RANGE_ATTACK_HMG1 = 282
---@readonly
ACT_RANGE_ATTACK_ML = 283
---@readonly
ACT_RANGE_ATTACK_SMG1 = 284
---@readonly
ACT_RANGE_ATTACK_SMG1_LOW = 285
---@readonly
ACT_RANGE_ATTACK_SMG2 = 286
---@readonly
ACT_RANGE_ATTACK_SHOTGUN = 287
---@readonly
ACT_RANGE_ATTACK_SHOTGUN_LOW = 288
---@readonly
ACT_RANGE_ATTACK_PISTOL = 289
---@readonly
ACT_RANGE_ATTACK_PISTOL_LOW = 290
---@readonly
ACT_RANGE_ATTACK_SLAM = 291
---@readonly
ACT_RANGE_ATTACK_TRIPWIRE = 292
---@readonly
ACT_RANGE_ATTACK_THROW = 293
---@readonly
ACT_RANGE_ATTACK_SNIPER_RIFLE = 294
---@readonly
ACT_RANGE_ATTACK_RPG = 295
---@readonly
ACT_MELEE_ATTACK_SWING = 296
---@readonly
ACT_RANGE_AIM_LOW = 297
---@readonly
ACT_RANGE_AIM_SMG1_LOW = 298
---@readonly
ACT_RANGE_AIM_PISTOL_LOW = 299
---@readonly
ACT_RANGE_AIM_AR2_LOW = 300
---@readonly
ACT_COVER_PISTOL_LOW = 301
---@readonly
ACT_COVER_SMG1_LOW = 302
---@readonly
ACT_GESTURE_RANGE_ATTACK_AR1 = 303
---@readonly
ACT_GESTURE_RANGE_ATTACK_AR2 = 304
---@readonly
ACT_GESTURE_RANGE_ATTACK_AR2_GRENADE = 305
---@readonly
ACT_GESTURE_RANGE_ATTACK_HMG1 = 306
---@readonly
ACT_GESTURE_RANGE_ATTACK_ML = 307
---@readonly
ACT_GESTURE_RANGE_ATTACK_SMG1 = 308
---@readonly
ACT_GESTURE_RANGE_ATTACK_SMG1_LOW = 309
---@readonly
ACT_GESTURE_RANGE_ATTACK_SMG2 = 310
---@readonly
ACT_GESTURE_RANGE_ATTACK_SHOTGUN = 311
---@readonly
ACT_GESTURE_RANGE_ATTACK_PISTOL = 312
---@readonly
ACT_GESTURE_RANGE_ATTACK_PISTOL_LOW = 313
---@readonly
ACT_GESTURE_RANGE_ATTACK_SLAM = 314
---@readonly
ACT_GESTURE_RANGE_ATTACK_TRIPWIRE = 315
---@readonly
ACT_GESTURE_RANGE_ATTACK_THROW = 316
---@readonly
ACT_GESTURE_RANGE_ATTACK_SNIPER_RIFLE = 317
---@readonly
ACT_GESTURE_MELEE_ATTACK_SWING = 318
---@readonly
ACT_IDLE_RIFLE = 319
---@readonly
ACT_IDLE_SMG1 = 320
---@readonly
ACT_IDLE_ANGRY_SMG1 = 321
---@readonly
ACT_IDLE_PISTOL = 322
---@readonly
ACT_IDLE_ANGRY_PISTOL = 323
---@readonly
ACT_IDLE_ANGRY_SHOTGUN = 324
---@readonly
ACT_IDLE_STEALTH_PISTOL = 325
---@readonly
ACT_IDLE_PACKAGE = 326
---@readonly
ACT_WALK_PACKAGE = 327
---@readonly
ACT_IDLE_SUITCASE = 328
---@readonly
ACT_WALK_SUITCASE = 329
---@readonly
ACT_IDLE_SMG1_RELAXED = 330
---@readonly
ACT_IDLE_SMG1_STIMULATED = 331
---@readonly
ACT_WALK_RIFLE_RELAXED = 332
---@readonly
ACT_RUN_RIFLE_RELAXED = 333
---@readonly
ACT_WALK_RIFLE_STIMULATED = 334
---@readonly
ACT_RUN_RIFLE_STIMULATED = 335
---@readonly
ACT_IDLE_AIM_RIFLE_STIMULATED = 336
---@readonly
ACT_WALK_AIM_RIFLE_STIMULATED = 337
---@readonly
ACT_RUN_AIM_RIFLE_STIMULATED = 338
---@readonly
ACT_IDLE_SHOTGUN_RELAXED = 339
---@readonly
ACT_IDLE_SHOTGUN_STIMULATED = 340
---@readonly
ACT_IDLE_SHOTGUN_AGITATED = 341
---@readonly
ACT_WALK_ANGRY = 342
---@readonly
ACT_POLICE_HARASS1 = 343
---@readonly
ACT_POLICE_HARASS2 = 344
---@readonly
ACT_IDLE_MANNEDGUN = 345
---@readonly
ACT_IDLE_MELEE = 346
---@readonly
ACT_IDLE_ANGRY_MELEE = 347
---@readonly
ACT_IDLE_RPG_RELAXED = 348
---@readonly
ACT_IDLE_RPG = 349
---@readonly
ACT_IDLE_ANGRY_RPG = 350
---@readonly
ACT_COVER_LOW_RPG = 351
---@readonly
ACT_WALK_RPG = 352
---@readonly
ACT_RUN_RPG = 353
---@readonly
ACT_WALK_CROUCH_RPG = 354
---@readonly
ACT_RUN_CROUCH_RPG = 355
---@readonly
ACT_WALK_RPG_RELAXED = 356
---@readonly
ACT_RUN_RPG_RELAXED = 357
---@readonly
ACT_WALK_RIFLE = 358
---@readonly
ACT_WALK_AIM_RIFLE = 359
---@readonly
ACT_WALK_CROUCH_RIFLE = 360
---@readonly
ACT_WALK_CROUCH_AIM_RIFLE = 361
---@readonly
ACT_RUN_RIFLE = 362
---@readonly
ACT_RUN_AIM_RIFLE = 363
---@readonly
ACT_RUN_CROUCH_RIFLE = 364
---@readonly
ACT_RUN_CROUCH_AIM_RIFLE = 365
---@readonly
ACT_RUN_STEALTH_PISTOL = 366
---@readonly
ACT_WALK_AIM_SHOTGUN = 367
---@readonly
ACT_RUN_AIM_SHOTGUN = 368
---@readonly
ACT_WALK_PISTOL = 369
---@readonly
ACT_RUN_PISTOL = 370
---@readonly
ACT_WALK_AIM_PISTOL = 371
---@readonly
ACT_RUN_AIM_PISTOL = 372
---@readonly
ACT_WALK_STEALTH_PISTOL = 373
---@readonly
ACT_WALK_AIM_STEALTH_PISTOL = 374
---@readonly
ACT_RUN_AIM_STEALTH_PISTOL = 375
---@readonly
ACT_RELOAD_PISTOL = 376
---@readonly
ACT_RELOAD_PISTOL_LOW = 377
---@readonly
ACT_RELOAD_SMG1 = 378
---@readonly
ACT_RELOAD_SMG1_LOW = 379
---@readonly
ACT_RELOAD_SHOTGUN = 380
---@readonly
ACT_RELOAD_SHOTGUN_LOW = 381
---@readonly
ACT_GESTURE_RELOAD = 382
---@readonly
ACT_GESTURE_RELOAD_PISTOL = 383
---@readonly
ACT_GESTURE_RELOAD_SMG1 = 384
---@readonly
ACT_GESTURE_RELOAD_SHOTGUN = 385
---@readonly
ACT_BUSY_LEAN_LEFT = 386
---@readonly
ACT_BUSY_LEAN_LEFT_ENTRY = 387
---@readonly
ACT_BUSY_LEAN_LEFT_EXIT = 388
---@readonly
ACT_BUSY_LEAN_BACK = 389
---@readonly
ACT_BUSY_LEAN_BACK_ENTRY = 390
---@readonly
ACT_BUSY_LEAN_BACK_EXIT = 391
---@readonly
ACT_BUSY_SIT_GROUND = 392
---@readonly
ACT_BUSY_SIT_GROUND_ENTRY = 393
---@readonly
ACT_BUSY_SIT_GROUND_EXIT = 394
---@readonly
ACT_BUSY_SIT_CHAIR = 395
---@readonly
ACT_BUSY_SIT_CHAIR_ENTRY = 396
---@readonly
ACT_BUSY_SIT_CHAIR_EXIT = 397
---@readonly
ACT_BUSY_STAND = 398
---@readonly
ACT_BUSY_QUEUE = 399
---@readonly
ACT_DUCK_DODGE = 400
---@readonly
ACT_DIE_BARNACLE_SWALLOW = 401
---@readonly
ACT_GESTURE_BARNACLE_STRANGLE = 402
---@readonly
ACT_PHYSCANNON_DETACH = 403
---@readonly
ACT_PHYSCANNON_ANIMATE = 404
---@readonly
ACT_PHYSCANNON_ANIMATE_PRE = 405
---@readonly
ACT_PHYSCANNON_ANIMATE_POST = 406
---@readonly
ACT_DIE_FRONTSIDE = 407
---@readonly
ACT_DIE_RIGHTSIDE = 408
---@readonly
ACT_DIE_BACKSIDE = 409
---@readonly
ACT_DIE_LEFTSIDE = 410
---@readonly
ACT_OPEN_DOOR = 411
---@readonly
ACT_DI_ALYX_ZOMBIE_MELEE = 412
---@readonly
ACT_DI_ALYX_ZOMBIE_TORSO_MELEE = 413
---@readonly
ACT_DI_ALYX_HEADCRAB_MELEE = 414
---@readonly
ACT_DI_ALYX_ANTLION = 415
---@readonly
ACT_DI_ALYX_ZOMBIE_SHOTGUN64 = 416
---@readonly
ACT_DI_ALYX_ZOMBIE_SHOTGUN26 = 417
---@readonly
ACT_READINESS_RELAXED_TO_STIMULATED = 418
---@readonly
ACT_READINESS_RELAXED_TO_STIMULATED_WALK = 419
---@readonly
ACT_READINESS_AGITATED_TO_STIMULATED = 420
---@readonly
ACT_READINESS_STIMULATED_TO_RELAXED = 421
---@readonly
ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED = 422
---@readonly
ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED_WALK = 423
---@readonly
ACT_READINESS_PISTOL_AGITATED_TO_STIMULATED = 424
---@readonly
ACT_READINESS_PISTOL_STIMULATED_TO_RELAXED = 425
---@readonly
ACT_IDLE_CARRY = 426
---@readonly
ACT_WALK_CARRY = 427
---@readonly
ACT_STARTDYING = 428
---@readonly
ACT_DYINGLOOP = 429
---@readonly
ACT_DYINGTODEAD = 430
---@readonly
ACT_RIDE_MANNED_GUN = 431
---@readonly
ACT_VM_SPRINT_ENTER = 432
---@readonly
ACT_VM_SPRINT_IDLE = 433
---@readonly
ACT_VM_SPRINT_LEAVE = 434
---@readonly
ACT_FIRE_START = 435
---@readonly
ACT_FIRE_LOOP = 436
---@readonly
ACT_FIRE_END = 437
---@readonly
ACT_CROUCHING_GRENADEIDLE = 438
---@readonly
ACT_CROUCHING_GRENADEREADY = 439
---@readonly
ACT_CROUCHING_PRIMARYATTACK = 440
---@readonly
ACT_OVERLAY_GRENADEIDLE = 441
---@readonly
ACT_OVERLAY_GRENADEREADY = 442
---@readonly
ACT_OVERLAY_PRIMARYATTACK = 443
---@readonly
ACT_OVERLAY_SHIELD_UP = 444
---@readonly
ACT_OVERLAY_SHIELD_DOWN = 445
---@readonly
ACT_OVERLAY_SHIELD_UP_IDLE = 446
---@readonly
ACT_OVERLAY_SHIELD_ATTACK = 447
---@readonly
ACT_OVERLAY_SHIELD_KNOCKBACK = 448
---@readonly
ACT_SHIELD_UP = 449
---@readonly
ACT_SHIELD_DOWN = 450
---@readonly
ACT_SHIELD_UP_IDLE = 451
---@readonly
ACT_SHIELD_ATTACK = 452
---@readonly
ACT_SHIELD_KNOCKBACK = 453
---@readonly
ACT_CROUCHING_SHIELD_UP = 454
---@readonly
ACT_CROUCHING_SHIELD_DOWN = 455
---@readonly
ACT_CROUCHING_SHIELD_UP_IDLE = 456
---@readonly
ACT_CROUCHING_SHIELD_ATTACK = 457
---@readonly
ACT_CROUCHING_SHIELD_KNOCKBACK = 458
---@readonly
ACT_TURNRIGHT45 = 459
---@readonly
ACT_TURNLEFT45 = 460
---@readonly
ACT_TURN = 461
---@readonly
ACT_OBJ_ASSEMBLING = 462
---@readonly
ACT_OBJ_DISMANTLING = 463
---@readonly
ACT_OBJ_STARTUP = 464
---@readonly
ACT_OBJ_RUNNING = 465
---@readonly
ACT_OBJ_IDLE = 466
---@readonly
ACT_OBJ_PLACING = 467
---@readonly
ACT_OBJ_DETERIORATING = 468
---@readonly
ACT_OBJ_UPGRADING = 469
---@readonly
ACT_DEPLOY = 470
---@readonly
ACT_DEPLOY_IDLE = 471
---@readonly
ACT_UNDEPLOY = 472
---@readonly
ACT_GRENADE_ROLL = 473
---@readonly
ACT_GRENADE_TOSS = 474
---@readonly
ACT_HANDGRENADE_THROW1 = 475
---@readonly
ACT_HANDGRENADE_THROW2 = 476
---@readonly
ACT_HANDGRENADE_THROW3 = 477
---@readonly
ACT_SHOTGUN_IDLE_DEEP = 478
---@readonly
ACT_SHOTGUN_IDLE4 = 479
---@readonly
ACT_GLOCK_SHOOTEMPTY = 480
---@readonly
ACT_GLOCK_SHOOT_RELOAD = 481
---@readonly
ACT_RPG_DRAW_UNLOADED = 482
---@readonly
ACT_RPG_HOLSTER_UNLOADED = 483
---@readonly
ACT_RPG_IDLE_UNLOADED = 484
---@readonly
ACT_RPG_FIDGET_UNLOADED = 485
---@readonly
ACT_CROSSBOW_DRAW_UNLOADED = 486
---@readonly
ACT_CROSSBOW_IDLE_UNLOADED = 487
---@readonly
ACT_CROSSBOW_FIDGET_UNLOADED = 488
---@readonly
ACT_GAUSS_SPINUP = 489
---@readonly
ACT_GAUSS_SPINCYCLE = 490
---@readonly
ACT_TRIPMINE_GROUND = 491
---@readonly
ACT_TRIPMINE_WORLD = 492
---@readonly
ACT_VM_PRIMARYATTACK_SILENCED = 493
---@readonly
ACT_VM_RELOAD_SILENCED = 494
---@readonly
ACT_VM_DRYFIRE_SILENCED = 495
---@readonly
ACT_VM_IDLE_SILENCED = 496
---@readonly
ACT_VM_DRAW_SILENCED = 497
---@readonly
ACT_VM_IDLE_EMPTY_LEFT = 498
---@readonly
ACT_VM_DRYFIRE_LEFT = 499
---@readonly
ACT_PLAYER_IDLE_FIRE = 500
---@readonly
ACT_PLAYER_CROUCH_FIRE = 501
---@readonly
ACT_PLAYER_CROUCH_WALK_FIRE = 502
---@readonly
ACT_PLAYER_WALK_FIRE = 503
---@readonly
ACT_PLAYER_RUN_FIRE = 504
---@readonly
ACT_IDLETORUN = 505
---@readonly
ACT_RUNTOIDLE = 506
---@readonly
ACT_SPRINT = 507
---@readonly
ACT_GET_DOWN_STAND = 508
---@readonly
ACT_GET_UP_STAND = 509
---@readonly
ACT_GET_DOWN_CROUCH = 510
---@readonly
ACT_GET_UP_CROUCH = 511
---@readonly
ACT_PRONE_FORWARD = 512
---@readonly
ACT_PRONE_IDLE = 513
---@readonly
ACT_DEEPIDLE1 = 514
---@readonly
ACT_DEEPIDLE2 = 515
---@readonly
ACT_DEEPIDLE3 = 516
---@readonly
ACT_DEEPIDLE4 = 517
---@readonly
ACT_VM_RELOAD_DEPLOYED = 518
---@readonly
ACT_VM_RELOAD_IDLE = 519
---@readonly
ACT_VM_DRAW_DEPLOYED = 520
---@readonly
ACT_VM_DRAW_EMPTY = 521
---@readonly
ACT_VM_PRIMARYATTACK_EMPTY = 522
---@readonly
ACT_VM_RELOAD_EMPTY = 523
---@readonly
ACT_VM_IDLE_EMPTY = 524
---@readonly
ACT_VM_IDLE_DEPLOYED_EMPTY = 525
---@readonly
ACT_VM_IDLE_8 = 526
---@readonly
ACT_VM_IDLE_7 = 527
---@readonly
ACT_VM_IDLE_6 = 528
---@readonly
ACT_VM_IDLE_5 = 529
---@readonly
ACT_VM_IDLE_4 = 530
---@readonly
ACT_VM_IDLE_3 = 531
---@readonly
ACT_VM_IDLE_2 = 532
---@readonly
ACT_VM_IDLE_1 = 533
---@readonly
ACT_VM_IDLE_DEPLOYED = 534
---@readonly
ACT_VM_IDLE_DEPLOYED_8 = 535
---@readonly
ACT_VM_IDLE_DEPLOYED_7 = 536
---@readonly
ACT_VM_IDLE_DEPLOYED_6 = 537
---@readonly
ACT_VM_IDLE_DEPLOYED_5 = 538
---@readonly
ACT_VM_IDLE_DEPLOYED_4 = 539
---@readonly
ACT_VM_IDLE_DEPLOYED_3 = 540
---@readonly
ACT_VM_IDLE_DEPLOYED_2 = 541
---@readonly
ACT_VM_IDLE_DEPLOYED_1 = 542
---@readonly
ACT_VM_UNDEPLOY = 543
---@readonly
ACT_VM_UNDEPLOY_8 = 544
---@readonly
ACT_VM_UNDEPLOY_7 = 545
---@readonly
ACT_VM_UNDEPLOY_6 = 546
---@readonly
ACT_VM_UNDEPLOY_5 = 547
---@readonly
ACT_VM_UNDEPLOY_4 = 548
---@readonly
ACT_VM_UNDEPLOY_3 = 549
---@readonly
ACT_VM_UNDEPLOY_2 = 550
---@readonly
ACT_VM_UNDEPLOY_1 = 551
---@readonly
ACT_VM_UNDEPLOY_EMPTY = 552
---@readonly
ACT_VM_DEPLOY = 553
---@readonly
ACT_VM_DEPLOY_8 = 554
---@readonly
ACT_VM_DEPLOY_7 = 555
---@readonly
ACT_VM_DEPLOY_6 = 556
---@readonly
ACT_VM_DEPLOY_5 = 557
---@readonly
ACT_VM_DEPLOY_4 = 558
---@readonly
ACT_VM_DEPLOY_3 = 559
---@readonly
ACT_VM_DEPLOY_2 = 560
---@readonly
ACT_VM_DEPLOY_1 = 561
---@readonly
ACT_VM_DEPLOY_EMPTY = 562
---@readonly
ACT_VM_PRIMARYATTACK_8 = 563
---@readonly
ACT_VM_PRIMARYATTACK_7 = 564
---@readonly
ACT_VM_PRIMARYATTACK_6 = 565
---@readonly
ACT_VM_PRIMARYATTACK_5 = 566
---@readonly
ACT_VM_PRIMARYATTACK_4 = 567
---@readonly
ACT_VM_PRIMARYATTACK_3 = 568
---@readonly
ACT_VM_PRIMARYATTACK_2 = 569
---@readonly
ACT_VM_PRIMARYATTACK_1 = 570
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED = 571
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_8 = 572
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_7 = 573
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_6 = 574
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_5 = 575
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_4 = 576
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_3 = 577
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_2 = 578
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_1 = 579
---@readonly
ACT_VM_PRIMARYATTACK_DEPLOYED_EMPTY = 580
---@readonly
ACT_DOD_DEPLOYED = 581
---@readonly
ACT_DOD_PRONE_DEPLOYED = 582
---@readonly
ACT_DOD_IDLE_ZOOMED = 583
---@readonly
ACT_DOD_WALK_ZOOMED = 584
---@readonly
ACT_DOD_CROUCH_ZOOMED = 585
---@readonly
ACT_DOD_CROUCHWALK_ZOOMED = 586
---@readonly
ACT_DOD_PRONE_ZOOMED = 587
---@readonly
ACT_DOD_PRONE_FORWARD_ZOOMED = 588
---@readonly
ACT_DOD_PRIMARYATTACK_DEPLOYED = 589
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED = 590
---@readonly
ACT_DOD_RELOAD_DEPLOYED = 591
---@readonly
ACT_DOD_RELOAD_PRONE_DEPLOYED = 592
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE = 593
---@readonly
ACT_DOD_SECONDARYATTACK_PRONE = 594
---@readonly
ACT_DOD_RELOAD_CROUCH = 595
---@readonly
ACT_DOD_RELOAD_PRONE = 596
---@readonly
ACT_DOD_STAND_IDLE = 597
---@readonly
ACT_DOD_STAND_AIM = 598
---@readonly
ACT_DOD_CROUCH_IDLE = 599
---@readonly
ACT_DOD_CROUCH_AIM = 600
---@readonly
ACT_DOD_CROUCHWALK_IDLE = 601
---@readonly
ACT_DOD_CROUCHWALK_AIM = 602
---@readonly
ACT_DOD_WALK_IDLE = 603
---@readonly
ACT_DOD_WALK_AIM = 604
---@readonly
ACT_DOD_RUN_IDLE = 605
---@readonly
ACT_DOD_RUN_AIM = 606
---@readonly
ACT_DOD_STAND_AIM_PISTOL = 607
---@readonly
ACT_DOD_CROUCH_AIM_PISTOL = 608
---@readonly
ACT_DOD_CROUCHWALK_AIM_PISTOL = 609
---@readonly
ACT_DOD_WALK_AIM_PISTOL = 610
---@readonly
ACT_DOD_RUN_AIM_PISTOL = 611
---@readonly
ACT_DOD_PRONE_AIM_PISTOL = 612
---@readonly
ACT_DOD_STAND_IDLE_PISTOL = 613
---@readonly
ACT_DOD_CROUCH_IDLE_PISTOL = 614
---@readonly
ACT_DOD_CROUCHWALK_IDLE_PISTOL = 615
---@readonly
ACT_DOD_WALK_IDLE_PISTOL = 616
---@readonly
ACT_DOD_RUN_IDLE_PISTOL = 617
---@readonly
ACT_DOD_SPRINT_IDLE_PISTOL = 618
---@readonly
ACT_DOD_PRONEWALK_IDLE_PISTOL = 619
---@readonly
ACT_DOD_STAND_AIM_C96 = 620
---@readonly
ACT_DOD_CROUCH_AIM_C96 = 621
---@readonly
ACT_DOD_CROUCHWALK_AIM_C96 = 622
---@readonly
ACT_DOD_WALK_AIM_C96 = 623
---@readonly
ACT_DOD_RUN_AIM_C96 = 624
---@readonly
ACT_DOD_PRONE_AIM_C96 = 625
---@readonly
ACT_DOD_STAND_IDLE_C96 = 626
---@readonly
ACT_DOD_CROUCH_IDLE_C96 = 627
---@readonly
ACT_DOD_CROUCHWALK_IDLE_C96 = 628
---@readonly
ACT_DOD_WALK_IDLE_C96 = 629
---@readonly
ACT_DOD_RUN_IDLE_C96 = 630
---@readonly
ACT_DOD_SPRINT_IDLE_C96 = 631
---@readonly
ACT_DOD_PRONEWALK_IDLE_C96 = 632
---@readonly
ACT_DOD_STAND_AIM_RIFLE = 633
---@readonly
ACT_DOD_CROUCH_AIM_RIFLE = 634
---@readonly
ACT_DOD_CROUCHWALK_AIM_RIFLE = 635
---@readonly
ACT_DOD_WALK_AIM_RIFLE = 636
---@readonly
ACT_DOD_RUN_AIM_RIFLE = 637
---@readonly
ACT_DOD_PRONE_AIM_RIFLE = 638
---@readonly
ACT_DOD_STAND_IDLE_RIFLE = 639
---@readonly
ACT_DOD_CROUCH_IDLE_RIFLE = 640
---@readonly
ACT_DOD_CROUCHWALK_IDLE_RIFLE = 641
---@readonly
ACT_DOD_WALK_IDLE_RIFLE = 642
---@readonly
ACT_DOD_RUN_IDLE_RIFLE = 643
---@readonly
ACT_DOD_SPRINT_IDLE_RIFLE = 644
---@readonly
ACT_DOD_PRONEWALK_IDLE_RIFLE = 645
---@readonly
ACT_DOD_STAND_AIM_BOLT = 646
---@readonly
ACT_DOD_CROUCH_AIM_BOLT = 647
---@readonly
ACT_DOD_CROUCHWALK_AIM_BOLT = 648
---@readonly
ACT_DOD_WALK_AIM_BOLT = 649
---@readonly
ACT_DOD_RUN_AIM_BOLT = 650
---@readonly
ACT_DOD_PRONE_AIM_BOLT = 651
---@readonly
ACT_DOD_STAND_IDLE_BOLT = 652
---@readonly
ACT_DOD_CROUCH_IDLE_BOLT = 653
---@readonly
ACT_DOD_CROUCHWALK_IDLE_BOLT = 654
---@readonly
ACT_DOD_WALK_IDLE_BOLT = 655
---@readonly
ACT_DOD_RUN_IDLE_BOLT = 656
---@readonly
ACT_DOD_SPRINT_IDLE_BOLT = 657
---@readonly
ACT_DOD_PRONEWALK_IDLE_BOLT = 658
---@readonly
ACT_DOD_STAND_AIM_TOMMY = 659
---@readonly
ACT_DOD_CROUCH_AIM_TOMMY = 660
---@readonly
ACT_DOD_CROUCHWALK_AIM_TOMMY = 661
---@readonly
ACT_DOD_WALK_AIM_TOMMY = 662
---@readonly
ACT_DOD_RUN_AIM_TOMMY = 663
---@readonly
ACT_DOD_PRONE_AIM_TOMMY = 664
---@readonly
ACT_DOD_STAND_IDLE_TOMMY = 665
---@readonly
ACT_DOD_CROUCH_IDLE_TOMMY = 666
---@readonly
ACT_DOD_CROUCHWALK_IDLE_TOMMY = 667
---@readonly
ACT_DOD_WALK_IDLE_TOMMY = 668
---@readonly
ACT_DOD_RUN_IDLE_TOMMY = 669
---@readonly
ACT_DOD_SPRINT_IDLE_TOMMY = 670
---@readonly
ACT_DOD_PRONEWALK_IDLE_TOMMY = 671
---@readonly
ACT_DOD_STAND_AIM_MP40 = 672
---@readonly
ACT_DOD_CROUCH_AIM_MP40 = 673
---@readonly
ACT_DOD_CROUCHWALK_AIM_MP40 = 674
---@readonly
ACT_DOD_WALK_AIM_MP40 = 675
---@readonly
ACT_DOD_RUN_AIM_MP40 = 676
---@readonly
ACT_DOD_PRONE_AIM_MP40 = 677
---@readonly
ACT_DOD_STAND_IDLE_MP40 = 678
---@readonly
ACT_DOD_CROUCH_IDLE_MP40 = 679
---@readonly
ACT_DOD_CROUCHWALK_IDLE_MP40 = 680
---@readonly
ACT_DOD_WALK_IDLE_MP40 = 681
---@readonly
ACT_DOD_RUN_IDLE_MP40 = 682
---@readonly
ACT_DOD_SPRINT_IDLE_MP40 = 683
---@readonly
ACT_DOD_PRONEWALK_IDLE_MP40 = 684
---@readonly
ACT_DOD_STAND_AIM_MP44 = 685
---@readonly
ACT_DOD_CROUCH_AIM_MP44 = 686
---@readonly
ACT_DOD_CROUCHWALK_AIM_MP44 = 687
---@readonly
ACT_DOD_WALK_AIM_MP44 = 688
---@readonly
ACT_DOD_RUN_AIM_MP44 = 689
---@readonly
ACT_DOD_PRONE_AIM_MP44 = 690
---@readonly
ACT_DOD_STAND_IDLE_MP44 = 691
---@readonly
ACT_DOD_CROUCH_IDLE_MP44 = 692
---@readonly
ACT_DOD_CROUCHWALK_IDLE_MP44 = 693
---@readonly
ACT_DOD_WALK_IDLE_MP44 = 694
---@readonly
ACT_DOD_RUN_IDLE_MP44 = 695
---@readonly
ACT_DOD_SPRINT_IDLE_MP44 = 696
---@readonly
ACT_DOD_PRONEWALK_IDLE_MP44 = 697
---@readonly
ACT_DOD_STAND_AIM_GREASE = 698
---@readonly
ACT_DOD_CROUCH_AIM_GREASE = 699
---@readonly
ACT_DOD_CROUCHWALK_AIM_GREASE = 700
---@readonly
ACT_DOD_WALK_AIM_GREASE = 701
---@readonly
ACT_DOD_RUN_AIM_GREASE = 702
---@readonly
ACT_DOD_PRONE_AIM_GREASE = 703
---@readonly
ACT_DOD_STAND_IDLE_GREASE = 704
---@readonly
ACT_DOD_CROUCH_IDLE_GREASE = 705
---@readonly
ACT_DOD_CROUCHWALK_IDLE_GREASE = 706
---@readonly
ACT_DOD_WALK_IDLE_GREASE = 707
---@readonly
ACT_DOD_RUN_IDLE_GREASE = 708
---@readonly
ACT_DOD_SPRINT_IDLE_GREASE = 709
---@readonly
ACT_DOD_PRONEWALK_IDLE_GREASE = 710
---@readonly
ACT_DOD_STAND_AIM_MG = 711
---@readonly
ACT_DOD_CROUCH_AIM_MG = 712
---@readonly
ACT_DOD_CROUCHWALK_AIM_MG = 713
---@readonly
ACT_DOD_WALK_AIM_MG = 714
---@readonly
ACT_DOD_RUN_AIM_MG = 715
---@readonly
ACT_DOD_PRONE_AIM_MG = 716
---@readonly
ACT_DOD_STAND_IDLE_MG = 717
---@readonly
ACT_DOD_CROUCH_IDLE_MG = 718
---@readonly
ACT_DOD_CROUCHWALK_IDLE_MG = 719
---@readonly
ACT_DOD_WALK_IDLE_MG = 720
---@readonly
ACT_DOD_RUN_IDLE_MG = 721
---@readonly
ACT_DOD_SPRINT_IDLE_MG = 722
---@readonly
ACT_DOD_PRONEWALK_IDLE_MG = 723
---@readonly
ACT_DOD_STAND_AIM_30CAL = 724
---@readonly
ACT_DOD_CROUCH_AIM_30CAL = 725
---@readonly
ACT_DOD_CROUCHWALK_AIM_30CAL = 726
---@readonly
ACT_DOD_WALK_AIM_30CAL = 727
---@readonly
ACT_DOD_RUN_AIM_30CAL = 728
---@readonly
ACT_DOD_PRONE_AIM_30CAL = 729
---@readonly
ACT_DOD_STAND_IDLE_30CAL = 730
---@readonly
ACT_DOD_CROUCH_IDLE_30CAL = 731
---@readonly
ACT_DOD_CROUCHWALK_IDLE_30CAL = 732
---@readonly
ACT_DOD_WALK_IDLE_30CAL = 733
---@readonly
ACT_DOD_RUN_IDLE_30CAL = 734
---@readonly
ACT_DOD_SPRINT_IDLE_30CAL = 735
---@readonly
ACT_DOD_PRONEWALK_IDLE_30CAL = 736
---@readonly
ACT_DOD_STAND_AIM_GREN_FRAG = 737
---@readonly
ACT_DOD_CROUCH_AIM_GREN_FRAG = 738
---@readonly
ACT_DOD_CROUCHWALK_AIM_GREN_FRAG = 739
---@readonly
ACT_DOD_WALK_AIM_GREN_FRAG = 740
---@readonly
ACT_DOD_RUN_AIM_GREN_FRAG = 741
---@readonly
ACT_DOD_PRONE_AIM_GREN_FRAG = 742
---@readonly
ACT_DOD_SPRINT_AIM_GREN_FRAG = 743
---@readonly
ACT_DOD_PRONEWALK_AIM_GREN_FRAG = 744
---@readonly
ACT_DOD_STAND_AIM_GREN_STICK = 745
---@readonly
ACT_DOD_CROUCH_AIM_GREN_STICK = 746
---@readonly
ACT_DOD_CROUCHWALK_AIM_GREN_STICK = 747
---@readonly
ACT_DOD_WALK_AIM_GREN_STICK = 748
---@readonly
ACT_DOD_RUN_AIM_GREN_STICK = 749
---@readonly
ACT_DOD_PRONE_AIM_GREN_STICK = 750
---@readonly
ACT_DOD_SPRINT_AIM_GREN_STICK = 751
---@readonly
ACT_DOD_PRONEWALK_AIM_GREN_STICK = 752
---@readonly
ACT_DOD_STAND_AIM_KNIFE = 753
---@readonly
ACT_DOD_CROUCH_AIM_KNIFE = 754
---@readonly
ACT_DOD_CROUCHWALK_AIM_KNIFE = 755
---@readonly
ACT_DOD_WALK_AIM_KNIFE = 756
---@readonly
ACT_DOD_RUN_AIM_KNIFE = 757
---@readonly
ACT_DOD_PRONE_AIM_KNIFE = 758
---@readonly
ACT_DOD_SPRINT_AIM_KNIFE = 759
---@readonly
ACT_DOD_PRONEWALK_AIM_KNIFE = 760
---@readonly
ACT_DOD_STAND_AIM_SPADE = 761
---@readonly
ACT_DOD_CROUCH_AIM_SPADE = 762
---@readonly
ACT_DOD_CROUCHWALK_AIM_SPADE = 763
---@readonly
ACT_DOD_WALK_AIM_SPADE = 764
---@readonly
ACT_DOD_RUN_AIM_SPADE = 765
---@readonly
ACT_DOD_PRONE_AIM_SPADE = 766
---@readonly
ACT_DOD_SPRINT_AIM_SPADE = 767
---@readonly
ACT_DOD_PRONEWALK_AIM_SPADE = 768
---@readonly
ACT_DOD_STAND_AIM_BAZOOKA = 769
---@readonly
ACT_DOD_CROUCH_AIM_BAZOOKA = 770
---@readonly
ACT_DOD_CROUCHWALK_AIM_BAZOOKA = 771
---@readonly
ACT_DOD_WALK_AIM_BAZOOKA = 772
---@readonly
ACT_DOD_RUN_AIM_BAZOOKA = 773
---@readonly
ACT_DOD_PRONE_AIM_BAZOOKA = 774
---@readonly
ACT_DOD_STAND_IDLE_BAZOOKA = 775
---@readonly
ACT_DOD_CROUCH_IDLE_BAZOOKA = 776
---@readonly
ACT_DOD_CROUCHWALK_IDLE_BAZOOKA = 777
---@readonly
ACT_DOD_WALK_IDLE_BAZOOKA = 778
---@readonly
ACT_DOD_RUN_IDLE_BAZOOKA = 779
---@readonly
ACT_DOD_SPRINT_IDLE_BAZOOKA = 780
---@readonly
ACT_DOD_PRONEWALK_IDLE_BAZOOKA = 781
---@readonly
ACT_DOD_STAND_AIM_PSCHRECK = 782
---@readonly
ACT_DOD_CROUCH_AIM_PSCHRECK = 783
---@readonly
ACT_DOD_CROUCHWALK_AIM_PSCHRECK = 784
---@readonly
ACT_DOD_WALK_AIM_PSCHRECK = 785
---@readonly
ACT_DOD_RUN_AIM_PSCHRECK = 786
---@readonly
ACT_DOD_PRONE_AIM_PSCHRECK = 787
---@readonly
ACT_DOD_STAND_IDLE_PSCHRECK = 788
---@readonly
ACT_DOD_CROUCH_IDLE_PSCHRECK = 789
---@readonly
ACT_DOD_CROUCHWALK_IDLE_PSCHRECK = 790
---@readonly
ACT_DOD_WALK_IDLE_PSCHRECK = 791
---@readonly
ACT_DOD_RUN_IDLE_PSCHRECK = 792
---@readonly
ACT_DOD_SPRINT_IDLE_PSCHRECK = 793
---@readonly
ACT_DOD_PRONEWALK_IDLE_PSCHRECK = 794
---@readonly
ACT_DOD_STAND_AIM_BAR = 795
---@readonly
ACT_DOD_CROUCH_AIM_BAR = 796
---@readonly
ACT_DOD_CROUCHWALK_AIM_BAR = 797
---@readonly
ACT_DOD_WALK_AIM_BAR = 798
---@readonly
ACT_DOD_RUN_AIM_BAR = 799
---@readonly
ACT_DOD_PRONE_AIM_BAR = 800
---@readonly
ACT_DOD_STAND_IDLE_BAR = 801
---@readonly
ACT_DOD_CROUCH_IDLE_BAR = 802
---@readonly
ACT_DOD_CROUCHWALK_IDLE_BAR = 803
---@readonly
ACT_DOD_WALK_IDLE_BAR = 804
---@readonly
ACT_DOD_RUN_IDLE_BAR = 805
---@readonly
ACT_DOD_SPRINT_IDLE_BAR = 806
---@readonly
ACT_DOD_PRONEWALK_IDLE_BAR = 807
---@readonly
ACT_DOD_STAND_ZOOM_RIFLE = 808
---@readonly
ACT_DOD_CROUCH_ZOOM_RIFLE = 809
---@readonly
ACT_DOD_CROUCHWALK_ZOOM_RIFLE = 810
---@readonly
ACT_DOD_WALK_ZOOM_RIFLE = 811
---@readonly
ACT_DOD_RUN_ZOOM_RIFLE = 812
---@readonly
ACT_DOD_PRONE_ZOOM_RIFLE = 813
---@readonly
ACT_DOD_STAND_ZOOM_BOLT = 814
---@readonly
ACT_DOD_CROUCH_ZOOM_BOLT = 815
---@readonly
ACT_DOD_CROUCHWALK_ZOOM_BOLT = 816
---@readonly
ACT_DOD_WALK_ZOOM_BOLT = 817
---@readonly
ACT_DOD_RUN_ZOOM_BOLT = 818
---@readonly
ACT_DOD_PRONE_ZOOM_BOLT = 819
---@readonly
ACT_DOD_STAND_ZOOM_BAZOOKA = 820
---@readonly
ACT_DOD_CROUCH_ZOOM_BAZOOKA = 821
---@readonly
ACT_DOD_CROUCHWALK_ZOOM_BAZOOKA = 822
---@readonly
ACT_DOD_WALK_ZOOM_BAZOOKA = 823
---@readonly
ACT_DOD_RUN_ZOOM_BAZOOKA = 824
---@readonly
ACT_DOD_PRONE_ZOOM_BAZOOKA = 825
---@readonly
ACT_DOD_STAND_ZOOM_PSCHRECK = 826
---@readonly
ACT_DOD_CROUCH_ZOOM_PSCHRECK = 827
---@readonly
ACT_DOD_CROUCHWALK_ZOOM_PSCHRECK = 828
---@readonly
ACT_DOD_WALK_ZOOM_PSCHRECK = 829
---@readonly
ACT_DOD_RUN_ZOOM_PSCHRECK = 830
---@readonly
ACT_DOD_PRONE_ZOOM_PSCHRECK = 831
---@readonly
ACT_DOD_DEPLOY_RIFLE = 832
---@readonly
ACT_DOD_DEPLOY_TOMMY = 833
---@readonly
ACT_DOD_DEPLOY_MG = 834
---@readonly
ACT_DOD_DEPLOY_30CAL = 835
---@readonly
ACT_DOD_PRONE_DEPLOY_RIFLE = 836
---@readonly
ACT_DOD_PRONE_DEPLOY_TOMMY = 837
---@readonly
ACT_DOD_PRONE_DEPLOY_MG = 838
---@readonly
ACT_DOD_PRONE_DEPLOY_30CAL = 839
---@readonly
ACT_DOD_PRIMARYATTACK_RIFLE = 840
---@readonly
ACT_DOD_SECONDARYATTACK_RIFLE = 841
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_RIFLE = 842
---@readonly
ACT_DOD_SECONDARYATTACK_PRONE_RIFLE = 843
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_RIFLE = 844
---@readonly
ACT_DOD_PRIMARYATTACK_DEPLOYED_RIFLE = 845
---@readonly
ACT_DOD_PRIMARYATTACK_BOLT = 846
---@readonly
ACT_DOD_SECONDARYATTACK_BOLT = 847
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_BOLT = 848
---@readonly
ACT_DOD_SECONDARYATTACK_PRONE_BOLT = 849
---@readonly
ACT_DOD_PRIMARYATTACK_TOMMY = 850
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_TOMMY = 851
---@readonly
ACT_DOD_SECONDARYATTACK_TOMMY = 852
---@readonly
ACT_DOD_SECONDARYATTACK_PRONE_TOMMY = 853
---@readonly
ACT_DOD_PRIMARYATTACK_MP40 = 854
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_MP40 = 855
---@readonly
ACT_DOD_SECONDARYATTACK_MP40 = 856
---@readonly
ACT_DOD_SECONDARYATTACK_PRONE_MP40 = 857
---@readonly
ACT_DOD_PRIMARYATTACK_MP44 = 858
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_MP44 = 859
---@readonly
ACT_DOD_PRIMARYATTACK_GREASE = 860
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_GREASE = 861
---@readonly
ACT_DOD_PRIMARYATTACK_PISTOL = 862
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_PISTOL = 863
---@readonly
ACT_DOD_PRIMARYATTACK_C96 = 864
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_C96 = 865
---@readonly
ACT_DOD_PRIMARYATTACK_MG = 866
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_MG = 867
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_MG = 868
---@readonly
ACT_DOD_PRIMARYATTACK_DEPLOYED_MG = 869
---@readonly
ACT_DOD_PRIMARYATTACK_30CAL = 870
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_30CAL = 871
---@readonly
ACT_DOD_PRIMARYATTACK_DEPLOYED_30CAL = 872
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_30CAL = 873
---@readonly
ACT_DOD_PRIMARYATTACK_GREN_FRAG = 874
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_GREN_FRAG = 875
---@readonly
ACT_DOD_PRIMARYATTACK_GREN_STICK = 876
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_GREN_STICK = 877
---@readonly
ACT_DOD_PRIMARYATTACK_KNIFE = 878
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_KNIFE = 879
---@readonly
ACT_DOD_PRIMARYATTACK_SPADE = 880
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_SPADE = 881
---@readonly
ACT_DOD_PRIMARYATTACK_BAZOOKA = 882
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_BAZOOKA = 883
---@readonly
ACT_DOD_PRIMARYATTACK_PSCHRECK = 884
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_PSCHRECK = 885
---@readonly
ACT_DOD_PRIMARYATTACK_BAR = 886
---@readonly
ACT_DOD_PRIMARYATTACK_PRONE_BAR = 887
---@readonly
ACT_DOD_RELOAD_GARAND = 888
---@readonly
ACT_DOD_RELOAD_K43 = 889
---@readonly
ACT_DOD_RELOAD_BAR = 890
---@readonly
ACT_DOD_RELOAD_MP40 = 891
---@readonly
ACT_DOD_RELOAD_MP44 = 892
---@readonly
ACT_DOD_RELOAD_BOLT = 893
---@readonly
ACT_DOD_RELOAD_M1CARBINE = 894
---@readonly
ACT_DOD_RELOAD_TOMMY = 895
---@readonly
ACT_DOD_RELOAD_GREASEGUN = 896
---@readonly
ACT_DOD_RELOAD_PISTOL = 897
---@readonly
ACT_DOD_RELOAD_FG42 = 898
---@readonly
ACT_DOD_RELOAD_RIFLE = 899
---@readonly
ACT_DOD_RELOAD_RIFLEGRENADE = 900
---@readonly
ACT_DOD_RELOAD_C96 = 901
---@readonly
ACT_DOD_RELOAD_CROUCH_BAR = 902
---@readonly
ACT_DOD_RELOAD_CROUCH_RIFLE = 903
---@readonly
ACT_DOD_RELOAD_CROUCH_RIFLEGRENADE = 904
---@readonly
ACT_DOD_RELOAD_CROUCH_BOLT = 905
---@readonly
ACT_DOD_RELOAD_CROUCH_MP44 = 906
---@readonly
ACT_DOD_RELOAD_CROUCH_MP40 = 907
---@readonly
ACT_DOD_RELOAD_CROUCH_TOMMY = 908
---@readonly
ACT_DOD_RELOAD_CROUCH_BAZOOKA = 909
---@readonly
ACT_DOD_RELOAD_CROUCH_PSCHRECK = 910
---@readonly
ACT_DOD_RELOAD_CROUCH_PISTOL = 911
---@readonly
ACT_DOD_RELOAD_CROUCH_M1CARBINE = 912
---@readonly
ACT_DOD_RELOAD_CROUCH_C96 = 913
---@readonly
ACT_DOD_RELOAD_BAZOOKA = 914
---@readonly
ACT_DOD_ZOOMLOAD_BAZOOKA = 915
---@readonly
ACT_DOD_RELOAD_PSCHRECK = 916
---@readonly
ACT_DOD_ZOOMLOAD_PSCHRECK = 917
---@readonly
ACT_DOD_RELOAD_DEPLOYED_FG42 = 918
---@readonly
ACT_DOD_RELOAD_DEPLOYED_30CAL = 919
---@readonly
ACT_DOD_RELOAD_DEPLOYED_MG = 920
---@readonly
ACT_DOD_RELOAD_DEPLOYED_MG34 = 921
---@readonly
ACT_DOD_RELOAD_DEPLOYED_BAR = 922
---@readonly
ACT_DOD_RELOAD_PRONE_PISTOL = 923
---@readonly
ACT_DOD_RELOAD_PRONE_GARAND = 924
---@readonly
ACT_DOD_RELOAD_PRONE_M1CARBINE = 925
---@readonly
ACT_DOD_RELOAD_PRONE_BOLT = 926
---@readonly
ACT_DOD_RELOAD_PRONE_K43 = 927
---@readonly
ACT_DOD_RELOAD_PRONE_MP40 = 928
---@readonly
ACT_DOD_RELOAD_PRONE_MP44 = 929
---@readonly
ACT_DOD_RELOAD_PRONE_BAR = 930
---@readonly
ACT_DOD_RELOAD_PRONE_GREASEGUN = 931
---@readonly
ACT_DOD_RELOAD_PRONE_TOMMY = 932
---@readonly
ACT_DOD_RELOAD_PRONE_FG42 = 933
---@readonly
ACT_DOD_RELOAD_PRONE_RIFLE = 934
---@readonly
ACT_DOD_RELOAD_PRONE_RIFLEGRENADE = 935
---@readonly
ACT_DOD_RELOAD_PRONE_C96 = 936
---@readonly
ACT_DOD_RELOAD_PRONE_BAZOOKA = 937
---@readonly
ACT_DOD_ZOOMLOAD_PRONE_BAZOOKA = 938
---@readonly
ACT_DOD_RELOAD_PRONE_PSCHRECK = 939
---@readonly
ACT_DOD_ZOOMLOAD_PRONE_PSCHRECK = 940
---@readonly
ACT_DOD_RELOAD_PRONE_DEPLOYED_BAR = 941
---@readonly
ACT_DOD_RELOAD_PRONE_DEPLOYED_FG42 = 942
---@readonly
ACT_DOD_RELOAD_PRONE_DEPLOYED_30CAL = 943
---@readonly
ACT_DOD_RELOAD_PRONE_DEPLOYED_MG = 944
---@readonly
ACT_DOD_RELOAD_PRONE_DEPLOYED_MG34 = 945
---@readonly
ACT_DOD_PRONE_ZOOM_FORWARD_RIFLE = 946
---@readonly
ACT_DOD_PRONE_ZOOM_FORWARD_BOLT = 947
---@readonly
ACT_DOD_PRONE_ZOOM_FORWARD_BAZOOKA = 948
---@readonly
ACT_DOD_PRONE_ZOOM_FORWARD_PSCHRECK = 949
---@readonly
ACT_DOD_PRIMARYATTACK_CROUCH = 950
---@readonly
ACT_DOD_PRIMARYATTACK_CROUCH_SPADE = 951
---@readonly
ACT_DOD_PRIMARYATTACK_CROUCH_KNIFE = 952
---@readonly
ACT_DOD_PRIMARYATTACK_CROUCH_GREN_FRAG = 953
---@readonly
ACT_DOD_PRIMARYATTACK_CROUCH_GREN_STICK = 954
---@readonly
ACT_DOD_SECONDARYATTACK_CROUCH = 955
---@readonly
ACT_DOD_SECONDARYATTACK_CROUCH_TOMMY = 956
---@readonly
ACT_DOD_SECONDARYATTACK_CROUCH_MP40 = 957
---@readonly
ACT_DOD_HS_IDLE = 958
---@readonly
ACT_DOD_HS_CROUCH = 959
---@readonly
ACT_DOD_HS_IDLE_30CAL = 960
---@readonly
ACT_DOD_HS_IDLE_BAZOOKA = 961
---@readonly
ACT_DOD_HS_IDLE_PSCHRECK = 962
---@readonly
ACT_DOD_HS_IDLE_KNIFE = 963
---@readonly
ACT_DOD_HS_IDLE_MG42 = 964
---@readonly
ACT_DOD_HS_IDLE_PISTOL = 965
---@readonly
ACT_DOD_HS_IDLE_STICKGRENADE = 966
---@readonly
ACT_DOD_HS_IDLE_TOMMY = 967
---@readonly
ACT_DOD_HS_IDLE_MP44 = 968
---@readonly
ACT_DOD_HS_IDLE_K98 = 969
---@readonly
ACT_DOD_HS_CROUCH_30CAL = 970
---@readonly
ACT_DOD_HS_CROUCH_BAZOOKA = 971
---@readonly
ACT_DOD_HS_CROUCH_PSCHRECK = 972
---@readonly
ACT_DOD_HS_CROUCH_KNIFE = 973
---@readonly
ACT_DOD_HS_CROUCH_MG42 = 974
---@readonly
ACT_DOD_HS_CROUCH_PISTOL = 975
---@readonly
ACT_DOD_HS_CROUCH_STICKGRENADE = 976
---@readonly
ACT_DOD_HS_CROUCH_TOMMY = 977
---@readonly
ACT_DOD_HS_CROUCH_MP44 = 978
---@readonly
ACT_DOD_HS_CROUCH_K98 = 979
---@readonly
ACT_DOD_STAND_IDLE_TNT = 980
---@readonly
ACT_DOD_CROUCH_IDLE_TNT = 981
---@readonly
ACT_DOD_CROUCHWALK_IDLE_TNT = 982
---@readonly
ACT_DOD_WALK_IDLE_TNT = 983
---@readonly
ACT_DOD_RUN_IDLE_TNT = 984
---@readonly
ACT_DOD_SPRINT_IDLE_TNT = 985
---@readonly
ACT_DOD_PRONEWALK_IDLE_TNT = 986
---@readonly
ACT_DOD_PLANT_TNT = 987
---@readonly
ACT_DOD_DEFUSE_TNT = 988
---@readonly
ACT_VM_FIZZLE = 989
---@readonly
ACT_MP_STAND_IDLE = 990
---@readonly
ACT_MP_CROUCH_IDLE = 991
---@readonly
ACT_MP_CROUCH_DEPLOYED_IDLE = 992
---@readonly
ACT_MP_CROUCH_DEPLOYED = 993
---@readonly
ACT_MP_DEPLOYED_IDLE = 995
---@readonly
ACT_MP_RUN = 996
---@readonly
ACT_MP_WALK = 997
---@readonly
ACT_MP_AIRWALK = 998
---@readonly
ACT_MP_CROUCHWALK = 999
---@readonly
ACT_MP_SPRINT = 1000
---@readonly
ACT_MP_JUMP = 1001
---@readonly
ACT_MP_JUMP_START = 1002
---@readonly
ACT_MP_JUMP_FLOAT = 1003
---@readonly
ACT_MP_JUMP_LAND = 1004
---@readonly
ACT_MP_DOUBLEJUMP = 1005
---@readonly
ACT_MP_SWIM = 1006
---@readonly
ACT_MP_DEPLOYED = 1007
---@readonly
ACT_MP_SWIM_DEPLOYED = 1008
---@readonly
ACT_MP_VCD = 1009
---@readonly
ACT_MP_SWIM_IDLE = 1010
---@readonly
ACT_MP_ATTACK_STAND_PRIMARYFIRE = 1011
---@readonly
ACT_MP_ATTACK_STAND_PRIMARYFIRE_DEPLOYED = 1012
---@readonly
ACT_MP_ATTACK_STAND_SECONDARYFIRE = 1013
---@readonly
ACT_MP_ATTACK_STAND_GRENADE = 1014
---@readonly
ACT_MP_ATTACK_CROUCH_PRIMARYFIRE = 1015
---@readonly
ACT_MP_ATTACK_CROUCH_PRIMARYFIRE_DEPLOYED = 1016
---@readonly
ACT_MP_ATTACK_CROUCH_SECONDARYFIRE = 1017
---@readonly
ACT_MP_ATTACK_CROUCH_GRENADE = 1018
---@readonly
ACT_MP_ATTACK_SWIM_PRIMARYFIRE = 1019
---@readonly
ACT_MP_ATTACK_SWIM_SECONDARYFIRE = 1020
---@readonly
ACT_MP_ATTACK_SWIM_GRENADE = 1021
---@readonly
ACT_MP_ATTACK_AIRWALK_PRIMARYFIRE = 1022
---@readonly
ACT_MP_ATTACK_AIRWALK_SECONDARYFIRE = 1023
---@readonly
ACT_MP_ATTACK_AIRWALK_GRENADE = 1024
---@readonly
ACT_MP_RELOAD_STAND = 1025
---@readonly
ACT_MP_RELOAD_STAND_LOOP = 1026
---@readonly
ACT_MP_RELOAD_STAND_END = 1027
---@readonly
ACT_MP_RELOAD_CROUCH = 1028
---@readonly
ACT_MP_RELOAD_CROUCH_LOOP = 1029
---@readonly
ACT_MP_RELOAD_CROUCH_END = 1030
---@readonly
ACT_MP_RELOAD_SWIM = 1031
---@readonly
ACT_MP_RELOAD_SWIM_LOOP = 1032
---@readonly
ACT_MP_RELOAD_SWIM_END = 1033
---@readonly
ACT_MP_RELOAD_AIRWALK = 1034
---@readonly
ACT_MP_RELOAD_AIRWALK_LOOP = 1035
---@readonly
ACT_MP_RELOAD_AIRWALK_END = 1036
---@readonly
ACT_MP_ATTACK_STAND_PREFIRE = 1037
---@readonly
ACT_MP_ATTACK_STAND_POSTFIRE = 1038
---@readonly
ACT_MP_ATTACK_STAND_STARTFIRE = 1039
---@readonly
ACT_MP_ATTACK_CROUCH_PREFIRE = 1040
---@readonly
ACT_MP_ATTACK_CROUCH_POSTFIRE = 1041
---@readonly
ACT_MP_ATTACK_SWIM_PREFIRE = 1042
---@readonly
ACT_MP_ATTACK_SWIM_POSTFIRE = 1043
---@readonly
ACT_MP_STAND_PRIMARY = 1044
---@readonly
ACT_MP_CROUCH_PRIMARY = 1045
---@readonly
ACT_MP_RUN_PRIMARY = 1046
---@readonly
ACT_MP_WALK_PRIMARY = 1047
---@readonly
ACT_MP_AIRWALK_PRIMARY = 1048
---@readonly
ACT_MP_CROUCHWALK_PRIMARY = 1049
---@readonly
ACT_MP_JUMP_PRIMARY = 1050
---@readonly
ACT_MP_JUMP_START_PRIMARY = 1051
---@readonly
ACT_MP_JUMP_FLOAT_PRIMARY = 1052
---@readonly
ACT_MP_JUMP_LAND_PRIMARY = 1053
---@readonly
ACT_MP_SWIM_PRIMARY = 1054
---@readonly
ACT_MP_DEPLOYED_PRIMARY = 1055
---@readonly
ACT_MP_SWIM_DEPLOYED_PRIMARY = 1056
---@readonly
ACT_MP_ATTACK_STAND_PRIMARY = 1059
---@readonly
ACT_MP_ATTACK_STAND_PRIMARY_DEPLOYED = 1060
---@readonly
ACT_MP_ATTACK_CROUCH_PRIMARY = 1061
---@readonly
ACT_MP_ATTACK_CROUCH_PRIMARY_DEPLOYED = 1062
---@readonly
ACT_MP_ATTACK_SWIM_PRIMARY = 1063
---@readonly
ACT_MP_ATTACK_AIRWALK_PRIMARY = 1064
---@readonly
ACT_MP_RELOAD_STAND_PRIMARY = 1065
---@readonly
ACT_MP_RELOAD_STAND_PRIMARY_LOOP = 1066
---@readonly
ACT_MP_RELOAD_STAND_PRIMARY_END = 1067
---@readonly
ACT_MP_RELOAD_CROUCH_PRIMARY = 1068
---@readonly
ACT_MP_RELOAD_CROUCH_PRIMARY_LOOP = 1069
---@readonly
ACT_MP_RELOAD_CROUCH_PRIMARY_END = 1070
---@readonly
ACT_MP_RELOAD_SWIM_PRIMARY = 1071
---@readonly
ACT_MP_RELOAD_SWIM_PRIMARY_LOOP = 1072
---@readonly
ACT_MP_RELOAD_SWIM_PRIMARY_END = 1073
---@readonly
ACT_MP_RELOAD_AIRWALK_PRIMARY = 1074
---@readonly
ACT_MP_RELOAD_AIRWALK_PRIMARY_LOOP = 1075
---@readonly
ACT_MP_RELOAD_AIRWALK_PRIMARY_END = 1076
---@readonly
ACT_MP_ATTACK_STAND_GRENADE_PRIMARY = 1105
---@readonly
ACT_MP_ATTACK_CROUCH_GRENADE_PRIMARY = 1106
---@readonly
ACT_MP_ATTACK_SWIM_GRENADE_PRIMARY = 1107
---@readonly
ACT_MP_ATTACK_AIRWALK_GRENADE_PRIMARY = 1108
---@readonly
ACT_MP_STAND_SECONDARY = 1109
---@readonly
ACT_MP_CROUCH_SECONDARY = 1110
---@readonly
ACT_MP_RUN_SECONDARY = 1111
---@readonly
ACT_MP_WALK_SECONDARY = 1112
---@readonly
ACT_MP_AIRWALK_SECONDARY = 1113
---@readonly
ACT_MP_CROUCHWALK_SECONDARY = 1114
---@readonly
ACT_MP_JUMP_SECONDARY = 1115
---@readonly
ACT_MP_JUMP_START_SECONDARY = 1116
---@readonly
ACT_MP_JUMP_FLOAT_SECONDARY = 1117
---@readonly
ACT_MP_JUMP_LAND_SECONDARY = 1118
---@readonly
ACT_MP_SWIM_SECONDARY = 1119
---@readonly
ACT_MP_ATTACK_STAND_SECONDARY = 1120
---@readonly
ACT_MP_ATTACK_CROUCH_SECONDARY = 1121
---@readonly
ACT_MP_ATTACK_SWIM_SECONDARY = 1122
---@readonly
ACT_MP_ATTACK_AIRWALK_SECONDARY = 1123
---@readonly
ACT_MP_RELOAD_STAND_SECONDARY = 1124
---@readonly
ACT_MP_RELOAD_STAND_SECONDARY_LOOP = 1125
---@readonly
ACT_MP_RELOAD_STAND_SECONDARY_END = 1126
---@readonly
ACT_MP_RELOAD_CROUCH_SECONDARY = 1127
---@readonly
ACT_MP_RELOAD_CROUCH_SECONDARY_LOOP = 1128
---@readonly
ACT_MP_RELOAD_CROUCH_SECONDARY_END = 1129
---@readonly
ACT_MP_RELOAD_SWIM_SECONDARY = 1130
---@readonly
ACT_MP_RELOAD_SWIM_SECONDARY_LOOP = 1131
---@readonly
ACT_MP_RELOAD_SWIM_SECONDARY_END = 1132
---@readonly
ACT_MP_RELOAD_AIRWALK_SECONDARY = 1133
---@readonly
ACT_MP_RELOAD_AIRWALK_SECONDARY_LOOP = 1134
---@readonly
ACT_MP_RELOAD_AIRWALK_SECONDARY_END = 1135
---@readonly
ACT_MP_ATTACK_STAND_GRENADE_SECONDARY = 1140
---@readonly
ACT_MP_ATTACK_CROUCH_GRENADE_SECONDARY = 1141
---@readonly
ACT_MP_ATTACK_SWIM_GRENADE_SECONDARY = 1142
---@readonly
ACT_MP_ATTACK_AIRWALK_GRENADE_SECONDARY = 1143
---@readonly
ACT_MP_STAND_MELEE = 1171
---@readonly
ACT_MP_CROUCH_MELEE = 1172
---@readonly
ACT_MP_RUN_MELEE = 1173
---@readonly
ACT_MP_WALK_MELEE = 1174
---@readonly
ACT_MP_AIRWALK_MELEE = 1175
---@readonly
ACT_MP_CROUCHWALK_MELEE = 1176
---@readonly
ACT_MP_JUMP_MELEE = 1177
---@readonly
ACT_MP_JUMP_START_MELEE = 1178
---@readonly
ACT_MP_JUMP_FLOAT_MELEE = 1179
---@readonly
ACT_MP_JUMP_LAND_MELEE = 1180
---@readonly
ACT_MP_SWIM_MELEE = 1181
---@readonly
ACT_MP_ATTACK_STAND_MELEE = 1182
---@readonly
ACT_MP_ATTACK_STAND_MELEE_SECONDARY = 1183
---@readonly
ACT_MP_ATTACK_CROUCH_MELEE = 1184
---@readonly
ACT_MP_ATTACK_CROUCH_MELEE_SECONDARY = 1185
---@readonly
ACT_MP_ATTACK_SWIM_MELEE = 1186
---@readonly
ACT_MP_ATTACK_AIRWALK_MELEE = 1187
---@readonly
ACT_MP_ATTACK_STAND_GRENADE_MELEE = 1188
---@readonly
ACT_MP_ATTACK_CROUCH_GRENADE_MELEE = 1189
---@readonly
ACT_MP_ATTACK_SWIM_GRENADE_MELEE = 1190
---@readonly
ACT_MP_ATTACK_AIRWALK_GRENADE_MELEE = 1191
---@readonly
ACT_MP_GESTURE_FLINCH = 1258
---@readonly
ACT_MP_GESTURE_FLINCH_PRIMARY = 1259
---@readonly
ACT_MP_GESTURE_FLINCH_SECONDARY = 1260
---@readonly
ACT_MP_GESTURE_FLINCH_MELEE = 1261
---@readonly
ACT_MP_GESTURE_FLINCH_HEAD = 1264
---@readonly
ACT_MP_GESTURE_FLINCH_CHEST = 1265
---@readonly
ACT_MP_GESTURE_FLINCH_STOMACH = 1266
---@readonly
ACT_MP_GESTURE_FLINCH_LEFTARM = 1267
---@readonly
ACT_MP_GESTURE_FLINCH_RIGHTARM = 1268
---@readonly
ACT_MP_GESTURE_FLINCH_LEFTLEG = 1269
---@readonly
ACT_MP_GESTURE_FLINCH_RIGHTLEG = 1270
---@readonly
ACT_MP_GRENADE1_DRAW = 1271
---@readonly
ACT_MP_GRENADE1_IDLE = 1272
---@readonly
ACT_MP_GRENADE1_ATTACK = 1273
---@readonly
ACT_MP_GRENADE2_DRAW = 1274
---@readonly
ACT_MP_GRENADE2_IDLE = 1275
---@readonly
ACT_MP_GRENADE2_ATTACK = 1276
---@readonly
ACT_MP_PRIMARY_GRENADE1_DRAW = 1277
---@readonly
ACT_MP_PRIMARY_GRENADE1_IDLE = 1278
---@readonly
ACT_MP_PRIMARY_GRENADE1_ATTACK = 1279
---@readonly
ACT_MP_PRIMARY_GRENADE2_DRAW = 1280
---@readonly
ACT_MP_PRIMARY_GRENADE2_IDLE = 1281
---@readonly
ACT_MP_PRIMARY_GRENADE2_ATTACK = 1282
---@readonly
ACT_MP_SECONDARY_GRENADE1_DRAW = 1283
---@readonly
ACT_MP_SECONDARY_GRENADE1_IDLE = 1284
---@readonly
ACT_MP_SECONDARY_GRENADE1_ATTACK = 1285
---@readonly
ACT_MP_SECONDARY_GRENADE2_DRAW = 1286
---@readonly
ACT_MP_SECONDARY_GRENADE2_IDLE = 1287
---@readonly
ACT_MP_SECONDARY_GRENADE2_ATTACK = 1288
---@readonly
ACT_MP_MELEE_GRENADE1_DRAW = 1289
---@readonly
ACT_MP_MELEE_GRENADE1_IDLE = 1290
---@readonly
ACT_MP_MELEE_GRENADE1_ATTACK = 1291
---@readonly
ACT_MP_MELEE_GRENADE2_DRAW = 1292
---@readonly
ACT_MP_MELEE_GRENADE2_IDLE = 1293
---@readonly
ACT_MP_MELEE_GRENADE2_ATTACK = 1294
---@readonly
ACT_MP_STAND_BUILDING = 1307
---@readonly
ACT_MP_CROUCH_BUILDING = 1308
---@readonly
ACT_MP_RUN_BUILDING = 1309
---@readonly
ACT_MP_WALK_BUILDING = 1310
---@readonly
ACT_MP_AIRWALK_BUILDING = 1311
---@readonly
ACT_MP_CROUCHWALK_BUILDING = 1312
---@readonly
ACT_MP_JUMP_BUILDING = 1313
---@readonly
ACT_MP_JUMP_START_BUILDING = 1314
---@readonly
ACT_MP_JUMP_FLOAT_BUILDING = 1315
---@readonly
ACT_MP_JUMP_LAND_BUILDING = 1316
---@readonly
ACT_MP_SWIM_BUILDING = 1317
---@readonly
ACT_MP_ATTACK_STAND_BUILDING = 1318
---@readonly
ACT_MP_ATTACK_CROUCH_BUILDING = 1319
---@readonly
ACT_MP_ATTACK_SWIM_BUILDING = 1320
---@readonly
ACT_MP_ATTACK_AIRWALK_BUILDING = 1321
---@readonly
ACT_MP_ATTACK_STAND_GRENADE_BUILDING = 1322
---@readonly
ACT_MP_ATTACK_CROUCH_GRENADE_BUILDING = 1323
---@readonly
ACT_MP_ATTACK_SWIM_GRENADE_BUILDING = 1324
---@readonly
ACT_MP_ATTACK_AIRWALK_GRENADE_BUILDING = 1325
---@readonly
ACT_MP_STAND_PDA = 1345
---@readonly
ACT_MP_CROUCH_PDA = 1346
---@readonly
ACT_MP_RUN_PDA = 1347
---@readonly
ACT_MP_WALK_PDA = 1348
---@readonly
ACT_MP_AIRWALK_PDA = 1349
---@readonly
ACT_MP_CROUCHWALK_PDA = 1350
---@readonly
ACT_MP_JUMP_PDA = 1351
---@readonly
ACT_MP_JUMP_START_PDA = 1352
---@readonly
ACT_MP_JUMP_FLOAT_PDA = 1353
---@readonly
ACT_MP_JUMP_LAND_PDA = 1354
---@readonly
ACT_MP_SWIM_PDA = 1355
---@readonly
ACT_MP_ATTACK_STAND_PDA = 1356
---@readonly
ACT_MP_ATTACK_SWIM_PDA = 1357
---@readonly
ACT_MP_GESTURE_VC_HANDMOUTH = 1377
---@readonly
ACT_MP_GESTURE_VC_FINGERPOINT = 1378
---@readonly
ACT_MP_GESTURE_VC_FISTPUMP = 1379
---@readonly
ACT_MP_GESTURE_VC_THUMBSUP = 1380
---@readonly
ACT_MP_GESTURE_VC_NODYES = 1381
---@readonly
ACT_MP_GESTURE_VC_NODNO = 1382
---@readonly
ACT_MP_GESTURE_VC_HANDMOUTH_PRIMARY = 1383
---@readonly
ACT_MP_GESTURE_VC_FINGERPOINT_PRIMARY = 1384
---@readonly
ACT_MP_GESTURE_VC_FISTPUMP_PRIMARY = 1385
---@readonly
ACT_MP_GESTURE_VC_THUMBSUP_PRIMARY = 1386
---@readonly
ACT_MP_GESTURE_VC_NODYES_PRIMARY = 1387
---@readonly
ACT_MP_GESTURE_VC_NODNO_PRIMARY = 1388
---@readonly
ACT_MP_GESTURE_VC_HANDMOUTH_SECONDARY = 1389
---@readonly
ACT_MP_GESTURE_VC_FINGERPOINT_SECONDARY = 1390
---@readonly
ACT_MP_GESTURE_VC_FISTPUMP_SECONDARY = 1391
---@readonly
ACT_MP_GESTURE_VC_THUMBSUP_SECONDARY = 1392
---@readonly
ACT_MP_GESTURE_VC_NODYES_SECONDARY = 1393
---@readonly
ACT_MP_GESTURE_VC_NODNO_SECONDARY = 1394
---@readonly
ACT_MP_GESTURE_VC_HANDMOUTH_MELEE = 1395
---@readonly
ACT_MP_GESTURE_VC_FINGERPOINT_MELEE = 1396
---@readonly
ACT_MP_GESTURE_VC_FISTPUMP_MELEE = 1397
---@readonly
ACT_MP_GESTURE_VC_THUMBSUP_MELEE = 1398
---@readonly
ACT_MP_GESTURE_VC_NODYES_MELEE = 1399
---@readonly
ACT_MP_GESTURE_VC_NODNO_MELEE = 1400
---@readonly
ACT_MP_GESTURE_VC_HANDMOUTH_BUILDING = 1413
---@readonly
ACT_MP_GESTURE_VC_FINGERPOINT_BUILDING = 1414
---@readonly
ACT_MP_GESTURE_VC_FISTPUMP_BUILDING = 1415
---@readonly
ACT_MP_GESTURE_VC_THUMBSUP_BUILDING = 1416
---@readonly
ACT_MP_GESTURE_VC_NODYES_BUILDING = 1417
---@readonly
ACT_MP_GESTURE_VC_NODNO_BUILDING = 1418
---@readonly
ACT_MP_GESTURE_VC_HANDMOUTH_PDA = 1419
---@readonly
ACT_MP_GESTURE_VC_FINGERPOINT_PDA = 1420
---@readonly
ACT_MP_GESTURE_VC_FISTPUMP_PDA = 1421
---@readonly
ACT_MP_GESTURE_VC_THUMBSUP_PDA = 1422
---@readonly
ACT_MP_GESTURE_VC_NODYES_PDA = 1423
---@readonly
ACT_MP_GESTURE_VC_NODNO_PDA = 1424
---@readonly
ACT_VM_UNUSABLE = 1428
---@readonly
ACT_VM_UNUSABLE_TO_USABLE = 1429
---@readonly
ACT_VM_USABLE_TO_UNUSABLE = 1430
---@readonly
ACT_GMOD_GESTURE_AGREE = 1610
---@readonly
ACT_GMOD_GESTURE_BECON = 1611
---@readonly
ACT_GMOD_GESTURE_BOW = 1612
---@readonly
ACT_GMOD_GESTURE_DISAGREE = 1613
---@readonly
ACT_GMOD_TAUNT_SALUTE = 1614
---@readonly
ACT_GMOD_GESTURE_WAVE = 1615
---@readonly
ACT_GMOD_TAUNT_PERSISTENCE = 1616
---@readonly
ACT_GMOD_TAUNT_MUSCLE = 1617
---@readonly
ACT_GMOD_TAUNT_LAUGH = 1618
---@readonly
ACT_GMOD_GESTURE_POINT = 1619
---@readonly
ACT_GMOD_TAUNT_CHEER = 1620
---@readonly
ACT_HL2MP_RUN_FAST = 1621
---@readonly
ACT_HL2MP_RUN_CHARGING = 1622
---@readonly
ACT_HL2MP_RUN_PANICKED = 1623
---@readonly
ACT_HL2MP_RUN_PROTECTED = 1624
---@readonly
ACT_HL2MP_IDLE_MELEE_ANGRY = 1625
---@readonly
ACT_HL2MP_ZOMBIE_SLUMP_IDLE = 1626
---@readonly
ACT_HL2MP_ZOMBIE_SLUMP_RISE = 1627
---@readonly
ACT_HL2MP_WALK_ZOMBIE_01 = 1628
---@readonly
ACT_HL2MP_WALK_ZOMBIE_02 = 1629
---@readonly
ACT_HL2MP_WALK_ZOMBIE_03 = 1630
---@readonly
ACT_HL2MP_WALK_ZOMBIE_04 = 1631
---@readonly
ACT_HL2MP_WALK_ZOMBIE_05 = 1632
---@readonly
ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 = 1633
---@readonly
ACT_HL2MP_WALK_CROUCH_ZOMBIE_02 = 1634
---@readonly
ACT_HL2MP_WALK_CROUCH_ZOMBIE_03 = 1635
---@readonly
ACT_HL2MP_WALK_CROUCH_ZOMBIE_04 = 1636
---@readonly
ACT_HL2MP_WALK_CROUCH_ZOMBIE_05 = 1637
---@readonly
ACT_HL2MP_IDLE_CROUCH_ZOMBIE_01 = 1638
---@readonly
ACT_HL2MP_IDLE_CROUCH_ZOMBIE_02 = 1639
---@readonly
ACT_GMOD_GESTURE_RANGE_ZOMBIE = 1640
---@readonly
ACT_GMOD_GESTURE_TAUNT_ZOMBIE = 1641
---@readonly
ACT_GMOD_TAUNT_DANCE = 1642
---@readonly
ACT_GMOD_TAUNT_ROBOT = 1643
---@readonly
ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL = 1644
---@readonly
ACT_GMOD_GESTURE_RANGE_FRENZY = 1645
---@readonly
ACT_HL2MP_RUN_ZOMBIE_FAST = 1646
---@readonly
ACT_HL2MP_WALK_ZOMBIE_06 = 1647
---@readonly
ACT_ZOMBIE_LEAP_START = 1648
---@readonly
ACT_ZOMBIE_LEAPING = 1649
---@readonly
ACT_ZOMBIE_CLIMB_UP = 1650
---@readonly
ACT_ZOMBIE_CLIMB_START = 1651
---@readonly
ACT_ZOMBIE_CLIMB_END = 1652
---@readonly
ACT_HL2MP_IDLE_MAGIC = 1653
---@readonly
ACT_HL2MP_WALK_MAGIC = 1654
---@readonly
ACT_HL2MP_RUN_MAGIC = 1655
---@readonly
ACT_HL2MP_IDLE_CROUCH_MAGIC = 1656
---@readonly
ACT_HL2MP_WALK_CROUCH_MAGIC = 1657
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_MAGIC = 1658
---@readonly
ACT_HL2MP_GESTURE_RELOAD_MAGIC = 1659
---@readonly
ACT_HL2MP_JUMP_MAGIC = 1660
---@readonly
ACT_HL2MP_SWIM_IDLE_MAGIC = 1661
---@readonly
ACT_HL2MP_SWIM_MAGIC = 1662
---@readonly
ACT_HL2MP_IDLE_REVOLVER = 1663
---@readonly
ACT_HL2MP_WALK_REVOLVER = 1664
---@readonly
ACT_HL2MP_RUN_REVOLVER = 1665
---@readonly
ACT_HL2MP_IDLE_CROUCH_REVOLVER = 1666
---@readonly
ACT_HL2MP_WALK_CROUCH_REVOLVER = 1667
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER = 1668
---@readonly
ACT_HL2MP_GESTURE_RELOAD_REVOLVER = 1669
---@readonly
ACT_HL2MP_JUMP_REVOLVER = 1670
---@readonly
ACT_HL2MP_SWIM_IDLE_REVOLVER = 1671
---@readonly
ACT_HL2MP_SWIM_REVOLVER = 1672
---@readonly
ACT_HL2MP_IDLE_CAMERA = 1673
---@readonly
ACT_HL2MP_WALK_CAMERA = 1674
---@readonly
ACT_HL2MP_RUN_CAMERA = 1675
---@readonly
ACT_HL2MP_IDLE_CROUCH_CAMERA = 1676
---@readonly
ACT_HL2MP_WALK_CROUCH_CAMERA = 1677
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_CAMERA = 1678
---@readonly
ACT_HL2MP_GESTURE_RELOAD_CAMERA = 1679
---@readonly
ACT_HL2MP_JUMP_CAMERA = 1680
---@readonly
ACT_HL2MP_SWIM_IDLE_CAMERA = 1681
---@readonly
ACT_HL2MP_SWIM_CAMERA = 1682
---@readonly
ACT_HL2MP_IDLE_ANGRY = 1683
---@readonly
ACT_HL2MP_WALK_ANGRY = 1684
---@readonly
ACT_HL2MP_RUN_ANGRY = 1685
---@readonly
ACT_HL2MP_IDLE_CROUCH_ANGRY = 1686
---@readonly
ACT_HL2MP_WALK_CROUCH_ANGRY = 1687
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_ANGRY = 1688
---@readonly
ACT_HL2MP_GESTURE_RELOAD_ANGRY = 1689
---@readonly
ACT_HL2MP_JUMP_ANGRY = 1690
---@readonly
ACT_HL2MP_SWIM_IDLE_ANGRY = 1691
---@readonly
ACT_HL2MP_SWIM_ANGRY = 1692
---@readonly
ACT_HL2MP_IDLE_SCARED = 1693
---@readonly
ACT_HL2MP_WALK_SCARED = 1694
---@readonly
ACT_HL2MP_RUN_SCARED = 1695
---@readonly
ACT_HL2MP_IDLE_CROUCH_SCARED = 1696
---@readonly
ACT_HL2MP_WALK_CROUCH_SCARED = 1697
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_SCARED = 1698
---@readonly
ACT_HL2MP_GESTURE_RELOAD_SCARED = 1699
---@readonly
ACT_HL2MP_JUMP_SCARED = 1700
---@readonly
ACT_HL2MP_SWIM_IDLE_SCARED = 1701
---@readonly
ACT_HL2MP_SWIM_SCARED = 1702
---@readonly
ACT_HL2MP_IDLE_ZOMBIE = 1703
---@readonly
ACT_HL2MP_WALK_ZOMBIE = 1704
---@readonly
ACT_HL2MP_RUN_ZOMBIE = 1705
---@readonly
ACT_HL2MP_IDLE_CROUCH_ZOMBIE = 1706
---@readonly
ACT_HL2MP_WALK_CROUCH_ZOMBIE = 1707
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_ZOMBIE = 1708
---@readonly
ACT_HL2MP_GESTURE_RELOAD_ZOMBIE = 1709
---@readonly
ACT_HL2MP_JUMP_ZOMBIE = 1710
---@readonly
ACT_HL2MP_SWIM_IDLE_ZOMBIE = 1711
---@readonly
ACT_HL2MP_SWIM_ZOMBIE = 1712
---@readonly
ACT_HL2MP_IDLE_SUITCASE = 1713
---@readonly
ACT_HL2MP_WALK_SUITCASE = 1714
---@readonly
ACT_HL2MP_RUN_SUITCASE = 1715
---@readonly
ACT_HL2MP_IDLE_CROUCH_SUITCASE = 1716
---@readonly
ACT_HL2MP_WALK_CROUCH_SUITCASE = 1717
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_SUITCASE = 1718
---@readonly
ACT_HL2MP_GESTURE_RELOAD_SUITCASE = 1719
---@readonly
ACT_HL2MP_JUMP_SUITCASE = 1720
---@readonly
ACT_HL2MP_SWIM_IDLE_SUITCASE = 1721
---@readonly
ACT_HL2MP_SWIM_SUITCASE = 1722
---@readonly
ACT_HL2MP_IDLE = 1777
---@readonly
ACT_HL2MP_WALK = 1778
---@readonly
ACT_HL2MP_RUN = 1779
---@readonly
ACT_HL2MP_IDLE_CROUCH = 1780
---@readonly
ACT_HL2MP_WALK_CROUCH = 1781
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK = 1782
---@readonly
ACT_HL2MP_GESTURE_RELOAD = 1783
---@readonly
ACT_HL2MP_JUMP = 1784
---@readonly
ACT_HL2MP_SWIM = 1786
---@readonly
ACT_HL2MP_IDLE_PISTOL = 1787
---@readonly
ACT_HL2MP_WALK_PISTOL = 1788
---@readonly
ACT_HL2MP_RUN_PISTOL = 1789
---@readonly
ACT_HL2MP_IDLE_CROUCH_PISTOL = 1790
---@readonly
ACT_HL2MP_WALK_CROUCH_PISTOL = 1791
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL = 1792
---@readonly
ACT_HL2MP_GESTURE_RELOAD_PISTOL = 1793
---@readonly
ACT_HL2MP_JUMP_PISTOL = 1794
---@readonly
ACT_HL2MP_SWIM_IDLE_PISTOL = 1795
---@readonly
ACT_HL2MP_SWIM_PISTOL = 1796
---@readonly
ACT_HL2MP_IDLE_SMG1 = 1797
---@readonly
ACT_HL2MP_WALK_SMG1 = 1798
---@readonly
ACT_HL2MP_RUN_SMG1 = 1799
---@readonly
ACT_HL2MP_IDLE_CROUCH_SMG1 = 1800
---@readonly
ACT_HL2MP_WALK_CROUCH_SMG1 = 1801
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1 = 1802
---@readonly
ACT_HL2MP_GESTURE_RELOAD_SMG1 = 1803
---@readonly
ACT_HL2MP_JUMP_SMG1 = 1804
---@readonly
ACT_HL2MP_SWIM_IDLE_SMG1 = 1805
---@readonly
ACT_HL2MP_SWIM_SMG1 = 1806
---@readonly
ACT_HL2MP_IDLE_AR2 = 1807
---@readonly
ACT_HL2MP_WALK_AR2 = 1808
---@readonly
ACT_HL2MP_RUN_AR2 = 1809
---@readonly
ACT_HL2MP_IDLE_CROUCH_AR2 = 1810
---@readonly
ACT_HL2MP_WALK_CROUCH_AR2 = 1811
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 = 1812
---@readonly
ACT_HL2MP_GESTURE_RELOAD_AR2 = 1813
---@readonly
ACT_HL2MP_JUMP_AR2 = 1814
---@readonly
ACT_HL2MP_SWIM_IDLE_AR2 = 1815
---@readonly
ACT_HL2MP_SWIM_AR2 = 1816
---@readonly
ACT_HL2MP_IDLE_SHOTGUN = 1817
---@readonly
ACT_HL2MP_WALK_SHOTGUN = 1818
---@readonly
ACT_HL2MP_RUN_SHOTGUN = 1819
---@readonly
ACT_HL2MP_IDLE_CROUCH_SHOTGUN = 1820
---@readonly
ACT_HL2MP_WALK_CROUCH_SHOTGUN = 1821
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN = 1822
---@readonly
ACT_HL2MP_GESTURE_RELOAD_SHOTGUN = 1823
---@readonly
ACT_HL2MP_JUMP_SHOTGUN = 1824
---@readonly
ACT_HL2MP_SWIM_IDLE_SHOTGUN = 1825
---@readonly
ACT_HL2MP_SWIM_SHOTGUN = 1826
---@readonly
ACT_HL2MP_IDLE_RPG = 1827
---@readonly
ACT_HL2MP_WALK_RPG = 1828
---@readonly
ACT_HL2MP_RUN_RPG = 1829
---@readonly
ACT_HL2MP_IDLE_CROUCH_RPG = 1830
---@readonly
ACT_HL2MP_WALK_CROUCH_RPG = 1831
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG = 1832
---@readonly
ACT_HL2MP_GESTURE_RELOAD_RPG = 1833
---@readonly
ACT_HL2MP_JUMP_RPG = 1834
---@readonly
ACT_HL2MP_SWIM_IDLE_RPG = 1835
---@readonly
ACT_HL2MP_SWIM_RPG = 1836
---@readonly
ACT_HL2MP_IDLE_GRENADE = 1837
---@readonly
ACT_HL2MP_WALK_GRENADE = 1838
---@readonly
ACT_HL2MP_RUN_GRENADE = 1839
---@readonly
ACT_HL2MP_IDLE_CROUCH_GRENADE = 1840
---@readonly
ACT_HL2MP_WALK_CROUCH_GRENADE = 1841
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE = 1842
---@readonly
ACT_HL2MP_GESTURE_RELOAD_GRENADE = 1843
---@readonly
ACT_HL2MP_JUMP_GRENADE = 1844
---@readonly
ACT_HL2MP_SWIM_IDLE_GRENADE = 1845
---@readonly
ACT_HL2MP_SWIM_GRENADE = 1846
---@readonly
ACT_HL2MP_IDLE_DUEL = 1847
---@readonly
ACT_HL2MP_WALK_DUEL = 1848
---@readonly
ACT_HL2MP_RUN_DUEL = 1849
---@readonly
ACT_HL2MP_IDLE_CROUCH_DUEL = 1850
---@readonly
ACT_HL2MP_WALK_CROUCH_DUEL = 1851
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL = 1852
---@readonly
ACT_HL2MP_GESTURE_RELOAD_DUEL = 1853
---@readonly
ACT_HL2MP_JUMP_DUEL = 1854
---@readonly
ACT_HL2MP_SWIM_IDLE_DUEL = 1855
---@readonly
ACT_HL2MP_SWIM_DUEL = 1856
---@readonly
ACT_HL2MP_IDLE_PHYSGUN = 1857
---@readonly
ACT_HL2MP_WALK_PHYSGUN = 1858
---@readonly
ACT_HL2MP_RUN_PHYSGUN = 1859
---@readonly
ACT_HL2MP_IDLE_CROUCH_PHYSGUN = 1860
---@readonly
ACT_HL2MP_WALK_CROUCH_PHYSGUN = 1861
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN = 1862
---@readonly
ACT_HL2MP_GESTURE_RELOAD_PHYSGUN = 1863
---@readonly
ACT_HL2MP_JUMP_PHYSGUN = 1864
---@readonly
ACT_HL2MP_SWIM_IDLE_PHYSGUN = 1865
---@readonly
ACT_HL2MP_SWIM_PHYSGUN = 1866
---@readonly
ACT_HL2MP_IDLE_CROSSBOW = 1867
---@readonly
ACT_HL2MP_WALK_CROSSBOW = 1868
---@readonly
ACT_HL2MP_RUN_CROSSBOW = 1869
---@readonly
ACT_HL2MP_IDLE_CROUCH_CROSSBOW = 1870
---@readonly
ACT_HL2MP_WALK_CROUCH_CROSSBOW = 1871
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW = 1872
---@readonly
ACT_HL2MP_GESTURE_RELOAD_CROSSBOW = 1873
---@readonly
ACT_HL2MP_JUMP_CROSSBOW = 1874
---@readonly
ACT_HL2MP_SWIM_IDLE_CROSSBOW = 1875
---@readonly
ACT_HL2MP_SWIM_CROSSBOW = 1876
---@readonly
ACT_HL2MP_IDLE_MELEE = 1877
---@readonly
ACT_HL2MP_WALK_MELEE = 1878
---@readonly
ACT_HL2MP_RUN_MELEE = 1879
---@readonly
ACT_HL2MP_IDLE_CROUCH_MELEE = 1880
---@readonly
ACT_HL2MP_WALK_CROUCH_MELEE = 1881
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE = 1882
---@readonly
ACT_HL2MP_GESTURE_RELOAD_MELEE = 1883
---@readonly
ACT_HL2MP_JUMP_MELEE = 1884
---@readonly
ACT_HL2MP_SWIM_IDLE_MELEE = 1885
---@readonly
ACT_HL2MP_SWIM_MELEE = 1886
---@readonly
ACT_HL2MP_IDLE_SLAM = 1887
---@readonly
ACT_HL2MP_WALK_SLAM = 1888
---@readonly
ACT_HL2MP_RUN_SLAM = 1889
---@readonly
ACT_HL2MP_IDLE_CROUCH_SLAM = 1890
---@readonly
ACT_HL2MP_WALK_CROUCH_SLAM = 1891
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM = 1892
---@readonly
ACT_HL2MP_GESTURE_RELOAD_SLAM = 1893
---@readonly
ACT_HL2MP_JUMP_SLAM = 1894
---@readonly
ACT_HL2MP_SWIM_IDLE_SLAM = 1895
---@readonly
ACT_HL2MP_SWIM_SLAM = 1896
---@readonly
ACT_VM_CRAWL = 1897
---@readonly
ACT_VM_CRAWL_EMPTY = 1898
---@readonly
ACT_VM_HOLSTER_EMPTY = 1899
---@readonly
ACT_VM_DOWN = 1900
---@readonly
ACT_VM_DOWN_EMPTY = 1901
---@readonly
ACT_VM_READY = 1902
---@readonly
ACT_VM_ISHOOT = 1903
---@readonly
ACT_VM_IIN = 1904
---@readonly
ACT_VM_IIN_EMPTY = 1905
---@readonly
ACT_VM_IIDLE = 1906
---@readonly
ACT_VM_IIDLE_EMPTY = 1907
---@readonly
ACT_VM_IOUT = 1908
---@readonly
ACT_VM_IOUT_EMPTY = 1909
---@readonly
ACT_VM_PULLBACK_HIGH_BAKE = 1910
---@readonly
ACT_VM_HITKILL = 1911
---@readonly
ACT_VM_DEPLOYED_IN = 1912
---@readonly
ACT_VM_DEPLOYED_IDLE = 1913
---@readonly
ACT_VM_DEPLOYED_FIRE = 1914
---@readonly
ACT_VM_DEPLOYED_DRYFIRE = 1915
---@readonly
ACT_VM_DEPLOYED_RELOAD = 1916
---@readonly
ACT_VM_DEPLOYED_RELOAD_EMPTY = 1917
---@readonly
ACT_VM_DEPLOYED_OUT = 1918
---@readonly
ACT_VM_DEPLOYED_IRON_IN = 1919
---@readonly
ACT_VM_DEPLOYED_IRON_IDLE = 1920
---@readonly
ACT_VM_DEPLOYED_IRON_FIRE = 1921
---@readonly
ACT_VM_DEPLOYED_IRON_DRYFIRE = 1922
---@readonly
ACT_VM_DEPLOYED_IRON_OUT = 1923
---@readonly
ACT_VM_DEPLOYED_LIFTED_IN = 1924
---@readonly
ACT_VM_DEPLOYED_LIFTED_IDLE = 1925
---@readonly
ACT_VM_DEPLOYED_LIFTED_OUT = 1926
---@readonly
ACT_VM_RELOADEMPTY = 1927
---@readonly
ACT_VM_IRECOIL1 = 1928
---@readonly
ACT_VM_IRECOIL2 = 1929
---@readonly
ACT_VM_FIREMODE = 1930
---@readonly
ACT_VM_ISHOOT_LAST = 1931
---@readonly
ACT_VM_IFIREMODE = 1932
---@readonly
ACT_VM_DFIREMODE = 1933
---@readonly
ACT_VM_DIFIREMODE = 1934
---@readonly
ACT_VM_SHOOTLAST = 1935
---@readonly
ACT_VM_ISHOOTDRY = 1936
---@readonly
ACT_VM_DRAW_M203 = 1937
---@readonly
ACT_VM_DRAWFULL_M203 = 1938
---@readonly
ACT_VM_READY_M203 = 1939
---@readonly
ACT_VM_IDLE_M203 = 1940
---@readonly
ACT_VM_RELOAD_M203 = 1941
---@readonly
ACT_VM_HOLSTER_M203 = 1942
---@readonly
ACT_VM_HOLSTERFULL_M203 = 1943
---@readonly
ACT_VM_IIN_M203 = 1944
---@readonly
ACT_VM_IIDLE_M203 = 1945
---@readonly
ACT_VM_IOUT_M203 = 1946
---@readonly
ACT_VM_CRAWL_M203 = 1947
---@readonly
ACT_VM_DOWN_M203 = 1948
---@readonly
ACT_VM_ISHOOT_M203 = 1949
---@readonly
ACT_VM_RELOAD_INSERT = 1950
---@readonly
ACT_VM_RELOAD_INSERT_PULL = 1951
---@readonly
ACT_VM_RELOAD_END = 1952
---@readonly
ACT_VM_RELOAD_END_EMPTY = 1953
---@readonly
ACT_VM_RELOAD_INSERT_EMPTY = 1954
---@readonly
ACT_CROSSBOW_HOLSTER_UNLOADED = 1955
---@readonly
ACT_VM_FIRE_TO_EMPTY = 1956
---@readonly
ACT_VM_UNLOAD = 1957
---@readonly
ACT_VM_RELOAD2 = 1958
---@readonly
ACT_GMOD_NOCLIP_LAYER = 1959
---@readonly
ACT_HL2MP_IDLE_FIST = 1960
---@readonly
ACT_HL2MP_WALK_FIST = 1961
---@readonly
ACT_HL2MP_RUN_FIST = 1962
---@readonly
ACT_HL2MP_IDLE_CROUCH_FIST = 1963
---@readonly
ACT_HL2MP_WALK_CROUCH_FIST = 1964
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST = 1965
---@readonly
ACT_HL2MP_GESTURE_RELOAD_FIST = 1966
---@readonly
ACT_HL2MP_JUMP_FIST = 1967
---@readonly
ACT_HL2MP_SWIM_IDLE_FIST = 1968
---@readonly
ACT_HL2MP_SWIM_FIST = 1969
---@readonly
ACT_HL2MP_SIT = 1970
---@readonly
ACT_HL2MP_FIST_BLOCK = 1971
---@readonly
ACT_DRIVE_AIRBOAT = 1972
---@readonly
ACT_DRIVE_JEEP = 1973
---@readonly
ACT_GMOD_SIT_ROLLERCOASTER = 1974
---@readonly
ACT_HL2MP_IDLE_KNIFE = 1975
---@readonly
ACT_HL2MP_WALK_KNIFE = 1976
---@readonly
ACT_HL2MP_RUN_KNIFE = 1977
---@readonly
ACT_HL2MP_IDLE_CROUCH_KNIFE = 1978
---@readonly
ACT_HL2MP_WALK_CROUCH_KNIFE = 1979
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE = 1980
---@readonly
ACT_HL2MP_GESTURE_RELOAD_KNIFE = 1981
---@readonly
ACT_HL2MP_JUMP_KNIFE = 1982
---@readonly
ACT_HL2MP_SWIM_IDLE_KNIFE = 1983
---@readonly
ACT_HL2MP_SWIM_KNIFE = 1984
---@readonly
ACT_HL2MP_IDLE_PASSIVE = 1985
---@readonly
ACT_HL2MP_WALK_PASSIVE = 1986
---@readonly
ACT_HL2MP_RUN_PASSIVE = 1987
---@readonly
ACT_HL2MP_IDLE_CROUCH_PASSIVE = 1988
---@readonly
ACT_HL2MP_WALK_CROUCH_PASSIVE = 1989
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE = 1990
---@readonly
ACT_HL2MP_GESTURE_RELOAD_PASSIVE = 1991
---@readonly
ACT_HL2MP_JUMP_PASSIVE = 1992
---@readonly
ACT_HL2MP_SWIM_PASSIVE = 1993
---@readonly
ACT_HL2MP_SWIM_IDLE_PASSIVE = 1994
---@readonly
ACT_HL2MP_IDLE_MELEE2 = 1995
---@readonly
ACT_HL2MP_WALK_MELEE2 = 1996
---@readonly
ACT_HL2MP_RUN_MELEE2 = 1997
---@readonly
ACT_HL2MP_IDLE_CROUCH_MELEE2 = 1998
---@readonly
ACT_HL2MP_WALK_CROUCH_MELEE2 = 1999
---@readonly
ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2 = 2000
---@readonly
ACT_HL2MP_GESTURE_RELOAD_MELEE2 = 2001
---@readonly
ACT_HL2MP_JUMP_MELEE2 = 2002
---@readonly
ACT_HL2MP_SWIM_IDLE_MELEE2 = 2003
---@readonly
ACT_HL2MP_SWIM_MELEE2 = 2004
---@readonly
ACT_HL2MP_SIT_PISTOL = 2005
---@readonly
ACT_HL2MP_SIT_SHOTGUN = 2006
---@readonly
ACT_HL2MP_SIT_SMG1 = 2007
---@readonly
ACT_HL2MP_SIT_AR2 = 2008
---@readonly
ACT_HL2MP_SIT_PHYSGUN = 2009
---@readonly
ACT_HL2MP_SIT_GRENADE = 2010
---@readonly
ACT_HL2MP_SIT_RPG = 2011
---@readonly
ACT_HL2MP_SIT_CROSSBOW = 2012
---@readonly
ACT_HL2MP_SIT_MELEE = 2013
---@readonly
ACT_HL2MP_SIT_SLAM = 2014
---@readonly
ACT_HL2MP_SIT_FIST = 2015
---@readonly
ACT_GMOD_IN_CHAT = 2019
---@readonly
ACT_GMOD_GESTURE_ITEM_GIVE = 2020
---@readonly
ACT_GMOD_GESTURE_ITEM_DROP = 2021
---@readonly
ACT_GMOD_GESTURE_ITEM_PLACE = 2022
---@readonly
ACT_GMOD_GESTURE_ITEM_THROW = 2023
---@readonly
ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND = 2024
---@readonly
ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND = 2025
---@readonly
ACT_HL2MP_SWIM_IDLE = 2026
---@readonly
ACT_HL2MP_IDLE_COWER = 2027
---@readonly
ACT_GMOD_DEATH = 2028
---@readonly
ACT_DRIVE_POD = 2029
---@readonly
ACT_FLINCH = 2030
---@readonly
ACT_FLINCH_BACK = 2031
---@readonly
ACT_FLINCH_SHOULDER_LEFT = 2032
---@readonly
ACT_FLINCH_SHOULDER_RIGHT = 2033
---@readonly
ACT_HL2MP_SIT_CAMERA = 2034
---@readonly
ACT_HL2MP_SIT_PASSIVE = 2035
---@readonly
ACT_HL2MP_ZOMBIE_SLUMP_ALT_IDLE = 2036
---@readonly
ACT_HL2MP_ZOMBIE_SLUMP_ALT_RISE_FAST = 2037
---@readonly
ACT_HL2MP_ZOMBIE_SLUMP_ALT_RISE_SLOW = 2038
---@readonly
ACT_GMOD_SHOWOFF_STAND_01 = 2039
---@readonly
ACT_GMOD_SHOWOFF_STAND_02 = 2040
---@readonly
ACT_GMOD_SHOWOFF_STAND_03 = 2041
---@readonly
ACT_GMOD_SHOWOFF_STAND_04 = 2042
---@readonly
ACT_GMOD_SHOWOFF_DUCK_01 = 2043
---@readonly
ACT_GMOD_SHOWOFF_DUCK_02 = 2044
--- The last shared activity number. IDs after this are "private" activities registered at runtime, and will have random IDs associated with specific ACTivities.
---@readonly
LAST_SHARED_ACTIVITY = 2045

---@enum ACT : number
---| ACT_INVALID
---| ACT_RESET
---| ACT_IDLE
---| ACT_TRANSITION
---| ACT_COVER
---| ACT_COVER_MED
---| ACT_COVER_LOW
---| ACT_WALK
---| ACT_WALK_AIM
---| ACT_WALK_CROUCH
---| ACT_WALK_CROUCH_AIM
---| ACT_RUN
---| ACT_RUN_AIM
---| ACT_RUN_CROUCH
---| ACT_RUN_CROUCH_AIM
---| ACT_RUN_PROTECTED
---| ACT_SCRIPT_CUSTOM_MOVE
---| ACT_RANGE_ATTACK1
---| ACT_RANGE_ATTACK2
---| ACT_RANGE_ATTACK1_LOW
---| ACT_RANGE_ATTACK2_LOW
---| ACT_DIESIMPLE
---| ACT_DIEBACKWARD
---| ACT_DIEFORWARD
---| ACT_DIEVIOLENT
---| ACT_DIERAGDOLL
---| ACT_FLY
---| ACT_HOVER
---| ACT_GLIDE
---| ACT_SWIM
---| ACT_SWIM_IDLE
---| ACT_JUMP
---| ACT_HOP
---| ACT_LEAP
---| ACT_LAND
---| ACT_CLIMB_UP
---| ACT_CLIMB_DOWN
---| ACT_CLIMB_DISMOUNT
---| ACT_SHIPLADDER_UP
---| ACT_SHIPLADDER_DOWN
---| ACT_STRAFE_LEFT
---| ACT_STRAFE_RIGHT
---| ACT_ROLL_LEFT
---| ACT_ROLL_RIGHT
---| ACT_TURN_LEFT
---| ACT_TURN_RIGHT
---| ACT_CROUCH
---| ACT_CROUCHIDLE
---| ACT_STAND
---| ACT_USE
---| ACT_SIGNAL1
---| ACT_SIGNAL2
---| ACT_SIGNAL3
---| ACT_SIGNAL_ADVANCE
---| ACT_SIGNAL_FORWARD
---| ACT_SIGNAL_GROUP
---| ACT_SIGNAL_HALT
---| ACT_SIGNAL_LEFT
---| ACT_SIGNAL_RIGHT
---| ACT_SIGNAL_TAKECOVER
---| ACT_LOOKBACK_RIGHT
---| ACT_LOOKBACK_LEFT
---| ACT_COWER
---| ACT_SMALL_FLINCH
---| ACT_BIG_FLINCH
---| ACT_MELEE_ATTACK1
---| ACT_MELEE_ATTACK2
---| ACT_RELOAD
---| ACT_RELOAD_START
---| ACT_RELOAD_FINISH
---| ACT_RELOAD_LOW
---| ACT_ARM
---| ACT_DISARM
---| ACT_DROP_WEAPON
---| ACT_DROP_WEAPON_SHOTGUN
---| ACT_PICKUP_GROUND
---| ACT_PICKUP_RACK
---| ACT_IDLE_ANGRY
---| ACT_IDLE_RELAXED
---| ACT_IDLE_STIMULATED
---| ACT_IDLE_AGITATED
---| ACT_IDLE_STEALTH
---| ACT_IDLE_HURT
---| ACT_WALK_RELAXED
---| ACT_WALK_STIMULATED
---| ACT_WALK_AGITATED
---| ACT_WALK_STEALTH
---| ACT_RUN_RELAXED
---| ACT_RUN_STIMULATED
---| ACT_RUN_AGITATED
---| ACT_RUN_STEALTH
---| ACT_IDLE_AIM_RELAXED
---| ACT_IDLE_AIM_STIMULATED
---| ACT_IDLE_AIM_AGITATED
---| ACT_IDLE_AIM_STEALTH
---| ACT_WALK_AIM_RELAXED
---| ACT_WALK_AIM_STIMULATED
---| ACT_WALK_AIM_AGITATED
---| ACT_WALK_AIM_STEALTH
---| ACT_RUN_AIM_RELAXED
---| ACT_RUN_AIM_STIMULATED
---| ACT_RUN_AIM_AGITATED
---| ACT_RUN_AIM_STEALTH
---| ACT_CROUCHIDLE_STIMULATED
---| ACT_CROUCHIDLE_AIM_STIMULATED
---| ACT_CROUCHIDLE_AGITATED
---| ACT_WALK_HURT
---| ACT_RUN_HURT
---| ACT_SPECIAL_ATTACK1
---| ACT_SPECIAL_ATTACK2
---| ACT_COMBAT_IDLE
---| ACT_WALK_SCARED
---| ACT_RUN_SCARED
---| ACT_VICTORY_DANCE
---| ACT_DIE_HEADSHOT
---| ACT_DIE_CHESTSHOT
---| ACT_DIE_GUTSHOT
---| ACT_DIE_BACKSHOT
---| ACT_FLINCH_HEAD
---| ACT_FLINCH_CHEST
---| ACT_FLINCH_STOMACH
---| ACT_FLINCH_LEFTARM
---| ACT_FLINCH_RIGHTARM
---| ACT_FLINCH_LEFTLEG
---| ACT_FLINCH_RIGHTLEG
---| ACT_FLINCH_PHYSICS
---| ACT_IDLE_ON_FIRE
---| ACT_WALK_ON_FIRE
---| ACT_RUN_ON_FIRE
---| ACT_RAPPEL_LOOP
---| ACT_180_LEFT
---| ACT_180_RIGHT
---| ACT_90_LEFT
---| ACT_90_RIGHT
---| ACT_STEP_LEFT
---| ACT_STEP_RIGHT
---| ACT_STEP_BACK
---| ACT_STEP_FORE
---| ACT_GESTURE_RANGE_ATTACK1
---| ACT_GESTURE_RANGE_ATTACK2
---| ACT_GESTURE_MELEE_ATTACK1
---| ACT_GESTURE_MELEE_ATTACK2
---| ACT_GESTURE_RANGE_ATTACK1_LOW
---| ACT_GESTURE_RANGE_ATTACK2_LOW
---| ACT_MELEE_ATTACK_SWING_GESTURE
---| ACT_GESTURE_SMALL_FLINCH
---| ACT_GESTURE_BIG_FLINCH
---| ACT_GESTURE_FLINCH_BLAST
---| ACT_GESTURE_FLINCH_BLAST_SHOTGUN
---| ACT_GESTURE_FLINCH_BLAST_DAMAGED
---| ACT_GESTURE_FLINCH_BLAST_DAMAGED_SHOTGUN
---| ACT_GESTURE_FLINCH_HEAD
---| ACT_GESTURE_FLINCH_CHEST
---| ACT_GESTURE_FLINCH_STOMACH
---| ACT_GESTURE_FLINCH_LEFTARM
---| ACT_GESTURE_FLINCH_RIGHTARM
---| ACT_GESTURE_FLINCH_LEFTLEG
---| ACT_GESTURE_FLINCH_RIGHTLEG
---| ACT_GESTURE_TURN_LEFT
---| ACT_GESTURE_TURN_RIGHT
---| ACT_GESTURE_TURN_LEFT45
---| ACT_GESTURE_TURN_RIGHT45
---| ACT_GESTURE_TURN_LEFT90
---| ACT_GESTURE_TURN_RIGHT90
---| ACT_GESTURE_TURN_LEFT45_FLAT
---| ACT_GESTURE_TURN_RIGHT45_FLAT
---| ACT_GESTURE_TURN_LEFT90_FLAT
---| ACT_GESTURE_TURN_RIGHT90_FLAT
---| ACT_BARNACLE_HIT
---| ACT_BARNACLE_PULL
---| ACT_BARNACLE_CHOMP
---| ACT_BARNACLE_CHEW
---| ACT_DO_NOT_DISTURB
---| ACT_VM_DRAW
---| ACT_VM_HOLSTER
---| ACT_VM_IDLE
---| ACT_VM_FIDGET
---| ACT_VM_PULLBACK
---| ACT_VM_PULLBACK_HIGH
---| ACT_VM_PULLBACK_LOW
---| ACT_VM_THROW
---| ACT_VM_PULLPIN
---| ACT_VM_PRIMARYATTACK
---| ACT_VM_SECONDARYATTACK
---| ACT_VM_RELOAD
---| ACT_VM_DRYFIRE
---| ACT_VM_HITLEFT
---| ACT_VM_HITLEFT2
---| ACT_VM_HITRIGHT
---| ACT_VM_HITRIGHT2
---| ACT_VM_HITCENTER
---| ACT_VM_HITCENTER2
---| ACT_VM_MISSLEFT
---| ACT_VM_MISSLEFT2
---| ACT_VM_MISSRIGHT
---| ACT_VM_MISSRIGHT2
---| ACT_VM_MISSCENTER
---| ACT_VM_MISSCENTER2
---| ACT_VM_HAULBACK
---| ACT_VM_SWINGHARD
---| ACT_VM_SWINGMISS
---| ACT_VM_SWINGHIT
---| ACT_VM_IDLE_TO_LOWERED
---| ACT_VM_IDLE_LOWERED
---| ACT_VM_LOWERED_TO_IDLE
---| ACT_VM_RECOIL1
---| ACT_VM_RECOIL2
---| ACT_VM_RECOIL3
---| ACT_VM_PICKUP
---| ACT_VM_RELEASE
---| ACT_VM_ATTACH_SILENCER
---| ACT_VM_DETACH_SILENCER
---| ACT_SLAM_STICKWALL_IDLE
---| ACT_SLAM_STICKWALL_ND_IDLE
---| ACT_SLAM_STICKWALL_ATTACH
---| ACT_SLAM_STICKWALL_ATTACH2
---| ACT_SLAM_STICKWALL_ND_ATTACH
---| ACT_SLAM_STICKWALL_ND_ATTACH2
---| ACT_SLAM_STICKWALL_DETONATE
---| ACT_SLAM_STICKWALL_DETONATOR_HOLSTER
---| ACT_SLAM_STICKWALL_DRAW
---| ACT_SLAM_STICKWALL_ND_DRAW
---| ACT_SLAM_STICKWALL_TO_THROW
---| ACT_SLAM_STICKWALL_TO_THROW_ND
---| ACT_SLAM_STICKWALL_TO_TRIPMINE_ND
---| ACT_SLAM_THROW_IDLE
---| ACT_SLAM_THROW_ND_IDLE
---| ACT_SLAM_THROW_THROW
---| ACT_SLAM_THROW_THROW2
---| ACT_SLAM_THROW_THROW_ND
---| ACT_SLAM_THROW_THROW_ND2
---| ACT_SLAM_THROW_DRAW
---| ACT_SLAM_THROW_ND_DRAW
---| ACT_SLAM_THROW_TO_STICKWALL
---| ACT_SLAM_THROW_TO_STICKWALL_ND
---| ACT_SLAM_THROW_DETONATE
---| ACT_SLAM_THROW_DETONATOR_HOLSTER
---| ACT_SLAM_THROW_TO_TRIPMINE_ND
---| ACT_SLAM_TRIPMINE_IDLE
---| ACT_SLAM_TRIPMINE_DRAW
---| ACT_SLAM_TRIPMINE_ATTACH
---| ACT_SLAM_TRIPMINE_ATTACH2
---| ACT_SLAM_TRIPMINE_TO_STICKWALL_ND
---| ACT_SLAM_TRIPMINE_TO_THROW_ND
---| ACT_SLAM_DETONATOR_IDLE
---| ACT_SLAM_DETONATOR_DRAW
---| ACT_SLAM_DETONATOR_DETONATE
---| ACT_SLAM_DETONATOR_HOLSTER
---| ACT_SLAM_DETONATOR_STICKWALL_DRAW
---| ACT_SLAM_DETONATOR_THROW_DRAW
---| ACT_SHOTGUN_RELOAD_START
---| ACT_SHOTGUN_RELOAD_FINISH
---| ACT_SHOTGUN_PUMP
---| ACT_SMG2_IDLE2
---| ACT_SMG2_FIRE2
---| ACT_SMG2_DRAW2
---| ACT_SMG2_RELOAD2
---| ACT_SMG2_DRYFIRE2
---| ACT_SMG2_TOAUTO
---| ACT_SMG2_TOBURST
---| ACT_PHYSCANNON_UPGRADE
---| ACT_RANGE_ATTACK_AR1
---| ACT_RANGE_ATTACK_AR2
---| ACT_RANGE_ATTACK_AR2_LOW
---| ACT_RANGE_ATTACK_AR2_GRENADE
---| ACT_RANGE_ATTACK_HMG1
---| ACT_RANGE_ATTACK_ML
---| ACT_RANGE_ATTACK_SMG1
---| ACT_RANGE_ATTACK_SMG1_LOW
---| ACT_RANGE_ATTACK_SMG2
---| ACT_RANGE_ATTACK_SHOTGUN
---| ACT_RANGE_ATTACK_SHOTGUN_LOW
---| ACT_RANGE_ATTACK_PISTOL
---| ACT_RANGE_ATTACK_PISTOL_LOW
---| ACT_RANGE_ATTACK_SLAM
---| ACT_RANGE_ATTACK_TRIPWIRE
---| ACT_RANGE_ATTACK_THROW
---| ACT_RANGE_ATTACK_SNIPER_RIFLE
---| ACT_RANGE_ATTACK_RPG
---| ACT_MELEE_ATTACK_SWING
---| ACT_RANGE_AIM_LOW
---| ACT_RANGE_AIM_SMG1_LOW
---| ACT_RANGE_AIM_PISTOL_LOW
---| ACT_RANGE_AIM_AR2_LOW
---| ACT_COVER_PISTOL_LOW
---| ACT_COVER_SMG1_LOW
---| ACT_GESTURE_RANGE_ATTACK_AR1
---| ACT_GESTURE_RANGE_ATTACK_AR2
---| ACT_GESTURE_RANGE_ATTACK_AR2_GRENADE
---| ACT_GESTURE_RANGE_ATTACK_HMG1
---| ACT_GESTURE_RANGE_ATTACK_ML
---| ACT_GESTURE_RANGE_ATTACK_SMG1
---| ACT_GESTURE_RANGE_ATTACK_SMG1_LOW
---| ACT_GESTURE_RANGE_ATTACK_SMG2
---| ACT_GESTURE_RANGE_ATTACK_SHOTGUN
---| ACT_GESTURE_RANGE_ATTACK_PISTOL
---| ACT_GESTURE_RANGE_ATTACK_PISTOL_LOW
---| ACT_GESTURE_RANGE_ATTACK_SLAM
---| ACT_GESTURE_RANGE_ATTACK_TRIPWIRE
---| ACT_GESTURE_RANGE_ATTACK_THROW
---| ACT_GESTURE_RANGE_ATTACK_SNIPER_RIFLE
---| ACT_GESTURE_MELEE_ATTACK_SWING
---| ACT_IDLE_RIFLE
---| ACT_IDLE_SMG1
---| ACT_IDLE_ANGRY_SMG1
---| ACT_IDLE_PISTOL
---| ACT_IDLE_ANGRY_PISTOL
---| ACT_IDLE_ANGRY_SHOTGUN
---| ACT_IDLE_STEALTH_PISTOL
---| ACT_IDLE_PACKAGE
---| ACT_WALK_PACKAGE
---| ACT_IDLE_SUITCASE
---| ACT_WALK_SUITCASE
---| ACT_IDLE_SMG1_RELAXED
---| ACT_IDLE_SMG1_STIMULATED
---| ACT_WALK_RIFLE_RELAXED
---| ACT_RUN_RIFLE_RELAXED
---| ACT_WALK_RIFLE_STIMULATED
---| ACT_RUN_RIFLE_STIMULATED
---| ACT_IDLE_AIM_RIFLE_STIMULATED
---| ACT_WALK_AIM_RIFLE_STIMULATED
---| ACT_RUN_AIM_RIFLE_STIMULATED
---| ACT_IDLE_SHOTGUN_RELAXED
---| ACT_IDLE_SHOTGUN_STIMULATED
---| ACT_IDLE_SHOTGUN_AGITATED
---| ACT_WALK_ANGRY
---| ACT_POLICE_HARASS1
---| ACT_POLICE_HARASS2
---| ACT_IDLE_MANNEDGUN
---| ACT_IDLE_MELEE
---| ACT_IDLE_ANGRY_MELEE
---| ACT_IDLE_RPG_RELAXED
---| ACT_IDLE_RPG
---| ACT_IDLE_ANGRY_RPG
---| ACT_COVER_LOW_RPG
---| ACT_WALK_RPG
---| ACT_RUN_RPG
---| ACT_WALK_CROUCH_RPG
---| ACT_RUN_CROUCH_RPG
---| ACT_WALK_RPG_RELAXED
---| ACT_RUN_RPG_RELAXED
---| ACT_WALK_RIFLE
---| ACT_WALK_AIM_RIFLE
---| ACT_WALK_CROUCH_RIFLE
---| ACT_WALK_CROUCH_AIM_RIFLE
---| ACT_RUN_RIFLE
---| ACT_RUN_AIM_RIFLE
---| ACT_RUN_CROUCH_RIFLE
---| ACT_RUN_CROUCH_AIM_RIFLE
---| ACT_RUN_STEALTH_PISTOL
---| ACT_WALK_AIM_SHOTGUN
---| ACT_RUN_AIM_SHOTGUN
---| ACT_WALK_PISTOL
---| ACT_RUN_PISTOL
---| ACT_WALK_AIM_PISTOL
---| ACT_RUN_AIM_PISTOL
---| ACT_WALK_STEALTH_PISTOL
---| ACT_WALK_AIM_STEALTH_PISTOL
---| ACT_RUN_AIM_STEALTH_PISTOL
---| ACT_RELOAD_PISTOL
---| ACT_RELOAD_PISTOL_LOW
---| ACT_RELOAD_SMG1
---| ACT_RELOAD_SMG1_LOW
---| ACT_RELOAD_SHOTGUN
---| ACT_RELOAD_SHOTGUN_LOW
---| ACT_GESTURE_RELOAD
---| ACT_GESTURE_RELOAD_PISTOL
---| ACT_GESTURE_RELOAD_SMG1
---| ACT_GESTURE_RELOAD_SHOTGUN
---| ACT_BUSY_LEAN_LEFT
---| ACT_BUSY_LEAN_LEFT_ENTRY
---| ACT_BUSY_LEAN_LEFT_EXIT
---| ACT_BUSY_LEAN_BACK
---| ACT_BUSY_LEAN_BACK_ENTRY
---| ACT_BUSY_LEAN_BACK_EXIT
---| ACT_BUSY_SIT_GROUND
---| ACT_BUSY_SIT_GROUND_ENTRY
---| ACT_BUSY_SIT_GROUND_EXIT
---| ACT_BUSY_SIT_CHAIR
---| ACT_BUSY_SIT_CHAIR_ENTRY
---| ACT_BUSY_SIT_CHAIR_EXIT
---| ACT_BUSY_STAND
---| ACT_BUSY_QUEUE
---| ACT_DUCK_DODGE
---| ACT_DIE_BARNACLE_SWALLOW
---| ACT_GESTURE_BARNACLE_STRANGLE
---| ACT_PHYSCANNON_DETACH
---| ACT_PHYSCANNON_ANIMATE
---| ACT_PHYSCANNON_ANIMATE_PRE
---| ACT_PHYSCANNON_ANIMATE_POST
---| ACT_DIE_FRONTSIDE
---| ACT_DIE_RIGHTSIDE
---| ACT_DIE_BACKSIDE
---| ACT_DIE_LEFTSIDE
---| ACT_OPEN_DOOR
---| ACT_DI_ALYX_ZOMBIE_MELEE
---| ACT_DI_ALYX_ZOMBIE_TORSO_MELEE
---| ACT_DI_ALYX_HEADCRAB_MELEE
---| ACT_DI_ALYX_ANTLION
---| ACT_DI_ALYX_ZOMBIE_SHOTGUN64
---| ACT_DI_ALYX_ZOMBIE_SHOTGUN26
---| ACT_READINESS_RELAXED_TO_STIMULATED
---| ACT_READINESS_RELAXED_TO_STIMULATED_WALK
---| ACT_READINESS_AGITATED_TO_STIMULATED
---| ACT_READINESS_STIMULATED_TO_RELAXED
---| ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED
---| ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED_WALK
---| ACT_READINESS_PISTOL_AGITATED_TO_STIMULATED
---| ACT_READINESS_PISTOL_STIMULATED_TO_RELAXED
---| ACT_IDLE_CARRY
---| ACT_WALK_CARRY
---| ACT_STARTDYING
---| ACT_DYINGLOOP
---| ACT_DYINGTODEAD
---| ACT_RIDE_MANNED_GUN
---| ACT_VM_SPRINT_ENTER
---| ACT_VM_SPRINT_IDLE
---| ACT_VM_SPRINT_LEAVE
---| ACT_FIRE_START
---| ACT_FIRE_LOOP
---| ACT_FIRE_END
---| ACT_CROUCHING_GRENADEIDLE
---| ACT_CROUCHING_GRENADEREADY
---| ACT_CROUCHING_PRIMARYATTACK
---| ACT_OVERLAY_GRENADEIDLE
---| ACT_OVERLAY_GRENADEREADY
---| ACT_OVERLAY_PRIMARYATTACK
---| ACT_OVERLAY_SHIELD_UP
---| ACT_OVERLAY_SHIELD_DOWN
---| ACT_OVERLAY_SHIELD_UP_IDLE
---| ACT_OVERLAY_SHIELD_ATTACK
---| ACT_OVERLAY_SHIELD_KNOCKBACK
---| ACT_SHIELD_UP
---| ACT_SHIELD_DOWN
---| ACT_SHIELD_UP_IDLE
---| ACT_SHIELD_ATTACK
---| ACT_SHIELD_KNOCKBACK
---| ACT_CROUCHING_SHIELD_UP
---| ACT_CROUCHING_SHIELD_DOWN
---| ACT_CROUCHING_SHIELD_UP_IDLE
---| ACT_CROUCHING_SHIELD_ATTACK
---| ACT_CROUCHING_SHIELD_KNOCKBACK
---| ACT_TURNRIGHT45
---| ACT_TURNLEFT45
---| ACT_TURN
---| ACT_OBJ_ASSEMBLING
---| ACT_OBJ_DISMANTLING
---| ACT_OBJ_STARTUP
---| ACT_OBJ_RUNNING
---| ACT_OBJ_IDLE
---| ACT_OBJ_PLACING
---| ACT_OBJ_DETERIORATING
---| ACT_OBJ_UPGRADING
---| ACT_DEPLOY
---| ACT_DEPLOY_IDLE
---| ACT_UNDEPLOY
---| ACT_GRENADE_ROLL
---| ACT_GRENADE_TOSS
---| ACT_HANDGRENADE_THROW1
---| ACT_HANDGRENADE_THROW2
---| ACT_HANDGRENADE_THROW3
---| ACT_SHOTGUN_IDLE_DEEP
---| ACT_SHOTGUN_IDLE4
---| ACT_GLOCK_SHOOTEMPTY
---| ACT_GLOCK_SHOOT_RELOAD
---| ACT_RPG_DRAW_UNLOADED
---| ACT_RPG_HOLSTER_UNLOADED
---| ACT_RPG_IDLE_UNLOADED
---| ACT_RPG_FIDGET_UNLOADED
---| ACT_CROSSBOW_DRAW_UNLOADED
---| ACT_CROSSBOW_IDLE_UNLOADED
---| ACT_CROSSBOW_FIDGET_UNLOADED
---| ACT_GAUSS_SPINUP
---| ACT_GAUSS_SPINCYCLE
---| ACT_TRIPMINE_GROUND
---| ACT_TRIPMINE_WORLD
---| ACT_VM_PRIMARYATTACK_SILENCED
---| ACT_VM_RELOAD_SILENCED
---| ACT_VM_DRYFIRE_SILENCED
---| ACT_VM_IDLE_SILENCED
---| ACT_VM_DRAW_SILENCED
---| ACT_VM_IDLE_EMPTY_LEFT
---| ACT_VM_DRYFIRE_LEFT
---| ACT_PLAYER_IDLE_FIRE
---| ACT_PLAYER_CROUCH_FIRE
---| ACT_PLAYER_CROUCH_WALK_FIRE
---| ACT_PLAYER_WALK_FIRE
---| ACT_PLAYER_RUN_FIRE
---| ACT_IDLETORUN
---| ACT_RUNTOIDLE
---| ACT_SPRINT
---| ACT_GET_DOWN_STAND
---| ACT_GET_UP_STAND
---| ACT_GET_DOWN_CROUCH
---| ACT_GET_UP_CROUCH
---| ACT_PRONE_FORWARD
---| ACT_PRONE_IDLE
---| ACT_DEEPIDLE1
---| ACT_DEEPIDLE2
---| ACT_DEEPIDLE3
---| ACT_DEEPIDLE4
---| ACT_VM_RELOAD_DEPLOYED
---| ACT_VM_RELOAD_IDLE
---| ACT_VM_DRAW_DEPLOYED
---| ACT_VM_DRAW_EMPTY
---| ACT_VM_PRIMARYATTACK_EMPTY
---| ACT_VM_RELOAD_EMPTY
---| ACT_VM_IDLE_EMPTY
---| ACT_VM_IDLE_DEPLOYED_EMPTY
---| ACT_VM_IDLE_8
---| ACT_VM_IDLE_7
---| ACT_VM_IDLE_6
---| ACT_VM_IDLE_5
---| ACT_VM_IDLE_4
---| ACT_VM_IDLE_3
---| ACT_VM_IDLE_2
---| ACT_VM_IDLE_1
---| ACT_VM_IDLE_DEPLOYED
---| ACT_VM_IDLE_DEPLOYED_8
---| ACT_VM_IDLE_DEPLOYED_7
---| ACT_VM_IDLE_DEPLOYED_6
---| ACT_VM_IDLE_DEPLOYED_5
---| ACT_VM_IDLE_DEPLOYED_4
---| ACT_VM_IDLE_DEPLOYED_3
---| ACT_VM_IDLE_DEPLOYED_2
---| ACT_VM_IDLE_DEPLOYED_1
---| ACT_VM_UNDEPLOY
---| ACT_VM_UNDEPLOY_8
---| ACT_VM_UNDEPLOY_7
---| ACT_VM_UNDEPLOY_6
---| ACT_VM_UNDEPLOY_5
---| ACT_VM_UNDEPLOY_4
---| ACT_VM_UNDEPLOY_3
---| ACT_VM_UNDEPLOY_2
---| ACT_VM_UNDEPLOY_1
---| ACT_VM_UNDEPLOY_EMPTY
---| ACT_VM_DEPLOY
---| ACT_VM_DEPLOY_8
---| ACT_VM_DEPLOY_7
---| ACT_VM_DEPLOY_6
---| ACT_VM_DEPLOY_5
---| ACT_VM_DEPLOY_4
---| ACT_VM_DEPLOY_3
---| ACT_VM_DEPLOY_2
---| ACT_VM_DEPLOY_1
---| ACT_VM_DEPLOY_EMPTY
---| ACT_VM_PRIMARYATTACK_8
---| ACT_VM_PRIMARYATTACK_7
---| ACT_VM_PRIMARYATTACK_6
---| ACT_VM_PRIMARYATTACK_5
---| ACT_VM_PRIMARYATTACK_4
---| ACT_VM_PRIMARYATTACK_3
---| ACT_VM_PRIMARYATTACK_2
---| ACT_VM_PRIMARYATTACK_1
---| ACT_VM_PRIMARYATTACK_DEPLOYED
---| ACT_VM_PRIMARYATTACK_DEPLOYED_8
---| ACT_VM_PRIMARYATTACK_DEPLOYED_7
---| ACT_VM_PRIMARYATTACK_DEPLOYED_6
---| ACT_VM_PRIMARYATTACK_DEPLOYED_5
---| ACT_VM_PRIMARYATTACK_DEPLOYED_4
---| ACT_VM_PRIMARYATTACK_DEPLOYED_3
---| ACT_VM_PRIMARYATTACK_DEPLOYED_2
---| ACT_VM_PRIMARYATTACK_DEPLOYED_1
---| ACT_VM_PRIMARYATTACK_DEPLOYED_EMPTY
---| ACT_DOD_DEPLOYED
---| ACT_DOD_PRONE_DEPLOYED
---| ACT_DOD_IDLE_ZOOMED
---| ACT_DOD_WALK_ZOOMED
---| ACT_DOD_CROUCH_ZOOMED
---| ACT_DOD_CROUCHWALK_ZOOMED
---| ACT_DOD_PRONE_ZOOMED
---| ACT_DOD_PRONE_FORWARD_ZOOMED
---| ACT_DOD_PRIMARYATTACK_DEPLOYED
---| ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED
---| ACT_DOD_RELOAD_DEPLOYED
---| ACT_DOD_RELOAD_PRONE_DEPLOYED
---| ACT_DOD_PRIMARYATTACK_PRONE
---| ACT_DOD_SECONDARYATTACK_PRONE
---| ACT_DOD_RELOAD_CROUCH
---| ACT_DOD_RELOAD_PRONE
---| ACT_DOD_STAND_IDLE
---| ACT_DOD_STAND_AIM
---| ACT_DOD_CROUCH_IDLE
---| ACT_DOD_CROUCH_AIM
---| ACT_DOD_CROUCHWALK_IDLE
---| ACT_DOD_CROUCHWALK_AIM
---| ACT_DOD_WALK_IDLE
---| ACT_DOD_WALK_AIM
---| ACT_DOD_RUN_IDLE
---| ACT_DOD_RUN_AIM
---| ACT_DOD_STAND_AIM_PISTOL
---| ACT_DOD_CROUCH_AIM_PISTOL
---| ACT_DOD_CROUCHWALK_AIM_PISTOL
---| ACT_DOD_WALK_AIM_PISTOL
---| ACT_DOD_RUN_AIM_PISTOL
---| ACT_DOD_PRONE_AIM_PISTOL
---| ACT_DOD_STAND_IDLE_PISTOL
---| ACT_DOD_CROUCH_IDLE_PISTOL
---| ACT_DOD_CROUCHWALK_IDLE_PISTOL
---| ACT_DOD_WALK_IDLE_PISTOL
---| ACT_DOD_RUN_IDLE_PISTOL
---| ACT_DOD_SPRINT_IDLE_PISTOL
---| ACT_DOD_PRONEWALK_IDLE_PISTOL
---| ACT_DOD_STAND_AIM_C96
---| ACT_DOD_CROUCH_AIM_C96
---| ACT_DOD_CROUCHWALK_AIM_C96
---| ACT_DOD_WALK_AIM_C96
---| ACT_DOD_RUN_AIM_C96
---| ACT_DOD_PRONE_AIM_C96
---| ACT_DOD_STAND_IDLE_C96
---| ACT_DOD_CROUCH_IDLE_C96
---| ACT_DOD_CROUCHWALK_IDLE_C96
---| ACT_DOD_WALK_IDLE_C96
---| ACT_DOD_RUN_IDLE_C96
---| ACT_DOD_SPRINT_IDLE_C96
---| ACT_DOD_PRONEWALK_IDLE_C96
---| ACT_DOD_STAND_AIM_RIFLE
---| ACT_DOD_CROUCH_AIM_RIFLE
---| ACT_DOD_CROUCHWALK_AIM_RIFLE
---| ACT_DOD_WALK_AIM_RIFLE
---| ACT_DOD_RUN_AIM_RIFLE
---| ACT_DOD_PRONE_AIM_RIFLE
---| ACT_DOD_STAND_IDLE_RIFLE
---| ACT_DOD_CROUCH_IDLE_RIFLE
---| ACT_DOD_CROUCHWALK_IDLE_RIFLE
---| ACT_DOD_WALK_IDLE_RIFLE
---| ACT_DOD_RUN_IDLE_RIFLE
---| ACT_DOD_SPRINT_IDLE_RIFLE
---| ACT_DOD_PRONEWALK_IDLE_RIFLE
---| ACT_DOD_STAND_AIM_BOLT
---| ACT_DOD_CROUCH_AIM_BOLT
---| ACT_DOD_CROUCHWALK_AIM_BOLT
---| ACT_DOD_WALK_AIM_BOLT
---| ACT_DOD_RUN_AIM_BOLT
---| ACT_DOD_PRONE_AIM_BOLT
---| ACT_DOD_STAND_IDLE_BOLT
---| ACT_DOD_CROUCH_IDLE_BOLT
---| ACT_DOD_CROUCHWALK_IDLE_BOLT
---| ACT_DOD_WALK_IDLE_BOLT
---| ACT_DOD_RUN_IDLE_BOLT
---| ACT_DOD_SPRINT_IDLE_BOLT
---| ACT_DOD_PRONEWALK_IDLE_BOLT
---| ACT_DOD_STAND_AIM_TOMMY
---| ACT_DOD_CROUCH_AIM_TOMMY
---| ACT_DOD_CROUCHWALK_AIM_TOMMY
---| ACT_DOD_WALK_AIM_TOMMY
---| ACT_DOD_RUN_AIM_TOMMY
---| ACT_DOD_PRONE_AIM_TOMMY
---| ACT_DOD_STAND_IDLE_TOMMY
---| ACT_DOD_CROUCH_IDLE_TOMMY
---| ACT_DOD_CROUCHWALK_IDLE_TOMMY
---| ACT_DOD_WALK_IDLE_TOMMY
---| ACT_DOD_RUN_IDLE_TOMMY
---| ACT_DOD_SPRINT_IDLE_TOMMY
---| ACT_DOD_PRONEWALK_IDLE_TOMMY
---| ACT_DOD_STAND_AIM_MP40
---| ACT_DOD_CROUCH_AIM_MP40
---| ACT_DOD_CROUCHWALK_AIM_MP40
---| ACT_DOD_WALK_AIM_MP40
---| ACT_DOD_RUN_AIM_MP40
---| ACT_DOD_PRONE_AIM_MP40
---| ACT_DOD_STAND_IDLE_MP40
---| ACT_DOD_CROUCH_IDLE_MP40
---| ACT_DOD_CROUCHWALK_IDLE_MP40
---| ACT_DOD_WALK_IDLE_MP40
---| ACT_DOD_RUN_IDLE_MP40
---| ACT_DOD_SPRINT_IDLE_MP40
---| ACT_DOD_PRONEWALK_IDLE_MP40
---| ACT_DOD_STAND_AIM_MP44
---| ACT_DOD_CROUCH_AIM_MP44
---| ACT_DOD_CROUCHWALK_AIM_MP44
---| ACT_DOD_WALK_AIM_MP44
---| ACT_DOD_RUN_AIM_MP44
---| ACT_DOD_PRONE_AIM_MP44
---| ACT_DOD_STAND_IDLE_MP44
---| ACT_DOD_CROUCH_IDLE_MP44
---| ACT_DOD_CROUCHWALK_IDLE_MP44
---| ACT_DOD_WALK_IDLE_MP44
---| ACT_DOD_RUN_IDLE_MP44
---| ACT_DOD_SPRINT_IDLE_MP44
---| ACT_DOD_PRONEWALK_IDLE_MP44
---| ACT_DOD_STAND_AIM_GREASE
---| ACT_DOD_CROUCH_AIM_GREASE
---| ACT_DOD_CROUCHWALK_AIM_GREASE
---| ACT_DOD_WALK_AIM_GREASE
---| ACT_DOD_RUN_AIM_GREASE
---| ACT_DOD_PRONE_AIM_GREASE
---| ACT_DOD_STAND_IDLE_GREASE
---| ACT_DOD_CROUCH_IDLE_GREASE
---| ACT_DOD_CROUCHWALK_IDLE_GREASE
---| ACT_DOD_WALK_IDLE_GREASE
---| ACT_DOD_RUN_IDLE_GREASE
---| ACT_DOD_SPRINT_IDLE_GREASE
---| ACT_DOD_PRONEWALK_IDLE_GREASE
---| ACT_DOD_STAND_AIM_MG
---| ACT_DOD_CROUCH_AIM_MG
---| ACT_DOD_CROUCHWALK_AIM_MG
---| ACT_DOD_WALK_AIM_MG
---| ACT_DOD_RUN_AIM_MG
---| ACT_DOD_PRONE_AIM_MG
---| ACT_DOD_STAND_IDLE_MG
---| ACT_DOD_CROUCH_IDLE_MG
---| ACT_DOD_CROUCHWALK_IDLE_MG
---| ACT_DOD_WALK_IDLE_MG
---| ACT_DOD_RUN_IDLE_MG
---| ACT_DOD_SPRINT_IDLE_MG
---| ACT_DOD_PRONEWALK_IDLE_MG
---| ACT_DOD_STAND_AIM_30CAL
---| ACT_DOD_CROUCH_AIM_30CAL
---| ACT_DOD_CROUCHWALK_AIM_30CAL
---| ACT_DOD_WALK_AIM_30CAL
---| ACT_DOD_RUN_AIM_30CAL
---| ACT_DOD_PRONE_AIM_30CAL
---| ACT_DOD_STAND_IDLE_30CAL
---| ACT_DOD_CROUCH_IDLE_30CAL
---| ACT_DOD_CROUCHWALK_IDLE_30CAL
---| ACT_DOD_WALK_IDLE_30CAL
---| ACT_DOD_RUN_IDLE_30CAL
---| ACT_DOD_SPRINT_IDLE_30CAL
---| ACT_DOD_PRONEWALK_IDLE_30CAL
---| ACT_DOD_STAND_AIM_GREN_FRAG
---| ACT_DOD_CROUCH_AIM_GREN_FRAG
---| ACT_DOD_CROUCHWALK_AIM_GREN_FRAG
---| ACT_DOD_WALK_AIM_GREN_FRAG
---| ACT_DOD_RUN_AIM_GREN_FRAG
---| ACT_DOD_PRONE_AIM_GREN_FRAG
---| ACT_DOD_SPRINT_AIM_GREN_FRAG
---| ACT_DOD_PRONEWALK_AIM_GREN_FRAG
---| ACT_DOD_STAND_AIM_GREN_STICK
---| ACT_DOD_CROUCH_AIM_GREN_STICK
---| ACT_DOD_CROUCHWALK_AIM_GREN_STICK
---| ACT_DOD_WALK_AIM_GREN_STICK
---| ACT_DOD_RUN_AIM_GREN_STICK
---| ACT_DOD_PRONE_AIM_GREN_STICK
---| ACT_DOD_SPRINT_AIM_GREN_STICK
---| ACT_DOD_PRONEWALK_AIM_GREN_STICK
---| ACT_DOD_STAND_AIM_KNIFE
---| ACT_DOD_CROUCH_AIM_KNIFE
---| ACT_DOD_CROUCHWALK_AIM_KNIFE
---| ACT_DOD_WALK_AIM_KNIFE
---| ACT_DOD_RUN_AIM_KNIFE
---| ACT_DOD_PRONE_AIM_KNIFE
---| ACT_DOD_SPRINT_AIM_KNIFE
---| ACT_DOD_PRONEWALK_AIM_KNIFE
---| ACT_DOD_STAND_AIM_SPADE
---| ACT_DOD_CROUCH_AIM_SPADE
---| ACT_DOD_CROUCHWALK_AIM_SPADE
---| ACT_DOD_WALK_AIM_SPADE
---| ACT_DOD_RUN_AIM_SPADE
---| ACT_DOD_PRONE_AIM_SPADE
---| ACT_DOD_SPRINT_AIM_SPADE
---| ACT_DOD_PRONEWALK_AIM_SPADE
---| ACT_DOD_STAND_AIM_BAZOOKA
---| ACT_DOD_CROUCH_AIM_BAZOOKA
---| ACT_DOD_CROUCHWALK_AIM_BAZOOKA
---| ACT_DOD_WALK_AIM_BAZOOKA
---| ACT_DOD_RUN_AIM_BAZOOKA
---| ACT_DOD_PRONE_AIM_BAZOOKA
---| ACT_DOD_STAND_IDLE_BAZOOKA
---| ACT_DOD_CROUCH_IDLE_BAZOOKA
---| ACT_DOD_CROUCHWALK_IDLE_BAZOOKA
---| ACT_DOD_WALK_IDLE_BAZOOKA
---| ACT_DOD_RUN_IDLE_BAZOOKA
---| ACT_DOD_SPRINT_IDLE_BAZOOKA
---| ACT_DOD_PRONEWALK_IDLE_BAZOOKA
---| ACT_DOD_STAND_AIM_PSCHRECK
---| ACT_DOD_CROUCH_AIM_PSCHRECK
---| ACT_DOD_CROUCHWALK_AIM_PSCHRECK
---| ACT_DOD_WALK_AIM_PSCHRECK
---| ACT_DOD_RUN_AIM_PSCHRECK
---| ACT_DOD_PRONE_AIM_PSCHRECK
---| ACT_DOD_STAND_IDLE_PSCHRECK
---| ACT_DOD_CROUCH_IDLE_PSCHRECK
---| ACT_DOD_CROUCHWALK_IDLE_PSCHRECK
---| ACT_DOD_WALK_IDLE_PSCHRECK
---| ACT_DOD_RUN_IDLE_PSCHRECK
---| ACT_DOD_SPRINT_IDLE_PSCHRECK
---| ACT_DOD_PRONEWALK_IDLE_PSCHRECK
---| ACT_DOD_STAND_AIM_BAR
---| ACT_DOD_CROUCH_AIM_BAR
---| ACT_DOD_CROUCHWALK_AIM_BAR
---| ACT_DOD_WALK_AIM_BAR
---| ACT_DOD_RUN_AIM_BAR
---| ACT_DOD_PRONE_AIM_BAR
---| ACT_DOD_STAND_IDLE_BAR
---| ACT_DOD_CROUCH_IDLE_BAR
---| ACT_DOD_CROUCHWALK_IDLE_BAR
---| ACT_DOD_WALK_IDLE_BAR
---| ACT_DOD_RUN_IDLE_BAR
---| ACT_DOD_SPRINT_IDLE_BAR
---| ACT_DOD_PRONEWALK_IDLE_BAR
---| ACT_DOD_STAND_ZOOM_RIFLE
---| ACT_DOD_CROUCH_ZOOM_RIFLE
---| ACT_DOD_CROUCHWALK_ZOOM_RIFLE
---| ACT_DOD_WALK_ZOOM_RIFLE
---| ACT_DOD_RUN_ZOOM_RIFLE
---| ACT_DOD_PRONE_ZOOM_RIFLE
---| ACT_DOD_STAND_ZOOM_BOLT
---| ACT_DOD_CROUCH_ZOOM_BOLT
---| ACT_DOD_CROUCHWALK_ZOOM_BOLT
---| ACT_DOD_WALK_ZOOM_BOLT
---| ACT_DOD_RUN_ZOOM_BOLT
---| ACT_DOD_PRONE_ZOOM_BOLT
---| ACT_DOD_STAND_ZOOM_BAZOOKA
---| ACT_DOD_CROUCH_ZOOM_BAZOOKA
---| ACT_DOD_CROUCHWALK_ZOOM_BAZOOKA
---| ACT_DOD_WALK_ZOOM_BAZOOKA
---| ACT_DOD_RUN_ZOOM_BAZOOKA
---| ACT_DOD_PRONE_ZOOM_BAZOOKA
---| ACT_DOD_STAND_ZOOM_PSCHRECK
---| ACT_DOD_CROUCH_ZOOM_PSCHRECK
---| ACT_DOD_CROUCHWALK_ZOOM_PSCHRECK
---| ACT_DOD_WALK_ZOOM_PSCHRECK
---| ACT_DOD_RUN_ZOOM_PSCHRECK
---| ACT_DOD_PRONE_ZOOM_PSCHRECK
---| ACT_DOD_DEPLOY_RIFLE
---| ACT_DOD_DEPLOY_TOMMY
---| ACT_DOD_DEPLOY_MG
---| ACT_DOD_DEPLOY_30CAL
---| ACT_DOD_PRONE_DEPLOY_RIFLE
---| ACT_DOD_PRONE_DEPLOY_TOMMY
---| ACT_DOD_PRONE_DEPLOY_MG
---| ACT_DOD_PRONE_DEPLOY_30CAL
---| ACT_DOD_PRIMARYATTACK_RIFLE
---| ACT_DOD_SECONDARYATTACK_RIFLE
---| ACT_DOD_PRIMARYATTACK_PRONE_RIFLE
---| ACT_DOD_SECONDARYATTACK_PRONE_RIFLE
---| ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_RIFLE
---| ACT_DOD_PRIMARYATTACK_DEPLOYED_RIFLE
---| ACT_DOD_PRIMARYATTACK_BOLT
---| ACT_DOD_SECONDARYATTACK_BOLT
---| ACT_DOD_PRIMARYATTACK_PRONE_BOLT
---| ACT_DOD_SECONDARYATTACK_PRONE_BOLT
---| ACT_DOD_PRIMARYATTACK_TOMMY
---| ACT_DOD_PRIMARYATTACK_PRONE_TOMMY
---| ACT_DOD_SECONDARYATTACK_TOMMY
---| ACT_DOD_SECONDARYATTACK_PRONE_TOMMY
---| ACT_DOD_PRIMARYATTACK_MP40
---| ACT_DOD_PRIMARYATTACK_PRONE_MP40
---| ACT_DOD_SECONDARYATTACK_MP40
---| ACT_DOD_SECONDARYATTACK_PRONE_MP40
---| ACT_DOD_PRIMARYATTACK_MP44
---| ACT_DOD_PRIMARYATTACK_PRONE_MP44
---| ACT_DOD_PRIMARYATTACK_GREASE
---| ACT_DOD_PRIMARYATTACK_PRONE_GREASE
---| ACT_DOD_PRIMARYATTACK_PISTOL
---| ACT_DOD_PRIMARYATTACK_PRONE_PISTOL
---| ACT_DOD_PRIMARYATTACK_C96
---| ACT_DOD_PRIMARYATTACK_PRONE_C96
---| ACT_DOD_PRIMARYATTACK_MG
---| ACT_DOD_PRIMARYATTACK_PRONE_MG
---| ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_MG
---| ACT_DOD_PRIMARYATTACK_DEPLOYED_MG
---| ACT_DOD_PRIMARYATTACK_30CAL
---| ACT_DOD_PRIMARYATTACK_PRONE_30CAL
---| ACT_DOD_PRIMARYATTACK_DEPLOYED_30CAL
---| ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_30CAL
---| ACT_DOD_PRIMARYATTACK_GREN_FRAG
---| ACT_DOD_PRIMARYATTACK_PRONE_GREN_FRAG
---| ACT_DOD_PRIMARYATTACK_GREN_STICK
---| ACT_DOD_PRIMARYATTACK_PRONE_GREN_STICK
---| ACT_DOD_PRIMARYATTACK_KNIFE
---| ACT_DOD_PRIMARYATTACK_PRONE_KNIFE
---| ACT_DOD_PRIMARYATTACK_SPADE
---| ACT_DOD_PRIMARYATTACK_PRONE_SPADE
---| ACT_DOD_PRIMARYATTACK_BAZOOKA
---| ACT_DOD_PRIMARYATTACK_PRONE_BAZOOKA
---| ACT_DOD_PRIMARYATTACK_PSCHRECK
---| ACT_DOD_PRIMARYATTACK_PRONE_PSCHRECK
---| ACT_DOD_PRIMARYATTACK_BAR
---| ACT_DOD_PRIMARYATTACK_PRONE_BAR
---| ACT_DOD_RELOAD_GARAND
---| ACT_DOD_RELOAD_K43
---| ACT_DOD_RELOAD_BAR
---| ACT_DOD_RELOAD_MP40
---| ACT_DOD_RELOAD_MP44
---| ACT_DOD_RELOAD_BOLT
---| ACT_DOD_RELOAD_M1CARBINE
---| ACT_DOD_RELOAD_TOMMY
---| ACT_DOD_RELOAD_GREASEGUN
---| ACT_DOD_RELOAD_PISTOL
---| ACT_DOD_RELOAD_FG42
---| ACT_DOD_RELOAD_RIFLE
---| ACT_DOD_RELOAD_RIFLEGRENADE
---| ACT_DOD_RELOAD_C96
---| ACT_DOD_RELOAD_CROUCH_BAR
---| ACT_DOD_RELOAD_CROUCH_RIFLE
---| ACT_DOD_RELOAD_CROUCH_RIFLEGRENADE
---| ACT_DOD_RELOAD_CROUCH_BOLT
---| ACT_DOD_RELOAD_CROUCH_MP44
---| ACT_DOD_RELOAD_CROUCH_MP40
---| ACT_DOD_RELOAD_CROUCH_TOMMY
---| ACT_DOD_RELOAD_CROUCH_BAZOOKA
---| ACT_DOD_RELOAD_CROUCH_PSCHRECK
---| ACT_DOD_RELOAD_CROUCH_PISTOL
---| ACT_DOD_RELOAD_CROUCH_M1CARBINE
---| ACT_DOD_RELOAD_CROUCH_C96
---| ACT_DOD_RELOAD_BAZOOKA
---| ACT_DOD_ZOOMLOAD_BAZOOKA
---| ACT_DOD_RELOAD_PSCHRECK
---| ACT_DOD_ZOOMLOAD_PSCHRECK
---| ACT_DOD_RELOAD_DEPLOYED_FG42
---| ACT_DOD_RELOAD_DEPLOYED_30CAL
---| ACT_DOD_RELOAD_DEPLOYED_MG
---| ACT_DOD_RELOAD_DEPLOYED_MG34
---| ACT_DOD_RELOAD_DEPLOYED_BAR
---| ACT_DOD_RELOAD_PRONE_PISTOL
---| ACT_DOD_RELOAD_PRONE_GARAND
---| ACT_DOD_RELOAD_PRONE_M1CARBINE
---| ACT_DOD_RELOAD_PRONE_BOLT
---| ACT_DOD_RELOAD_PRONE_K43
---| ACT_DOD_RELOAD_PRONE_MP40
---| ACT_DOD_RELOAD_PRONE_MP44
---| ACT_DOD_RELOAD_PRONE_BAR
---| ACT_DOD_RELOAD_PRONE_GREASEGUN
---| ACT_DOD_RELOAD_PRONE_TOMMY
---| ACT_DOD_RELOAD_PRONE_FG42
---| ACT_DOD_RELOAD_PRONE_RIFLE
---| ACT_DOD_RELOAD_PRONE_RIFLEGRENADE
---| ACT_DOD_RELOAD_PRONE_C96
---| ACT_DOD_RELOAD_PRONE_BAZOOKA
---| ACT_DOD_ZOOMLOAD_PRONE_BAZOOKA
---| ACT_DOD_RELOAD_PRONE_PSCHRECK
---| ACT_DOD_ZOOMLOAD_PRONE_PSCHRECK
---| ACT_DOD_RELOAD_PRONE_DEPLOYED_BAR
---| ACT_DOD_RELOAD_PRONE_DEPLOYED_FG42
---| ACT_DOD_RELOAD_PRONE_DEPLOYED_30CAL
---| ACT_DOD_RELOAD_PRONE_DEPLOYED_MG
---| ACT_DOD_RELOAD_PRONE_DEPLOYED_MG34
---| ACT_DOD_PRONE_ZOOM_FORWARD_RIFLE
---| ACT_DOD_PRONE_ZOOM_FORWARD_BOLT
---| ACT_DOD_PRONE_ZOOM_FORWARD_BAZOOKA
---| ACT_DOD_PRONE_ZOOM_FORWARD_PSCHRECK
---| ACT_DOD_PRIMARYATTACK_CROUCH
---| ACT_DOD_PRIMARYATTACK_CROUCH_SPADE
---| ACT_DOD_PRIMARYATTACK_CROUCH_KNIFE
---| ACT_DOD_PRIMARYATTACK_CROUCH_GREN_FRAG
---| ACT_DOD_PRIMARYATTACK_CROUCH_GREN_STICK
---| ACT_DOD_SECONDARYATTACK_CROUCH
---| ACT_DOD_SECONDARYATTACK_CROUCH_TOMMY
---| ACT_DOD_SECONDARYATTACK_CROUCH_MP40
---| ACT_DOD_HS_IDLE
---| ACT_DOD_HS_CROUCH
---| ACT_DOD_HS_IDLE_30CAL
---| ACT_DOD_HS_IDLE_BAZOOKA
---| ACT_DOD_HS_IDLE_PSCHRECK
---| ACT_DOD_HS_IDLE_KNIFE
---| ACT_DOD_HS_IDLE_MG42
---| ACT_DOD_HS_IDLE_PISTOL
---| ACT_DOD_HS_IDLE_STICKGRENADE
---| ACT_DOD_HS_IDLE_TOMMY
---| ACT_DOD_HS_IDLE_MP44
---| ACT_DOD_HS_IDLE_K98
---| ACT_DOD_HS_CROUCH_30CAL
---| ACT_DOD_HS_CROUCH_BAZOOKA
---| ACT_DOD_HS_CROUCH_PSCHRECK
---| ACT_DOD_HS_CROUCH_KNIFE
---| ACT_DOD_HS_CROUCH_MG42
---| ACT_DOD_HS_CROUCH_PISTOL
---| ACT_DOD_HS_CROUCH_STICKGRENADE
---| ACT_DOD_HS_CROUCH_TOMMY
---| ACT_DOD_HS_CROUCH_MP44
---| ACT_DOD_HS_CROUCH_K98
---| ACT_DOD_STAND_IDLE_TNT
---| ACT_DOD_CROUCH_IDLE_TNT
---| ACT_DOD_CROUCHWALK_IDLE_TNT
---| ACT_DOD_WALK_IDLE_TNT
---| ACT_DOD_RUN_IDLE_TNT
---| ACT_DOD_SPRINT_IDLE_TNT
---| ACT_DOD_PRONEWALK_IDLE_TNT
---| ACT_DOD_PLANT_TNT
---| ACT_DOD_DEFUSE_TNT
---| ACT_VM_FIZZLE
---| ACT_MP_STAND_IDLE
---| ACT_MP_CROUCH_IDLE
---| ACT_MP_CROUCH_DEPLOYED_IDLE
---| ACT_MP_CROUCH_DEPLOYED
---| ACT_MP_DEPLOYED_IDLE
---| ACT_MP_RUN
---| ACT_MP_WALK
---| ACT_MP_AIRWALK
---| ACT_MP_CROUCHWALK
---| ACT_MP_SPRINT
---| ACT_MP_JUMP
---| ACT_MP_JUMP_START
---| ACT_MP_JUMP_FLOAT
---| ACT_MP_JUMP_LAND
---| ACT_MP_DOUBLEJUMP
---| ACT_MP_SWIM
---| ACT_MP_DEPLOYED
---| ACT_MP_SWIM_DEPLOYED
---| ACT_MP_VCD
---| ACT_MP_SWIM_IDLE
---| ACT_MP_ATTACK_STAND_PRIMARYFIRE
---| ACT_MP_ATTACK_STAND_PRIMARYFIRE_DEPLOYED
---| ACT_MP_ATTACK_STAND_SECONDARYFIRE
---| ACT_MP_ATTACK_STAND_GRENADE
---| ACT_MP_ATTACK_CROUCH_PRIMARYFIRE
---| ACT_MP_ATTACK_CROUCH_PRIMARYFIRE_DEPLOYED
---| ACT_MP_ATTACK_CROUCH_SECONDARYFIRE
---| ACT_MP_ATTACK_CROUCH_GRENADE
---| ACT_MP_ATTACK_SWIM_PRIMARYFIRE
---| ACT_MP_ATTACK_SWIM_SECONDARYFIRE
---| ACT_MP_ATTACK_SWIM_GRENADE
---| ACT_MP_ATTACK_AIRWALK_PRIMARYFIRE
---| ACT_MP_ATTACK_AIRWALK_SECONDARYFIRE
---| ACT_MP_ATTACK_AIRWALK_GRENADE
---| ACT_MP_RELOAD_STAND
---| ACT_MP_RELOAD_STAND_LOOP
---| ACT_MP_RELOAD_STAND_END
---| ACT_MP_RELOAD_CROUCH
---| ACT_MP_RELOAD_CROUCH_LOOP
---| ACT_MP_RELOAD_CROUCH_END
---| ACT_MP_RELOAD_SWIM
---| ACT_MP_RELOAD_SWIM_LOOP
---| ACT_MP_RELOAD_SWIM_END
---| ACT_MP_RELOAD_AIRWALK
---| ACT_MP_RELOAD_AIRWALK_LOOP
---| ACT_MP_RELOAD_AIRWALK_END
---| ACT_MP_ATTACK_STAND_PREFIRE
---| ACT_MP_ATTACK_STAND_POSTFIRE
---| ACT_MP_ATTACK_STAND_STARTFIRE
---| ACT_MP_ATTACK_CROUCH_PREFIRE
---| ACT_MP_ATTACK_CROUCH_POSTFIRE
---| ACT_MP_ATTACK_SWIM_PREFIRE
---| ACT_MP_ATTACK_SWIM_POSTFIRE
---| ACT_MP_STAND_PRIMARY
---| ACT_MP_CROUCH_PRIMARY
---| ACT_MP_RUN_PRIMARY
---| ACT_MP_WALK_PRIMARY
---| ACT_MP_AIRWALK_PRIMARY
---| ACT_MP_CROUCHWALK_PRIMARY
---| ACT_MP_JUMP_PRIMARY
---| ACT_MP_JUMP_START_PRIMARY
---| ACT_MP_JUMP_FLOAT_PRIMARY
---| ACT_MP_JUMP_LAND_PRIMARY
---| ACT_MP_SWIM_PRIMARY
---| ACT_MP_DEPLOYED_PRIMARY
---| ACT_MP_SWIM_DEPLOYED_PRIMARY
---| ACT_MP_ATTACK_STAND_PRIMARY
---| ACT_MP_ATTACK_STAND_PRIMARY_DEPLOYED
---| ACT_MP_ATTACK_CROUCH_PRIMARY
---| ACT_MP_ATTACK_CROUCH_PRIMARY_DEPLOYED
---| ACT_MP_ATTACK_SWIM_PRIMARY
---| ACT_MP_ATTACK_AIRWALK_PRIMARY
---| ACT_MP_RELOAD_STAND_PRIMARY
---| ACT_MP_RELOAD_STAND_PRIMARY_LOOP
---| ACT_MP_RELOAD_STAND_PRIMARY_END
---| ACT_MP_RELOAD_CROUCH_PRIMARY
---| ACT_MP_RELOAD_CROUCH_PRIMARY_LOOP
---| ACT_MP_RELOAD_CROUCH_PRIMARY_END
---| ACT_MP_RELOAD_SWIM_PRIMARY
---| ACT_MP_RELOAD_SWIM_PRIMARY_LOOP
---| ACT_MP_RELOAD_SWIM_PRIMARY_END
---| ACT_MP_RELOAD_AIRWALK_PRIMARY
---| ACT_MP_RELOAD_AIRWALK_PRIMARY_LOOP
---| ACT_MP_RELOAD_AIRWALK_PRIMARY_END
---| ACT_MP_ATTACK_STAND_GRENADE_PRIMARY
---| ACT_MP_ATTACK_CROUCH_GRENADE_PRIMARY
---| ACT_MP_ATTACK_SWIM_GRENADE_PRIMARY
---| ACT_MP_ATTACK_AIRWALK_GRENADE_PRIMARY
---| ACT_MP_STAND_SECONDARY
---| ACT_MP_CROUCH_SECONDARY
---| ACT_MP_RUN_SECONDARY
---| ACT_MP_WALK_SECONDARY
---| ACT_MP_AIRWALK_SECONDARY
---| ACT_MP_CROUCHWALK_SECONDARY
---| ACT_MP_JUMP_SECONDARY
---| ACT_MP_JUMP_START_SECONDARY
---| ACT_MP_JUMP_FLOAT_SECONDARY
---| ACT_MP_JUMP_LAND_SECONDARY
---| ACT_MP_SWIM_SECONDARY
---| ACT_MP_ATTACK_STAND_SECONDARY
---| ACT_MP_ATTACK_CROUCH_SECONDARY
---| ACT_MP_ATTACK_SWIM_SECONDARY
---| ACT_MP_ATTACK_AIRWALK_SECONDARY
---| ACT_MP_RELOAD_STAND_SECONDARY
---| ACT_MP_RELOAD_STAND_SECONDARY_LOOP
---| ACT_MP_RELOAD_STAND_SECONDARY_END
---| ACT_MP_RELOAD_CROUCH_SECONDARY
---| ACT_MP_RELOAD_CROUCH_SECONDARY_LOOP
---| ACT_MP_RELOAD_CROUCH_SECONDARY_END
---| ACT_MP_RELOAD_SWIM_SECONDARY
---| ACT_MP_RELOAD_SWIM_SECONDARY_LOOP
---| ACT_MP_RELOAD_SWIM_SECONDARY_END
---| ACT_MP_RELOAD_AIRWALK_SECONDARY
---| ACT_MP_RELOAD_AIRWALK_SECONDARY_LOOP
---| ACT_MP_RELOAD_AIRWALK_SECONDARY_END
---| ACT_MP_ATTACK_STAND_GRENADE_SECONDARY
---| ACT_MP_ATTACK_CROUCH_GRENADE_SECONDARY
---| ACT_MP_ATTACK_SWIM_GRENADE_SECONDARY
---| ACT_MP_ATTACK_AIRWALK_GRENADE_SECONDARY
---| ACT_MP_STAND_MELEE
---| ACT_MP_CROUCH_MELEE
---| ACT_MP_RUN_MELEE
---| ACT_MP_WALK_MELEE
---| ACT_MP_AIRWALK_MELEE
---| ACT_MP_CROUCHWALK_MELEE
---| ACT_MP_JUMP_MELEE
---| ACT_MP_JUMP_START_MELEE
---| ACT_MP_JUMP_FLOAT_MELEE
---| ACT_MP_JUMP_LAND_MELEE
---| ACT_MP_SWIM_MELEE
---| ACT_MP_ATTACK_STAND_MELEE
---| ACT_MP_ATTACK_STAND_MELEE_SECONDARY
---| ACT_MP_ATTACK_CROUCH_MELEE
---| ACT_MP_ATTACK_CROUCH_MELEE_SECONDARY
---| ACT_MP_ATTACK_SWIM_MELEE
---| ACT_MP_ATTACK_AIRWALK_MELEE
---| ACT_MP_ATTACK_STAND_GRENADE_MELEE
---| ACT_MP_ATTACK_CROUCH_GRENADE_MELEE
---| ACT_MP_ATTACK_SWIM_GRENADE_MELEE
---| ACT_MP_ATTACK_AIRWALK_GRENADE_MELEE
---| ACT_MP_GESTURE_FLINCH
---| ACT_MP_GESTURE_FLINCH_PRIMARY
---| ACT_MP_GESTURE_FLINCH_SECONDARY
---| ACT_MP_GESTURE_FLINCH_MELEE
---| ACT_MP_GESTURE_FLINCH_HEAD
---| ACT_MP_GESTURE_FLINCH_CHEST
---| ACT_MP_GESTURE_FLINCH_STOMACH
---| ACT_MP_GESTURE_FLINCH_LEFTARM
---| ACT_MP_GESTURE_FLINCH_RIGHTARM
---| ACT_MP_GESTURE_FLINCH_LEFTLEG
---| ACT_MP_GESTURE_FLINCH_RIGHTLEG
---| ACT_MP_GRENADE1_DRAW
---| ACT_MP_GRENADE1_IDLE
---| ACT_MP_GRENADE1_ATTACK
---| ACT_MP_GRENADE2_DRAW
---| ACT_MP_GRENADE2_IDLE
---| ACT_MP_GRENADE2_ATTACK
---| ACT_MP_PRIMARY_GRENADE1_DRAW
---| ACT_MP_PRIMARY_GRENADE1_IDLE
---| ACT_MP_PRIMARY_GRENADE1_ATTACK
---| ACT_MP_PRIMARY_GRENADE2_DRAW
---| ACT_MP_PRIMARY_GRENADE2_IDLE
---| ACT_MP_PRIMARY_GRENADE2_ATTACK
---| ACT_MP_SECONDARY_GRENADE1_DRAW
---| ACT_MP_SECONDARY_GRENADE1_IDLE
---| ACT_MP_SECONDARY_GRENADE1_ATTACK
---| ACT_MP_SECONDARY_GRENADE2_DRAW
---| ACT_MP_SECONDARY_GRENADE2_IDLE
---| ACT_MP_SECONDARY_GRENADE2_ATTACK
---| ACT_MP_MELEE_GRENADE1_DRAW
---| ACT_MP_MELEE_GRENADE1_IDLE
---| ACT_MP_MELEE_GRENADE1_ATTACK
---| ACT_MP_MELEE_GRENADE2_DRAW
---| ACT_MP_MELEE_GRENADE2_IDLE
---| ACT_MP_MELEE_GRENADE2_ATTACK
---| ACT_MP_STAND_BUILDING
---| ACT_MP_CROUCH_BUILDING
---| ACT_MP_RUN_BUILDING
---| ACT_MP_WALK_BUILDING
---| ACT_MP_AIRWALK_BUILDING
---| ACT_MP_CROUCHWALK_BUILDING
---| ACT_MP_JUMP_BUILDING
---| ACT_MP_JUMP_START_BUILDING
---| ACT_MP_JUMP_FLOAT_BUILDING
---| ACT_MP_JUMP_LAND_BUILDING
---| ACT_MP_SWIM_BUILDING
---| ACT_MP_ATTACK_STAND_BUILDING
---| ACT_MP_ATTACK_CROUCH_BUILDING
---| ACT_MP_ATTACK_SWIM_BUILDING
---| ACT_MP_ATTACK_AIRWALK_BUILDING
---| ACT_MP_ATTACK_STAND_GRENADE_BUILDING
---| ACT_MP_ATTACK_CROUCH_GRENADE_BUILDING
---| ACT_MP_ATTACK_SWIM_GRENADE_BUILDING
---| ACT_MP_ATTACK_AIRWALK_GRENADE_BUILDING
---| ACT_MP_STAND_PDA
---| ACT_MP_CROUCH_PDA
---| ACT_MP_RUN_PDA
---| ACT_MP_WALK_PDA
---| ACT_MP_AIRWALK_PDA
---| ACT_MP_CROUCHWALK_PDA
---| ACT_MP_JUMP_PDA
---| ACT_MP_JUMP_START_PDA
---| ACT_MP_JUMP_FLOAT_PDA
---| ACT_MP_JUMP_LAND_PDA
---| ACT_MP_SWIM_PDA
---| ACT_MP_ATTACK_STAND_PDA
---| ACT_MP_ATTACK_SWIM_PDA
---| ACT_MP_GESTURE_VC_HANDMOUTH
---| ACT_MP_GESTURE_VC_FINGERPOINT
---| ACT_MP_GESTURE_VC_FISTPUMP
---| ACT_MP_GESTURE_VC_THUMBSUP
---| ACT_MP_GESTURE_VC_NODYES
---| ACT_MP_GESTURE_VC_NODNO
---| ACT_MP_GESTURE_VC_HANDMOUTH_PRIMARY
---| ACT_MP_GESTURE_VC_FINGERPOINT_PRIMARY
---| ACT_MP_GESTURE_VC_FISTPUMP_PRIMARY
---| ACT_MP_GESTURE_VC_THUMBSUP_PRIMARY
---| ACT_MP_GESTURE_VC_NODYES_PRIMARY
---| ACT_MP_GESTURE_VC_NODNO_PRIMARY
---| ACT_MP_GESTURE_VC_HANDMOUTH_SECONDARY
---| ACT_MP_GESTURE_VC_FINGERPOINT_SECONDARY
---| ACT_MP_GESTURE_VC_FISTPUMP_SECONDARY
---| ACT_MP_GESTURE_VC_THUMBSUP_SECONDARY
---| ACT_MP_GESTURE_VC_NODYES_SECONDARY
---| ACT_MP_GESTURE_VC_NODNO_SECONDARY
---| ACT_MP_GESTURE_VC_HANDMOUTH_MELEE
---| ACT_MP_GESTURE_VC_FINGERPOINT_MELEE
---| ACT_MP_GESTURE_VC_FISTPUMP_MELEE
---| ACT_MP_GESTURE_VC_THUMBSUP_MELEE
---| ACT_MP_GESTURE_VC_NODYES_MELEE
---| ACT_MP_GESTURE_VC_NODNO_MELEE
---| ACT_MP_GESTURE_VC_HANDMOUTH_BUILDING
---| ACT_MP_GESTURE_VC_FINGERPOINT_BUILDING
---| ACT_MP_GESTURE_VC_FISTPUMP_BUILDING
---| ACT_MP_GESTURE_VC_THUMBSUP_BUILDING
---| ACT_MP_GESTURE_VC_NODYES_BUILDING
---| ACT_MP_GESTURE_VC_NODNO_BUILDING
---| ACT_MP_GESTURE_VC_HANDMOUTH_PDA
---| ACT_MP_GESTURE_VC_FINGERPOINT_PDA
---| ACT_MP_GESTURE_VC_FISTPUMP_PDA
---| ACT_MP_GESTURE_VC_THUMBSUP_PDA
---| ACT_MP_GESTURE_VC_NODYES_PDA
---| ACT_MP_GESTURE_VC_NODNO_PDA
---| ACT_VM_UNUSABLE
---| ACT_VM_UNUSABLE_TO_USABLE
---| ACT_VM_USABLE_TO_UNUSABLE
---| ACT_GMOD_GESTURE_AGREE
---| ACT_GMOD_GESTURE_BECON
---| ACT_GMOD_GESTURE_BOW
---| ACT_GMOD_GESTURE_DISAGREE
---| ACT_GMOD_TAUNT_SALUTE
---| ACT_GMOD_GESTURE_WAVE
---| ACT_GMOD_TAUNT_PERSISTENCE
---| ACT_GMOD_TAUNT_MUSCLE
---| ACT_GMOD_TAUNT_LAUGH
---| ACT_GMOD_GESTURE_POINT
---| ACT_GMOD_TAUNT_CHEER
---| ACT_HL2MP_RUN_FAST
---| ACT_HL2MP_RUN_CHARGING
---| ACT_HL2MP_RUN_PANICKED
---| ACT_HL2MP_RUN_PROTECTED
---| ACT_HL2MP_IDLE_MELEE_ANGRY
---| ACT_HL2MP_ZOMBIE_SLUMP_IDLE
---| ACT_HL2MP_ZOMBIE_SLUMP_RISE
---| ACT_HL2MP_WALK_ZOMBIE_01
---| ACT_HL2MP_WALK_ZOMBIE_02
---| ACT_HL2MP_WALK_ZOMBIE_03
---| ACT_HL2MP_WALK_ZOMBIE_04
---| ACT_HL2MP_WALK_ZOMBIE_05
---| ACT_HL2MP_WALK_CROUCH_ZOMBIE_01
---| ACT_HL2MP_WALK_CROUCH_ZOMBIE_02
---| ACT_HL2MP_WALK_CROUCH_ZOMBIE_03
---| ACT_HL2MP_WALK_CROUCH_ZOMBIE_04
---| ACT_HL2MP_WALK_CROUCH_ZOMBIE_05
---| ACT_HL2MP_IDLE_CROUCH_ZOMBIE_01
---| ACT_HL2MP_IDLE_CROUCH_ZOMBIE_02
---| ACT_GMOD_GESTURE_RANGE_ZOMBIE
---| ACT_GMOD_GESTURE_TAUNT_ZOMBIE
---| ACT_GMOD_TAUNT_DANCE
---| ACT_GMOD_TAUNT_ROBOT
---| ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL
---| ACT_GMOD_GESTURE_RANGE_FRENZY
---| ACT_HL2MP_RUN_ZOMBIE_FAST
---| ACT_HL2MP_WALK_ZOMBIE_06
---| ACT_ZOMBIE_LEAP_START
---| ACT_ZOMBIE_LEAPING
---| ACT_ZOMBIE_CLIMB_UP
---| ACT_ZOMBIE_CLIMB_START
---| ACT_ZOMBIE_CLIMB_END
---| ACT_HL2MP_IDLE_MAGIC
---| ACT_HL2MP_WALK_MAGIC
---| ACT_HL2MP_RUN_MAGIC
---| ACT_HL2MP_IDLE_CROUCH_MAGIC
---| ACT_HL2MP_WALK_CROUCH_MAGIC
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_MAGIC
---| ACT_HL2MP_GESTURE_RELOAD_MAGIC
---| ACT_HL2MP_JUMP_MAGIC
---| ACT_HL2MP_SWIM_IDLE_MAGIC
---| ACT_HL2MP_SWIM_MAGIC
---| ACT_HL2MP_IDLE_REVOLVER
---| ACT_HL2MP_WALK_REVOLVER
---| ACT_HL2MP_RUN_REVOLVER
---| ACT_HL2MP_IDLE_CROUCH_REVOLVER
---| ACT_HL2MP_WALK_CROUCH_REVOLVER
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
---| ACT_HL2MP_GESTURE_RELOAD_REVOLVER
---| ACT_HL2MP_JUMP_REVOLVER
---| ACT_HL2MP_SWIM_IDLE_REVOLVER
---| ACT_HL2MP_SWIM_REVOLVER
---| ACT_HL2MP_IDLE_CAMERA
---| ACT_HL2MP_WALK_CAMERA
---| ACT_HL2MP_RUN_CAMERA
---| ACT_HL2MP_IDLE_CROUCH_CAMERA
---| ACT_HL2MP_WALK_CROUCH_CAMERA
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_CAMERA
---| ACT_HL2MP_GESTURE_RELOAD_CAMERA
---| ACT_HL2MP_JUMP_CAMERA
---| ACT_HL2MP_SWIM_IDLE_CAMERA
---| ACT_HL2MP_SWIM_CAMERA
---| ACT_HL2MP_IDLE_ANGRY
---| ACT_HL2MP_WALK_ANGRY
---| ACT_HL2MP_RUN_ANGRY
---| ACT_HL2MP_IDLE_CROUCH_ANGRY
---| ACT_HL2MP_WALK_CROUCH_ANGRY
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_ANGRY
---| ACT_HL2MP_GESTURE_RELOAD_ANGRY
---| ACT_HL2MP_JUMP_ANGRY
---| ACT_HL2MP_SWIM_IDLE_ANGRY
---| ACT_HL2MP_SWIM_ANGRY
---| ACT_HL2MP_IDLE_SCARED
---| ACT_HL2MP_WALK_SCARED
---| ACT_HL2MP_RUN_SCARED
---| ACT_HL2MP_IDLE_CROUCH_SCARED
---| ACT_HL2MP_WALK_CROUCH_SCARED
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_SCARED
---| ACT_HL2MP_GESTURE_RELOAD_SCARED
---| ACT_HL2MP_JUMP_SCARED
---| ACT_HL2MP_SWIM_IDLE_SCARED
---| ACT_HL2MP_SWIM_SCARED
---| ACT_HL2MP_IDLE_ZOMBIE
---| ACT_HL2MP_WALK_ZOMBIE
---| ACT_HL2MP_RUN_ZOMBIE
---| ACT_HL2MP_IDLE_CROUCH_ZOMBIE
---| ACT_HL2MP_WALK_CROUCH_ZOMBIE
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_ZOMBIE
---| ACT_HL2MP_GESTURE_RELOAD_ZOMBIE
---| ACT_HL2MP_JUMP_ZOMBIE
---| ACT_HL2MP_SWIM_IDLE_ZOMBIE
---| ACT_HL2MP_SWIM_ZOMBIE
---| ACT_HL2MP_IDLE_SUITCASE
---| ACT_HL2MP_WALK_SUITCASE
---| ACT_HL2MP_RUN_SUITCASE
---| ACT_HL2MP_IDLE_CROUCH_SUITCASE
---| ACT_HL2MP_WALK_CROUCH_SUITCASE
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_SUITCASE
---| ACT_HL2MP_GESTURE_RELOAD_SUITCASE
---| ACT_HL2MP_JUMP_SUITCASE
---| ACT_HL2MP_SWIM_IDLE_SUITCASE
---| ACT_HL2MP_SWIM_SUITCASE
---| ACT_HL2MP_IDLE
---| ACT_HL2MP_WALK
---| ACT_HL2MP_RUN
---| ACT_HL2MP_IDLE_CROUCH
---| ACT_HL2MP_WALK_CROUCH
---| ACT_HL2MP_GESTURE_RANGE_ATTACK
---| ACT_HL2MP_GESTURE_RELOAD
---| ACT_HL2MP_JUMP
---| ACT_HL2MP_SWIM
---| ACT_HL2MP_IDLE_PISTOL
---| ACT_HL2MP_WALK_PISTOL
---| ACT_HL2MP_RUN_PISTOL
---| ACT_HL2MP_IDLE_CROUCH_PISTOL
---| ACT_HL2MP_WALK_CROUCH_PISTOL
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
---| ACT_HL2MP_GESTURE_RELOAD_PISTOL
---| ACT_HL2MP_JUMP_PISTOL
---| ACT_HL2MP_SWIM_IDLE_PISTOL
---| ACT_HL2MP_SWIM_PISTOL
---| ACT_HL2MP_IDLE_SMG1
---| ACT_HL2MP_WALK_SMG1
---| ACT_HL2MP_RUN_SMG1
---| ACT_HL2MP_IDLE_CROUCH_SMG1
---| ACT_HL2MP_WALK_CROUCH_SMG1
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
---| ACT_HL2MP_GESTURE_RELOAD_SMG1
---| ACT_HL2MP_JUMP_SMG1
---| ACT_HL2MP_SWIM_IDLE_SMG1
---| ACT_HL2MP_SWIM_SMG1
---| ACT_HL2MP_IDLE_AR2
---| ACT_HL2MP_WALK_AR2
---| ACT_HL2MP_RUN_AR2
---| ACT_HL2MP_IDLE_CROUCH_AR2
---| ACT_HL2MP_WALK_CROUCH_AR2
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
---| ACT_HL2MP_GESTURE_RELOAD_AR2
---| ACT_HL2MP_JUMP_AR2
---| ACT_HL2MP_SWIM_IDLE_AR2
---| ACT_HL2MP_SWIM_AR2
---| ACT_HL2MP_IDLE_SHOTGUN
---| ACT_HL2MP_WALK_SHOTGUN
---| ACT_HL2MP_RUN_SHOTGUN
---| ACT_HL2MP_IDLE_CROUCH_SHOTGUN
---| ACT_HL2MP_WALK_CROUCH_SHOTGUN
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
---| ACT_HL2MP_GESTURE_RELOAD_SHOTGUN
---| ACT_HL2MP_JUMP_SHOTGUN
---| ACT_HL2MP_SWIM_IDLE_SHOTGUN
---| ACT_HL2MP_SWIM_SHOTGUN
---| ACT_HL2MP_IDLE_RPG
---| ACT_HL2MP_WALK_RPG
---| ACT_HL2MP_RUN_RPG
---| ACT_HL2MP_IDLE_CROUCH_RPG
---| ACT_HL2MP_WALK_CROUCH_RPG
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
---| ACT_HL2MP_GESTURE_RELOAD_RPG
---| ACT_HL2MP_JUMP_RPG
---| ACT_HL2MP_SWIM_IDLE_RPG
---| ACT_HL2MP_SWIM_RPG
---| ACT_HL2MP_IDLE_GRENADE
---| ACT_HL2MP_WALK_GRENADE
---| ACT_HL2MP_RUN_GRENADE
---| ACT_HL2MP_IDLE_CROUCH_GRENADE
---| ACT_HL2MP_WALK_CROUCH_GRENADE
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
---| ACT_HL2MP_GESTURE_RELOAD_GRENADE
---| ACT_HL2MP_JUMP_GRENADE
---| ACT_HL2MP_SWIM_IDLE_GRENADE
---| ACT_HL2MP_SWIM_GRENADE
---| ACT_HL2MP_IDLE_DUEL
---| ACT_HL2MP_WALK_DUEL
---| ACT_HL2MP_RUN_DUEL
---| ACT_HL2MP_IDLE_CROUCH_DUEL
---| ACT_HL2MP_WALK_CROUCH_DUEL
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL
---| ACT_HL2MP_GESTURE_RELOAD_DUEL
---| ACT_HL2MP_JUMP_DUEL
---| ACT_HL2MP_SWIM_IDLE_DUEL
---| ACT_HL2MP_SWIM_DUEL
---| ACT_HL2MP_IDLE_PHYSGUN
---| ACT_HL2MP_WALK_PHYSGUN
---| ACT_HL2MP_RUN_PHYSGUN
---| ACT_HL2MP_IDLE_CROUCH_PHYSGUN
---| ACT_HL2MP_WALK_CROUCH_PHYSGUN
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN
---| ACT_HL2MP_GESTURE_RELOAD_PHYSGUN
---| ACT_HL2MP_JUMP_PHYSGUN
---| ACT_HL2MP_SWIM_IDLE_PHYSGUN
---| ACT_HL2MP_SWIM_PHYSGUN
---| ACT_HL2MP_IDLE_CROSSBOW
---| ACT_HL2MP_WALK_CROSSBOW
---| ACT_HL2MP_RUN_CROSSBOW
---| ACT_HL2MP_IDLE_CROUCH_CROSSBOW
---| ACT_HL2MP_WALK_CROUCH_CROSSBOW
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
---| ACT_HL2MP_GESTURE_RELOAD_CROSSBOW
---| ACT_HL2MP_JUMP_CROSSBOW
---| ACT_HL2MP_SWIM_IDLE_CROSSBOW
---| ACT_HL2MP_SWIM_CROSSBOW
---| ACT_HL2MP_IDLE_MELEE
---| ACT_HL2MP_WALK_MELEE
---| ACT_HL2MP_RUN_MELEE
---| ACT_HL2MP_IDLE_CROUCH_MELEE
---| ACT_HL2MP_WALK_CROUCH_MELEE
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
---| ACT_HL2MP_GESTURE_RELOAD_MELEE
---| ACT_HL2MP_JUMP_MELEE
---| ACT_HL2MP_SWIM_IDLE_MELEE
---| ACT_HL2MP_SWIM_MELEE
---| ACT_HL2MP_IDLE_SLAM
---| ACT_HL2MP_WALK_SLAM
---| ACT_HL2MP_RUN_SLAM
---| ACT_HL2MP_IDLE_CROUCH_SLAM
---| ACT_HL2MP_WALK_CROUCH_SLAM
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM
---| ACT_HL2MP_GESTURE_RELOAD_SLAM
---| ACT_HL2MP_JUMP_SLAM
---| ACT_HL2MP_SWIM_IDLE_SLAM
---| ACT_HL2MP_SWIM_SLAM
---| ACT_VM_CRAWL
---| ACT_VM_CRAWL_EMPTY
---| ACT_VM_HOLSTER_EMPTY
---| ACT_VM_DOWN
---| ACT_VM_DOWN_EMPTY
---| ACT_VM_READY
---| ACT_VM_ISHOOT
---| ACT_VM_IIN
---| ACT_VM_IIN_EMPTY
---| ACT_VM_IIDLE
---| ACT_VM_IIDLE_EMPTY
---| ACT_VM_IOUT
---| ACT_VM_IOUT_EMPTY
---| ACT_VM_PULLBACK_HIGH_BAKE
---| ACT_VM_HITKILL
---| ACT_VM_DEPLOYED_IN
---| ACT_VM_DEPLOYED_IDLE
---| ACT_VM_DEPLOYED_FIRE
---| ACT_VM_DEPLOYED_DRYFIRE
---| ACT_VM_DEPLOYED_RELOAD
---| ACT_VM_DEPLOYED_RELOAD_EMPTY
---| ACT_VM_DEPLOYED_OUT
---| ACT_VM_DEPLOYED_IRON_IN
---| ACT_VM_DEPLOYED_IRON_IDLE
---| ACT_VM_DEPLOYED_IRON_FIRE
---| ACT_VM_DEPLOYED_IRON_DRYFIRE
---| ACT_VM_DEPLOYED_IRON_OUT
---| ACT_VM_DEPLOYED_LIFTED_IN
---| ACT_VM_DEPLOYED_LIFTED_IDLE
---| ACT_VM_DEPLOYED_LIFTED_OUT
---| ACT_VM_RELOADEMPTY
---| ACT_VM_IRECOIL1
---| ACT_VM_IRECOIL2
---| ACT_VM_FIREMODE
---| ACT_VM_ISHOOT_LAST
---| ACT_VM_IFIREMODE
---| ACT_VM_DFIREMODE
---| ACT_VM_DIFIREMODE
---| ACT_VM_SHOOTLAST
---| ACT_VM_ISHOOTDRY
---| ACT_VM_DRAW_M203
---| ACT_VM_DRAWFULL_M203
---| ACT_VM_READY_M203
---| ACT_VM_IDLE_M203
---| ACT_VM_RELOAD_M203
---| ACT_VM_HOLSTER_M203
---| ACT_VM_HOLSTERFULL_M203
---| ACT_VM_IIN_M203
---| ACT_VM_IIDLE_M203
---| ACT_VM_IOUT_M203
---| ACT_VM_CRAWL_M203
---| ACT_VM_DOWN_M203
---| ACT_VM_ISHOOT_M203
---| ACT_VM_RELOAD_INSERT
---| ACT_VM_RELOAD_INSERT_PULL
---| ACT_VM_RELOAD_END
---| ACT_VM_RELOAD_END_EMPTY
---| ACT_VM_RELOAD_INSERT_EMPTY
---| ACT_CROSSBOW_HOLSTER_UNLOADED
---| ACT_VM_FIRE_TO_EMPTY
---| ACT_VM_UNLOAD
---| ACT_VM_RELOAD2
---| ACT_GMOD_NOCLIP_LAYER
---| ACT_HL2MP_IDLE_FIST
---| ACT_HL2MP_WALK_FIST
---| ACT_HL2MP_RUN_FIST
---| ACT_HL2MP_IDLE_CROUCH_FIST
---| ACT_HL2MP_WALK_CROUCH_FIST
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST
---| ACT_HL2MP_GESTURE_RELOAD_FIST
---| ACT_HL2MP_JUMP_FIST
---| ACT_HL2MP_SWIM_IDLE_FIST
---| ACT_HL2MP_SWIM_FIST
---| ACT_HL2MP_SIT
---| ACT_HL2MP_FIST_BLOCK
---| ACT_DRIVE_AIRBOAT
---| ACT_DRIVE_JEEP
---| ACT_GMOD_SIT_ROLLERCOASTER
---| ACT_HL2MP_IDLE_KNIFE
---| ACT_HL2MP_WALK_KNIFE
---| ACT_HL2MP_RUN_KNIFE
---| ACT_HL2MP_IDLE_CROUCH_KNIFE
---| ACT_HL2MP_WALK_CROUCH_KNIFE
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
---| ACT_HL2MP_GESTURE_RELOAD_KNIFE
---| ACT_HL2MP_JUMP_KNIFE
---| ACT_HL2MP_SWIM_IDLE_KNIFE
---| ACT_HL2MP_SWIM_KNIFE
---| ACT_HL2MP_IDLE_PASSIVE
---| ACT_HL2MP_WALK_PASSIVE
---| ACT_HL2MP_RUN_PASSIVE
---| ACT_HL2MP_IDLE_CROUCH_PASSIVE
---| ACT_HL2MP_WALK_CROUCH_PASSIVE
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE
---| ACT_HL2MP_GESTURE_RELOAD_PASSIVE
---| ACT_HL2MP_JUMP_PASSIVE
---| ACT_HL2MP_SWIM_PASSIVE
---| ACT_HL2MP_SWIM_IDLE_PASSIVE
---| ACT_HL2MP_IDLE_MELEE2
---| ACT_HL2MP_WALK_MELEE2
---| ACT_HL2MP_RUN_MELEE2
---| ACT_HL2MP_IDLE_CROUCH_MELEE2
---| ACT_HL2MP_WALK_CROUCH_MELEE2
---| ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
---| ACT_HL2MP_GESTURE_RELOAD_MELEE2
---| ACT_HL2MP_JUMP_MELEE2
---| ACT_HL2MP_SWIM_IDLE_MELEE2
---| ACT_HL2MP_SWIM_MELEE2
---| ACT_HL2MP_SIT_PISTOL
---| ACT_HL2MP_SIT_SHOTGUN
---| ACT_HL2MP_SIT_SMG1
---| ACT_HL2MP_SIT_AR2
---| ACT_HL2MP_SIT_PHYSGUN
---| ACT_HL2MP_SIT_GRENADE
---| ACT_HL2MP_SIT_RPG
---| ACT_HL2MP_SIT_CROSSBOW
---| ACT_HL2MP_SIT_MELEE
---| ACT_HL2MP_SIT_SLAM
---| ACT_HL2MP_SIT_FIST
---| ACT_GMOD_IN_CHAT
---| ACT_GMOD_GESTURE_ITEM_GIVE
---| ACT_GMOD_GESTURE_ITEM_DROP
---| ACT_GMOD_GESTURE_ITEM_PLACE
---| ACT_GMOD_GESTURE_ITEM_THROW
---| ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND
---| ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND
---| ACT_HL2MP_SWIM_IDLE
---| ACT_HL2MP_IDLE_COWER
---| ACT_GMOD_DEATH
---| ACT_DRIVE_POD
---| ACT_FLINCH
---| ACT_FLINCH_BACK
---| ACT_FLINCH_SHOULDER_LEFT
---| ACT_FLINCH_SHOULDER_RIGHT
---| ACT_HL2MP_SIT_CAMERA
---| ACT_HL2MP_SIT_PASSIVE
---| ACT_HL2MP_ZOMBIE_SLUMP_ALT_IDLE
---| ACT_HL2MP_ZOMBIE_SLUMP_ALT_RISE_FAST
---| ACT_HL2MP_ZOMBIE_SLUMP_ALT_RISE_SLOW
---| ACT_GMOD_SHOWOFF_STAND_01
---| ACT_GMOD_SHOWOFF_STAND_02
---| ACT_GMOD_SHOWOFF_STAND_03
---| ACT_GMOD_SHOWOFF_STAND_04
---| ACT_GMOD_SHOWOFF_DUCK_01
---| ACT_GMOD_SHOWOFF_DUCK_02
---| LAST_SHARED_ACTIVITY # The last shared activity number. IDs after this are "private" activities registered at runtime, and will have random IDs associated with specific ACTivities.

--- Used by [NPC:MoveClimbExec](https://wiki.facepunch.com/gmod/NPC:MoveClimbExec), [NPC:MoveJumpExec](https://wiki.facepunch.com/gmod/NPC:MoveJumpExec) and [NPC:MoveJumpStop](https://wiki.facepunch.com/gmod/NPC:MoveJumpStop).
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/AIMR
--- Move is illegal for some reason.
---@readonly
AIMR_ILLEGAL = -4
--- Move was blocked by an NPC.
---@readonly
AIMR_BLOCKED_NPC = -3
--- Move was blocked by the world.
---@readonly
AIMR_BLOCKED_WORLD = -2
--- Move was blocked by an entity.
---@readonly
AIMR_BLOCKED_ENTITY = -1
--- Move op was ok.
---@readonly
AIMR_OK = 0
--- Locomotion method has changed.
---@readonly
AIMR_CHANGE_TYPE = 1

---@enum AIMR : number
---| AIMR_ILLEGAL # Move is illegal for some reason.
---| AIMR_BLOCKED_NPC # Move was blocked by an NPC.
---| AIMR_BLOCKED_WORLD # Move was blocked by the world.
---| AIMR_BLOCKED_ENTITY # Move was blocked by an entity.
---| AIMR_OK # Move op was ok.
---| AIMR_CHANGE_TYPE # Locomotion method has changed.

--- Used by [game.AddAmmoType](https://wiki.facepunch.com/gmod/game.AddAmmoType)'s input structure - the [Structures/AmmoData](https://wiki.facepunch.com/gmod/Structures/AmmoData).
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/AMMO
--- * `AMMO_FORCE_DROP_IF_CARRIED` = `1`
--- * `AMMO_INTERPRET_PLRDAMAGE_AS_DAMAGE_TO_PLAYER` = `2`
---@alias AMMO 1 | 2 | number

--- The analog axis to get the value of via [input.GetAnalogValue](https://wiki.facepunch.com/gmod/input.GetAnalogValue).
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/ANALOG
---@readonly
ANALOG_MOUSE_X = 0
---@readonly
ANALOG_MOUSE_Y = 1
---@readonly
ANALOG_MOUSE_WHEEL = 3
---@readonly
ANALOG_JOY_X = 4
---@readonly
ANALOG_JOY_Y = 5
---@readonly
ANALOG_JOY_Z = 6
---@readonly
ANALOG_JOY_R = 7
---@readonly
ANALOG_JOY_U = 8
---@readonly
ANALOG_JOY_V = 9

---@enum ANALOG : number
---| ANALOG_MOUSE_X
---| ANALOG_MOUSE_Y
---| ANALOG_MOUSE_WHEEL
---| ANALOG_JOY_X
---| ANALOG_JOY_Y
---| ANALOG_JOY_Z
---| ANALOG_JOY_R
---| ANALOG_JOY_U
---| ANALOG_JOY_V

--- These enums are used by [render.OverrideBlend](https://wiki.facepunch.com/gmod/render.OverrideBlend) to determine what the Source and Destination color and alpha channel values for a given pixel will be multiplied by before they are sent to the [Blend Function](https://wiki.facepunch.com/gmod/Enums/BLENDFUNC) to calculate the pixel's final color during draw operations.
---
--- For an interactive demonstration of how these enums behave, see [Anders Riggelsen's Visual glBlendFunc Tool here](https://www.andersriggelsen.dk/glblendfunc.php)
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/BLEND
--- The Multiplier will be `r=0`, `g=0`, `b=0`, `a=0`
---
--- This is useful for removing the Source or Destination from the final pixel color.
---@readonly
BLEND_ZERO = 0
--- The Multiplier will be `r=1`, `g=1`, `b=1`, `a=1`
---
--- This is useful for keeping the Source or Destination as their starting values.
---@readonly
BLEND_ONE = 1
--- The Multiplier will be the same as the Destination color and alpha.
---@readonly
BLEND_DST_COLOR = 2
--- Each color and alpha channel value of the Destination is subtracted from `1`.
---
--- **Example:**
--- If your Destination channels are: `r=1`, `g=0.25`, `b=0.1`, `a=1`
--- They will be modified by: `r=1-1`, `g=1-0.25`, `b=1-0.1`, `a=1-1`
--- The final Multiplier value will be: `r=0`, `g=0.75`, `b=0.9`, `a=0`
---@readonly
BLEND_ONE_MINUS_DST_COLOR = 3
--- All color and alpha channels will be the same as the Source alpha value.
---
--- **Example:**
--- If your Source channels are: `r=0.1`, `g=0`, `b=1`, `a=0.5`
--- The final Multiplier value will be: `r=0.5`, `g=0.5`, `b=0.5`, `a=0.5`
---@readonly
BLEND_SRC_ALPHA = 4
--- All color and alpha channels will be set to the Source alpha value subtracted from `1`.
---
--- **Example:**
--- If your Source channels are: `r=0`, `g=0.23`, `b=1`, `a=0.6`
--- The alpha channel will be modified by `a=1-0.6`
--- The final Multiplier value will be: `r=0.4`, `g=0.4`, `b=0.4`, `a=0.4`
---@readonly
BLEND_ONE_MINUS_SRC_ALPHA = 5
--- All color and alpha channels will be set to the the Destination alpha value.
---
--- **Example:**
--- If your Destination channels are: `r=0.1`, `g=0`, `b=1`, `a=0.5`
--- The final Multiplier value will be: `r=0.5`, `g=0.5`, `b=0.5`, `a=0.5`
---@readonly
BLEND_DST_ALPHA = 6
--- All color and alpha channels will be set to the Destination alpha value subtracted from `1`.
---
--- **Example:**
--- If your Destination channels are: `r=0`, `g=0.23`, `b=1`, `a=0.6`
--- The alpha channel will be modified by `a=1-0.6`
--- The final Multiplier value will be: `r=0.4`, `g=0.4`, `b=0.4`, `a=0.4`
---@readonly
BLEND_ONE_MINUS_DST_ALPHA = 7
--- First, the Source alpha is compared against the Destination alpha value subtracted from `1` and the smaller of the two is kept.
---
--- Then, the Source color channels are multiplied by the value from the first step.
---
--- The Source alpha channel is multiplied by `1`.
---
--- **Example:**
--- If your Source channels are: `r=1`, `g=0.25`, `b=0.1`, `a=0.6`
--- and your Destination channels are: `r=0`, `g=1`, `b=0.5`, `a=0.75`
---
--- The Destination alpha value subtracted from `1` is calculated: `1-0.75` = `0.25`
--- The Source alpha `0.6` is compared to the subtracted Destination alpha `0.25` and the smaller of the two is kept (`0.25`)
---
--- The color channels of the Source are multiplied by the smaller value: `r=1*0.25`, `g=0.25*0.25`, `b=0.1*0.25`
---
--- The final Multiplier value will be `r=0.25`, `g=0.0625`, `b=0.025`, `a=0.6`
---@readonly
BLEND_SRC_ALPHA_SATURATE = 8
--- The Multiplier will be the same as the Source color and alpha.
---@readonly
BLEND_SRC_COLOR = 9
--- Each color and alpha channel value of the Source is subtracted from `1`.
---
--- **Example:**
--- If your Source channels are: `r=1`, `g=0.25`, `b=0.1`, `a=1`
--- They will be modified by: `r=1-1`, `g=1-0.25`, `b=1-0.1`, `a=1-1`
--- The final Multiplier value will be: `r=0`, `g=0.75`, `b=0.9`, `a=0`
---@readonly
BLEND_ONE_MINUS_SRC_COLOR = 10

---@enum BLEND : number
---| BLEND_ZERO #  			The Multiplier will be `r=0`, `g=0`, `b=0`, `a=0`  			This is useful for removing the Source or Destination from the final pixel color.
---| BLEND_ONE #  			The Multiplier will be `r=1`, `g=1`, `b=1`, `a=1`  			This is useful for keeping the Source or Destination as their starting values.
---| BLEND_DST_COLOR #  			The Multiplier will be the same as the Destination color and alpha.
---| BLEND_ONE_MINUS_DST_COLOR #  			Each color and alpha channel value of the Destination is subtracted from `1`.  			**Example:**   			If your Destination channels are: `r=1`, `g=0.25`, `b=0.1`, `a=1`   			They will be modified by: `r=1-1`, `g=1-0.25`, `b=1-0.1`, `a=1-1`   			The final Multiplier value will be: `r=0`, `g=0.75`, `b=0.9`, `a=0`
---| BLEND_SRC_ALPHA #  			All color and alpha channels will be the same as the Source alpha value.    			**Example:**   			If your Source channels are: `r=0.1`, `g=0`, `b=1`, `a=0.5`   			The final Multiplier value will be: `r=0.5`, `g=0.5`, `b=0.5`, `a=0.5`
---| BLEND_ONE_MINUS_SRC_ALPHA #  			All color and alpha channels will be set to the Source alpha value subtracted from `1`.  			**Example:**   			If your Source channels are: `r=0`, `g=0.23`, `b=1`, `a=0.6`   			The alpha channel will be modified by `a=1-0.6`   			The final Multiplier value will be: `r=0.4`, `g=0.4`, `b=0.4`, `a=0.4`
---| BLEND_DST_ALPHA #  			All color and alpha channels will be set to the the Destination alpha value.  			**Example:**   			If your Destination channels are: `r=0.1`, `g=0`, `b=1`, `a=0.5`   			The final Multiplier value will be: `r=0.5`, `g=0.5`, `b=0.5`, `a=0.5`
---| BLEND_ONE_MINUS_DST_ALPHA #  			All color and alpha channels will be set to the Destination alpha value subtracted from `1`.  			**Example:**   			If your Destination channels are: `r=0`, `g=0.23`, `b=1`, `a=0.6`   			The alpha channel will be modified by `a=1-0.6`   			The final Multiplier value will be: `r=0.4`, `g=0.4`, `b=0.4`, `a=0.4`
---| BLEND_SRC_ALPHA_SATURATE #  			First, the Source alpha is compared against the Destination alpha value subtracted from `1` and the smaller of the two is kept.  			Then, the Source color channels are multiplied by the value from the first step.  			The Source alpha channel is multiplied by `1`.  			**Example:**   			If your Source channels are: `r=1`, `g=0.25`, `b=0.1`, `a=0.6`   			and your Destination channels are: `r=0`, `g=1`, `b=0.5`, `a=0.75`  			The Destination alpha value subtracted from `1` is calculated: `1-0.75` = `0.25`   			The Source alpha `0.6` is compared to the subtracted Destination alpha `0.25` and the smaller of the two is kept (`0.25`)  			The color channels of the Source are multiplied by the smaller value: `r=1*0.25`, `g=0.25*0.25`, `b=0.1*0.25`  			The final Multiplier value will be `r=0.25`, `g=0.0625`, `b=0.025`, `a=0.6`
---| BLEND_SRC_COLOR #  			The Multiplier will be the same as the Source color and alpha.
---| BLEND_ONE_MINUS_SRC_COLOR #  			Each color and alpha channel value of the Source is subtracted from `1`.  			**Example:**   			If your Source channels are: `r=1`, `g=0.25`, `b=0.1`, `a=1`   			They will be modified by: `r=1-1`, `g=1-0.25`, `b=1-0.1`, `a=1-1`   			The final Multiplier value will be: `r=0`, `g=0.75`, `b=0.9`, `a=0`

--- These enums are used by [render.OverrideBlend](https://wiki.facepunch.com/gmod/render.OverrideBlend) to combine the Source and Destination color and alpha into a final pixel color after they have been multiplied by their corresponding [Blend Multiplier](https://wiki.facepunch.com/gmod/Enums/BLEND).
---
--- All results will be clamped in the range `(0-1)` and will produce final pixel channel values in the range `(0-255)`.
---
--- For an interactive demonstration of how these enums behave, see [Anders Riggelsen's Visual glBlendFunc Tool here](https://www.andersriggelsen.dk/glblendfunc.php)
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/BLENDFUNC
--- **Source + Destination**
--- Adds each channel of the Source with the same channel of the Destination.
---
--- **Example:**
--- Using the Source channels: `r=0.0`, `g=0.25`, `b=0.1`, `a=0.9`
--- With Destination channels: `r=0.25`, `g=0.25`, `b=1.0`, `a=0.0`
--- The final pixel channels are: `r=0.25`, `g=0.5`, `b=1.0`, `a=0.9`
---@readonly
BLENDFUNC_ADD = 0
--- **Source - Destination**
--- Subtracts each channel of the Destination from the same channel of the Source.
---
--- **Example:**
--- Using the Source channels: `r=0.0`, `g=0.25`, `b=1.0`, `a=0.9`
--- With Destination channels: `r=0.25`, `g=0.1`, `b=0.4`, `a=0.0`
--- The final pixel channels are: `r=0.0`, `g=0.0`, `b=0.6`, `a=0.9`
---@readonly
BLENDFUNC_SUBTRACT = 1
--- **Destination - Source**
--- Subtracts each channel of the Source from the same channel of the Destination.
---
--- **Example:**
--- Using the Source channels: `r=0.0`, `g=0.25`, `b=1.0`, `a=0.9`
--- With Destination channels: `r=0.25`, `g=0.1`, `b=0.4`, `a=0.0`
--- The final pixel channels are: `r=0.0`, `g=0.75`, `b=0.0`, `a=0.0`
---@readonly
BLENDFUNC_REVERSE_SUBTRACT = 2
--- **Min(Source, Destination**
--- All of the Source channels are added together and compared to all of the Destination channels added together and the smaller of the two is used as the final pixel color.
---@readonly
BLENDFUNC_MIN = 3
--- **Max(Source, Destination**
--- All of the Source channels are added together and compared to all of the Destination channels added together and the larger of the two is used as the final pixel color.
---@readonly
BLENDFUNC_MAX = 4

---@enum BLENDFUNC : number
---| BLENDFUNC_ADD #  			**Source + Destination**   			Adds each channel of the Source with the same channel of the Destination.  			**Example:**   			Using the Source channels: `r=0.0`, `g=0.25`, `b=0.1`, `a=0.9`   			With Destination channels: `r=0.25`, `g=0.25`, `b=1.0`, `a=0.0`   			The final pixel channels are: `r=0.25`, `g=0.5`, `b=1.0`, `a=0.9`
---| BLENDFUNC_SUBTRACT #  			**Source - Destination**   			Subtracts each channel of the Destination from the same channel of the Source.  			**Example:**   			Using the Source channels: `r=0.0`, `g=0.25`, `b=1.0`, `a=0.9`   			With Destination channels: `r=0.25`, `g=0.1`, `b=0.4`, `a=0.0`   			The final pixel channels are: `r=0.0`, `g=0.0`, `b=0.6`, `a=0.9`
---| BLENDFUNC_REVERSE_SUBTRACT #  			**Destination - Source**   			Subtracts each channel of the Source from the same channel of the Destination.  			**Example:**   			Using the Source channels: `r=0.0`, `g=0.25`, `b=1.0`, `a=0.9`   			With Destination channels: `r=0.25`, `g=0.1`, `b=0.4`, `a=0.0`   			The final pixel channels are: `r=0.0`, `g=0.75`, `b=0.0`, `a=0.0`
---| BLENDFUNC_MIN #  			**Min(Source, Destination**   			All of the Source channels are added together and compared to all of the Destination channels added together and the smaller of the two is used as the final pixel color.
---| BLENDFUNC_MAX #  			**Max(Source, Destination**   			All of the Source channels are added together and compared to all of the Destination channels added together and the larger of the two is used as the final pixel color.

--- Enumerations used by [Entity:GetBloodColor](https://wiki.facepunch.com/gmod/Entity:GetBloodColor) and [Entity:SetBloodColor](https://wiki.facepunch.com/gmod/Entity:SetBloodColor).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/BLOOD_COLOR
--- No blood
---@readonly
DONT_BLEED = -1
--- Normal red blood
---@readonly
BLOOD_COLOR_RED = 0
--- Yellow blood
---@readonly
BLOOD_COLOR_YELLOW = 1
--- Green-red blood
---@readonly
BLOOD_COLOR_GREEN = 2
--- Sparks
---@readonly
BLOOD_COLOR_MECH = 3
--- Yellow blood
---@readonly
BLOOD_COLOR_ANTLION = 4
--- Green-red blood
---@readonly
BLOOD_COLOR_ZOMBIE = 5
--- Bright green blood
---@readonly
BLOOD_COLOR_ANTLION_WORKER = 6

---@enum BLOOD_COLOR : number
---| DONT_BLEED # No blood
---| BLOOD_COLOR_RED # Normal red blood
---| BLOOD_COLOR_YELLOW # Yellow blood
---| BLOOD_COLOR_GREEN # Green-red blood
---| BLOOD_COLOR_MECH # Sparks
---| BLOOD_COLOR_ANTLION # Yellow blood
---| BLOOD_COLOR_ZOMBIE # Green-red blood
---| BLOOD_COLOR_ANTLION_WORKER # Bright green blood

--- Used by [Entity:BoneHasFlag](https://wiki.facepunch.com/gmod/Entity:BoneHasFlag).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/BONE
--- Bone is physically simulated when physics are active
---@readonly
BONE_PHYSICALLY_SIMULATED = 1
--- Procedural when physics is active
---@readonly
BONE_PHYSICS_PROCEDURAL = 2
--- Bone is always procedurally animated
---@readonly
BONE_ALWAYS_PROCEDURAL = 4
--- Bone aligns to the screen, not constrained in motion.
---@readonly
BONE_SCREEN_ALIGN_SPHERE = 8
--- Bone aligns to the screen, constrained by it's own axis.
---@readonly
BONE_SCREEN_ALIGN_CYLINDER = 16
---@readonly
BONE_CALCULATE_MASK = 31
--- A hitbox is attached to this bone
---@readonly
BONE_USED_BY_HITBOX = 256
--- An attachment is attached to this bone
---@readonly
BONE_USED_BY_ATTACHMENT = 512
---@readonly
BONE_USED_BY_VERTEX_LOD0 = 1024
---@readonly
BONE_USED_BY_VERTEX_LOD1 = 2048
---@readonly
BONE_USED_BY_VERTEX_LOD2 = 4096
---@readonly
BONE_USED_BY_VERTEX_LOD3 = 8192
---@readonly
BONE_USED_BY_VERTEX_LOD4 = 16384
---@readonly
BONE_USED_BY_VERTEX_LOD5 = 32768
---@readonly
BONE_USED_BY_VERTEX_LOD6 = 65536
---@readonly
BONE_USED_BY_VERTEX_LOD7 = 131072
---@readonly
BONE_USED_BY_VERTEX_MASK = 261120
--- Bone is available for bone merge to occur against it
---@readonly
BONE_USED_BY_BONE_MERGE = 262144
--- Is this bone used by anything?
---
--- ( If any BONE_USED_BY_* flags are true )
---@readonly
BONE_USED_BY_ANYTHING = 524032
---@readonly
BONE_USED_MASK = 524032

---@enum BONE : number
---| BONE_PHYSICALLY_SIMULATED # Bone is physically simulated when physics are active
---| BONE_PHYSICS_PROCEDURAL # Procedural when physics is active
---| BONE_ALWAYS_PROCEDURAL # Bone is always procedurally animated
---| BONE_SCREEN_ALIGN_SPHERE # Bone aligns to the screen, not constrained in motion.
---| BONE_SCREEN_ALIGN_CYLINDER # Bone aligns to the screen, constrained by it's own axis.
---| BONE_CALCULATE_MASK
---| BONE_USED_BY_HITBOX # A hitbox is attached to this bone
---| BONE_USED_BY_ATTACHMENT # An attachment is attached to this bone
---| BONE_USED_BY_VERTEX_LOD0
---| BONE_USED_BY_VERTEX_LOD1
---| BONE_USED_BY_VERTEX_LOD2
---| BONE_USED_BY_VERTEX_LOD3
---| BONE_USED_BY_VERTEX_LOD4
---| BONE_USED_BY_VERTEX_LOD5
---| BONE_USED_BY_VERTEX_LOD6
---| BONE_USED_BY_VERTEX_LOD7
---| BONE_USED_BY_VERTEX_MASK
---| BONE_USED_BY_BONE_MERGE # Bone is available for bone merge to occur against it
---| BONE_USED_BY_ANYTHING # Is this bone used by anything?  ( If any BONE_USED_BY_* flags are true )
---| BONE_USED_MASK

--- Enumerations used by [Entity:SetSurroundingBoundsType](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBoundsType).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/BOUNDS
--- Sets the bounds in relation to the entity's collision bounds.
---@readonly
BOUNDS_COLLISION = 0
--- Sets the bounds to fit all hitboxes of the entity's model.
---@readonly
BOUNDS_HITBOXES = 2

---@enum BOUNDS : number
---| BOUNDS_COLLISION # Sets the bounds in relation to the entity's collision bounds.
---| BOUNDS_HITBOXES # Sets the bounds to fit all hitboxes of the entity's model.

--- Enumerations used by [render.SetModelLighting](https://wiki.facepunch.com/gmod/render.SetModelLighting).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/BOX
--- Place the light from the front
---@readonly
BOX_FRONT = 0
--- Place the light behind
---@readonly
BOX_BACK = 1
--- Place the light to the right
---@readonly
BOX_RIGHT = 2
--- Place the light to the left
---@readonly
BOX_LEFT = 3
--- Place the light to the top
---@readonly
BOX_TOP = 4
--- Place the light to the bottom
---@readonly
BOX_BOTTOM = 5

---@enum BOX : number
---| BOX_FRONT # Place the light from the front
---| BOX_BACK # Place the light behind
---| BOX_RIGHT # Place the light to the right
---| BOX_LEFT # Place the light to the left
---| BOX_TOP # Place the light to the top
---| BOX_BOTTOM # Place the light to the bottom

--- Encompasses the range of [Enums/KEY](https://wiki.facepunch.com/gmod/Enums/KEY), [Enums/MOUSE](https://wiki.facepunch.com/gmod/Enums/MOUSE) and [Enums/JOYSTICK](https://wiki.facepunch.com/gmod/Enums/JOYSTICK), all of which can be used by:
--- * [input.IsButtonDown](https://wiki.facepunch.com/gmod/input.IsButtonDown)
--- * [input.LookupKeyBinding](https://wiki.facepunch.com/gmod/input.LookupKeyBinding)
--- * [input.GetKeyName](https://wiki.facepunch.com/gmod/input.GetKeyName)
--- * [input.GetKeyCode](https://wiki.facepunch.com/gmod/input.GetKeyCode)
--- * [GM:PlayerButtonDown](https://wiki.facepunch.com/gmod/GM:PlayerButtonDown)
--- * [GM:PlayerButtonUp](https://wiki.facepunch.com/gmod/GM:PlayerButtonUp)
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/BUTTON_CODE
---@readonly
BUTTON_CODE_INVALID = -1
---@readonly
BUTTON_CODE_NONE = 0
---@readonly
BUTTON_CODE_LAST = 171
---@readonly
BUTTON_CODE_COUNT = 172

---@enum BUTTON_CODE : number
---| BUTTON_CODE_INVALID
---| BUTTON_CODE_NONE
---| BUTTON_CODE_LAST
---| BUTTON_CODE_COUNT

--- Enumerations used by [NPC:CapabilitiesAdd](https://wiki.facepunch.com/gmod/NPC:CapabilitiesAdd), [WEAPON:GetCapabilities](https://wiki.facepunch.com/gmod/WEAPON:GetCapabilities) and [NPC:CapabilitiesGet](https://wiki.facepunch.com/gmod/NPC:CapabilitiesGet). Serverside only.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/CAP
--- When hit by an explosion, we'll simply block it instead of spilling it to entities behind us, the sv_robust_explosions cvar can also enable this globally when set to 0
---@readonly
CAP_SIMPLE_RADIUS_DAMAGE = -2147483648
--- Walk/Run
---@readonly
CAP_MOVE_GROUND = 1
--- Jump/Leap
---@readonly
CAP_MOVE_JUMP = 2
--- Can fly  move all around
---@readonly
CAP_MOVE_FLY = 4
--- climb ladders
---@readonly
CAP_MOVE_CLIMB = 8
---@readonly
CAP_MOVE_SWIM = 16
---@readonly
CAP_MOVE_CRAWL = 32
--- Tries to shoot weapon while moving
---@readonly
CAP_MOVE_SHOOT = 64
---@readonly
CAP_SKIP_NAV_GROUND_CHECK = 128
--- Open doors/push buttons/pull levers
---@readonly
CAP_USE = 256
--- Can trigger auto doors
---@readonly
CAP_AUTO_DOORS = 1024
--- Can open manual doors
---@readonly
CAP_OPEN_DOORS = 2048
--- Can turn head  always bone controller 0
---@readonly
CAP_TURN_HEAD = 4096
---@readonly
CAP_WEAPON_RANGE_ATTACK1 = 8192
---@readonly
CAP_WEAPON_RANGE_ATTACK2 = 16384
---@readonly
CAP_WEAPON_MELEE_ATTACK1 = 32768
---@readonly
CAP_WEAPON_MELEE_ATTACK2 = 65536
---@readonly
CAP_INNATE_RANGE_ATTACK1 = 131072
---@readonly
CAP_INNATE_RANGE_ATTACK2 = 262144
---@readonly
CAP_INNATE_MELEE_ATTACK1 = 524288
---@readonly
CAP_INNATE_MELEE_ATTACK2 = 1048576
---@readonly
CAP_USE_WEAPONS = 2097152
---@readonly
CAP_USE_SHOT_REGULATOR = 16777216
--- Has animated eyes/face
---@readonly
CAP_ANIMATEDFACE = 8388608
--- Don't take damage from npc's that are D_LI
---@readonly
CAP_FRIENDLY_DMG_IMMUNE = 33554432
--- Can form squads
---@readonly
CAP_SQUAD = 67108864
--- Cover and Reload ducking
---@readonly
CAP_DUCK = 134217728
--- Don't hit players
---@readonly
CAP_NO_HIT_PLAYER = 268435456
--- Use arms to aim gun, not just body
---@readonly
CAP_AIM_GUN = 536870912
---@readonly
CAP_NO_HIT_SQUADMATES = 1073741824

---@enum CAP : number
---| CAP_SIMPLE_RADIUS_DAMAGE # When hit by an explosion, we'll simply block it instead of spilling it to entities behind us, the sv_robust_explosions cvar can also enable this globally when set to 0
---| CAP_MOVE_GROUND # Walk/Run
---| CAP_MOVE_JUMP # Jump/Leap
---| CAP_MOVE_FLY # Can fly  move all around
---| CAP_MOVE_CLIMB # climb ladders
---| CAP_MOVE_SWIM
---| CAP_MOVE_CRAWL
---| CAP_MOVE_SHOOT # Tries to shoot weapon while moving
---| CAP_SKIP_NAV_GROUND_CHECK
---| CAP_USE # Open doors/push buttons/pull levers
---| CAP_AUTO_DOORS # Can trigger auto doors
---| CAP_OPEN_DOORS # Can open manual doors
---| CAP_TURN_HEAD # Can turn head  always bone controller 0
---| CAP_WEAPON_RANGE_ATTACK1
---| CAP_WEAPON_RANGE_ATTACK2
---| CAP_WEAPON_MELEE_ATTACK1
---| CAP_WEAPON_MELEE_ATTACK2
---| CAP_INNATE_RANGE_ATTACK1
---| CAP_INNATE_RANGE_ATTACK2
---| CAP_INNATE_MELEE_ATTACK1
---| CAP_INNATE_MELEE_ATTACK2
---| CAP_USE_WEAPONS
---| CAP_USE_SHOT_REGULATOR
---| CAP_ANIMATEDFACE # Has animated eyes/face
---| CAP_FRIENDLY_DMG_IMMUNE # Don't take damage from npc's that are D_LI
---| CAP_SQUAD # Can form squads
---| CAP_DUCK # Cover and Reload ducking
---| CAP_NO_HIT_PLAYER # Don't hit players
---| CAP_AIM_GUN # Use arms to aim gun, not just body
---| CAP_NO_HIT_SQUADMATES

--- Enumerations used by [Global.EmitSound](https://wiki.facepunch.com/gmod/Global.EmitSound) and [sound.Add](https://wiki.facepunch.com/gmod/sound.Add).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/CHAN
--- Used when playing sounds through console commands.
---@readonly
CHAN_REPLACE = -1
--- Automatic channel
---@readonly
CHAN_AUTO = 0
--- Channel for weapon sounds
---@readonly
CHAN_WEAPON = 1
--- Channel for NPC voices
---@readonly
CHAN_VOICE = 2
--- Channel for items ( Health kits, etc )
---@readonly
CHAN_ITEM = 3
--- Clothing, ragdoll impacts, footsteps, knocking/pounding/punching etc.
---@readonly
CHAN_BODY = 4
--- Stream channel from the static or dynamic area
---@readonly
CHAN_STREAM = 5
--- A constant/background sound that doesn't require any reaction.
--- **This channel allows same sounds files to play multiple times without cutting out.**
---@readonly
CHAN_STATIC = 6
--- TF2s Announcer dialogue channel
---@readonly
CHAN_VOICE2 = 7
--- Channels 8-135 (128 channels) are allocated for player voice chat
--- **This channel allows same sounds files to play multiple times without cutting out.**
---@readonly
CHAN_VOICE_BASE = 8
--- Channels from this and onwards are allocated to game code
---@readonly
CHAN_USER_BASE = 136

---@enum CHAN : number
---| CHAN_REPLACE # Used when playing sounds through console commands.
---| CHAN_AUTO # Automatic channel
---| CHAN_WEAPON # Channel for weapon sounds
---| CHAN_VOICE # Channel for NPC voices
---| CHAN_ITEM # Channel for items ( Health kits, etc )
---| CHAN_BODY # Clothing, ragdoll impacts, footsteps, knocking/pounding/punching etc.
---| CHAN_STREAM # Stream channel from the static or dynamic area
---| CHAN_STATIC # A constant/background sound that doesn't require any reaction. **This channel allows same sounds files to play multiple times without cutting out.**
---| CHAN_VOICE2 # TF2s Announcer dialogue channel
---| CHAN_VOICE_BASE # Channels 8-135 (128 channels) are allocated for player voice chat **This channel allows same sounds files to play multiple times without cutting out.**
---| CHAN_USER_BASE # Channels from this and onwards are allocated to game code

--- Enumerations used by [NPC:Classify](https://wiki.facepunch.com/gmod/NPC:Classify).
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/CLASS
--- None - default class for entities.
---@readonly
CLASS_NONE = 0
--- Players
---@readonly
CLASS_PLAYER = 1
--- HL2 - **Allies**
--- - `monster_barney`
--- - `npc_citizen`
--- - `npc_manhack` ( Hacked )
--- - `npc_turret_floor` ( Friendly )
---@readonly
CLASS_PLAYER_ALLY = 2
--- HL2 - **Vital Allies**
--- - `npc_magnusson`
--- - `npc_gman`
--- - `npc_fisherman`
--- - `npc_eli`
--- - `npc_barney`
--- - `npc_kleiner`
--- - `npc_mossman`
--- - `npc_alyx`
--- - `npc_monk`
--- - `npc_dog`
--- - `npc_vortigaunt` at the end of EP2 (controlled by `MakeGameEndAlly` input)
---@readonly
CLASS_PLAYER_ALLY_VITAL = 3
--- HL2 - **Antlions**
--- - `npc_antlion`
--- - `npc_antlionguard`
--- - `npc_antlionguard`
---@readonly
CLASS_ANTLION = 4
--- HL2 - **Barnacles**
--- - `npc_barnacle`
---@readonly
CLASS_BARNACLE = 5
--- HL2 - **Bullseyes**
--- - `npc_bullseye`
---@readonly
CLASS_BULLSEYE = 6
--- HL2 - **Passive / Non-Rebel Citizens**
--- - `npc_citizen` in the beginning of HL2.
---@readonly
CLASS_CITIZEN_PASSIVE = 7
--- HL2 -  Unused
---@readonly
CLASS_CITIZEN_REBEL = 8
--- HL2 - **Combine Troops**
--- - `npc_combine`
--- - `npc_advisor`
--- - `apc_missile`
--- - `npc_apcdriver`
--- - `npc_turret_floor` ( Hostile )
--- - `npc_rollermine` ( Hostile )
--- - `npc_turret_ground` ( Active )
--- - `npc_turret_ceiling` ( Active )
--- - `npc_strider` ( Active - Not being carried by the gunship )
---@readonly
CLASS_COMBINE = 9
--- HL2 - **Combine Aircrafts**
--- - `npc_combinegunship`
--- - `npc_combinedropship`
--- - `npc_helicopter`
---@readonly
CLASS_COMBINE_GUNSHIP = 10
--- HL2 -  Unused
---@readonly
CLASS_CONSCRIPT = 11
--- HL2 - **Headcrabs**
--- - `npc_headcrab` ( Visible )
---@readonly
CLASS_HEADCRAB = 12
--- HL2 - **Manhacks**
--- - `npc_manhack` ( Hostile - Not held by the gravity gun )
---@readonly
CLASS_MANHACK = 13
--- HL2 - **Metro Police**
--- - `npc_metropolice`
--- - `npc_vehicledriver`
---@readonly
CLASS_METROPOLICE = 14
--- HL2 - **Combine Military Objects**
--- - `func_guntarget`
--- - `npc_spotlight`
--- - `npc_combine_camera` ( Active )
---@readonly
CLASS_MILITARY = 15
--- HL2 - **Combine Scanners**
--- - `npc_cscanner`
--- - `npc_clawscanner`
---@readonly
CLASS_SCANNER = 16
--- HL2 - **Stalkers**
--- - `npc_stalker`
---@readonly
CLASS_STALKER = 17
--- HL2 - **Vortigaunts**
--- - `npc_vortigaunt` before the end of EP2 ( Controlled by `MakeGameEndAlly` input )
---@readonly
CLASS_VORTIGAUNT = 18
--- HL2 - **Zombies**
--- - `npc_zombie` ( Unslumped )
--- - `npc_poisonzombie`
--- - `npc_fastzombie`
--- - `npc_fastzombie_torso`
--- - `npc_zombine`
---@readonly
CLASS_ZOMBIE = 19
--- HL2 - **Snipers**
--- - `npc_sniper`
--- - `proto_sniper`
---@readonly
CLASS_PROTOSNIPER = 20
--- HL2 - **Missiles**
--- - `rpg_missile`
--- - `apc_missile`
--- - `grenade_pathfollower`
---@readonly
CLASS_MISSILE = 21
--- HL2 - **Flares**
--- - `env_flare`
---@readonly
CLASS_FLARE = 22
--- HL2 - **Animals**
--- - `npc_crow`
--- - `npc_seagull`
--- - `npc_pigeon`
---@readonly
CLASS_EARTH_FAUNA = 23
--- HL2 - **Friendly Rollermines**
--- - `npc_rollermine` ( Hacked )
---@readonly
CLASS_HACKED_ROLLERMINE = 24
--- HL2 - **Hunters**
--- - `npc_hunter`
---@readonly
CLASS_COMBINE_HUNTER = 25
--- HL:S - **Turrets**
--- - `monster_turret`
--- - `monster_miniturret`
--- - `monster_sentry`
---@readonly
CLASS_MACHINE = 26
--- HL:S - **Friendly Humans**
--- - `monster_scientist`
---@readonly
CLASS_HUMAN_PASSIVE = 27
--- HL:S - **Human Military**
--- - `monster_human_grunt`
--- - `monster_apache`
---@readonly
CLASS_HUMAN_MILITARY = 28
--- HL:S - **Alien Military**
--- - `monster_alien_controller`
--- - `monster_vortigaunt`
--- - `monster_alien_grunt`
--- - `monster_nihilanth`
--- - `monster_snark` if it has an enemy of class  `CLASS_PLAYER` , `CLASS_HUMAN_PASSIVE` or `CLASS_HUMAN_MILITARY`
---@readonly
CLASS_ALIEN_MILITARY = 29
--- HL:S - **Monsters**
--- - `monster_tentacle`
--- - `monster_barnacle`
--- - `monster_zombie`
--- - `monster_gargantua`
--- - `monster_houndeye`
--- - `monster_ichthyosaur`
--- - `monster_bigmomma`
---@readonly
CLASS_ALIEN_MONSTER = 30
--- HL:S - **Headcrabs**
--- - `monster_headcrab`
---@readonly
CLASS_ALIEN_PREY = 31
--- HL:S - **Alien Predators**
--- - `monster_bullsquid`
--- - `xen_tree`
--- - `xen_hull`
---@readonly
CLASS_ALIEN_PREDATOR = 32
--- HL:S - **Insects**
--- - `montser_roach`
--- - `monster_leech`
---@readonly
CLASS_INSECT = 33
--- HL:S - **Player Bioweapons**
--- - `hornet` fired by a player
---@readonly
CLASS_PLAYER_BIOWEAPON = 34
--- HL:S - **Enemy Bioweapons**
--- - `hornet` fired by anyone but a player
--- - `monster_snark` with no enemy or an enemy without the class  `CLASS_PLAYER` , `CLASS_HUMAN_PASSIVE` or `CLASS_HUMAN_MILITARY`
---@readonly
CLASS_ALIEN_BIOWEAPON = 35
--- Portal - **Portal rocket and normal turrets, and the camera**
--- * `npc_portal_turret_floor`
--- * `npc_rocket_turret`
--- * `npc_security_camera`
---@readonly
CLASS_PORTAL_TURRET = 36

---@enum CLASS : number
---| CLASS_NONE #  			None - default class for entities.
---| CLASS_PLAYER #  			Players
---| CLASS_PLAYER_ALLY #  			HL2 - **Allies**   			- `monster_barney`   			- `npc_citizen`   			- `npc_manhack` ( Hacked )   			- `npc_turret_floor` ( Friendly )
---| CLASS_PLAYER_ALLY_VITAL #  			HL2 - **Vital Allies**   			- `npc_magnusson`   			- `npc_gman`   			- `npc_fisherman`   			- `npc_eli`   			- `npc_barney`   			- `npc_kleiner`   			- `npc_mossman`   			- `npc_alyx`   			- `npc_monk`   			- `npc_dog`   			- `npc_vortigaunt` at the end of EP2 (controlled by `MakeGameEndAlly` input)
---| CLASS_ANTLION #  			HL2 - **Antlions**   			- `npc_antlion`   			- `npc_antlionguard`   			- `npc_antlionguard`
---| CLASS_BARNACLE #  			HL2 - **Barnacles**   			- `npc_barnacle`
---| CLASS_BULLSEYE #  			HL2 - **Bullseyes**   			- `npc_bullseye`
---| CLASS_CITIZEN_PASSIVE #  			HL2 - **Passive / Non-Rebel Citizens**   			- `npc_citizen` in the beginning of HL2.
---| CLASS_CITIZEN_REBEL #  			HL2 -  Unused
---| CLASS_COMBINE #  			HL2 - **Combine Troops**   			- `npc_combine`   			- `npc_advisor`   			- `apc_missile`   			- `npc_apcdriver`   			- `npc_turret_floor` ( Hostile )   			- `npc_rollermine` ( Hostile )   			- `npc_turret_ground` ( Active )   			- `npc_turret_ceiling` ( Active )   			- `npc_strider` ( Active - Not being carried by the gunship )
---| CLASS_COMBINE_GUNSHIP #  			HL2 - **Combine Aircrafts**   			- `npc_combinegunship`   			- `npc_combinedropship` 			- `npc_helicopter`
---| CLASS_CONSCRIPT #  			HL2 -  Unused
---| CLASS_HEADCRAB #  			HL2 - **Headcrabs**   			- `npc_headcrab` ( Visible )
---| CLASS_MANHACK #  			HL2 - **Manhacks**   			- `npc_manhack` ( Hostile - Not held by the gravity gun )
---| CLASS_METROPOLICE #  			HL2 - **Metro Police**   			- `npc_metropolice`   			- `npc_vehicledriver`
---| CLASS_MILITARY #  			HL2 - **Combine Military Objects**   			- `func_guntarget`   			- `npc_spotlight`   			- `npc_combine_camera` ( Active )
---| CLASS_SCANNER #  			HL2 - **Combine Scanners**   			- `npc_cscanner`   			- `npc_clawscanner`
---| CLASS_STALKER #  			HL2 - **Stalkers**   			- `npc_stalker`
---| CLASS_VORTIGAUNT #  			HL2 - **Vortigaunts**   			- `npc_vortigaunt` before the end of EP2 ( Controlled by `MakeGameEndAlly` input )
---| CLASS_ZOMBIE #  			HL2 - **Zombies**   			- `npc_zombie` ( Unslumped )   			- `npc_poisonzombie`   			- `npc_fastzombie`   			- `npc_fastzombie_torso`   			- `npc_zombine`
---| CLASS_PROTOSNIPER #  			HL2 - **Snipers**   			- `npc_sniper`   			- `proto_sniper`
---| CLASS_MISSILE #  			HL2 - **Missiles**   			- `rpg_missile`   			- `apc_missile`   			- `grenade_pathfollower`
---| CLASS_FLARE #  			HL2 - **Flares**   			- `env_flare`
---| CLASS_EARTH_FAUNA #  			HL2 - **Animals**   			- `npc_crow`   			- `npc_seagull`   			- `npc_pigeon`
---| CLASS_HACKED_ROLLERMINE #  			HL2 - **Friendly Rollermines**   			- `npc_rollermine` ( Hacked )
---| CLASS_COMBINE_HUNTER #  			HL2 - **Hunters**   			- `npc_hunter`
---| CLASS_MACHINE #  			HL:S - **Turrets**   			- `monster_turret`   			- `monster_miniturret`   			- `monster_sentry`
---| CLASS_HUMAN_PASSIVE #  			HL:S - **Friendly Humans**   			- `monster_scientist`
---| CLASS_HUMAN_MILITARY #  			HL:S - **Human Military**   			- `monster_human_grunt`   			- `monster_apache`
---| CLASS_ALIEN_MILITARY #  			HL:S - **Alien Military**   			- `monster_alien_controller`   			- `monster_vortigaunt`   			- `monster_alien_grunt`   			- `monster_nihilanth`   			- `monster_snark` if it has an enemy of class  `CLASS_PLAYER` , `CLASS_HUMAN_PASSIVE` or `CLASS_HUMAN_MILITARY`
---| CLASS_ALIEN_MONSTER #  			HL:S - **Monsters**   			- `monster_tentacle`   			- `monster_barnacle`   			- `monster_zombie`   			- `monster_gargantua`   			- `monster_houndeye`   			- `monster_ichthyosaur`   			- `monster_bigmomma`
---| CLASS_ALIEN_PREY #  			HL:S - **Headcrabs**   			- `monster_headcrab`
---| CLASS_ALIEN_PREDATOR #  			HL:S - **Alien Predators**   			- `monster_bullsquid`   			- `xen_tree`   			- `xen_hull`
---| CLASS_INSECT #  			HL:S - **Insects**   			- `montser_roach`   			- `monster_leech`
---| CLASS_PLAYER_BIOWEAPON #  			HL:S - **Player Bioweapons**   			- `hornet` fired by a player
---| CLASS_ALIEN_BIOWEAPON #  			HL:S - **Enemy Bioweapons**   			- `hornet` fired by anyone but a player   			- `monster_snark` with no enemy or an enemy without the class  `CLASS_PLAYER` , `CLASS_HUMAN_PASSIVE` or `CLASS_HUMAN_MILITARY`
---| CLASS_PORTAL_TURRET #  Portal - **Portal rocket and normal turrets, and the camera** * `npc_portal_turret_floor` * `npc_rocket_turret` * `npc_security_camera`

--- Enumerations used by [Entity:SetCollisionGroup](https://wiki.facepunch.com/gmod/Entity:SetCollisionGroup), [Entity:GetCollisionGroup](https://wiki.facepunch.com/gmod/Entity:GetCollisionGroup) and [Traces](https://wiki.facepunch.com/gmod/Structures/Trace#collisiongroup).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/COLLISION_GROUP
--- Normal
---@readonly
COLLISION_GROUP_NONE = 0
--- Collides with nothing but world and static stuff
---@readonly
COLLISION_GROUP_DEBRIS = 1
--- Same as debris, but hits triggers. Useful for an item that can be shot, but doesn't collide.
---@readonly
COLLISION_GROUP_DEBRIS_TRIGGER = 2
--- Collides with everything except other interactive debris or debris
---@readonly
COLLISION_GROUP_INTERACTIVE_DEBRIS = 3
--- Collides with everything except interactive debris or debris
---@readonly
COLLISION_GROUP_INTERACTIVE = 4
--- Used by players, but NOT for movement collision. Does not collide with COLLISION_GROUP_PASSABLE_DOOR and COLLISION_GROUP_PUSHAWAY
---@readonly
COLLISION_GROUP_PLAYER = 5
--- NPCs can see straight through an Entity with this applied.
---@readonly
COLLISION_GROUP_BREAKABLE_GLASS = 6
--- Used by driveable vehicles. Always collides against COLLISION_GROUP_VEHICLE_CLIP
---@readonly
COLLISION_GROUP_VEHICLE = 7
--- For HL2, same as Collision_Group_Player, for TF2, this filters out other players and CBaseObjects
---@readonly
COLLISION_GROUP_PLAYER_MOVEMENT = 8
--- Generic NPC group
---@readonly
COLLISION_GROUP_NPC = 9
--- Doesn't collide with anything, no traces
---@readonly
COLLISION_GROUP_IN_VEHICLE = 10
--- Doesn't collide with players and vehicles
---@readonly
COLLISION_GROUP_WEAPON = 11
--- Only collides with vehicles
---@readonly
COLLISION_GROUP_VEHICLE_CLIP = 12
--- Set on projectiles. Does not collide with other projectiles.
---@readonly
COLLISION_GROUP_PROJECTILE = 13
--- Blocks entities not permitted to get near moving doors
---@readonly
COLLISION_GROUP_DOOR_BLOCKER = 14
--- Lets the Player through, nothing else.
---@readonly
COLLISION_GROUP_PASSABLE_DOOR = 15
--- Things that are dissolving are in this group
---@readonly
COLLISION_GROUP_DISSOLVING = 16
--- Nonsolid on client and server, pushaway in player code
---@readonly
COLLISION_GROUP_PUSHAWAY = 17
--- Used so NPCs in scripts ignore the player
---@readonly
COLLISION_GROUP_NPC_ACTOR = 18
--- Used for NPCs in scripts that should not collide with each other
---@readonly
COLLISION_GROUP_NPC_SCRIPTED = 19
--- Doesn't collide with players/props
---@readonly
COLLISION_GROUP_WORLD = 20
--- Amount of COLLISION_GROUP_ enumerations
---@readonly
LAST_SHARED_COLLISION_GROUP = 21
--- Half-Life 2 exclusive collision group, acts similarly to `COLLISION_GROUP_PROJECTILE` but is also ignored by player movement.
---@readonly
COLLISION_GROUP_HL2_SPIT = 22

---@enum COLLISION_GROUP : number
---| COLLISION_GROUP_NONE # Normal
---| COLLISION_GROUP_DEBRIS # Collides with nothing but world and static stuff
---| COLLISION_GROUP_DEBRIS_TRIGGER # Same as debris, but hits triggers. Useful for an item that can be shot, but doesn't collide.
---| COLLISION_GROUP_INTERACTIVE_DEBRIS # Collides with everything except other interactive debris or debris
---| COLLISION_GROUP_INTERACTIVE # Collides with everything except interactive debris or debris
---| COLLISION_GROUP_PLAYER # Used by players, but NOT for movement collision. Does not collide with COLLISION_GROUP_PASSABLE_DOOR and COLLISION_GROUP_PUSHAWAY
---| COLLISION_GROUP_BREAKABLE_GLASS # NPCs can see straight through an Entity with this applied.
---| COLLISION_GROUP_VEHICLE # Used by driveable vehicles. Always collides against COLLISION_GROUP_VEHICLE_CLIP
---| COLLISION_GROUP_PLAYER_MOVEMENT # For HL2, same as Collision_Group_Player, for TF2, this filters out other players and CBaseObjects
---| COLLISION_GROUP_NPC # Generic NPC group
---| COLLISION_GROUP_IN_VEHICLE # Doesn't collide with anything, no traces
---| COLLISION_GROUP_WEAPON # Doesn't collide with players and vehicles
---| COLLISION_GROUP_VEHICLE_CLIP # Only collides with vehicles
---| COLLISION_GROUP_PROJECTILE # 	Set on projectiles. Does not collide with other projectiles.
---| COLLISION_GROUP_DOOR_BLOCKER # Blocks entities not permitted to get near moving doors
---| COLLISION_GROUP_PASSABLE_DOOR # Lets the Player through, nothing else.
---| COLLISION_GROUP_DISSOLVING # Things that are dissolving are in this group
---| COLLISION_GROUP_PUSHAWAY # Nonsolid on client and server, pushaway in player code
---| COLLISION_GROUP_NPC_ACTOR # Used so NPCs in scripts ignore the player
---| COLLISION_GROUP_NPC_SCRIPTED # Used for NPCs in scripts that should not collide with each other
---| COLLISION_GROUP_WORLD # Doesn't collide with players/props
---| LAST_SHARED_COLLISION_GROUP # Amount of COLLISION_GROUP_ enumerations
---| COLLISION_GROUP_HL2_SPIT # Half-Life 2 exclusive collision group, acts similarly to `COLLISION_GROUP_PROJECTILE` but is also ignored by player movement.

--- Enumerations for NPC conditions, used by [NPC:SetCondition](https://wiki.facepunch.com/gmod/NPC:SetCondition). Serverside only.
---
--- **NOTE**: Unlike other Enums `COND` is a table that contains all the enums.
---
--- 	There are more conditions than listed here after **COND_NO_CUSTOM_INTERRUPTS**(70)
--- 	but the name depends on what's returned by [NPC:ConditionName](https://wiki.facepunch.com/gmod/NPC:ConditionName)
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/COND
---@enum COND
COND = {
	BEHIND_ENEMY = 29,
	BETTER_WEAPON_AVAILABLE = 46,
	CAN_MELEE_ATTACK1 = 23,
	CAN_MELEE_ATTACK2 = 24,
	CAN_RANGE_ATTACK1 = 21,
	CAN_RANGE_ATTACK2 = 22,
	ENEMY_DEAD = 30,
	ENEMY_FACING_ME = 28,
	ENEMY_OCCLUDED = 13,
	ENEMY_TOO_FAR = 27,
	ENEMY_UNREACHABLE = 31,
	ENEMY_WENT_NULL = 12,
	FLOATING_OFF_GROUND = 61,
	GIVE_WAY = 48,
	HAVE_ENEMY_LOS = 15,
	HAVE_TARGET_LOS = 16,
	HEALTH_ITEM_AVAILABLE = 47,
	HEAR_BUGBAIT = 52,
	HEAR_BULLET_IMPACT = 56,
	HEAR_COMBAT = 53,
	HEAR_DANGER = 50,
	HEAR_MOVE_AWAY = 58,
	HEAR_PHYSICS_DANGER = 57,
	HEAR_PLAYER = 55,
	HEAR_SPOOKY = 59,
	HEAR_THUMPER = 51,
	HEAR_WORLD = 54,
	HEAVY_DAMAGE = 18,
	IDLE_INTERRUPT = 2,
	IN_PVS = 1,
	LIGHT_DAMAGE = 17,
	LOST_ENEMY = 11,
	LOST_PLAYER = 33,
	LOW_PRIMARY_AMMO = 3,
	MOBBED_BY_ENEMIES = 62,
	NEW_ENEMY = 26,
	NO_CUSTOM_INTERRUPTS = 70,
	NO_HEAR_DANGER = 60,
	NO_PRIMARY_AMMO = 4,
	NO_SECONDARY_AMMO = 5,
	NO_WEAPON = 6,
	--- No additional conditions are being played
	NONE = 0,
	NOT_FACING_ATTACK = 40,
	--- Freezes NPC movement
	NPC_FREEZE = 67,
	--- Unfreezes NPC movement
	NPC_UNFREEZE = 68,
	PHYSICS_DAMAGE = 19,
	PLAYER_ADDED_TO_SQUAD = 64,
	PLAYER_PUSHING = 66,
	PLAYER_REMOVED_FROM_SQUAD = 65,
	PROVOKED = 25,
	RECEIVED_ORDERS = 63,
	REPEATED_DAMAGE = 20,
	SCHEDULE_DONE = 36,
	SEE_DISLIKE = 9,
	SEE_ENEMY = 10,
	SEE_FEAR = 8,
	SEE_HATE = 7,
	SEE_NEMESIS = 34,
	SEE_PLAYER = 32,
	SMELL = 37,
	TALKER_RESPOND_TO_QUESTION = 69,
	TARGET_OCCLUDED = 14,
	TASK_FAILED = 35,
	TOO_CLOSE_TO_ATTACK = 38,
	TOO_FAR_TO_ATTACK = 39,
	WAY_CLEAR = 49,
	WEAPON_BLOCKED_BY_FRIEND = 42,
	WEAPON_HAS_LOS = 41,
	WEAPON_PLAYER_IN_SPREAD = 43,
	WEAPON_PLAYER_NEAR_TARGET = 44,
	WEAPON_SIGHT_OCCLUDED = 45,
}

--- Alignment of a panel's contents, laid out like the keys of a number pad.
--- Used by [Panel:SetContentAlignment](https://wiki.facepunch.com/gmod/Panel:SetContentAlignment), [DListView_Column:SetTextAlign](https://wiki.facepunch.com/gmod/DListView_Column:SetTextAlign) and [DNotify:SetAlignment](https://wiki.facepunch.com/gmod/DNotify:SetAlignment).
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/ContentAlignment
--- * `BOTTOM_LEFT` = `1`
--- * `BOTTOM_CENTER` = `2`
--- * `BOTTOM_RIGHT` = `3`
--- * `MIDDLE_LEFT` = `4`
--- * `CENTER` = `5`
--- * `MIDDLE_RIGHT` = `6`
--- * `TOP_LEFT` = `7`
--- * `TOP_CENTER` = `8`
--- * `TOP_RIGHT` = `9`
---@alias ContentAlignment 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | number

--- Enumerations used by [util.PointContents](https://wiki.facepunch.com/gmod/util.PointContents) and [PhysObj:SetContents](https://wiki.facepunch.com/gmod/PhysObj:SetContents) as tracer masks, and by [ENT.PhysicsSolidMask](https://wiki.facepunch.com/gmod/Structures/ENT#PhysicsSolidMask) for collision masking.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/CONTENTS
--- Things that are not solid
---@readonly
CONTENTS_EMPTY = 0
--- Things that are solid
---@readonly
CONTENTS_SOLID = 1
--- Glass
---@readonly
CONTENTS_WINDOW = 2
---@readonly
CONTENTS_AUX = 4
--- Bullets go through, solids don't
---@readonly
CONTENTS_GRATE = 8
---@readonly
CONTENTS_SLIME = 16
--- Hits world but not skybox
---@readonly
CONTENTS_WATER = 32
--- Things that block line of sight
---@readonly
CONTENTS_BLOCKLOS = 64
--- Things that block light
---@readonly
CONTENTS_OPAQUE = 128
---@readonly
CONTENTS_TESTFOGVOLUME = 256
---@readonly
CONTENTS_TEAM4 = 512
---@readonly
CONTENTS_TEAM3 = 1024
---@readonly
CONTENTS_TEAM1 = 2048
---@readonly
CONTENTS_TEAM2 = 4096
---@readonly
CONTENTS_IGNORE_NODRAW_OPAQUE = 8192
---@readonly
CONTENTS_MOVEABLE = 16384
---@readonly
CONTENTS_AREAPORTAL = 32768
---@readonly
CONTENTS_PLAYERCLIP = 65536
---@readonly
CONTENTS_MONSTERCLIP = 131072
---@readonly
CONTENTS_CURRENT_0 = 262144
---@readonly
CONTENTS_CURRENT_180 = 1048576
---@readonly
CONTENTS_CURRENT_270 = 2097152
---@readonly
CONTENTS_CURRENT_90 = 524288
---@readonly
CONTENTS_CURRENT_DOWN = 8388608
---@readonly
CONTENTS_CURRENT_UP = 4194304
--- Includes, among other things, client-side ragdolls and prop gibs
---@readonly
CONTENTS_DEBRIS = 67108864
---@readonly
CONTENTS_DETAIL = 134217728
--- Hitbox
---@readonly
CONTENTS_HITBOX = 1073741824
--- Ladder
---@readonly
CONTENTS_LADDER = 536870912
--- NPCs
---@readonly
CONTENTS_MONSTER = 33554432
---@readonly
CONTENTS_ORIGIN = 16777216
--- Hits world but not skybox
---@readonly
CONTENTS_TRANSLUCENT = 268435456
--- Last visible contents enumeration
---@readonly
LAST_VISIBLE_CONTENTS = 128
--- Sum of all the visible contents enumerations
---@readonly
ALL_VISIBLE_CONTENTS = 255

---@enum CONTENTS : number
---| CONTENTS_EMPTY # Things that are not solid
---| CONTENTS_SOLID # Things that are solid
---| CONTENTS_WINDOW # Glass
---| CONTENTS_AUX
---| CONTENTS_GRATE # Bullets go through, solids don't
---| CONTENTS_SLIME
---| CONTENTS_WATER # Hits world but not skybox
---| CONTENTS_BLOCKLOS # Things that block line of sight
---| CONTENTS_OPAQUE # Things that block light
---| CONTENTS_TESTFOGVOLUME
---| CONTENTS_TEAM4
---| CONTENTS_TEAM3
---| CONTENTS_TEAM1
---| CONTENTS_TEAM2
---| CONTENTS_IGNORE_NODRAW_OPAQUE
---| CONTENTS_MOVEABLE
---| CONTENTS_AREAPORTAL
---| CONTENTS_PLAYERCLIP
---| CONTENTS_MONSTERCLIP
---| CONTENTS_CURRENT_0
---| CONTENTS_CURRENT_180
---| CONTENTS_CURRENT_270
---| CONTENTS_CURRENT_90
---| CONTENTS_CURRENT_DOWN
---| CONTENTS_CURRENT_UP
---| CONTENTS_DEBRIS #  	Includes, among other things, client-side ragdolls and prop gibs
---| CONTENTS_DETAIL
---| CONTENTS_HITBOX # Hitbox
---| CONTENTS_LADDER # Ladder
---| CONTENTS_MONSTER # NPCs
---| CONTENTS_ORIGIN
---| CONTENTS_TRANSLUCENT # Hits world but not skybox
---| LAST_VISIBLE_CONTENTS # Last visible contents enumeration
---| ALL_VISIBLE_CONTENTS # Sum of all the visible contents enumerations

--- Enumerations used by [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx). Clientside only.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/CREATERENDERTARGETFLAGS
--- Makes this render target an HDR render target if the current system supports HDR.
---@readonly
CREATERENDERTARGETFLAGS_HDR = 1
--- Does nothing.
---@readonly
CREATERENDERTARGETFLAGS_AUTOMIPMAP = 2
--- Does nothing
---@readonly
CREATERENDERTARGETFLAGS_UNFILTERABLE_OK = 4

---@enum CREATERENDERTARGETFLAGS : number
---| CREATERENDERTARGETFLAGS_HDR # Makes this render target an HDR render target if the current system supports HDR.
---| CREATERENDERTARGETFLAGS_AUTOMIPMAP # Does nothing.
---| CREATERENDERTARGETFLAGS_UNFILTERABLE_OK # Does nothing

--- Citizen type, a KeyValue for npc_citizen( citizentype ), serverside only.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/CT
--- Default citizen
---@readonly
CT_DEFAULT = 0
--- Default citizen(?)
---@readonly
CT_DOWNTRODDEN = 1
--- Refugee
---@readonly
CT_REFUGEE = 2
--- Rebel
---@readonly
CT_REBEL = 3
--- Odessa?
---@readonly
CT_UNIQUE = 4

---@enum CT : number
---| CT_DEFAULT # Default citizen
---| CT_DOWNTRODDEN # Default citizen(?)
---| CT_REFUGEE # Refugee
---| CT_REBEL # Rebel
---| CT_UNIQUE # Odessa?

--- Enumerations used by [NPC:Disposition](https://wiki.facepunch.com/gmod/NPC:Disposition) and [ENTITY:GetRelationship](https://wiki.facepunch.com/gmod/ENTITY:GetRelationship).
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/D
--- Error
---@readonly
D_ER = 0
--- Hate
---@readonly
D_HT = 1
--- Frightened / Fear
---@readonly
D_FR = 2
--- Like
---@readonly
D_LI = 3
--- Neutral
---@readonly
D_NU = 4

---@enum D : number
---| D_ER # Error
---| D_HT # Hate
---| D_FR # Frightened / Fear
---| D_LI # Like
---| D_NU # Neutral

--- Enumerations used internally by death notice system.
---
--- This enumeration is a bit field/bitflag, which means that you can combine multiple death flags using the [bit](https://wiki.facepunch.com/gmod/bit) library. You can use [bit.band](https://wiki.facepunch.com/gmod/bit.band) to test if a specific death flag is set.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/DEATH_NOTICE
--- Was the victim friendly?
---@readonly
DEATH_NOTICE_FRIENDLY_VICTIM = 1
--- Was the attacker friendly?
---@readonly
DEATH_NOTICE_FRIENDLY_ATTACKER = 2

---@enum DEATH_NOTICE : number
---| DEATH_NOTICE_FRIENDLY_VICTIM # Was the victim friendly?
---| DEATH_NOTICE_FRIENDLY_ATTACKER # Was the attacker friendly?

--- Displacement surface flags, used by the [Structures/TraceResult](https://wiki.facepunch.com/gmod/Structures/TraceResult).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/DISPSURF
---@readonly
DISPSURF_SURFACE = 1
---@readonly
DISPSURF_WALKABLE = 2
---@readonly
DISPSURF_BUILDABLE = 4
---@readonly
DISPSURF_SURFPROP1 = 8
---@readonly
DISPSURF_SURFPROP2 = 16

---@enum DISPSURF : number
---| DISPSURF_SURFACE
---| DISPSURF_WALKABLE
---| DISPSURF_BUILDABLE
---| DISPSURF_SURFPROP1
---| DISPSURF_SURFPROP2

--- Enumerations used by [CTakeDamageInfo:GetDamageType](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageType), [CTakeDamageInfo:SetDamageType](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageType) and [CTakeDamageInfo:IsDamageType](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsDamageType).
---
--- This enumeration is a bit field/bitflag, which means that you can combine multiple damage types using the [bit](https://wiki.facepunch.com/gmod/bit) library. You can use [bit.band](https://wiki.facepunch.com/gmod/bit.band) to test if a specific damage type is set.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/DMG
--- Generic damage (used by weapon_fists)
---@readonly
DMG_GENERIC = 0
--- Caused by physics interaction and ignored by airboat drivers. This is used by the Rollermine and an unused animation attack called 'Fireattack' by the Antlion Guard [ACT_RANGE_ATTACK1](https://wiki.facepunch.com/gmod/Enums/ACT)
---@readonly
DMG_CRUSH = 1
--- Bullet damage from Ceiling Turrets, the Strider, Turrets and most guns.
---@readonly
DMG_BULLET = 2
--- Used by the Stunstick, Manhacks, Antlions, Antlion Guards, Headcrabs, Fast Headcrabs, all Zombies types, Hunter, and potentially other NPCs attacks
---@readonly
DMG_SLASH = 4
--- Damage from fire
---@readonly
DMG_BURN = 8
--- Hit by a vehicle (This will need to be set for passengers of some vehicle to receive damage)
---@readonly
DMG_VEHICLE = 16
--- Fall damage
---@readonly
DMG_FALL = 32
--- Explosion damage like grenades, helicopter bombs, combine mines, Will be ignored by most vehicle passengers.
---@readonly
DMG_BLAST = 64
--- Blunt attacks such as from the Crowbar, Antlion Guard & Hunter
---@readonly
DMG_CLUB = 128
--- Electrical damage, shows smoke at the damage position and its used by Stalkers & Vortigaunts
---@readonly
DMG_SHOCK = 256
--- Sonic damage, used by the Gargantua and Houndeye NPCs
---@readonly
DMG_SONIC = 512
--- Laser damage
---@readonly
DMG_ENERGYBEAM = 1024
--- Prevent a physics force.
---@readonly
DMG_PREVENT_PHYSICS_FORCE = 2048
--- Crossbow damage, never creates gibs.
---@readonly
DMG_NEVERGIB = 4096
--- Always create gibs
---@readonly
DMG_ALWAYSGIB = 8192
--- Drown damage
---@readonly
DMG_DROWN = 16384
--- Same as DMG_POISON
---@readonly
DMG_PARALYZE = 32768
--- Neurotoxin damage
---@readonly
DMG_NERVEGAS = 65536
--- Poison damage used by Antlion Workers & Poison Headcrabs.
---@readonly
DMG_POISON = 131072
--- Radiation damage & it will be ignored by most vehicle passengers
---@readonly
DMG_RADIATION = 262144
--- Damage applied to the player to restore health after drowning
---@readonly
DMG_DROWNRECOVER = 524288
--- Toxic chemical or acid burn damage used by the Antlion Workers
---@readonly
DMG_ACID = 1048576
--- In an oven
---@readonly
DMG_SLOWBURN = 2097152
--- Don't create a ragdoll on death
---@readonly
DMG_REMOVENORAGDOLL = 4194304
--- Damage done by the gravity gun.
---@readonly
DMG_PHYSGUN = 8388608
--- Plasma damage
---@readonly
DMG_PLASMA = 16777216
--- Airboat gun damage
---@readonly
DMG_AIRBOAT = 33554432
--- Forces the entity to dissolve on death. This is what the combine ball uses when it hits a target.
---@readonly
DMG_DISSOLVE = 67108864
--- This won't hurt the player underwater
---@readonly
DMG_BLAST_SURFACE = 134217728
--- Direct damage to the entity that does not go through any damage value modifications
---@readonly
DMG_DIRECT = 268435456
--- The pellets fired from a shotgun
---@readonly
DMG_BUCKSHOT = 536870912
--- Damage from SniperRound/SniperPenetratedRound ammo types
---@readonly
DMG_SNIPER = 1073741824
--- Damage from npc_missiledefense, npc_combinegunship, or monster_mortar
---@readonly
DMG_MISSILEDEFENSE = 2147483648

---@enum DMG : number
---| DMG_GENERIC # Generic damage (used by weapon_fists)
---| DMG_CRUSH # Caused by physics interaction and ignored by airboat drivers. This is used by the Rollermine and an unused animation attack called 'Fireattack' by the Antlion Guard [ACT_RANGE_ATTACK1](https://wiki.facepunch.com/gmod/Enums/ACT)
---| DMG_BULLET # Bullet damage from Ceiling Turrets, the Strider, Turrets and most guns.
---| DMG_SLASH # Used by the Stunstick, Manhacks, Antlions, Antlion Guards, Headcrabs, Fast Headcrabs, all Zombies types, Hunter, and potentially other NPCs attacks
---| DMG_BURN # Damage from fire
---| DMG_VEHICLE # Hit by a vehicle (This will need to be set for passengers of some vehicle to receive damage)
---| DMG_FALL # Fall damage
---| DMG_BLAST # Explosion damage like grenades, helicopter bombs, combine mines, Will be ignored by most vehicle passengers.
---| DMG_CLUB # Blunt attacks such as from the Crowbar, Antlion Guard & Hunter
---| DMG_SHOCK # Electrical damage, shows smoke at the damage position and its used by Stalkers & Vortigaunts
---| DMG_SONIC # Sonic damage, used by the Gargantua and Houndeye NPCs
---| DMG_ENERGYBEAM # Laser damage
---| DMG_PREVENT_PHYSICS_FORCE # Prevent a physics force.
---| DMG_NEVERGIB # Crossbow damage, never creates gibs.
---| DMG_ALWAYSGIB # Always create gibs
---| DMG_DROWN # Drown damage
---| DMG_PARALYZE # Same as DMG_POISON
---| DMG_NERVEGAS # Neurotoxin damage
---| DMG_POISON # Poison damage used by Antlion Workers & Poison Headcrabs.
---| DMG_RADIATION # Radiation damage & it will be ignored by most vehicle passengers
---| DMG_DROWNRECOVER # Damage applied to the player to restore health after drowning
---| DMG_ACID # Toxic chemical or acid burn damage used by the Antlion Workers
---| DMG_SLOWBURN # In an oven
---| DMG_REMOVENORAGDOLL # Don't create a ragdoll on death
---| DMG_PHYSGUN # Damage done by the gravity gun.
---| DMG_PLASMA # Plasma damage
---| DMG_AIRBOAT # Airboat gun damage
---| DMG_DISSOLVE # Forces the entity to dissolve on death. This is what the combine ball uses when it hits a target.
---| DMG_BLAST_SURFACE # This won't hurt the player underwater
---| DMG_DIRECT # Direct damage to the entity that does not go through any damage value modifications
---| DMG_BUCKSHOT # The pellets fired from a shotgun
---| DMG_SNIPER # Damage from SniperRound/SniperPenetratedRound ammo types
---| DMG_MISSILEDEFENSE # Damage from npc_missiledefense, npc_combinegunship, or monster_mortar

--- Enumerations used by [Panel:Dock](https://wiki.facepunch.com/gmod/Panel:Dock).
--- **NOTE**: These enumerations doesn't have DOCK_ prefix, this is an exception from all other enumerations.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/DOCK
--- Don't dock
---@readonly
NODOCK = 0
--- Fill parent
---@readonly
FILL = 1
--- Dock to the left
---@readonly
LEFT = 2
--- Dock to the right
---@readonly
RIGHT = 3
--- Dock to the top
---@readonly
TOP = 4
--- Dock to the bottom
---@readonly
BOTTOM = 5

---@enum DOCK : number
---| NODOCK # Don't dock
---| FILL # Fill parent
---| LEFT # Dock to the left
---| RIGHT # Dock to the right
---| TOP # Dock to the top
---| BOTTOM # Dock to the bottom

--- Internal globals for SimpleDoF.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/DOF
---@readonly
DOF_OFFSET = 256
---@readonly
DOF_SPACING = 512

---@enum DOF : number
---| DOF_OFFSET
---| DOF_SPACING

--- Enumerations used by [Entity:AddEffects](https://wiki.facepunch.com/gmod/Entity:AddEffects),  [Entity:RemoveEffects](https://wiki.facepunch.com/gmod/Entity:RemoveEffects) and  [Entity:IsEffectActive](https://wiki.facepunch.com/gmod/Entity:IsEffectActive).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/EF
--- Performs bone merge on client side, merging bone positions of child entities ([Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent)) with those of the parent, by bone names. The skeletons should have identical proportions, however it is not a requirement.
---@readonly
EF_BONEMERGE = 1
--- For use with EF_BONEMERGE. If this is set, then it places this ents origin at its parent and uses the parent's bbox + the max extents of the aiment. Otherwise, it sets up the parent's bones every frame to figure out where to place the aiment, which is inefficient because it'll setup the parent's bones even if the parent is not in the PVS.
---@readonly
EF_BONEMERGE_FASTCULL = 128
--- DLIGHT centered at entity origin.
---@readonly
EF_BRIGHTLIGHT = 2
--- Player flashlight.
---@readonly
EF_DIMLIGHT = 4
--- Seems to have no effect. Has been replaced with [C_BaseEntity::IsNoInterpolationFrame()](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/client/c_baseentity.h#L1331-L1332).Don't interpolate the next frame.
---@deprecated Seems to have no effect. Has been replaced with [C_BaseEntity::IsNoInterpolationFrame()](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/client/c_baseentity.h#L1331-L1332).
---@readonly
EF_NOINTERP = 8
--- Disables shadow.
---@readonly
EF_NOSHADOW = 16
--- Prevents the entity from drawing and networking.
---@readonly
EF_NODRAW = 32
--- Don't receive shadows.
---@readonly
EF_NORECEIVESHADOW = 64
--- Makes the entity blink.
---@readonly
EF_ITEM_BLINK = 256
--- Always assume that the parent entity is animating.
---@readonly
EF_PARENT_ANIMATES = 512
--- Internal flag that is set by [Entity:FollowBone](https://wiki.facepunch.com/gmod/Entity:FollowBone).
---@readonly
EF_FOLLOWBONE = 1024
--- GMod-specific. Makes the entity not accept being lit by projected textures, including the player's flashlight.
---@readonly
EF_NOFLASHLIGHT = 8192

---@enum EF : number
---| EF_BONEMERGE # Performs bone merge on client side, merging bone positions of child entities ([Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent)) with those of the parent, by bone names. The skeletons should have identical proportions, however it is not a requirement.
---| EF_BONEMERGE_FASTCULL # For use with EF_BONEMERGE. If this is set, then it places this ents origin at its parent and uses the parent's bbox + the max extents of the aiment. Otherwise, it sets up the parent's bones every frame to figure out where to place the aiment, which is inefficient because it'll setup the parent's bones even if the parent is not in the PVS.
---| EF_BRIGHTLIGHT # DLIGHT centered at entity origin.
---| EF_DIMLIGHT # Player flashlight.
---| EF_NOINTERP # Seems to have no effect. Has been replaced with [C_BaseEntity::IsNoInterpolationFrame()](https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/client/c_baseentity.h#L1331-L1332).Don't interpolate the next frame.
---| EF_NOSHADOW # Disables shadow.
---| EF_NODRAW # Prevents the entity from drawing and networking.
---| EF_NORECEIVESHADOW # Don't receive shadows.
---| EF_ITEM_BLINK # Makes the entity blink.
---| EF_PARENT_ANIMATES # Always assume that the parent entity is animating.
---| EF_FOLLOWBONE # Internal flag that is set by [Entity:FollowBone](https://wiki.facepunch.com/gmod/Entity:FollowBone).
---| EF_NOFLASHLIGHT # GMod-specific. Makes the entity not accept being lit by projected textures, including the player's flashlight.

--- Enumerations used by [Entity:AddEFlags](https://wiki.facepunch.com/gmod/Entity:AddEFlags), [Entity:RemoveEFlags](https://wiki.facepunch.com/gmod/Entity:RemoveEFlags) and [Entity:IsEFlagSet](https://wiki.facepunch.com/gmod/Entity:IsEFlagSet).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/EFL
--- This entity is marked for death -- This allows the game to actually delete ents at a safe time.
--- **WARNING**: You should never set this flag manually.
---@readonly
EFL_KILLME = 1
--- Entity is dormant, no updates to client
---@readonly
EFL_DORMANT = 2
--- Lets us know when the noclip command is active
---@readonly
EFL_NOCLIP_ACTIVE = 4
--- Set while a model is setting up its bones
---@readonly
EFL_SETTING_UP_BONES = 8
--- This is a special entity that should not be deleted when we respawn entities via [game.CleanUpMap](https://wiki.facepunch.com/gmod/game.CleanUpMap).
---@readonly
EFL_KEEP_ON_RECREATE_ENTITIES = 16
--- One of the child entities is a player
---@readonly
EFL_HAS_PLAYER_CHILD = 16
--- (Client only) need shadow manager to update the shadow
---@readonly
EFL_DIRTY_SHADOWUPDATE = 32
--- Another entity is watching events on this entity (used by teleport)
---@readonly
EFL_NOTIFY = 64
--- The default behavior in ShouldTransmit is to not send an entity if it doesn't have a model. Certain entities want to be sent anyway because all the drawing logic is in the client DLL. They can set this flag and the engine will transmit them even if they don't have model
---@readonly
EFL_FORCE_CHECK_TRANSMIT = 128
--- This is set on bots that are frozen
---@readonly
EFL_BOT_FROZEN = 256
--- Non-networked entity
---@readonly
EFL_SERVER_ONLY = 512
--- Don't attach the edict
---@readonly
EFL_NO_AUTO_EDICT_ATTACH = 1024
--- Some 'dirty' bits with respect to absolute computations. Used internally by the engine when an entity's absolute position needs to be recalculated.
---@readonly
EFL_DIRTY_ABSTRANSFORM = 2048
--- Some 'dirty' bits with respect to absolute computations. Used internally by the engine when an entity's absolute velocity needs to be recalculated.
---@readonly
EFL_DIRTY_ABSVELOCITY = 4096
--- Some 'dirty' bits with respect to absolute computations. Used internally by the engine when an entity's absolute angular velocity needs to be recalculated.
---@readonly
EFL_DIRTY_ABSANGVELOCITY = 8192
--- Marks the entity as having a 'dirty' surrounding box. Used internally by the engine to recompute the entity's collision bounds.
---@readonly
EFL_DIRTY_SURROUNDING_COLLISION_BOUNDS = 16384
--- Used internally by the engine when an entity's "spatial partition" needs to be recalculated.
---@readonly
EFL_DIRTY_SPATIAL_PARTITION = 32768
--- This is set if the entity detects that it's in the skybox. This forces it to pass the "in PVS" for transmission
---@readonly
EFL_IN_SKYBOX = 131072
--- Entities with this flag set show up in the partition even when not solid
---@readonly
EFL_USE_PARTITION_WHEN_NOT_SOLID = 262144
--- Used to determine if an entity is floating
---@readonly
EFL_TOUCHING_FLUID = 524288
--- The entity is currently being lifted by a Barnacle.
---@readonly
EFL_IS_BEING_LIFTED_BY_BARNACLE = 1048576
--- The entity is not affected by 'rotorwash push'--the wind-push effect caused by helicopters close to the ground in Half-Life 2.
---@readonly
EFL_NO_ROTORWASH_PUSH = 2097152
--- Avoid executing the entity's Think
---@readonly
EFL_NO_THINK_FUNCTION = 4194304
--- The entity is currently not simulating any physics.
---@readonly
EFL_NO_GAME_PHYSICS_SIMULATION = 8388608
--- The entity is about to have its untouch callback checked, e.g. when this entity stops touching another entity.
---@readonly
EFL_CHECK_UNTOUCH = 16777216
--- Entity shouldn't block NPC line-of-sight
---@readonly
EFL_DONTBLOCKLOS = 33554432
--- NPCs should not walk on this entity
---@readonly
EFL_DONTWALKON = 67108864
--- The entity shouldn't dissolve
---@readonly
EFL_NO_DISSOLVE = 134217728
--- Mega physcannon can't ragdoll these guys
---@readonly
EFL_NO_MEGAPHYSCANNON_RAGDOLL = 268435456
--- Don't adjust this entity's velocity when transitioning into water
---@readonly
EFL_NO_WATER_VELOCITY_CHANGE = 536870912
--- Physcannon can't pick these up or punt them
---@readonly
EFL_NO_PHYSCANNON_INTERACTION = 1073741824
--- Doesn't accept forces from physics damage
---@readonly
EFL_NO_DAMAGE_FORCES = -2147483648

---@enum EFL : number
---| EFL_KILLME # This entity is marked for death -- This allows the game to actually delete ents at a safe time. **WARNING**: You should never set this flag manually.
---| EFL_DORMANT # Entity is dormant, no updates to client
---| EFL_NOCLIP_ACTIVE # Lets us know when the noclip command is active
---| EFL_SETTING_UP_BONES # Set while a model is setting up its bones
---| EFL_KEEP_ON_RECREATE_ENTITIES # This is a special entity that should not be deleted when we respawn entities via [game.CleanUpMap](https://wiki.facepunch.com/gmod/game.CleanUpMap).
---| EFL_HAS_PLAYER_CHILD # One of the child entities is a player
---| EFL_DIRTY_SHADOWUPDATE # (Client only) need shadow manager to update the shadow
---| EFL_NOTIFY # Another entity is watching events on this entity (used by teleport)
---| EFL_FORCE_CHECK_TRANSMIT # The default behavior in ShouldTransmit is to not send an entity if it doesn't have a model. Certain entities want to be sent anyway because all the drawing logic is in the client DLL. They can set this flag and the engine will transmit them even if they don't have model
---| EFL_BOT_FROZEN # This is set on bots that are frozen
---| EFL_SERVER_ONLY # Non-networked entity
---| EFL_NO_AUTO_EDICT_ATTACH # Don't attach the edict
---| EFL_DIRTY_ABSTRANSFORM # Some 'dirty' bits with respect to absolute computations. Used internally by the engine when an entity's absolute position needs to be recalculated.
---| EFL_DIRTY_ABSVELOCITY # Some 'dirty' bits with respect to absolute computations. Used internally by the engine when an entity's absolute velocity needs to be recalculated.
---| EFL_DIRTY_ABSANGVELOCITY # Some 'dirty' bits with respect to absolute computations. Used internally by the engine when an entity's absolute angular velocity needs to be recalculated.
---| EFL_DIRTY_SURROUNDING_COLLISION_BOUNDS # Marks the entity as having a 'dirty' surrounding box. Used internally by the engine to recompute the entity's collision bounds.
---| EFL_DIRTY_SPATIAL_PARTITION # Used internally by the engine when an entity's "spatial partition" needs to be recalculated.
---| EFL_IN_SKYBOX # This is set if the entity detects that it's in the skybox. This forces it to pass the "in PVS" for transmission
---| EFL_USE_PARTITION_WHEN_NOT_SOLID # Entities with this flag set show up in the partition even when not solid
---| EFL_TOUCHING_FLUID # Used to determine if an entity is floating
---| EFL_IS_BEING_LIFTED_BY_BARNACLE # The entity is currently being lifted by a Barnacle.
---| EFL_NO_ROTORWASH_PUSH # The entity is not affected by 'rotorwash push'--the wind-push effect caused by helicopters close to the ground in Half-Life 2.
---| EFL_NO_THINK_FUNCTION # Avoid executing the entity's Think
---| EFL_NO_GAME_PHYSICS_SIMULATION # The entity is currently not simulating any physics.
---| EFL_CHECK_UNTOUCH # The entity is about to have its untouch callback checked, e.g. when this entity stops touching another entity.
---| EFL_DONTBLOCKLOS # Entity shouldn't block NPC line-of-sight
---| EFL_DONTWALKON # NPCs should not walk on this entity
---| EFL_NO_DISSOLVE # The entity shouldn't dissolve
---| EFL_NO_MEGAPHYSCANNON_RAGDOLL # Mega physcannon can't ragdoll these guys
---| EFL_NO_WATER_VELOCITY_CHANGE # Don't adjust this entity's velocity when transitioning into water
---| EFL_NO_PHYSCANNON_INTERACTION # Physcannon can't pick these up or punt them
---| EFL_NO_DAMAGE_FORCES # Doesn't accept forces from physics damage

--- Enumerations used by [Global.AddConsoleCommand](https://wiki.facepunch.com/gmod/Global.AddConsoleCommand), [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add), [Global.CreateClientConVar](https://wiki.facepunch.com/gmod/Global.CreateClientConVar) and [Global.CreateConVar](https://wiki.facepunch.com/gmod/Global.CreateConVar).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/FCVAR
--- Save the [ConVar](https://wiki.facepunch.com/gmod/ConVar) value into either client.vdf or server.vdf
---
--- Reported as "a" by `cvarlist`, except Lua [ConVar](https://wiki.facepunch.com/gmod/ConVar)s
---@readonly
FCVAR_ARCHIVE = 128
--- Save the [ConVar](https://wiki.facepunch.com/gmod/ConVar) value into config.vdf on XBox
---@readonly
FCVAR_ARCHIVE_XBOX = 16777216
--- Requires `sv_cheats` to be enabled to change the [ConVar](https://wiki.facepunch.com/gmod/ConVar) or run the command
---
--- Reported as "cheat" by `cvarlist`
---@readonly
FCVAR_CHEAT = 16384
--- `IVEngineClient::ClientCmd` is allowed to execute this command
---
--- Reported as "clientcmd_can_execute" by `cvarlist`
---@readonly
FCVAR_CLIENTCMD_CAN_EXECUTE = 1073741824
--- [ConVar](https://wiki.facepunch.com/gmod/ConVar) is defined by the client DLL.
---
--- This flag is set automatically
---
--- Reported as "cl" by `cvarlist`
---@readonly
FCVAR_CLIENTDLL = 8
--- Force the [ConVar](https://wiki.facepunch.com/gmod/ConVar) to be recorded by demo recordings.
---
--- Reported as "demo" by `cvarlist`
---@readonly
FCVAR_DEMO = 65536
--- Opposite of [FCVAR_DEMO](https://wiki.facepunch.com/gmod/#FCVAR_DEMO), ensures the [ConVar](https://wiki.facepunch.com/gmod/ConVar) is not recorded in demos
---
--- Reported as "norecord" by `cvarlist`
---@readonly
FCVAR_DONTRECORD = 131072
--- [ConVar](https://wiki.facepunch.com/gmod/ConVar) is defined by the game DLL.
---
--- This flag is set automatically
---
--- Reported as "sv" by `cvarlist`
---@readonly
FCVAR_GAMEDLL = 4
--- Set automatically on all ConVars and console commands created by the client Lua state.
---
--- Reported as "lua_client" by `cvarlist`
---@readonly
FCVAR_LUA_CLIENT = 262144
--- Set automatically on all ConVars and console commands created by the server Lua state.
---
--- Reported as "lua_server" by `cvarlist`
---@readonly
FCVAR_LUA_SERVER = 524288
--- Tells the engine to never print this variable as a string. This is used for variables which may contain control characters.
---
--- Reported as "numeric" by `cvarlist`
---@readonly
FCVAR_NEVER_AS_STRING = 4096
--- No flags
---@readonly
FCVAR_NONE = 0
--- For serverside [ConVar](https://wiki.facepunch.com/gmod/ConVar)s, notifies all players with blue chat text when the value gets changed, also makes the convar appear in [A2S_RULES](https://developer.valvesoftware.com/wiki/Server_queries#A2S_RULES)
---
--- Reported as "nf" by `cvarlist`
---@readonly
FCVAR_NOTIFY = 256
--- Makes the [ConVar](https://wiki.facepunch.com/gmod/ConVar) not changeable while connected to a server or in singleplayer
---@readonly
FCVAR_NOT_CONNECTED = 4194304
--- Forces the [ConVar](https://wiki.facepunch.com/gmod/ConVar) to only have printable characters (No control characters)
---
--- Reported as "print" by `cvarlist`
---@readonly
FCVAR_PRINTABLEONLY = 1024
--- Makes the [ConVar](https://wiki.facepunch.com/gmod/ConVar) value hidden from all clients (For example `sv_password`)
---
--- Reported as "prot" by `cvarlist`
---@readonly
FCVAR_PROTECTED = 32
--- For serverside [ConVar](https://wiki.facepunch.com/gmod/ConVar)s, it will enforce its value on all clients. The [ConVar](https://wiki.facepunch.com/gmod/ConVar) with the same name must also exist on the client!
---
--- Reported as "rep" by `cvarlist`
---@readonly
FCVAR_REPLICATED = 8192
--- Prevents the server from querying value of this [ConVar](https://wiki.facepunch.com/gmod/ConVar)
---@readonly
FCVAR_SERVER_CANNOT_QUERY = 536870912
--- The server is allowed to execute this command on clients.
---
--- Reported as "server_can_execute" by `cvarlist`
---@readonly
FCVAR_SERVER_CAN_EXECUTE = 268435456
--- Executing the command or changing the [ConVar](https://wiki.facepunch.com/gmod/ConVar) is only allowed in singleplayer
---
--- Reported as "sp" by `cvarlist`
---@readonly
FCVAR_SPONLY = 64
--- Don't log the [ConVar](https://wiki.facepunch.com/gmod/ConVar) changes to console/log files/users
---
--- Reported as "log" by `cvarlist`
---@readonly
FCVAR_UNLOGGED = 2048
--- If this is set, the convar will become anonymous and won't show up in the `find` results.
---@readonly
FCVAR_UNREGISTERED = 1
--- For clientside commands, sends the value to the server
---
--- Reported as "user" by `cvarlist`
---@readonly
FCVAR_USERINFO = 512

---@enum FCVAR : number
---| FCVAR_ARCHIVE # Save the [ConVar](https://wiki.facepunch.com/gmod/ConVar) value into either client.vdf or server.vdf  Reported as "a" by `cvarlist`, except Lua [ConVar](https://wiki.facepunch.com/gmod/ConVar)s
---| FCVAR_ARCHIVE_XBOX # Save the [ConVar](https://wiki.facepunch.com/gmod/ConVar) value into config.vdf on XBox
---| FCVAR_CHEAT # Requires `sv_cheats` to be enabled to change the [ConVar](https://wiki.facepunch.com/gmod/ConVar) or run the command  Reported as "cheat" by `cvarlist`
---| FCVAR_CLIENTCMD_CAN_EXECUTE # `IVEngineClient::ClientCmd` is allowed to execute this command  Reported as "clientcmd_can_execute" by `cvarlist`
---| FCVAR_CLIENTDLL # [ConVar](https://wiki.facepunch.com/gmod/ConVar) is defined by the client DLL.  This flag is set automatically  Reported as "cl" by `cvarlist`
---| FCVAR_DEMO # Force the [ConVar](https://wiki.facepunch.com/gmod/ConVar) to be recorded by demo recordings.  Reported as "demo" by `cvarlist`
---| FCVAR_DONTRECORD # Opposite of [FCVAR_DEMO](https://wiki.facepunch.com/gmod/#FCVAR_DEMO), ensures the [ConVar](https://wiki.facepunch.com/gmod/ConVar) is not recorded in demos  Reported as "norecord" by `cvarlist`
---| FCVAR_GAMEDLL # [ConVar](https://wiki.facepunch.com/gmod/ConVar) is defined by the game DLL.  This flag is set automatically  Reported as "sv" by `cvarlist`
---| FCVAR_LUA_CLIENT # Set automatically on all ConVars and console commands created by the client Lua state.  Reported as "lua_client" by `cvarlist`
---| FCVAR_LUA_SERVER # Set automatically on all ConVars and console commands created by the server Lua state.  Reported as "lua_server" by `cvarlist`
---| FCVAR_NEVER_AS_STRING # Tells the engine to never print this variable as a string. This is used for variables which may contain control characters.  Reported as "numeric" by `cvarlist`
---| FCVAR_NONE # No flags
---| FCVAR_NOTIFY # For serverside [ConVar](https://wiki.facepunch.com/gmod/ConVar)s, notifies all players with blue chat text when the value gets changed, also makes the convar appear in [A2S_RULES](https://developer.valvesoftware.com/wiki/Server_queries#A2S_RULES)  Reported as "nf" by `cvarlist`
---| FCVAR_NOT_CONNECTED # Makes the [ConVar](https://wiki.facepunch.com/gmod/ConVar) not changeable while connected to a server or in singleplayer
---| FCVAR_PRINTABLEONLY # Forces the [ConVar](https://wiki.facepunch.com/gmod/ConVar) to only have printable characters (No control characters)  Reported as "print" by `cvarlist`
---| FCVAR_PROTECTED # Makes the [ConVar](https://wiki.facepunch.com/gmod/ConVar) value hidden from all clients (For example `sv_password`)  Reported as "prot" by `cvarlist`
---| FCVAR_REPLICATED # For serverside [ConVar](https://wiki.facepunch.com/gmod/ConVar)s, it will enforce its value on all clients. The [ConVar](https://wiki.facepunch.com/gmod/ConVar) with the same name must also exist on the client!  Reported as "rep" by `cvarlist`
---| FCVAR_SERVER_CANNOT_QUERY # Prevents the server from querying value of this [ConVar](https://wiki.facepunch.com/gmod/ConVar)
---| FCVAR_SERVER_CAN_EXECUTE # The server is allowed to execute this command on clients.  Reported as "server_can_execute" by `cvarlist`
---| FCVAR_SPONLY # Executing the command or changing the [ConVar](https://wiki.facepunch.com/gmod/ConVar) is only allowed in singleplayer  Reported as "sp" by `cvarlist`
---| FCVAR_UNLOGGED # Don't log the [ConVar](https://wiki.facepunch.com/gmod/ConVar) changes to console/log files/users  Reported as "log" by `cvarlist`
---| FCVAR_UNREGISTERED # If this is set, the convar will become anonymous and won't show up in the `find` results.
---| FCVAR_USERINFO # For clientside commands, sends the value to the server  Reported as "user" by `cvarlist`

--- Enumerations used by [IGModAudioChannel:FFT](https://wiki.facepunch.com/gmod/IGModAudioChannel:FFT). Clientside only.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/FFT
--- 128 levels
---@readonly
FFT_256 = 0
--- 256 levels
---@readonly
FFT_512 = 1
--- 512 levels
---@readonly
FFT_1024 = 2
--- 1024 levels
---@readonly
FFT_2048 = 3
--- 2048 levels
---@readonly
FFT_4096 = 4
--- 4096 levels
---@readonly
FFT_8192 = 5
--- 8192 levels
---@readonly
FFT_16384 = 6
--- 16384 levels
---@readonly
FFT_32768 = 7

---@enum FFT : number
---| FFT_256 # 128 levels
---| FFT_512 # 256 levels
---| FFT_1024 # 512 levels
---| FFT_2048 # 1024 levels
---| FFT_4096 # 2048 levels
---| FFT_8192 # 4096 levels
---| FFT_16384 # 8192 levels
---| FFT_32768 # 16384 levels

--- Enumerations used by [Entity:AddFlags](https://wiki.facepunch.com/gmod/Entity:AddFlags), [Entity:RemoveFlags](https://wiki.facepunch.com/gmod/Entity:RemoveFlags) and [Entity:IsFlagSet](https://wiki.facepunch.com/gmod/Entity:IsFlagSet).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/FL
--- Is the entity on ground or not
---@readonly
FL_ONGROUND = 1
--- Is player ducking or not
---@readonly
FL_DUCKING = 2
--- Is the player in the process of ducking or standing up
---@readonly
FL_ANIMDUCKING = 4
--- The player is jumping out of water
---@readonly
FL_WATERJUMP = 8
--- This player is controlling a func_train
---@readonly
FL_ONTRAIN = 16
--- Indicates the entity is standing in rain
---@readonly
FL_INRAIN = 32
--- Completely freezes the player
--- Bots will still be able to look around.
---@readonly
FL_FROZEN = 64
--- This player is controlling something UI related in the world, this prevents his movement, but doesn't freeze mouse movement, jumping, etc.
---@readonly
FL_ATCONTROLS = 128
--- Is this entity a player or not
---@readonly
FL_CLIENT = 256
--- Bots have this flag
---@readonly
FL_FAKECLIENT = 512
--- Is the player in water or not
---@readonly
FL_INWATER = 1024
--- This entity can fly
---@readonly
FL_FLY = 2048
--- This entity can swim
---@readonly
FL_SWIM = 4096
--- This entity is a func_conveyor
---@readonly
FL_CONVEYOR = 8192
--- NPCs have this flag (NPC: Ignore player push)
---@readonly
FL_NPC = 16384
--- Whether the player has god mode enabled
---@readonly
FL_GODMODE = 32768
--- Makes the entity invisible to AI
---@readonly
FL_NOTARGET = 65536
--- This entity can be aimed at
---@readonly
FL_AIMTARGET = 131072
--- Not all corners are valid
---@readonly
FL_PARTIALGROUND = 262144
--- It's a static prop
---@readonly
FL_STATICPROP = 524288
--- worldgraph has this ent listed as something that blocks a connection
---@readonly
FL_GRAPHED = 1048576
--- This entity is a grenade, unused
---@readonly
FL_GRENADE = 2097152
--- Changes the SV_Movestep() behavior to not do any processing
---@readonly
FL_STEPMOVEMENT = 4194304
--- Doesn't generate touch functions, calls [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch) when this flag gets set during a touch callback
---@readonly
FL_DONTTOUCH = 8388608
--- Base velocity has been applied this frame (used to convert base velocity into momentum)
---@readonly
FL_BASEVELOCITY = 16777216
--- This entity is a brush and part of the world
---@readonly
FL_WORLDBRUSH = 33554432
--- This entity can be seen by NPCs
---@readonly
FL_OBJECT = 67108864
--- This entity is about to get removed
---@readonly
FL_KILLME = 134217728
--- This entity is on fire
---@readonly
FL_ONFIRE = 268435456
--- The entity is currently dissolving
---@readonly
FL_DISSOLVING = 536870912
--- This entity is about to become a ragdoll
---@readonly
FL_TRANSRAGDOLL = 1073741824
--- This moving door can't be blocked by the player
---@readonly
FL_UNBLOCKABLE_BY_PLAYER = -2147483648

---@enum FL : number
---| FL_ONGROUND # Is the entity on ground or not
---| FL_DUCKING # Is player ducking or not
---| FL_ANIMDUCKING # Is the player in the process of ducking or standing up
---| FL_WATERJUMP # The player is jumping out of water
---| FL_ONTRAIN # This player is controlling a func_train
---| FL_INRAIN # Indicates the entity is standing in rain
---| FL_FROZEN # Completely freezes the player Bots will still be able to look around.
---| FL_ATCONTROLS # This player is controlling something UI related in the world, this prevents his movement, but doesn't freeze mouse movement, jumping, etc.
---| FL_CLIENT # Is this entity a player or not
---| FL_FAKECLIENT # Bots have this flag
---| FL_INWATER # Is the player in water or not
---| FL_FLY # This entity can fly
---| FL_SWIM # This entity can swim
---| FL_CONVEYOR # This entity is a func_conveyor
---| FL_NPC # NPCs have this flag (NPC: Ignore player push)
---| FL_GODMODE # Whether the player has god mode enabled
---| FL_NOTARGET # Makes the entity invisible to AI
---| FL_AIMTARGET # This entity can be aimed at
---| FL_PARTIALGROUND # Not all corners are valid
---| FL_STATICPROP # It's a static prop
---| FL_GRAPHED # worldgraph has this ent listed as something that blocks a connection
---| FL_GRENADE # This entity is a grenade, unused
---| FL_STEPMOVEMENT # Changes the SV_Movestep() behavior to not do any processing
---| FL_DONTTOUCH # Doesn't generate touch functions, calls [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch) when this flag gets set during a touch callback
---| FL_BASEVELOCITY # Base velocity has been applied this frame (used to convert base velocity into momentum)
---| FL_WORLDBRUSH # This entity is a brush and part of the world
---| FL_OBJECT # This entity can be seen by NPCs
---| FL_KILLME # This entity is about to get removed
---| FL_ONFIRE # This entity is on fire
---| FL_DISSOLVING # The entity is currently dissolving
---| FL_TRANSRAGDOLL # This entity is about to become a ragdoll
---| FL_UNBLOCKABLE_BY_PLAYER # This moving door can't be blocked by the player

--- Enumerations used by [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/FORCE
--- Forces the function to take [string](https://wiki.facepunch.com/gmod/string)s only
---@readonly
FORCE_STRING = 1
--- Forces the function to take [number](https://wiki.facepunch.com/gmod/number)s only
---@readonly
FORCE_NUMBER = 2
--- Forces the function to take [boolean](https://wiki.facepunch.com/gmod/boolean)s only
---@readonly
FORCE_BOOL = 3
--- Forces the function to take [Angle](https://wiki.facepunch.com/gmod/Angle)s only
---@readonly
FORCE_ANGLE = 4
--- Forces the function to take [Color](https://wiki.facepunch.com/gmod/Color)s only
---@readonly
FORCE_COLOR = 5
--- Forces the function to take [Vector](https://wiki.facepunch.com/gmod/Vector)s only
---@readonly
FORCE_VECTOR = 6

---@enum FORCE : number
---| FORCE_STRING # Forces the function to take [string](https://wiki.facepunch.com/gmod/string)s only
---| FORCE_NUMBER # Forces the function to take [number](https://wiki.facepunch.com/gmod/number)s only
---| FORCE_BOOL # Forces the function to take [boolean](https://wiki.facepunch.com/gmod/boolean)s only
---| FORCE_ANGLE # Forces the function to take [Angle](https://wiki.facepunch.com/gmod/Angle)s only
---| FORCE_COLOR # Forces the function to take [Color](https://wiki.facepunch.com/gmod/Color)s only
---| FORCE_VECTOR # Forces the function to take [Vector](https://wiki.facepunch.com/gmod/Vector)s only

--- Used by [file.AsyncRead](https://wiki.facepunch.com/gmod/file.AsyncRead).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/FSASYNC
---@readonly
FSASYNC_ERR_NOT_MINE = -8
---@readonly
FSASYNC_ERR_RETRY_LATER = -7
---@readonly
FSASYNC_ERR_ALIGNMENT = -6
---@readonly
FSASYNC_ERR_FAILURE = -5
---@readonly
FSASYNC_ERR_READING = -4
---@readonly
FSASYNC_ERR_NOMEMORY = -3
---@readonly
FSASYNC_ERR_UNKNOWNID = -2
---@readonly
FSASYNC_ERR_FILEOPEN = -1
---@readonly
FSASYNC_OK = 0
---@readonly
FSASYNC_STATUS_PENDING = 1
---@readonly
FSASYNC_STATUS_INPROGRESS = 2
---@readonly
FSASYNC_STATUS_ABORTED = 3
---@readonly
FSASYNC_STATUS_UNSERVICED = 4

---@enum FSASYNC : number
---| FSASYNC_ERR_NOT_MINE
---| FSASYNC_ERR_RETRY_LATER
---| FSASYNC_ERR_ALIGNMENT
---| FSASYNC_ERR_FAILURE
---| FSASYNC_ERR_READING
---| FSASYNC_ERR_NOMEMORY
---| FSASYNC_ERR_UNKNOWNID
---| FSASYNC_ERR_FILEOPEN
---| FSASYNC_OK
---| FSASYNC_STATUS_PENDING
---| FSASYNC_STATUS_INPROGRESS
---| FSASYNC_STATUS_ABORTED
---| FSASYNC_STATUS_UNSERVICED

--- Enumerations used by [Entity:SetSolidFlags](https://wiki.facepunch.com/gmod/Entity:SetSolidFlags) and [Entity:GetSolidFlags](https://wiki.facepunch.com/gmod/Entity:GetSolidFlags).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/FSOLID
--- Ignore solid type + always call into the entity for ray tests
---@readonly
FSOLID_CUSTOMRAYTEST = 1
--- Ignore solid type + always call into the entity for swept box tests
---@readonly
FSOLID_CUSTOMBOXTEST = 2
--- The object is currently not solid
---@readonly
FSOLID_NOT_SOLID = 4
--- This is something may be collideable but fires touch functions even when it's not collideable (when the FSOLID_NOT_SOLID flag is set)
---@readonly
FSOLID_TRIGGER = 8
--- The player can't stand on this
---@readonly
FSOLID_NOT_STANDABLE = 16
--- Contains volumetric contents (like water)
---@readonly
FSOLID_VOLUME_CONTENTS = 32
--- Forces the collision representation to be world-aligned even if it's SOLID_BSP or SOLID_VPHYSICS
---@readonly
FSOLID_FORCE_WORLD_ALIGNED = 64
--- Uses a special trigger bounds separate from the normal OBB
---@readonly
FSOLID_USE_TRIGGER_BOUNDS = 128
--- Collisions are defined in root parent's local coordinate space
---@readonly
FSOLID_ROOT_PARENT_ALIGNED = 256
--- This trigger will touch debris objects
---@readonly
FSOLID_TRIGGER_TOUCH_DEBRIS = 512
--- The amount of bits needed to store the all the flags in a variable/sent over network.
---@readonly
FSOLID_MAX_BITS = 10

---@enum FSOLID : number
---| FSOLID_CUSTOMRAYTEST # Ignore solid type + always call into the entity for ray tests
---| FSOLID_CUSTOMBOXTEST # Ignore solid type + always call into the entity for swept box tests
---| FSOLID_NOT_SOLID # The object is currently not solid
---| FSOLID_TRIGGER # This is something may be collideable but fires touch functions even when it's not collideable (when the FSOLID_NOT_SOLID flag is set)
---| FSOLID_NOT_STANDABLE # The player can't stand on this
---| FSOLID_VOLUME_CONTENTS # Contains volumetric contents (like water)
---| FSOLID_FORCE_WORLD_ALIGNED # Forces the collision representation to be world-aligned even if it's SOLID_BSP or SOLID_VPHYSICS
---| FSOLID_USE_TRIGGER_BOUNDS # Uses a special trigger bounds separate from the normal OBB
---| FSOLID_ROOT_PARENT_ALIGNED # Collisions are defined in root parent's local coordinate space
---| FSOLID_TRIGGER_TOUCH_DEBRIS # This trigger will touch debris objects
---| FSOLID_MAX_BITS # The amount of bits needed to store the all the flags in a variable/sent over network.

--- Enumerations used by [PhysObj:AddGameFlag](https://wiki.facepunch.com/gmod/PhysObj:AddGameFlag), [PhysObj:HasGameFlag](https://wiki.facepunch.com/gmod/PhysObj:HasGameFlag) and [PhysObj:ClearGameFlag](https://wiki.facepunch.com/gmod/PhysObj:ClearGameFlag).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/FVPHYSICS
--- Won't receive physics forces from collisions and won't collide with other [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) with the same flag set.
---@readonly
FVPHYSICS_CONSTRAINT_STATIC = 2
--- Colliding with entities will cause 1000 damage with DMG_DISSOLVE as the damage type, but only if EFL_NO_DISSOLVE is not set.
---@readonly
FVPHYSICS_DMG_DISSOLVE = 512
--- Does slice damage, not just blunt damage.
---@readonly
FVPHYSICS_DMG_SLICE = 1
--- Will deal high physics damage even with a small mass.
---@readonly
FVPHYSICS_HEAVY_OBJECT = 32
--- This [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) is part of an entity with multiple [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) , such as a ragdoll or a vehicle , and will be considered during collision damage events.
---@readonly
FVPHYSICS_MULTIOBJECT_ENTITY = 16
--- Colliding with entities won't cause physics damage.
---@readonly
FVPHYSICS_NO_IMPACT_DMG = 1024
--- Like FVPHYSICS_NO_IMPACT_DMG, but only checks for NPCs. Usually set on Combine Balls fired by Combine Soldiers.
---@readonly
FVPHYSICS_NO_NPC_IMPACT_DMG = 2048
--- Doesn't allow the player to pick this [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) with the Gravity Gun or +use pickup.
---@readonly
FVPHYSICS_NO_PLAYER_PICKUP = 128
--- We won't collide with other [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) associated to the same entity, only used for vehicles and ragdolls held by the Super Gravity Gun.
---@readonly
FVPHYSICS_NO_SELF_COLLISIONS = 32768
--- This [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) is part of a ragdoll.
---@readonly
FVPHYSICS_PART_OF_RAGDOLL = 8
--- Set by the physics engine when two [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) are penetrating each other. This is only automatically updated for non-static physics objects.
---@readonly
FVPHYSICS_PENETRATING = 64
--- Set when the player is holding this [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) with the Physics Gun, Gravity Gun or +use pickup.
---@readonly
FVPHYSICS_PLAYER_HELD = 4
--- This object was thrown by the Gravity Gun , stuns Antlion guards, Hunters, and squashes Antlion grubs.
---@readonly
FVPHYSICS_WAS_THROWN = 256

---@enum FVPHYSICS : number
---| FVPHYSICS_CONSTRAINT_STATIC # Won't receive physics forces from collisions and won't collide with other [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) with the same flag set.
---| FVPHYSICS_DMG_DISSOLVE # Colliding with entities will cause 1000 damage with DMG_DISSOLVE as the damage type, but only if EFL_NO_DISSOLVE is not set.
---| FVPHYSICS_DMG_SLICE # Does slice damage, not just blunt damage.
---| FVPHYSICS_HEAVY_OBJECT # Will deal high physics damage even with a small mass.
---| FVPHYSICS_MULTIOBJECT_ENTITY # This [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) is part of an entity with multiple [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) , such as a ragdoll or a vehicle , and will be considered during collision damage events.
---| FVPHYSICS_NO_IMPACT_DMG # Colliding with entities won't cause physics damage.
---| FVPHYSICS_NO_NPC_IMPACT_DMG # Like FVPHYSICS_NO_IMPACT_DMG, but only checks for NPCs. Usually set on Combine Balls fired by Combine Soldiers.
---| FVPHYSICS_NO_PLAYER_PICKUP # Doesn't allow the player to pick this [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) with the Gravity Gun or +use pickup.
---| FVPHYSICS_NO_SELF_COLLISIONS # We won't collide with other [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) associated to the same entity, only used for vehicles and ragdolls held by the Super Gravity Gun.
---| FVPHYSICS_PART_OF_RAGDOLL # This [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) is part of a ragdoll.
---| FVPHYSICS_PENETRATING # Set by the physics engine when two [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) are penetrating each other. This is only automatically updated for non-static physics objects.
---| FVPHYSICS_PLAYER_HELD # Set when the player is holding this [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) with the Physics Gun, Gravity Gun or +use pickup.
---| FVPHYSICS_WAS_THROWN # This object was thrown by the Gravity Gun , stuns Antlion guards, Hunters, and squashes Antlion grubs.

--- Enumerations used by [Player:AddVCDSequenceToGestureSlot](https://wiki.facepunch.com/gmod/Player:AddVCDSequenceToGestureSlot), [Player:AnimResetGestureSlot](https://wiki.facepunch.com/gmod/Player:AnimResetGestureSlot) and [Player:AnimRestartGesture](https://wiki.facepunch.com/gmod/Player:AnimRestartGesture).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/GESTURE_SLOT
--- Slot for weapon gestures
---@readonly
GESTURE_SLOT_ATTACK_AND_RELOAD = 0
---@readonly
GESTURE_SLOT_GRENADE = 1
--- Slot for jump gestures
---@readonly
GESTURE_SLOT_JUMP = 2
--- Slot for swimming gestures
---@readonly
GESTURE_SLOT_SWIM = 3
--- Slot for flinching gestures
---@readonly
GESTURE_SLOT_FLINCH = 4
---@readonly
GESTURE_SLOT_VCD = 5
--- Slot for custom gestures
---@readonly
GESTURE_SLOT_CUSTOM = 6

---@enum GESTURE_SLOT : number
---| GESTURE_SLOT_ATTACK_AND_RELOAD # Slot for weapon gestures
---| GESTURE_SLOT_GRENADE
---| GESTURE_SLOT_JUMP # Slot for jump gestures
---| GESTURE_SLOT_SWIM # Slot for swimming gestures
---| GESTURE_SLOT_FLINCH # Slot for flinching gestures
---| GESTURE_SLOT_VCD
---| GESTURE_SLOT_CUSTOM # Slot for custom gestures

--- Enumerations used by [game.SetGlobalState](https://wiki.facepunch.com/gmod/game.SetGlobalState) and [game.GetGlobalState](https://wiki.facepunch.com/gmod/game.GetGlobalState).
---
--- Serverside only.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/GLOBAL
--- Initial state, the global state is off.
---@readonly
GLOBAL_OFF = 0
--- The global state is enabled.
---@readonly
GLOBAL_ON = 1
--- The global state is dead and is no longer active. It will be cleared.
---@readonly
GLOBAL_DEAD = 2

---@enum GLOBAL : number
---| GLOBAL_OFF # Initial state, the global state is off.
---| GLOBAL_ON # The global state is enabled.
---| GLOBAL_DEAD # The global state is dead and is no longer active. It will be cleared.

--- Enumerations used by [IGModAudioChannel:GetState](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetState). Clientside only.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/GMOD_CHANNEL
--- The channel is stopped
---@readonly
GMOD_CHANNEL_STOPPED = 0
--- The channel is playing
---@readonly
GMOD_CHANNEL_PLAYING = 1
--- The channel is paused
---@readonly
GMOD_CHANNEL_PAUSED = 2
--- The channel is buffering
---@readonly
GMOD_CHANNEL_STALLED = 3

---@enum GMOD_CHANNEL : number
---| GMOD_CHANNEL_STOPPED # The channel is stopped
---| GMOD_CHANNEL_PLAYING # The channel is playing
---| GMOD_CHANNEL_PAUSED # The channel is paused
---| GMOD_CHANNEL_STALLED # The channel is buffering

--- Used by [NPC:GetCurGoalType](https://wiki.facepunch.com/gmod/NPC:GetCurGoalType).
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/GOALTYPE
--- * `GOALTYPE_NONE` = `0`
--- * `GOALTYPE_TARGETENT` = `1`
--- * `GOALTYPE_ENEMY` = `2`
--- * `GOALTYPE_PATHCORNER` = `3`
--- * `GOALTYPE_LOCATION` = `4`
--- * `GOALTYPE_LOCATION_NEAREST_NODE` = `5`
--- * `GOALTYPE_FLANK` = `6`
--- * `GOALTYPE_COVER` = `7`
--- * `GOALTYPE_INVALID` = `8`
---@alias GOALTYPE 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | number

--- Enumerations used by [GM:ScalePlayerDamage](https://wiki.facepunch.com/gmod/GM:ScalePlayerDamage) and [GM:ScaleNPCDamage](https://wiki.facepunch.com/gmod/GM:ScaleNPCDamage) and returned by [Player:LastHitGroup](https://wiki.facepunch.com/gmod/Player:LastHitGroup).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/HITGROUP
--- 1:1 damage. Melee weapons and fall damage typically hit this hitgroup.
--- This hitgroup is not present on default player models.
---
--- It is unknown how this is generated in [GM:ScalePlayerDamage](https://wiki.facepunch.com/gmod/GM:ScalePlayerDamage), but it occurs when shot by NPCs ( npc_combine_s ) for example.
---@readonly
HITGROUP_GENERIC = 0
--- Head
---@readonly
HITGROUP_HEAD = 1
--- Chest
---@readonly
HITGROUP_CHEST = 2
--- Stomach
---@readonly
HITGROUP_STOMACH = 3
--- Left arm
---@readonly
HITGROUP_LEFTARM = 4
--- Right arm
---@readonly
HITGROUP_RIGHTARM = 5
--- Left leg
---@readonly
HITGROUP_LEFTLEG = 6
--- Right leg
---@readonly
HITGROUP_RIGHTLEG = 7
--- Gear. Supposed to be belt area.
---
--- This hitgroup is not present on default player models.
---
--- Alerts NPC, but doesn't do damage or bleed (1/100th damage)
---@readonly
HITGROUP_GEAR = 10

---@enum HITGROUP : number
---| HITGROUP_GENERIC # 1:1 damage. Melee weapons and fall damage typically hit this hitgroup. This hitgroup is not present on default player models.  It is unknown how this is generated in [GM:ScalePlayerDamage](https://wiki.facepunch.com/gmod/GM:ScalePlayerDamage), but it occurs when shot by NPCs ( npc_combine_s ) for example.
---| HITGROUP_HEAD # Head
---| HITGROUP_CHEST # Chest
---| HITGROUP_STOMACH # Stomach
---| HITGROUP_LEFTARM # Left arm
---| HITGROUP_RIGHTARM # Right arm
---| HITGROUP_LEFTLEG # Left leg
---| HITGROUP_RIGHTLEG # Right leg
---| HITGROUP_GEAR # Gear. Supposed to be belt area.  This hitgroup is not present on default player models.  Alerts NPC, but doesn't do damage or bleed (1/100th damage)

--- Enumerations used by [Player:PrintMessage](https://wiki.facepunch.com/gmod/Player:PrintMessage) and [Global.PrintMessage](https://wiki.facepunch.com/gmod/Global.PrintMessage).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/HUD
--- No longer works; now same as HUD_PRINTCONSOLE
---@readonly
HUD_PRINTNOTIFY = 1
--- Console
---@readonly
HUD_PRINTCONSOLE = 2
--- Chat, also prints to console
---@readonly
HUD_PRINTTALK = 3
--- Center of the screen, nothing on client
---@readonly
HUD_PRINTCENTER = 4

---@enum HUD : number
---| HUD_PRINTNOTIFY # No longer works; now same as HUD_PRINTCONSOLE
---| HUD_PRINTCONSOLE # Console
---| HUD_PRINTTALK # Chat, also prints to console
---| HUD_PRINTCENTER # Center of the screen, nothing on client

--- Enumerations used by [NPC:SetHullType](https://wiki.facepunch.com/gmod/NPC:SetHullType) and  [NPC:GetHullType](https://wiki.facepunch.com/gmod/NPC:GetHullType). Serverside only.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/HULL
--- Hull of a Citizen
---@readonly
HULL_HUMAN = 0
---@readonly
HULL_SMALL_CENTERED = 1
---@readonly
HULL_WIDE_HUMAN = 2
---@readonly
HULL_TINY = 3
---@readonly
HULL_WIDE_SHORT = 4
---@readonly
HULL_MEDIUM = 5
---@readonly
HULL_TINY_CENTERED = 6
---@readonly
HULL_LARGE = 7
---@readonly
HULL_LARGE_CENTERED = 8
---@readonly
HULL_MEDIUM_TALL = 9

---@enum HULL : number
---| HULL_HUMAN # Hull of a Citizen
---| HULL_SMALL_CENTERED
---| HULL_WIDE_HUMAN
---| HULL_TINY
---| HULL_WIDE_SHORT
---| HULL_MEDIUM
---| HULL_TINY_CENTERED
---| HULL_LARGE
---| HULL_LARGE_CENTERED
---| HULL_MEDIUM_TALL

--- Enumerations used by [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx) to determine the byte format of each pixel in the [Render Target](https://wiki.facepunch.com/gmod/render_rendertargets).
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/IMAGE_FORMAT
---
---@readonly
IMAGE_FORMAT_DEFAULT = -1
--- Red, Green, Blue, Alpha, 8 bit per pixel.
---@readonly
IMAGE_FORMAT_RGBA8888 = 0
--- Probably legacy format. Alpha, Red, Green, Blue, 8 bit per pixel.
---@readonly
IMAGE_FORMAT_ABGR8888 = 1
--- Legacy format. Red, Green, Blue, 8 bit per pixel. `D3DFMT_R8G8B8` is invalid for most modern video cards. Thats why `IMAGE_FORMAT_RGB888` and `IMAGE_FORMAT_BGR888` is legacy formats. It have fallback to `IMAGE_FORMAT_BGRX8888`. `X` means «any».
---@readonly
IMAGE_FORMAT_RGB888 = 2
--- Legacy format. Blue, Green, Red order, 8 bit per pixel.
---@readonly
IMAGE_FORMAT_BGR888 = 3
--- Red, Green, Blue, 5 bit per pixel for Red and Blue channels, 6 bits for Green. Effectively uses less video memory.
---@readonly
IMAGE_FORMAT_RGB565 = 4
--- `IMAGE_FORMAT_RGBA8888` with different byte order. Legacy format.
---@readonly
IMAGE_FORMAT_ARGB8888 = 11
--- `IMAGE_FORMAT_RGBA8888` with different byte order. Legacy format.
---@readonly
IMAGE_FORMAT_BGRA8888 = 12
--- RGBA, but 16 bits per pixel. Was meant to be used for "Integer mode" for HDR.
---@readonly
IMAGE_FORMAT_RGBA16161616 = 25
--- RGBA, but floating point 16 bits per pixel. Is used for "Float mode" HDR.
---@readonly
IMAGE_FORMAT_RGBA16161616F = 24

---@enum IMAGE_FORMAT : number
---| IMAGE_FORMAT_DEFAULT
---| IMAGE_FORMAT_RGBA8888 #  			Red, Green, Blue, Alpha, 8 bit per pixel.
---| IMAGE_FORMAT_ABGR8888 #  			Probably legacy format. Alpha, Red, Green, Blue, 8 bit per pixel.
---| IMAGE_FORMAT_RGB888 #  			Legacy format. Red, Green, Blue, 8 bit per pixel. `D3DFMT_R8G8B8` is invalid for most modern video cards. Thats why `IMAGE_FORMAT_RGB888` and `IMAGE_FORMAT_BGR888` is legacy formats. It have fallback to `IMAGE_FORMAT_BGRX8888`. `X` means «any».
---| IMAGE_FORMAT_BGR888 #  			Legacy format. Blue, Green, Red order, 8 bit per pixel.
---| IMAGE_FORMAT_RGB565 #  			Red, Green, Blue, 5 bit per pixel for Red and Blue channels, 6 bits for Green. Effectively uses less video memory.
---| IMAGE_FORMAT_ARGB8888 #  			`IMAGE_FORMAT_RGBA8888` with different byte order. Legacy format.
---| IMAGE_FORMAT_BGRA8888 #  			`IMAGE_FORMAT_RGBA8888` with different byte order. Legacy format.
---| IMAGE_FORMAT_RGBA16161616 #  			RGBA, but 16 bits per pixel. Was meant to be used for "Integer mode" for HDR.
---| IMAGE_FORMAT_RGBA16161616F #  			RGBA, but floating point 16 bits per pixel. Is used for "Float mode" HDR.

--- Unlike [Enums/BUTTON_CODE](https://wiki.facepunch.com/gmod/Enums/BUTTON_CODE), these enums are abstracted to allow the user to bind actions to any key they might prefer.
---
--- Keybinds using these actions work with two console commands, one starting with a plus and one with a minus symbol. A key press or release will call either the plus or minus command, adding or removing the corresponding enum in the current [CUserCmd](https://wiki.facepunch.com/gmod/CUserCmd).
---
--- Enumerations used by:
--- * [Player:KeyDown](https://wiki.facepunch.com/gmod/Player:KeyDown)
--- * [Player:KeyDownLast](https://wiki.facepunch.com/gmod/Player:KeyDownLast)
--- * [Player:KeyPressed](https://wiki.facepunch.com/gmod/Player:KeyPressed)
--- * [Player:KeyReleased](https://wiki.facepunch.com/gmod/Player:KeyReleased)
--- * [CMoveData:AddKey](https://wiki.facepunch.com/gmod/CMoveData:AddKey)
--- * [CMoveData:GetButtons](https://wiki.facepunch.com/gmod/CMoveData:GetButtons)
--- * [CMoveData:GetOldButtons](https://wiki.facepunch.com/gmod/CMoveData:GetOldButtons)
--- * [CMoveData:KeyDown](https://wiki.facepunch.com/gmod/CMoveData:KeyDown)
--- * [CMoveData:KeyPressed](https://wiki.facepunch.com/gmod/CMoveData:KeyPressed)
--- * [CMoveData:KeyReleased](https://wiki.facepunch.com/gmod/CMoveData:KeyReleased)
--- * [CMoveData:KeyWasDown](https://wiki.facepunch.com/gmod/CMoveData:KeyWasDown)
--- * [CMoveData:SetButtons](https://wiki.facepunch.com/gmod/CMoveData:SetButtons)
--- * [CMoveData:SetOldButtons](https://wiki.facepunch.com/gmod/CMoveData:SetOldButtons)
--- * [CUserCmd:GetButtons](https://wiki.facepunch.com/gmod/CUserCmd:GetButtons)
--- * [CUserCmd:KeyDown](https://wiki.facepunch.com/gmod/CUserCmd:KeyDown)
--- * [CUserCmd:RemoveKey](https://wiki.facepunch.com/gmod/CUserCmd:RemoveKey)
--- * [CUserCmd:SetButtons](https://wiki.facepunch.com/gmod/CUserCmd:SetButtons)
--- * [GM:KeyPress](https://wiki.facepunch.com/gmod/GM:KeyPress)
--- * [GM:KeyRelease](https://wiki.facepunch.com/gmod/GM:KeyRelease)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/IN
--- +attack bound key ( Default: Left Mouse Button )
---@readonly
IN_ATTACK = 1
--- +jump bound key ( Default: Space )
---@readonly
IN_JUMP = 2
--- +duck bound key ( Default: CTRL )
---@readonly
IN_DUCK = 4
--- +forward bound key ( Default: W )
---@readonly
IN_FORWARD = 8
--- +back bound key ( Default: S )
---@readonly
IN_BACK = 16
--- +use bound key ( Default: E )
---@readonly
IN_USE = 32
---@readonly
IN_CANCEL = 64
--- +left bound key ( Look left )
---@readonly
IN_LEFT = 128
--- +right bound key ( Look right )
---@readonly
IN_RIGHT = 256
--- +moveleft bound key ( Default: A )
---@readonly
IN_MOVELEFT = 512
--- +moveright bound key ( Default: D )
---@readonly
IN_MOVERIGHT = 1024
--- +attack2 bound key ( Default: Right Mouse Button )
---@readonly
IN_ATTACK2 = 2048
---@readonly
IN_RUN = 4096
--- +reload bound key ( Default: R )
---@readonly
IN_RELOAD = 8192
--- +alt1 bound key
---@readonly
IN_ALT1 = 16384
--- +alt2 bound key
---@readonly
IN_ALT2 = 32768
--- +showscores bound key ( Default: Tab )
---@readonly
IN_SCORE = 65536
--- +speed bound key ( Default: Shift )
---@readonly
IN_SPEED = 131072
--- +walk bound key ( Slow walk )
---@readonly
IN_WALK = 262144
--- +zoom bound key ( Suit Zoom )
---@readonly
IN_ZOOM = 524288
--- For use in weapons. Set in the physgun when scrolling an object away from you.
---@readonly
IN_WEAPON1 = 1048576
--- For use in weapons. Set in the physgun when scrolling an object towards you.
---@readonly
IN_WEAPON2 = 2097152
---@readonly
IN_BULLRUSH = 4194304
--- +grenade1 bound key
---@readonly
IN_GRENADE1 = 8388608
--- +grenade2 bound key
---@readonly
IN_GRENADE2 = 16777216

---@enum IN : number
---| IN_ATTACK # +attack bound key ( Default: Left Mouse Button )
---| IN_JUMP # +jump bound key ( Default: Space )
---| IN_DUCK # +duck bound key ( Default: CTRL )
---| IN_FORWARD # +forward bound key ( Default: W )
---| IN_BACK # +back bound key ( Default: S )
---| IN_USE # +use bound key ( Default: E )
---| IN_CANCEL
---| IN_LEFT # +left bound key ( Look left )
---| IN_RIGHT # +right bound key ( Look right )
---| IN_MOVELEFT # +moveleft bound key ( Default: A )
---| IN_MOVERIGHT # +moveright bound key ( Default: D )
---| IN_ATTACK2 # +attack2 bound key ( Default: Right Mouse Button )
---| IN_RUN
---| IN_RELOAD # +reload bound key ( Default: R )
---| IN_ALT1 # +alt1 bound key
---| IN_ALT2 # +alt2 bound key
---| IN_SCORE # +showscores bound key ( Default: Tab )
---| IN_SPEED # +speed bound key ( Default: Shift )
---| IN_WALK # +walk bound key ( Slow walk )
---| IN_ZOOM # +zoom bound key ( Suit Zoom )
---| IN_WEAPON1 # For use in weapons. Set in the physgun when scrolling an object away from you.
---| IN_WEAPON2 # For use in weapons. Set in the physgun when scrolling an object towards you.
---| IN_BULLRUSH
---| IN_GRENADE1 # +grenade1 bound key
---| IN_GRENADE2 # +grenade2 bound key

--- Enumerations used by [input.IsButtonDown](https://wiki.facepunch.com/gmod/input.IsButtonDown).
---
--- It's also part of the [Enums/BUTTON_CODE](https://wiki.facepunch.com/gmod/Enums/BUTTON_CODE).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/JOYSTICK
---@readonly
JOYSTICK_FIRST = 114
--- Joystick buttons are in this range, but don't have individual enum names.
---@readonly
JOYSTICK_FIRST_BUTTON = 114
---@readonly
JOYSTICK_LAST_BUTTON = 145
--- Joystick POV buttons are in this range, but don't have individual enum names.
---@readonly
JOYSTICK_FIRST_POV_BUTTON = 146
---@readonly
JOYSTICK_LAST_POV_BUTTON = 149
--- Joystick axis buttons are in this range, but don't have individual enum names.
---@readonly
JOYSTICK_FIRST_AXIS_BUTTON = 150
---@readonly
JOYSTICK_LAST_AXIS_BUTTON = 161
---@readonly
JOYSTICK_LAST = 161

---@enum JOYSTICK : number
---| JOYSTICK_FIRST
---| JOYSTICK_FIRST_BUTTON # Joystick buttons are in this range, but don't have individual enum names.
---| JOYSTICK_LAST_BUTTON
---| JOYSTICK_FIRST_POV_BUTTON # Joystick POV buttons are in this range, but don't have individual enum names.
---| JOYSTICK_LAST_POV_BUTTON
---| JOYSTICK_FIRST_AXIS_BUTTON # Joystick axis buttons are in this range, but don't have individual enum names.
---| JOYSTICK_LAST_AXIS_BUTTON
---| JOYSTICK_LAST

--- Enumerations used by:
--- * [input.IsKeyDown](https://wiki.facepunch.com/gmod/input.IsKeyDown)
--- * [input.WasKeyPressed](https://wiki.facepunch.com/gmod/input.WasKeyPressed)
--- * [input.WasKeyReleased](https://wiki.facepunch.com/gmod/input.WasKeyReleased)
--- * [input.WasKeyTyped](https://wiki.facepunch.com/gmod/input.WasKeyTyped)
--- * [input.IsKeyTrapping](https://wiki.facepunch.com/gmod/input.IsKeyTrapping)
--- * [input.GetKeyName](https://wiki.facepunch.com/gmod/input.GetKeyName)
--- * [input.LookupBinding](https://wiki.facepunch.com/gmod/input.LookupBinding)
--- * [PANEL:OnKeyCodePressed](https://wiki.facepunch.com/gmod/PANEL:OnKeyCodePressed)
--- * [PANEL:OnKeyCodeReleased](https://wiki.facepunch.com/gmod/PANEL:OnKeyCodeReleased)
---
--- It's also part of the [Enums/BUTTON_CODE](https://wiki.facepunch.com/gmod/Enums/BUTTON_CODE).
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/KEY
---@readonly
KEY_FIRST = 0
---@readonly
KEY_NONE = 0
--- Normal number 0 key
---@readonly
KEY_0 = 1
--- Normal number 1 key
---@readonly
KEY_1 = 2
--- Normal number 2 key
---@readonly
KEY_2 = 3
--- Normal number 3 key
---@readonly
KEY_3 = 4
--- Normal number 4 key
---@readonly
KEY_4 = 5
--- Normal number 5 key
---@readonly
KEY_5 = 6
--- Normal number 6 key
---@readonly
KEY_6 = 7
--- Normal number 7 key
---@readonly
KEY_7 = 8
--- Normal number 8 key
---@readonly
KEY_8 = 9
--- Normal number 9 key
---@readonly
KEY_9 = 10
---@readonly
KEY_A = 11
---@readonly
KEY_B = 12
---@readonly
KEY_C = 13
---@readonly
KEY_D = 14
---@readonly
KEY_E = 15
---@readonly
KEY_F = 16
---@readonly
KEY_G = 17
---@readonly
KEY_H = 18
---@readonly
KEY_I = 19
---@readonly
KEY_J = 20
---@readonly
KEY_K = 21
---@readonly
KEY_L = 22
---@readonly
KEY_M = 23
---@readonly
KEY_N = 24
---@readonly
KEY_O = 25
---@readonly
KEY_P = 26
---@readonly
KEY_Q = 27
---@readonly
KEY_R = 28
---@readonly
KEY_S = 29
---@readonly
KEY_T = 30
---@readonly
KEY_U = 31
---@readonly
KEY_V = 32
---@readonly
KEY_W = 33
---@readonly
KEY_X = 34
---@readonly
KEY_Y = 35
---@readonly
KEY_Z = 36
--- Keypad number 0 key
---@readonly
KEY_PAD_0 = 37
--- Keypad number 1 key
---@readonly
KEY_PAD_1 = 38
--- Keypad number 2 key
---@readonly
KEY_PAD_2 = 39
--- Keypad number 3 key
---@readonly
KEY_PAD_3 = 40
--- Keypad number 4 key
---@readonly
KEY_PAD_4 = 41
--- Keypad number 5 key
---@readonly
KEY_PAD_5 = 42
--- Keypad number 6 key
---@readonly
KEY_PAD_6 = 43
--- Keypad number 7 key
---@readonly
KEY_PAD_7 = 44
--- Keypad number 8 key
---@readonly
KEY_PAD_8 = 45
--- Keypad number 9 key
---@readonly
KEY_PAD_9 = 46
--- Keypad division/slash key (/)
---@readonly
KEY_PAD_DIVIDE = 47
--- Keypad asterisk key (*)
---@readonly
KEY_PAD_MULTIPLY = 48
--- Keypad minus key
---@readonly
KEY_PAD_MINUS = 49
--- Keypad plus key
---@readonly
KEY_PAD_PLUS = 50
--- Keypad enter key
---@readonly
KEY_PAD_ENTER = 51
--- Keypad dot key (.)
---@readonly
KEY_PAD_DECIMAL = 52
---@readonly
KEY_LBRACKET = 53
---@readonly
KEY_RBRACKET = 54
---@readonly
KEY_SEMICOLON = 55
---@readonly
KEY_APOSTROPHE = 56
---@readonly
KEY_BACKQUOTE = 57
---@readonly
KEY_COMMA = 58
---@readonly
KEY_PERIOD = 59
---@readonly
KEY_SLASH = 60
---@readonly
KEY_BACKSLASH = 61
---@readonly
KEY_MINUS = 62
---@readonly
KEY_EQUAL = 63
---@readonly
KEY_ENTER = 64
---@readonly
KEY_SPACE = 65
---@readonly
KEY_BACKSPACE = 66
---@readonly
KEY_TAB = 67
---@readonly
KEY_CAPSLOCK = 68
---@readonly
KEY_NUMLOCK = 69
---@readonly
KEY_ESCAPE = 70
---@readonly
KEY_SCROLLLOCK = 71
---@readonly
KEY_INSERT = 72
---@readonly
KEY_DELETE = 73
---@readonly
KEY_HOME = 74
---@readonly
KEY_END = 75
---@readonly
KEY_PAGEUP = 76
---@readonly
KEY_PAGEDOWN = 77
---@readonly
KEY_BREAK = 78
--- The left Shift key, has been seen to be triggered by Right Shift in [PANEL:OnKeyCodePressed](https://wiki.facepunch.com/gmod/PANEL:OnKeyCodePressed)
---@readonly
KEY_LSHIFT = 79
---@readonly
KEY_RSHIFT = 80
---@readonly
KEY_LALT = 81
---@readonly
KEY_RALT = 82
---@readonly
KEY_LCONTROL = 83
---@readonly
KEY_RCONTROL = 84
--- The left Windows key or the Command key on Mac OSX
---@readonly
KEY_LWIN = 85
--- The right Windows key or the Command key on Mac OSX
---@readonly
KEY_RWIN = 86
---@readonly
KEY_APP = 87
---@readonly
KEY_UP = 88
---@readonly
KEY_LEFT = 89
---@readonly
KEY_DOWN = 90
---@readonly
KEY_RIGHT = 91
---@readonly
KEY_F1 = 92
---@readonly
KEY_F2 = 93
---@readonly
KEY_F3 = 94
---@readonly
KEY_F4 = 95
---@readonly
KEY_F5 = 96
---@readonly
KEY_F6 = 97
---@readonly
KEY_F7 = 98
--- **WARNING**: By default, it serves as bind "load quick", which loads the save by forcing the player to exit the server.
---@readonly
KEY_F8 = 99
---@readonly
KEY_F9 = 100
---@readonly
KEY_F10 = 101
---@readonly
KEY_F11 = 102
---@readonly
KEY_F12 = 103
---@readonly
KEY_CAPSLOCKTOGGLE = 104
---@readonly
KEY_NUMLOCKTOGGLE = 105
---@readonly
KEY_LAST = 106
---@readonly
KEY_SCROLLLOCKTOGGLE = 106
---@readonly
KEY_COUNT = 107
---@readonly
KEY_XBUTTON_A = 114
---@readonly
KEY_XBUTTON_B = 115
---@readonly
KEY_XBUTTON_X = 116
---@readonly
KEY_XBUTTON_Y = 117
---@readonly
KEY_XBUTTON_LEFT_SHOULDER = 118
---@readonly
KEY_XBUTTON_RIGHT_SHOULDER = 119
---@readonly
KEY_XBUTTON_BACK = 120
---@readonly
KEY_XBUTTON_START = 121
---@readonly
KEY_XBUTTON_STICK1 = 122
---@readonly
KEY_XBUTTON_STICK2 = 123
---@readonly
KEY_XBUTTON_UP = 146
---@readonly
KEY_XBUTTON_RIGHT = 147
---@readonly
KEY_XBUTTON_DOWN = 148
---@readonly
KEY_XBUTTON_LEFT = 149
---@readonly
KEY_XSTICK1_RIGHT = 150
---@readonly
KEY_XSTICK1_LEFT = 151
---@readonly
KEY_XSTICK1_DOWN = 152
---@readonly
KEY_XSTICK1_UP = 153
---@readonly
KEY_XBUTTON_LTRIGGER = 154
---@readonly
KEY_XBUTTON_RTRIGGER = 155
---@readonly
KEY_XSTICK2_RIGHT = 156
---@readonly
KEY_XSTICK2_LEFT = 157
---@readonly
KEY_XSTICK2_DOWN = 158
---@readonly
KEY_XSTICK2_UP = 159

---@enum KEY : number
---| KEY_FIRST
---| KEY_NONE
---| KEY_0 # Normal number 0 key
---| KEY_1 # Normal number 1 key
---| KEY_2 # Normal number 2 key
---| KEY_3 # Normal number 3 key
---| KEY_4 # Normal number 4 key
---| KEY_5 # Normal number 5 key
---| KEY_6 # Normal number 6 key
---| KEY_7 # Normal number 7 key
---| KEY_8 # Normal number 8 key
---| KEY_9 # Normal number 9 key
---| KEY_A
---| KEY_B
---| KEY_C
---| KEY_D
---| KEY_E
---| KEY_F
---| KEY_G
---| KEY_H
---| KEY_I
---| KEY_J
---| KEY_K
---| KEY_L
---| KEY_M
---| KEY_N
---| KEY_O
---| KEY_P
---| KEY_Q
---| KEY_R
---| KEY_S
---| KEY_T
---| KEY_U
---| KEY_V
---| KEY_W
---| KEY_X
---| KEY_Y
---| KEY_Z
---| KEY_PAD_0 # Keypad number 0 key
---| KEY_PAD_1 # Keypad number 1 key
---| KEY_PAD_2 # Keypad number 2 key
---| KEY_PAD_3 # Keypad number 3 key
---| KEY_PAD_4 # Keypad number 4 key
---| KEY_PAD_5 # Keypad number 5 key
---| KEY_PAD_6 # Keypad number 6 key
---| KEY_PAD_7 # Keypad number 7 key
---| KEY_PAD_8 # Keypad number 8 key
---| KEY_PAD_9 # Keypad number 9 key
---| KEY_PAD_DIVIDE # Keypad division/slash key (/)
---| KEY_PAD_MULTIPLY # Keypad asterisk key (*)
---| KEY_PAD_MINUS # Keypad minus key
---| KEY_PAD_PLUS # Keypad plus key
---| KEY_PAD_ENTER # Keypad enter key
---| KEY_PAD_DECIMAL # Keypad dot key (.)
---| KEY_LBRACKET
---| KEY_RBRACKET
---| KEY_SEMICOLON
---| KEY_APOSTROPHE
---| KEY_BACKQUOTE
---| KEY_COMMA
---| KEY_PERIOD
---| KEY_SLASH
---| KEY_BACKSLASH
---| KEY_MINUS
---| KEY_EQUAL
---| KEY_ENTER
---| KEY_SPACE
---| KEY_BACKSPACE
---| KEY_TAB
---| KEY_CAPSLOCK
---| KEY_NUMLOCK
---| KEY_ESCAPE
---| KEY_SCROLLLOCK
---| KEY_INSERT
---| KEY_DELETE
---| KEY_HOME
---| KEY_END
---| KEY_PAGEUP
---| KEY_PAGEDOWN
---| KEY_BREAK
---| KEY_LSHIFT # The left Shift key, has been seen to be triggered by Right Shift in [PANEL:OnKeyCodePressed](https://wiki.facepunch.com/gmod/PANEL:OnKeyCodePressed)
---| KEY_RSHIFT
---| KEY_LALT
---| KEY_RALT
---| KEY_LCONTROL
---| KEY_RCONTROL
---| KEY_LWIN # The left Windows key or the Command key on Mac OSX
---| KEY_RWIN # The right Windows key or the Command key on Mac OSX
---| KEY_APP
---| KEY_UP
---| KEY_LEFT
---| KEY_DOWN
---| KEY_RIGHT
---| KEY_F1
---| KEY_F2
---| KEY_F3
---| KEY_F4
---| KEY_F5
---| KEY_F6
---| KEY_F7
---| KEY_F8 # **WARNING**: By default, it serves as bind "load quick", which loads the save by forcing the player to exit the server.
---| KEY_F9
---| KEY_F10
---| KEY_F11
---| KEY_F12
---| KEY_CAPSLOCKTOGGLE
---| KEY_NUMLOCKTOGGLE
---| KEY_LAST
---| KEY_SCROLLLOCKTOGGLE
---| KEY_COUNT
---| KEY_XBUTTON_A
---| KEY_XBUTTON_B
---| KEY_XBUTTON_X
---| KEY_XBUTTON_Y
---| KEY_XBUTTON_LEFT_SHOULDER
---| KEY_XBUTTON_RIGHT_SHOULDER
---| KEY_XBUTTON_BACK
---| KEY_XBUTTON_START
---| KEY_XBUTTON_STICK1
---| KEY_XBUTTON_STICK2
---| KEY_XBUTTON_UP
---| KEY_XBUTTON_RIGHT
---| KEY_XBUTTON_DOWN
---| KEY_XBUTTON_LEFT
---| KEY_XSTICK1_RIGHT
---| KEY_XSTICK1_LEFT
---| KEY_XSTICK1_DOWN
---| KEY_XSTICK1_UP
---| KEY_XBUTTON_LTRIGGER
---| KEY_XBUTTON_RTRIGGER
---| KEY_XSTICK2_RIGHT
---| KEY_XSTICK2_LEFT
---| KEY_XSTICK2_DOWN
---| KEY_XSTICK2_UP

--- Used by [Entity:SetRenderFX](https://wiki.facepunch.com/gmod/Entity:SetRenderFX) and returned by [Entity:GetRenderFX](https://wiki.facepunch.com/gmod/Entity:GetRenderFX).
---
--- Most of these require alpha value of entitys color to be less than 255 to have any visible effect.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/kRenderFx
--- None. No change.
---@readonly
kRenderFxNone = 0
--- Slowly pulses the entitys transparency, +-15 to the current alpha.
---@readonly
kRenderFxPulseSlow = 1
--- Quickly pulses the entitys transparency, +-15 to the current alpha.
---@readonly
kRenderFxPulseFast = 2
--- Slowly pulses the entitys transparency, +-60 to the current alpha.
---@readonly
kRenderFxPulseSlowWide = 3
--- Quickly pulses the entitys transparency, +-60 to the current alpha.
---@readonly
kRenderFxPulseFastWide = 4
--- Slowly fades away the entity, making it completely invisible over 3 seconds.
---
--- Starts from whatever alpha the entity currently has set.
---@readonly
kRenderFxFadeSlow = 5
--- Quickly fades away the entity, making it completely invisible.
---
--- Starts from whatever alpha the entity currently has set.
---@readonly
kRenderFxFadeFast = 6
--- Slowly solidifies the entity, making it fully opaque.
---
--- Starts from whatever alpha the entity currently has set.
---@readonly
kRenderFxSolidSlow = 7
--- Quickly solidifies the entity, making it fully opaque.
---
--- Starts from whatever alpha the entity currently has set.
---@readonly
kRenderFxSolidFast = 8
--- Slowly switches the entitys transparency between its alpha and 0.
---@readonly
kRenderFxStrobeSlow = 9
--- Quickly switches the entitys transparency between its alpha and 0.
---@readonly
kRenderFxStrobeFast = 10
--- Very quickly switches the entitys transparency between its alpha and 0.
---@readonly
kRenderFxStrobeFaster = 11
--- Same as Strobe Slow, but the interval is more randomized.
---@readonly
kRenderFxFlickerSlow = 12
--- Same as Strobe Fast, but the interval is more randomized.
---@readonly
kRenderFxFlickerFast = 13
---@readonly
kRenderFxNoDissipation = 14
--- Flickers ( randomizes ) the entitys transparency
---@readonly
kRenderFxDistort = 15
--- Same as Distort, but fades the entity away the farther you are from it.
---@readonly
kRenderFxHologram = 16
---@readonly
kRenderFxExplode = 17
---@readonly
kRenderFxGlowShell = 18
---@readonly
kRenderFxClampMinScale = 19
---@readonly
kRenderFxEnvRain = 20
---@readonly
kRenderFxEnvSnow = 21
---@readonly
kRenderFxSpotlight = 22
--- Is ragdoll, can be set to force an entity to create a clientside ragdoll.
---@readonly
kRenderFxRagdoll = 23
--- Quickly pulses the entitys transparency, from 0 to 255.
---@readonly
kRenderFxPulseFastWider = 24

---@enum kRenderFx : number
---| kRenderFxNone # None. No change.
---| kRenderFxPulseSlow # Slowly pulses the entitys transparency, +-15 to the current alpha.
---| kRenderFxPulseFast # Quickly pulses the entitys transparency, +-15 to the current alpha.
---| kRenderFxPulseSlowWide # Slowly pulses the entitys transparency, +-60 to the current alpha.
---| kRenderFxPulseFastWide # Quickly pulses the entitys transparency, +-60 to the current alpha.
---| kRenderFxFadeSlow # Slowly fades away the entity, making it completely invisible over 3 seconds.  Starts from whatever alpha the entity currently has set.
---| kRenderFxFadeFast # Quickly fades away the entity, making it completely invisible.  Starts from whatever alpha the entity currently has set.
---| kRenderFxSolidSlow # Slowly solidifies the entity, making it fully opaque.  Starts from whatever alpha the entity currently has set.
---| kRenderFxSolidFast # Quickly solidifies the entity, making it fully opaque.  Starts from whatever alpha the entity currently has set.
---| kRenderFxStrobeSlow # Slowly switches the entitys transparency between its alpha and 0.
---| kRenderFxStrobeFast # Quickly switches the entitys transparency between its alpha and 0.
---| kRenderFxStrobeFaster # Very quickly switches the entitys transparency between its alpha and 0.
---| kRenderFxFlickerSlow # Same as Strobe Slow, but the interval is more randomized.
---| kRenderFxFlickerFast # Same as Strobe Fast, but the interval is more randomized.
---| kRenderFxNoDissipation
---| kRenderFxDistort # Flickers ( randomizes ) the entitys transparency
---| kRenderFxHologram # Same as Distort, but fades the entity away the farther you are from it.
---| kRenderFxExplode
---| kRenderFxGlowShell
---| kRenderFxClampMinScale
---| kRenderFxEnvRain
---| kRenderFxEnvSnow
---| kRenderFxSpotlight
---| kRenderFxRagdoll # Is ragdoll, can be set to force an entity to create a clientside ragdoll.
---| kRenderFxPulseFastWider # Quickly pulses the entitys transparency, from 0 to 255.

--- Enumerations used as trace masks in [Structures/Trace](https://wiki.facepunch.com/gmod/Structures/Trace) and [Structures/HullTrace](https://wiki.facepunch.com/gmod/Structures/HullTrace). These enumerations are simply combinations of [Enums/CONTENTS](https://wiki.facepunch.com/gmod/Enums/CONTENTS).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/MASK
--- Anything that is not empty space
---@readonly
MASK_ALL = 4294967295
--- Anything that blocks line of sight for AI
---@readonly
MASK_BLOCKLOS = 16449
--- Anything that blocks line of sight for AI or NPCs
---@readonly
MASK_BLOCKLOS_AND_NPCS = 33570881
--- Water that is moving (may not work)
---@readonly
MASK_CURRENT = 16515072
--- Anything that blocks corpse movement
---@readonly
MASK_DEADSOLID = 65547
--- Anything that blocks NPC movement
---@readonly
MASK_NPCSOLID = 33701899
--- Anything that blocks NPC movement, except other NPCs
---@readonly
MASK_NPCSOLID_BRUSHONLY = 147467
--- The world entity
---@readonly
MASK_NPCWORLDSTATIC = 131083
--- Anything that blocks lighting
---@readonly
MASK_OPAQUE = 16513
--- Anything that blocks lighting, including NPCs
---@readonly
MASK_OPAQUE_AND_NPCS = 33570945
--- Anything that blocks player movement
---@readonly
MASK_PLAYERSOLID = 33636363
--- World + Brushes + Player Clips
---@readonly
MASK_PLAYERSOLID_BRUSHONLY = 81931
--- Anything that stops a bullet (including hitboxes)
---@readonly
MASK_SHOT = 1174421507
--- Anything that stops a bullet (excluding hitboxes)
---@readonly
MASK_SHOT_HULL = 100679691
--- Solids except for grates
---@readonly
MASK_SHOT_PORTAL = 33570819
--- Anything that is (normally) solid
---@readonly
MASK_SOLID = 33570827
--- World + Brushes
---@readonly
MASK_SOLID_BRUSHONLY = 16395
--- Things that split area portals
---@readonly
MASK_SPLITAREAPORTAL = 48
--- Anything that blocks line of sight for players
---@readonly
MASK_VISIBLE = 24705
--- Anything that blocks line of sight for players, including NPCs
---@readonly
MASK_VISIBLE_AND_NPCS = 33579137
--- Anything that has water-like physics
---@readonly
MASK_WATER = 16432

---@enum MASK : number
---| MASK_ALL # Anything that is not empty space
---| MASK_BLOCKLOS # Anything that blocks line of sight for AI
---| MASK_BLOCKLOS_AND_NPCS # Anything that blocks line of sight for AI or NPCs
---| MASK_CURRENT # Water that is moving (may not work)
---| MASK_DEADSOLID # Anything that blocks corpse movement
---| MASK_NPCSOLID # Anything that blocks NPC movement
---| MASK_NPCSOLID_BRUSHONLY # Anything that blocks NPC movement, except other NPCs
---| MASK_NPCWORLDSTATIC # The world entity
---| MASK_OPAQUE # Anything that blocks lighting
---| MASK_OPAQUE_AND_NPCS # Anything that blocks lighting, including NPCs
---| MASK_PLAYERSOLID # Anything that blocks player movement
---| MASK_PLAYERSOLID_BRUSHONLY # World + Brushes + Player Clips
---| MASK_SHOT # Anything that stops a bullet (including hitboxes)
---| MASK_SHOT_HULL # Anything that stops a bullet (excluding hitboxes)
---| MASK_SHOT_PORTAL # Solids except for grates
---| MASK_SOLID # Anything that is (normally) solid
---| MASK_SOLID_BRUSHONLY # World + Brushes
---| MASK_SPLITAREAPORTAL # Things that split area portals
---| MASK_VISIBLE # Anything that blocks line of sight for players
---| MASK_VISIBLE_AND_NPCS # Anything that blocks line of sight for players, including NPCs
---| MASK_WATER # Anything that has water-like physics

--- Enumerations used in [Structures/TraceResult](https://wiki.facepunch.com/gmod/Structures/TraceResult) and [Structures/SurfacePropertyData](https://wiki.facepunch.com/gmod/Structures/SurfacePropertyData), and by [Entity:GetMaterialType](https://wiki.facepunch.com/gmod/Entity:GetMaterialType).
---
--- **NOTE**: These aren't [VMT materials](https://wiki.facepunch.com/gmod/IMaterial)!
---
--- [Material types](https://developer.valvesoftware.com/wiki/Material_Types) are a [holdover from GoldSrc](https://developer.valvesoftware.com/wiki/Material_surface_properties) and Quake before it. They were previously used to classify textures and entities into categories, defining their physical properties. In practice, this really only changed impact sounds and effects, and player footstep sounds. For example, `func_breakable` (in GoldSrc) used it to select which gibs to spawn when broken. Raw texture files were given these properties by assigning them to a material. These were tracked in the single file `materials.txt`, which contained mappings of material types to texture names. Materials are indexed using a letter—for example `MAT_METAL` was indexed in `materials.txt` with the letter "M". The value of `MAT_METAL` is 77, because the ASCII value for M is 77. Some entities could also be assigned materials directly in their [keyvalues](https://wiki.facepunch.com/gmod/Entity:GetSaveTable) using the same system.
---
--- In Source, materials were moved out of the single `materials.txt` file; now every texture has its own associated [material](https://wiki.facepunch.com/gmod/Materials_and_Textures) file, called [VMT](https://developer.valvesoftware.com/wiki/VMT) (**V**alve **M**aterial **T**ype). VMTs contain all the information legacy materials used to provide and more, including including shader, transparency, physical properties, animations...
---
--- Rather than place the properties directly inside the VMT (which would prevent them from being assigned directly to entities like legacy materials could), [surface properties](https://wiki.facepunch.com/gmod/Structures/SurfacePropertyData) were added, which can be selected in the VMT using the `$surfaceprop` key. Surface properties are what determine impact sounds, buoyancy, friction, and other such properties. These do not use letters as identifiers and instead use [string names](https://wiki.facepunch.com/gmod/util.GetSurfaceIndex). You can view the surface properties Garry's Mod loads by looking in the [`GarrysMod/sourceengine/scripts/surfaceproperties.txt`](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) file.
---
--- However, legacy materials still exist in Source. They are called game materials or [material types](https://wiki.facepunch.com/gmod/Entity:GetMaterialType) to separate them from the new material system where confusion between the two is a concern. For example, surface property definitions contain a `gamematerial` parameter; this field assigns a legacy game material to a surface property, which is then assigned to VMTs and entities.
---
--- The main thing legacy game materials are used for nowadays are picking impact effects and decals, like in GoldSrc. Otherwise, surface properties and VMTs replace most other functionality.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/MAT
--- Antlions
---@readonly
MAT_ANTLION = 65
--- Similar to MAT_FLESH, only used by "bloodyflesh" surface property, has different impact sound
---@readonly
MAT_BLOODYFLESH = 66
--- Concrete
---@readonly
MAT_CONCRETE = 67
--- Dirt
---@readonly
MAT_DIRT = 68
--- The egg sacs in the antlion tunnels in HL2: EP2
---@readonly
MAT_EGGSHELL = 69
--- Flesh
---@readonly
MAT_FLESH = 70
--- Grates, chainlink fences
---@readonly
MAT_GRATE = 71
--- Alien flesh - headcrabs and vortigaunts
---@readonly
MAT_ALIENFLESH = 72
--- Unused
---@readonly
MAT_CLIP = 73
--- Snow
---@readonly
MAT_SNOW = 74
--- Plastic
---@readonly
MAT_PLASTIC = 76
--- Metal
---@readonly
MAT_METAL = 77
--- Sand
---@readonly
MAT_SAND = 78
--- Plants, only used by the "foliage" surface property
---@readonly
MAT_FOLIAGE = 79
--- Electronics, only used by "computer" surface property
---@readonly
MAT_COMPUTER = 80
--- Water, slime
---@readonly
MAT_SLOSH = 83
--- Floor tiles
---@readonly
MAT_TILE = 84
--- Grass
---@readonly
MAT_GRASS = 85
--- Metallic vents
---@readonly
MAT_VENT = 86
--- Wood
---@readonly
MAT_WOOD = 87
--- Skybox or nodraw texture
---@readonly
MAT_DEFAULT = 88
--- Glass
---@readonly
MAT_GLASS = 89
--- "wierd-looking jello effect for advisor shield."
---@readonly
MAT_WARPSHIELD = 90

---@enum MAT : number
---| MAT_ANTLION # Antlions
---| MAT_BLOODYFLESH # Similar to MAT_FLESH, only used by "bloodyflesh" surface property, has different impact sound
---| MAT_CONCRETE # Concrete
---| MAT_DIRT # Dirt
---| MAT_EGGSHELL # The egg sacs in the antlion tunnels in HL2: EP2
---| MAT_FLESH # Flesh
---| MAT_GRATE # Grates, chainlink fences
---| MAT_ALIENFLESH # Alien flesh - headcrabs and vortigaunts
---| MAT_CLIP # Unused
---| MAT_SNOW # Snow
---| MAT_PLASTIC # Plastic
---| MAT_METAL # Metal
---| MAT_SAND # Sand
---| MAT_FOLIAGE # Plants, only used by the "foliage" surface property
---| MAT_COMPUTER # Electronics, only used by "computer" surface property
---| MAT_SLOSH # Water, slime
---| MAT_TILE # Floor tiles
---| MAT_GRASS # Grass
---| MAT_VENT # Metallic vents
---| MAT_WOOD # Wood
---| MAT_DEFAULT # Skybox or nodraw texture
---| MAT_GLASS # Glass
---| MAT_WARPSHIELD # "wierd-looking jello effect for advisor shield."

--- Enumerations used by [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) to control what type of vertex information it should expect. Clientside only.
---
--- For more information, see the [Mesh Primitives](https://wiki.facepunch.com/gmod/mesh_primitives) reference page.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/MATERIAL
--- **WARNING**: The primitive type `MATERIAL_POINTS` does not currently work and will not produce any visual effect if used.
---
--- For more information, see [Point Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#points)
---@readonly
MATERIAL_POINTS = 0
--- Creates line using 2 vertices.
---
--- The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of line multiply by 2 that the Mesh will contain.
--- E.g. `(vertexCount * 2)`
---
--- For more information, see [Line Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#lines)
---@readonly
MATERIAL_LINES = 1
--- Creates triangles from groupings of 3 vertices.
---
--- The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of triangles that the Mesh will contain.
--- E.g. `(vertexCount / 3)`
---
--- For more information, see [Triangle Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#triangles)
---@readonly
MATERIAL_TRIANGLES = 2
--- Creates a set of triangles that each share two vertices with the previous triangle in the sequence.
---
--- The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of triangles that the Mesh will contain.
--- E.g. `(vertexCount - 2)`
---
--- For more information, see [Triangle Strip Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#trianglestrips)
---@readonly
MATERIAL_TRIANGLE_STRIP = 3
--- Creates a set of lines that all share a single vertex and each share a vertex with the previous lines.
---
--- The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of line connection that the Mesh will contain.
--- E.g. `(vertexCount)`
---
--- For more information, see [Line Strip Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#linestrips)
---@readonly
MATERIAL_LINE_STRIP = 4
--- Exactly like MATERIAL_LINE_STRIP do, but the first and the last vertex will always be connected together.
---
--- For more information, see [Line Loop Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#lineloops)
---@readonly
MATERIAL_LINE_LOOP = 5
--- Creates a set of triangles that all share a single vertex and each share a vertex with the previous triangle.
---
--- The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of vertices that the Mesh will contain.
--- E.g. `(vertexCount)`
---
--- For more information, see [Polygon Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#polygons)
---@readonly
MATERIAL_POLYGON = 6
--- Creates pairs of triangles that share two vertices.
---
--- The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of quads that the Mesh will contain.
--- E.g. `(vertexCount / 4)`
---
--- For more information, see [Quad Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#quads)
---@readonly
MATERIAL_QUADS = 7

---@enum MATERIAL : number
---| MATERIAL_POINTS #  			**WARNING**: The primitive type `MATERIAL_POINTS` does not currently work and will not produce any visual effect if used.   			For more information, see [Point Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#points)
---| MATERIAL_LINES #  			Creates line using 2 vertices.    			The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of line multiply by 2 that the Mesh will contain.   E.g. `(vertexCount * 2)`  			For more information, see [Line Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#lines)
---| MATERIAL_TRIANGLES #  			Creates triangles from groupings of 3 vertices.    			The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of triangles that the Mesh will contain.   E.g. `(vertexCount / 3)`  			For more information, see [Triangle Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#triangles)
---| MATERIAL_TRIANGLE_STRIP #  			Creates a set of triangles that each share two vertices with the previous triangle in the sequence.  			The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of triangles that the Mesh will contain.   			E.g. `(vertexCount - 2)`  			For more information, see [Triangle Strip Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#trianglestrips)
---| MATERIAL_LINE_STRIP #  			Creates a set of lines that all share a single vertex and each share a vertex with the previous lines.  			The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of line connection that the Mesh will contain.   			E.g. `(vertexCount)`  			For more information, see [Line Strip Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#linestrips)
---| MATERIAL_LINE_LOOP #  			Exactly like MATERIAL_LINE_STRIP do, but the first and the last vertex will always be connected together.  			For more information, see [Line Loop Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#lineloops)
---| MATERIAL_POLYGON #  			Creates a set of triangles that all share a single vertex and each share a vertex with the previous triangle.  			The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of vertices that the Mesh will contain.   			E.g. `(vertexCount)`  			For more information, see [Polygon Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#polygons)
---| MATERIAL_QUADS #  			Creates pairs of triangles that share two vertices.  			The `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of quads that the Mesh will contain.   			E.g. `(vertexCount / 4)`  			For more information, see [Quad Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#quads)

--- Enumerations used by [render.CullMode](https://wiki.facepunch.com/gmod/render.CullMode). Clientside only.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/MATERIAL_CULLMODE
--- Cull back faces with counterclockwise vertices.
---@readonly
MATERIAL_CULLMODE_CCW = 0
--- Cull back faces with clockwise vertices.
---@readonly
MATERIAL_CULLMODE_CW = 1
--- Do not cull back faces at all.
---@readonly
MATERIAL_CULLMODE_NONE = 2

---@enum MATERIAL_CULLMODE : number
---| MATERIAL_CULLMODE_CCW # Cull back faces with counterclockwise vertices.
---| MATERIAL_CULLMODE_CW # Cull back faces with clockwise vertices.
---| MATERIAL_CULLMODE_NONE # Do not cull back faces at all.

--- Enumerations used by [render.GetFogMode](https://wiki.facepunch.com/gmod/render.GetFogMode) and [render.FogMode](https://wiki.facepunch.com/gmod/render.FogMode). Clientside only.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/MATERIAL_FOG
--- No fog
---@readonly
MATERIAL_FOG_NONE = 0
--- Linear fog
---@readonly
MATERIAL_FOG_LINEAR = 1
--- For use in conjunction with [render.SetFogZ](https://wiki.facepunch.com/gmod/render.SetFogZ). Does not work if start distance is bigger than end distance. Ignores density setting. Seems to be broken? Used for underwater fog by the engine.
---@readonly
MATERIAL_FOG_LINEAR_BELOW_FOG_Z = 2

---@enum MATERIAL_FOG : number
---| MATERIAL_FOG_NONE # No fog
---| MATERIAL_FOG_LINEAR # Linear fog
---| MATERIAL_FOG_LINEAR_BELOW_FOG_Z # For use in conjunction with [render.SetFogZ](https://wiki.facepunch.com/gmod/render.SetFogZ). Does not work if start distance is bigger than end distance. Ignores density setting. Seems to be broken? Used for underwater fog by the engine.

--- Enumerations used by [render.SetLocalModelLights](https://wiki.facepunch.com/gmod/render.SetLocalModelLights). Clientside only.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/MATERIAL_LIGHT
--- No light
---@readonly
MATERIAL_LIGHT_DISABLE = 0
--- Point light
---@readonly
MATERIAL_LIGHT_POINT = 1
--- Directional light
---@readonly
MATERIAL_LIGHT_DIRECTIONAL = 2
--- Spot light
---@readonly
MATERIAL_LIGHT_SPOT = 3

---@enum MATERIAL_LIGHT : number
---| MATERIAL_LIGHT_DISABLE # No light
---| MATERIAL_LIGHT_POINT # Point light
---| MATERIAL_LIGHT_DIRECTIONAL # Directional light
---| MATERIAL_LIGHT_SPOT # Spot light

--- Enumerations used by [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx). Clientside only.
--- 	**WARNING**: When Anti Aliasing is enabled then `MATERIAL_RT_DEPTH_SHARED` and `MATERIAL_RT_DEPTH_SEPARATE` will always create a new depth-stencil buffer because Render Targets do not have Anti Aliasing.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/MATERIAL_RT_DEPTH
--- Do not create a depth-stencil buffer.Use the default depth-stencil buffer if used as render target 0.
---@readonly
MATERIAL_RT_DEPTH_SHARED = 0
--- Create a depth-stencil buffer.Use the created depth-stencil buffer if used as render target 0.
---@readonly
MATERIAL_RT_DEPTH_SEPARATE = 1
--- Do not create a depth-stencil buffer.Disable depth and stencil buffer usage if used as render target 0.
---@readonly
MATERIAL_RT_DEPTH_NONE = 2
--- Create a depth-stencil buffer.Use the created depth-stencil buffer if used as render target 0.
---
--- Creates a color texture despite the name.
--- Seems to behave the same as MATERIAL_RT_DEPTH_SEPARATE.
---@readonly
MATERIAL_RT_DEPTH_ONLY = 3

---@enum MATERIAL_RT_DEPTH : number
---| MATERIAL_RT_DEPTH_SHARED # Do not create a depth-stencil buffer.Use the default depth-stencil buffer if used as render target 0.
---| MATERIAL_RT_DEPTH_SEPARATE # Create a depth-stencil buffer.Use the created depth-stencil buffer if used as render target 0.
---| MATERIAL_RT_DEPTH_NONE # Do not create a depth-stencil buffer.Disable depth and stencil buffer usage if used as render target 0.
---| MATERIAL_RT_DEPTH_ONLY # Create a depth-stencil buffer.Use the created depth-stencil buffer if used as render target 0.  Creates a color texture despite the name. Seems to behave the same as MATERIAL_RT_DEPTH_SEPARATE.

--- Enumerations used by:
--- * [input.IsMouseDown](https://wiki.facepunch.com/gmod/input.IsMouseDown)
--- * [input.WasMousePressed](https://wiki.facepunch.com/gmod/input.WasMousePressed)
--- * [input.WasMouseDoublePressed](https://wiki.facepunch.com/gmod/input.WasMouseDoublePressed)
---
--- It's also part of the [Enums/BUTTON_CODE](https://wiki.facepunch.com/gmod/Enums/BUTTON_CODE).
--- # Catch mouse wheel
--- You can catch the mouse wheel's value by:
--- ```
--- local testVal = 0
--- hook.Add("InputMouseApply", "testMouseWheel", function(cmd, x, y, ang)
---     testVal = testVal + cmd:GetMouseWheel() * 2 --any scale number you want to use
---     print(testVal)
--- end)
--- ```
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/MOUSE
--- First mouse button
---@readonly
MOUSE_FIRST = 107
--- Left mouse button
---@readonly
MOUSE_LEFT = 107
--- Right mouse button
---@readonly
MOUSE_RIGHT = 108
--- Middle mouse button, aka the wheel press
---@readonly
MOUSE_MIDDLE = 109
--- Mouse 4 button ( Sometimes, mouse wheel tilt left )
---@readonly
MOUSE_4 = 110
--- Mouse 5 button ( Sometimes, mouse wheel tilt right )
---@readonly
MOUSE_5 = 111
--- Mouse wheel scroll up
---@readonly
MOUSE_WHEEL_UP = 112
--- Mouse wheel scroll down
---@readonly
MOUSE_WHEEL_DOWN = 113
--- Last mouse button
---@readonly
MOUSE_LAST = 113
--- Mouse button count
---@readonly
MOUSE_COUNT = 7

---@enum MOUSE : number
---| MOUSE_FIRST # First mouse button
---| MOUSE_LEFT # Left mouse button
---| MOUSE_RIGHT # Right mouse button
---| MOUSE_MIDDLE # Middle mouse button, aka the wheel press
---| MOUSE_4 # Mouse 4 button ( Sometimes, mouse wheel tilt left )
---| MOUSE_5 # Mouse 5 button ( Sometimes, mouse wheel tilt right )
---| MOUSE_WHEEL_UP # Mouse wheel scroll up
---| MOUSE_WHEEL_DOWN # Mouse wheel scroll down
---| MOUSE_LAST # Last mouse button
---| MOUSE_COUNT # Mouse button count

--- Enumerations used by [Entity:SetMoveCollide](https://wiki.facepunch.com/gmod/Entity:SetMoveCollide) and [Entity:GetMoveCollide](https://wiki.facepunch.com/gmod/Entity:GetMoveCollide).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/MOVECOLLIDE
--- Default behavior
---@readonly
MOVECOLLIDE_DEFAULT = 0
--- Entity bounces, reflects, based on elasticity of surface and object - applies friction (adjust velocity)
---@readonly
MOVECOLLIDE_FLY_BOUNCE = 1
--- [ENTITY:ResolveCustomFlyCollision](https://wiki.facepunch.com/gmod/ENTITY:ResolveCustomFlyCollision) will modify the velocity however it likes
---@readonly
MOVECOLLIDE_FLY_CUSTOM = 2
--- Entity slides along surfaces (no bounce) - applies friciton (adjusts velocity)
---@readonly
MOVECOLLIDE_FLY_SLIDE = 3
--- Number of different movecollides
---@readonly
MOVECOLLIDE_COUNT = 4

---@enum MOVECOLLIDE : number
---| MOVECOLLIDE_DEFAULT # Default behavior
---| MOVECOLLIDE_FLY_BOUNCE # Entity bounces, reflects, based on elasticity of surface and object - applies friction (adjust velocity)
---| MOVECOLLIDE_FLY_CUSTOM # [ENTITY:ResolveCustomFlyCollision](https://wiki.facepunch.com/gmod/ENTITY:ResolveCustomFlyCollision) will modify the velocity however it likes
---| MOVECOLLIDE_FLY_SLIDE # Entity slides along surfaces (no bounce) - applies friciton (adjusts velocity)
---| MOVECOLLIDE_COUNT # Number of different movecollides

--- Enumerations used by [Entity:SetMoveType](https://wiki.facepunch.com/gmod/Entity:SetMoveType) and [Entity:GetMoveType](https://wiki.facepunch.com/gmod/Entity:GetMoveType).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/MOVETYPE
--- Don't move
---@readonly
MOVETYPE_NONE = 0
--- For players, in TF2 commander view, etc
---@readonly
MOVETYPE_ISOMETRIC = 1
--- Player only, moving on the ground
---@readonly
MOVETYPE_WALK = 2
--- Monster/NPC movement
---@readonly
MOVETYPE_STEP = 3
--- Fly, no gravity
---@readonly
MOVETYPE_FLY = 4
--- Fly, with gravity
---@readonly
MOVETYPE_FLYGRAVITY = 5
--- Physics movetype
---@readonly
MOVETYPE_VPHYSICS = 6
--- Doesn't collide with the world, but does push and crush entities.
--- This is what is used by the engine for elevators, trains, doors, moving water, etc.
---
--- In order to work properly, the entity needs to have specific Save Values/Internal Variables set which tell it how long it should be moving for.
---
--- **Note:** This same process can be done for both position and angle.
---
--- 1. You'll need to [Get an existing Save Value](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable) called `ltime`
--- 2. Calculate how long (in seconds) the entity will be moving before it reaches its destination.
--- As a simple example, this can be done via `duration = distance / speed`
--- 3. [Set the Save Value](https://wiki.facepunch.com/gmod/Entity:SetSaveValue) for `m_flMoveDoneTime` to the value you retrieved for `ltime` plus the duration calculated in step 2.
--- Put more simply: `m_flMoveDoneTime = ltime + duration`
--- 4. Set the entity's velocity to move it to the destination at the speed used in step 2.
---
--- Once the duration of the move has elapsed, the entity will stop moving.  If you have done your calculations correctly, it should stop exactly at the desired destination.
---
--- **NOTE**: MOVETYPE_PUSH entities only move during [Entity:Think](https://wiki.facepunch.com/gmod/Entity:Think) so if you want smooth movement, you need to set [Entity:NextThink](https://wiki.facepunch.com/gmod/Entity:NextThink) to [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime), which instructs the entity to execute [Entity:Think](https://wiki.facepunch.com/gmod/Entity:Think) as quickly as possible.
---@readonly
MOVETYPE_PUSH = 7
--- Noclip
---@readonly
MOVETYPE_NOCLIP = 8
--- For players, when moving on a ladder
---@readonly
MOVETYPE_LADDER = 9
--- Spectator movetype. DO **NOT** use this to make player spectate
---@readonly
MOVETYPE_OBSERVER = 10
--- Custom movetype, can be applied to the player to prevent the default movement code from running, while still calling the related hooks
---@readonly
MOVETYPE_CUSTOM = 11

---@enum MOVETYPE : number
---| MOVETYPE_NONE # Don't move
---| MOVETYPE_ISOMETRIC # For players, in TF2 commander view, etc
---| MOVETYPE_WALK # Player only, moving on the ground
---| MOVETYPE_STEP # Monster/NPC movement
---| MOVETYPE_FLY # Fly, no gravity
---| MOVETYPE_FLYGRAVITY # Fly, with gravity
---| MOVETYPE_VPHYSICS # Physics movetype
---| MOVETYPE_PUSH #  	Doesn't collide with the world, but does push and crush entities.   	This is what is used by the engine for elevators, trains, doors, moving water, etc.  	In order to work properly, the entity needs to have specific Save Values/Internal Variables set which tell it how long it should be moving for. 	 	**Note:** This same process can be done for both position and angle.  	1. You'll need to [Get an existing Save Value](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable) called `ltime`   	2. Calculate how long (in seconds) the entity will be moving before it reaches its destination.   	As a simple example, this can be done via `duration = distance / speed`   	3. [Set the Save Value](https://wiki.facepunch.com/gmod/Entity:SetSaveValue) for `m_flMoveDoneTime` to the value you retrieved for `ltime` plus the duration calculated in step 2.   	Put more simply: `m_flMoveDoneTime = ltime + duration`   	4. Set the entity's velocity to move it to the destination at the speed used in step 2.  	Once the duration of the move has elapsed, the entity will stop moving.  If you have done your calculations correctly, it should stop exactly at the desired destination.  	**NOTE**: MOVETYPE_PUSH entities only move during [Entity:Think](https://wiki.facepunch.com/gmod/Entity:Think) so if you want smooth movement, you need to set [Entity:NextThink](https://wiki.facepunch.com/gmod/Entity:NextThink) to [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime), which instructs the entity to execute [Entity:Think](https://wiki.facepunch.com/gmod/Entity:Think) as quickly as possible.
---| MOVETYPE_NOCLIP # Noclip
---| MOVETYPE_LADDER # For players, when moving on a ladder
---| MOVETYPE_OBSERVER # Spectator movetype. DO **NOT** use this to make player spectate
---| MOVETYPE_CUSTOM # Custom movetype, can be applied to the player to prevent the default movement code from running, while still calling the related hooks

--- Used by [NPC:SetNavType](https://wiki.facepunch.com/gmod/NPC:SetNavType) and [NPC:GetNavType](https://wiki.facepunch.com/gmod/NPC:GetNavType).
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/NAV
--- Error condition.
---@readonly
NAV_NONE = -1
--- walk/run
---@readonly
NAV_GROUND = 0
--- jump/leap
---@readonly
NAV_JUMP = 1
--- can fly, move all around
---@readonly
NAV_FLY = 2
--- climb ladders
---@readonly
NAV_CLIMB = 3

---@enum NAV : number
---| NAV_NONE # Error condition.
---| NAV_GROUND # walk/run
---| NAV_JUMP # jump/leap
---| NAV_FLY # can fly, move all around
---| NAV_CLIMB # climb ladders

--- Enumerations used by [CNavArea:GetAttributes](https://wiki.facepunch.com/gmod/CNavArea:GetAttributes) and [CNavArea:HasAttributes](https://wiki.facepunch.com/gmod/CNavArea:HasAttributes).
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/NAV_MESH
--- The nav area is invalid.
---@readonly
NAV_MESH_INVALID = 0
--- Must crouch to use this node/area
---@readonly
NAV_MESH_CROUCH = 1
--- Must jump to traverse this area (only used during generation)
---@readonly
NAV_MESH_JUMP = 2
--- Do not adjust for obstacles, just move along area
---@readonly
NAV_MESH_PRECISE = 4
--- Inhibit discontinuity jumping
---@readonly
NAV_MESH_NO_JUMP = 8
--- Must stop when entering this area
---@readonly
NAV_MESH_STOP = 16
--- Must run to traverse this area
---@readonly
NAV_MESH_RUN = 32
--- Must walk to traverse this area
---@readonly
NAV_MESH_WALK = 64
--- Avoid this area unless alternatives are too dangerous
---@readonly
NAV_MESH_AVOID = 128
--- Area may become blocked, and should be periodically checked
---@readonly
NAV_MESH_TRANSIENT = 256
--- Area should not be considered for hiding spot generation
---@readonly
NAV_MESH_DONT_HIDE = 512
--- Bots hiding in this area should stand
---@readonly
NAV_MESH_STAND = 1024
--- Hostages shouldn't use this area
---@readonly
NAV_MESH_NO_HOSTAGES = 2048
--- This area represents stairs, do not attempt to climb or jump them - just walk up
---@readonly
NAV_MESH_STAIRS = 4096
--- Don't merge this area with adjacent areas
---@readonly
NAV_MESH_NO_MERGE = 8192
--- This nav area is the climb point on the tip of an obstacle
---@readonly
NAV_MESH_OBSTACLE_TOP = 16384
--- This nav area is adjacent to a drop of at least `CliffHeight` (300 hammer units). Unused by base game.
---@readonly
NAV_MESH_CLIFF = 32768
--- Whether the area is blocked via [CNavArea:MarkAsBlocked](https://wiki.facepunch.com/gmod/CNavArea:MarkAsBlocked).
---@readonly
NAV_MESH_BLOCKED_LUA = 65536
--- Whether the area has a `prop_door_rotating` that is blocking it (because the door is closed)
---@readonly
NAV_MESH_BLOCKED_PROPDOOR = 268435456
--- Area has designer specified cost controlled by `func_nav_cost` entities
---@readonly
NAV_MESH_FUNC_COST = 536870912
--- Area is in an elevator's path
---@readonly
NAV_MESH_HAS_ELEVATOR = 1073741824
--- Whether the area is blocked by a `func_nav_blocker` entity and is impassible.
---@readonly
NAV_MESH_NAV_BLOCKER = -2147483648

---@enum NAV_MESH : number
---| NAV_MESH_INVALID # The nav area is invalid.
---| NAV_MESH_CROUCH # Must crouch to use this node/area
---| NAV_MESH_JUMP # Must jump to traverse this area (only used during generation)
---| NAV_MESH_PRECISE # Do not adjust for obstacles, just move along area
---| NAV_MESH_NO_JUMP # Inhibit discontinuity jumping
---| NAV_MESH_STOP # Must stop when entering this area
---| NAV_MESH_RUN # Must run to traverse this area
---| NAV_MESH_WALK # Must walk to traverse this area
---| NAV_MESH_AVOID # Avoid this area unless alternatives are too dangerous
---| NAV_MESH_TRANSIENT # Area may become blocked, and should be periodically checked
---| NAV_MESH_DONT_HIDE # Area should not be considered for hiding spot generation
---| NAV_MESH_STAND # Bots hiding in this area should stand
---| NAV_MESH_NO_HOSTAGES # Hostages shouldn't use this area
---| NAV_MESH_STAIRS # This area represents stairs, do not attempt to climb or jump them - just walk up
---| NAV_MESH_NO_MERGE # Don't merge this area with adjacent areas
---| NAV_MESH_OBSTACLE_TOP # This nav area is the climb point on the tip of an obstacle
---| NAV_MESH_CLIFF # This nav area is adjacent to a drop of at least `CliffHeight` (300 hammer units). Unused by base game.
---| NAV_MESH_BLOCKED_LUA # Whether the area is blocked via [CNavArea:MarkAsBlocked](https://wiki.facepunch.com/gmod/CNavArea:MarkAsBlocked).
---| NAV_MESH_BLOCKED_PROPDOOR # Whether the area has a `prop_door_rotating` that is blocking it (because the door is closed)
---| NAV_MESH_FUNC_COST # Area has designer specified cost controlled by `func_nav_cost` entities
---| NAV_MESH_HAS_ELEVATOR # Area is in an elevator's path
---| NAV_MESH_NAV_BLOCKER # Whether the area is blocked by a `func_nav_blocker` entity and is impassible.

--- Enumerations used by [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) methods.
--- These Enums correspond to each corner of a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/NavCorner
--- * `NORTH_WEST` = `0`
--- * `NORTH_EAST` = `1`
--- * `SOUTH_EAST` = `2`
--- * `SOUTH_WEST` = `3`
--- * `NUM_CORNERS` = `4`
---@alias NavCorner 0 | 1 | 2 | 3 | 4 | number

--- Enumerations used by [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) methods.
--- These Enums correspond to each side of a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/NavDir
--- * `NORTH` = `0`
--- * `EAST` = `1`
--- * `SOUTH` = `2`
--- * `WEST` = `3`
---@alias NavDir 0 | 1 | 2 | 3 | number

--- Enumerations used by [CNavArea:GetParentHow](https://wiki.facepunch.com/gmod/CNavArea:GetParentHow).
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/NavTraverseType
--- * `GO_NORTH` = `0`
--- * `GO_EAST` = `1`
--- * `GO_SOUTH` = `2`
--- * `GO_WEST` = `3`
--- * `GO_LADDER_UP` = `4`
--- * `GO_LADDER_DOWN` = `5`
--- * `GO_JUMP` = `6`
--- * `GO_ELEVATOR_UP` = `7`
--- * `GO_ELEVATOR_DOWN` = `8`
---@alias NavTraverseType 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | number

--- Enumerations used by [notification.AddLegacy](https://wiki.facepunch.com/gmod/notification.AddLegacy). Clientside only.
---@realm client
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/NOTIFY
--- Generic notification
---@readonly
NOTIFY_GENERIC = 0
--- Error notification
---@readonly
NOTIFY_ERROR = 1
--- Undo notification
---@readonly
NOTIFY_UNDO = 2
--- Hint notification
---@readonly
NOTIFY_HINT = 3
--- Cleanup notification
---@readonly
NOTIFY_CLEANUP = 4

---@enum NOTIFY : number
---| NOTIFY_GENERIC #  Generic notification
---| NOTIFY_ERROR #  Error notification
---| NOTIFY_UNDO #  Undo notification
---| NOTIFY_HINT #  Hint notification
---| NOTIFY_CLEANUP #  Cleanup notification

--- Enumerations used by [NPC:SetNPCState](https://wiki.facepunch.com/gmod/NPC:SetNPCState). Serverside only.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/NPC_STATE
--- Invalid state
---@readonly
NPC_STATE_INVALID = -1
--- NPC default state
---@readonly
NPC_STATE_NONE = 0
--- NPC is idle
---@readonly
NPC_STATE_IDLE = 1
--- NPC is alert and searching for enemies
---@readonly
NPC_STATE_ALERT = 2
--- NPC is in combat
---@readonly
NPC_STATE_COMBAT = 3
--- NPC is executing scripted sequence
---@readonly
NPC_STATE_SCRIPT = 4
--- NPC is playing dead (used for expressions)
---@readonly
NPC_STATE_PLAYDEAD = 5
--- NPC is prone to death
---@readonly
NPC_STATE_PRONE = 6
--- NPC is dead
---@readonly
NPC_STATE_DEAD = 7

---@enum NPC_STATE : number
---| NPC_STATE_INVALID # Invalid state
---| NPC_STATE_NONE # NPC default state
---| NPC_STATE_IDLE # NPC is idle
---| NPC_STATE_ALERT # NPC is alert and searching for enemies
---| NPC_STATE_COMBAT # NPC is in combat
---| NPC_STATE_SCRIPT # NPC is executing scripted sequence
---| NPC_STATE_PLAYDEAD # NPC is playing dead (used for expressions)
---| NPC_STATE_PRONE # NPC is prone to death
---| NPC_STATE_DEAD # NPC is dead

--- Various count enums.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/NUM
--- Amount of [Enums/CLASS](https://wiki.facepunch.com/gmod/Enums/CLASS). Used by [Global.Add_NPC_Class](https://wiki.facepunch.com/gmod/Global.Add_NPC_Class).
---@readonly
NUM_AI_CLASSES = 36
--- Amount of [Enums/HULL](https://wiki.facepunch.com/gmod/Enums/HULL).
---@readonly
NUM_HULLS = 10

---@enum NUM : number
---| NUM_AI_CLASSES # Amount of [Enums/CLASS](https://wiki.facepunch.com/gmod/Enums/CLASS). Used by [Global.Add_NPC_Class](https://wiki.facepunch.com/gmod/Global.Add_NPC_Class).
---| NUM_HULLS # Amount of [Enums/HULL](https://wiki.facepunch.com/gmod/Enums/HULL).

--- Enumerations used by [Player:SetObserverMode](https://wiki.facepunch.com/gmod/Player:SetObserverMode), [Player:GetObserverMode](https://wiki.facepunch.com/gmod/Player:GetObserverMode) and [Player:Spectate](https://wiki.facepunch.com/gmod/Player:Spectate).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/OBS_MODE
--- Not spectating
---@readonly
OBS_MODE_NONE = 0
--- Camera doesn't move, but adjusts camera angles to follow the spectated target
---@readonly
OBS_MODE_DEATHCAM = 1
--- TF2-like freeze-cam, then acts like `OBS_MODE_FIXED`.
---@readonly
OBS_MODE_FREEZECAM = 2
--- Same as OBS_MODE_CHASE, but you can't rotate the view
---@readonly
OBS_MODE_FIXED = 3
--- Spectate a specific player from first person view.
---@readonly
OBS_MODE_IN_EYE = 4
--- Chase cam, 3rd person cam, free rotation around the spectated target
---@readonly
OBS_MODE_CHASE = 5
--- Free roam/noclip-alike. Does not work from [GM:PlayerDeath](https://wiki.facepunch.com/gmod/GM:PlayerDeath)
---@readonly
OBS_MODE_ROAMING = 6

---@enum OBS_MODE : number
---| OBS_MODE_NONE # Not spectating
---| OBS_MODE_DEATHCAM # Camera doesn't move, but adjusts camera angles to follow the spectated target
---| OBS_MODE_FREEZECAM # TF2-like freeze-cam, then acts like `OBS_MODE_FIXED`.
---| OBS_MODE_FIXED # Same as OBS_MODE_CHASE, but you can't rotate the view
---| OBS_MODE_IN_EYE # Spectate a specific player from first person view.
---| OBS_MODE_CHASE # Chase cam, 3rd person cam, free rotation around the spectated target
---| OBS_MODE_ROAMING # Free roam/noclip-alike. Does not work from [GM:PlayerDeath](https://wiki.facepunch.com/gmod/GM:PlayerDeath)

--- Enumerations used by [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/PATTACH
--- Particle spawns in entity's origin and does not follow it
---@readonly
PATTACH_ABSORIGIN = 0
--- Particle attaches to entity's origin and follows the entity
---@readonly
PATTACH_ABSORIGIN_FOLLOW = 1
--- Create at a custom origin, but don't follow
---@readonly
PATTACH_CUSTOMORIGIN = 2
--- Particle attaches to passed to [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach) attachment id, but does not follow the entity
---@readonly
PATTACH_POINT = 3
--- Particle attaches to passed to [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach) attachment id and follows the entity
---@readonly
PATTACH_POINT_FOLLOW = 4
--- Particle spawns in the beginning of coordinates ( Vector( 0, 0, 0 ) ), used for control points that don't attach to an entity
---@readonly
PATTACH_WORLDORIGIN = 5

---@enum PATTACH : number
---| PATTACH_ABSORIGIN # Particle spawns in entity's origin and does not follow it
---| PATTACH_ABSORIGIN_FOLLOW # Particle attaches to entity's origin and follows the entity
---| PATTACH_CUSTOMORIGIN # Create at a custom origin, but don't follow
---| PATTACH_POINT # Particle attaches to passed to [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach) attachment id, but does not follow the entity
---| PATTACH_POINT_FOLLOW # Particle attaches to passed to [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach) attachment id and follows the entity
---| PATTACH_WORLDORIGIN # Particle spawns in the beginning of coordinates ( Vector( 0, 0, 0 ) ), used for control points that don't attach to an entity

--- Enumerations used by [Entity:SetAnimation](https://wiki.facepunch.com/gmod/Entity:SetAnimation)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/PLAYER
---@readonly
PLAYER_IDLE = 0
---@readonly
PLAYER_WALK = 1
---@readonly
PLAYER_JUMP = 2
---@readonly
PLAYER_SUPERJUMP = 3
---@readonly
PLAYER_DIE = 4
--- Player attack according to current hold type, used in SWEPs
---@readonly
PLAYER_ATTACK1 = 5
---@readonly
PLAYER_IN_VEHICLE = 6
--- Player reload according to current hold type, used in SWEPs
---@readonly
PLAYER_RELOAD = 7
---@readonly
PLAYER_START_AIMING = 8
---@readonly
PLAYER_LEAVE_AIMING = 9

---@enum PLAYER : number
---| PLAYER_IDLE
---| PLAYER_WALK
---| PLAYER_JUMP
---| PLAYER_SUPERJUMP
---| PLAYER_DIE
---| PLAYER_ATTACK1 # Player attack according to current hold type, used in SWEPs
---| PLAYER_IN_VEHICLE
---| PLAYER_RELOAD # Player reload according to current hold type, used in SWEPs
---| PLAYER_START_AIMING
---| PLAYER_LEAVE_AIMING

--- Used by [GM:DoAnimationEvent](https://wiki.facepunch.com/gmod/GM:DoAnimationEvent) and [Player:DoCustomAnimEvent](https://wiki.facepunch.com/gmod/Player:DoCustomAnimEvent).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/PLAYERANIMEVENT
--- Primary attack
---@readonly
PLAYERANIMEVENT_ATTACK_PRIMARY = 0
--- Secondary attack
---@readonly
PLAYERANIMEVENT_ATTACK_SECONDARY = 1
--- Grenade throw
---@readonly
PLAYERANIMEVENT_ATTACK_GRENADE = 2
--- Reload
---@readonly
PLAYERANIMEVENT_RELOAD = 3
--- Looping reload (single-reload shotguns)
---@readonly
PLAYERANIMEVENT_RELOAD_LOOP = 4
--- Looping reload end
---@readonly
PLAYERANIMEVENT_RELOAD_END = 5
--- Jump
---@readonly
PLAYERANIMEVENT_JUMP = 6
--- Swim
---@readonly
PLAYERANIMEVENT_SWIM = 7
--- Die
---@readonly
PLAYERANIMEVENT_DIE = 8
---@readonly
PLAYERANIMEVENT_FLINCH_CHEST = 9
---@readonly
PLAYERANIMEVENT_FLINCH_HEAD = 10
---@readonly
PLAYERANIMEVENT_FLINCH_LEFTARM = 11
---@readonly
PLAYERANIMEVENT_FLINCH_RIGHTARM = 12
---@readonly
PLAYERANIMEVENT_FLINCH_LEFTLEG = 13
---@readonly
PLAYERANIMEVENT_FLINCH_RIGHTLEG = 14
---@readonly
PLAYERANIMEVENT_DOUBLEJUMP = 15
---@readonly
PLAYERANIMEVENT_CANCEL = 16
--- Spawn
---@readonly
PLAYERANIMEVENT_SPAWN = 17
---@readonly
PLAYERANIMEVENT_SNAP_YAW = 18
--- Custom activity
---@readonly
PLAYERANIMEVENT_CUSTOM = 19
--- Play activity in gesture slot
---@readonly
PLAYERANIMEVENT_CUSTOM_GESTURE = 20
--- Play sequence
---@readonly
PLAYERANIMEVENT_CUSTOM_SEQUENCE = 21
--- Play sequence in gesture slot
---@readonly
PLAYERANIMEVENT_CUSTOM_GESTURE_SEQUENCE = 22
--- Cancel reload animation
---@readonly
PLAYERANIMEVENT_CANCEL_RELOAD = 23

---@enum PLAYERANIMEVENT : number
---| PLAYERANIMEVENT_ATTACK_PRIMARY # Primary attack
---| PLAYERANIMEVENT_ATTACK_SECONDARY # Secondary attack
---| PLAYERANIMEVENT_ATTACK_GRENADE # Grenade throw
---| PLAYERANIMEVENT_RELOAD # Reload
---| PLAYERANIMEVENT_RELOAD_LOOP # Looping reload (single-reload shotguns)
---| PLAYERANIMEVENT_RELOAD_END # Looping reload end
---| PLAYERANIMEVENT_JUMP # Jump
---| PLAYERANIMEVENT_SWIM # Swim
---| PLAYERANIMEVENT_DIE # Die
---| PLAYERANIMEVENT_FLINCH_CHEST
---| PLAYERANIMEVENT_FLINCH_HEAD
---| PLAYERANIMEVENT_FLINCH_LEFTARM
---| PLAYERANIMEVENT_FLINCH_RIGHTARM
---| PLAYERANIMEVENT_FLINCH_LEFTLEG
---| PLAYERANIMEVENT_FLINCH_RIGHTLEG
---| PLAYERANIMEVENT_DOUBLEJUMP
---| PLAYERANIMEVENT_CANCEL
---| PLAYERANIMEVENT_SPAWN # Spawn
---| PLAYERANIMEVENT_SNAP_YAW
---| PLAYERANIMEVENT_CUSTOM # Custom activity
---| PLAYERANIMEVENT_CUSTOM_GESTURE # Play activity in gesture slot
---| PLAYERANIMEVENT_CUSTOM_SEQUENCE # Play sequence
---| PLAYERANIMEVENT_CUSTOM_GESTURE_SEQUENCE # Play sequence in gesture slot
---| PLAYERANIMEVENT_CANCEL_RELOAD # Cancel reload animation

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

--- Enumerations used by [Entity:SetRenderMode](https://wiki.facepunch.com/gmod/Entity:SetRenderMode) and [Entity:GetRenderMode](https://wiki.facepunch.com/gmod/Entity:GetRenderMode).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/RENDERMODE
--- Default render mode. Transparently has no effect.
---@readonly
RENDERMODE_NORMAL = 0
--- Supports transparency.
---
--- Use this to make alpha of [Global.Color](https://wiki.facepunch.com/gmod/Global.Color) work for your entity. For players, it must be set for their active weapon aswell.
---@readonly
RENDERMODE_TRANSCOLOR = 1
---@readonly
RENDERMODE_TRANSTEXTURE = 2
--- Intended for glowing sprites. Allows transparency, and forces the sprite or model to be rendered unlit.
---
--- The size of a sprite rendered with Glow is consistent with the screen size (unlike the alternative World Space Glow), making it appear larger at a distance, in comparison to the world.
---
--- The GlowProxySize keyvalue affects this Render Mode on sprites.
---@readonly
RENDERMODE_GLOW = 3
--- Enables Alphatesting. Legacy port from Goldsource. Obsolete in Source due to Alphatesting being handled in materials. Does not allow transparency.
---@readonly
RENDERMODE_TRANSALPHA = 4
--- Add the material's color values to the existing image, instead of performing a multiplication. Sprites will appear through world geometry and the sprite/model will always brighten the world. Allows transparency.
---@readonly
RENDERMODE_TRANSADD = 5
--- Causes the material to be not be drawn at all, similarly to Don't Render.
---@readonly
RENDERMODE_ENVIROMENTAL = 6
--- Functions like Additive, but also blends between animation frames. Requires the material to have a functioning animating texture. Allows transparency.
---@readonly
RENDERMODE_TRANSADDFRAMEBLEND = 7
--- Functions similarly to Additive, except that the alpha channel controls the opacity of the sprite. An example of use is for dark sprites, with an example material being sprites/strider_blackball.vmt.
---@readonly
RENDERMODE_TRANSALPHADD = 8
--- Functions similarly to Glow, with the exception that the size of the sprite is relative to the world rather than the screen.
---
--- The GlowProxySize keyvalue affects this Render Mode on sprites.
---@readonly
RENDERMODE_WORLDGLOW = 9
--- The entity is still being drawn and networked albeit invisible, therefore not making this Render Mode ideal for performance reasons.
---
--- To completely avoid drawing and networking an entity, see EF_NODRAW.
---@readonly
RENDERMODE_NONE = 10

---@enum RENDERMODE : number
---| RENDERMODE_NORMAL # Default render mode. Transparently has no effect.
---| RENDERMODE_TRANSCOLOR # Supports transparency.  Use this to make alpha of [Global.Color](https://wiki.facepunch.com/gmod/Global.Color) work for your entity. For players, it must be set for their active weapon aswell.
---| RENDERMODE_TRANSTEXTURE
---| RENDERMODE_GLOW # Intended for glowing sprites. Allows transparency, and forces the sprite or model to be rendered unlit.  The size of a sprite rendered with Glow is consistent with the screen size (unlike the alternative World Space Glow), making it appear larger at a distance, in comparison to the world.  The GlowProxySize keyvalue affects this Render Mode on sprites.
---| RENDERMODE_TRANSALPHA # Enables Alphatesting. Legacy port from Goldsource. Obsolete in Source due to Alphatesting being handled in materials. Does not allow transparency.
---| RENDERMODE_TRANSADD # Add the material's color values to the existing image, instead of performing a multiplication. Sprites will appear through world geometry and the sprite/model will always brighten the world. Allows transparency.
---| RENDERMODE_ENVIROMENTAL # Causes the material to be not be drawn at all, similarly to Don't Render.
---| RENDERMODE_TRANSADDFRAMEBLEND # Functions like Additive, but also blends between animation frames. Requires the material to have a functioning animating texture. Allows transparency.
---| RENDERMODE_TRANSALPHADD # Functions similarly to Additive, except that the alpha channel controls the opacity of the sprite. An example of use is for dark sprites, with an example material being sprites/strider_blackball.vmt.
---| RENDERMODE_WORLDGLOW # Functions similarly to Glow, with the exception that the size of the sprite is relative to the world rather than the screen.  The GlowProxySize keyvalue affects this Render Mode on sprites.
---| RENDERMODE_NONE # The entity is still being drawn and networked albeit invisible, therefore not making this Render Mode ideal for performance reasons.  To completely avoid drawing and networking an entity, see EF_NODRAW.

--- Enumerations used by [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx). Clientside only.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/RT_SIZE
--- Only allowed for render targets that don't want a depth buffer (because if they have a depth buffer, the render target must be less than or equal to the size of the framebuffer).
---@readonly
RT_SIZE_NO_CHANGE = 0
--- Don't play with the specified width and height other than making sure it fits in the framebuffer.
---@readonly
RT_SIZE_DEFAULT = 1
--- Apply picmip to the render target's width and height.
---@readonly
RT_SIZE_PICMIP = 2
--- frame_buffer_width / 4
---@readonly
RT_SIZE_HDR = 3
--- Same size as frame buffer, or next lower power of 2 if we can't do that.
---@readonly
RT_SIZE_FULL_FRAME_BUFFER = 4
--- Target of specified size, don't mess with dimensions
---@readonly
RT_SIZE_OFFSCREEN = 5
--- Same size as the frame buffer, rounded up if necessary for systems that can't do non-power of two textures.
---@readonly
RT_SIZE_FULL_FRAME_BUFFER_ROUNDED_UP = 6
--- Rounded down to power of 2, essentially
---@readonly
RT_SIZE_REPLAY_SCREENSHOT = 7
--- Use the size passed in. Don't clamp it to the frame buffer size. Really.
---@readonly
RT_SIZE_LITERAL = 8
--- Use the size passed in, don't clamp to the frame buffer size, but do apply picmip restrictions.
---@readonly
RT_SIZE_LITERAL_PICMIP = 9

---@enum RT_SIZE : number
---| RT_SIZE_NO_CHANGE # Only allowed for render targets that don't want a depth buffer (because if they have a depth buffer, the render target must be less than or equal to the size of the framebuffer).
---| RT_SIZE_DEFAULT # Don't play with the specified width and height other than making sure it fits in the framebuffer.
---| RT_SIZE_PICMIP # Apply picmip to the render target's width and height.
---| RT_SIZE_HDR # frame_buffer_width / 4
---| RT_SIZE_FULL_FRAME_BUFFER # Same size as frame buffer, or next lower power of 2 if we can't do that.
---| RT_SIZE_OFFSCREEN # Target of specified size, don't mess with dimensions
---| RT_SIZE_FULL_FRAME_BUFFER_ROUNDED_UP # Same size as the frame buffer, rounded up if necessary for systems that can't do non-power of two textures.
---| RT_SIZE_REPLAY_SCREENSHOT # Rounded down to power of 2, essentially
---| RT_SIZE_LITERAL # Use the size passed in. Don't clamp it to the frame buffer size. Really.
---| RT_SIZE_LITERAL_PICMIP # Use the size passed in, don't clamp to the frame buffer size, but do apply picmip restrictions.

--- Enumerations for NPC schedules, used by [ENTITY:StartEngineSchedule](https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule), [ENTITY:TranslateSchedule](https://wiki.facepunch.com/gmod/ENTITY:TranslateSchedule) and [NPC:SetSchedule](https://wiki.facepunch.com/gmod/NPC:SetSchedule). Serverside only.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/SCHED
--- The schedule enum limit
---@readonly
LAST_SHARED_SCHEDULE = 88
--- Begins AI script based on NPC's `m_hCine` save value.
---@readonly
SCHED_AISCRIPT = 56
--- Idle stance and face ideal yaw angles.
---@readonly
SCHED_ALERT_FACE = 5
---@readonly
SCHED_ALERT_FACE_BESTSOUND = 6
---@readonly
SCHED_ALERT_REACT_TO_COMBAT_SOUND = 7
--- Rotate 180 degrees and back to check for enemies.
---@readonly
SCHED_ALERT_SCAN = 8
--- Remain idle until an enemy is heard or found.
---@readonly
SCHED_ALERT_STAND = 9
--- Walk until an enemy is heard or found.
---@readonly
SCHED_ALERT_WALK = 10
--- Remain idle until provoked or an enemy is found.
---@readonly
SCHED_AMBUSH = 52
--- Performs ACT_ARM.
---@readonly
SCHED_ARM_WEAPON = 48
--- Back away from enemy. If not possible to back away then go behind enemy.
---@readonly
SCHED_BACK_AWAY_FROM_ENEMY = 24
--- Requires valid enemy, backs away from SaveValue: m_vSavePosition
---@readonly
SCHED_BACK_AWAY_FROM_SAVE_POSITION = 26
--- Heavy damage was taken for the first time in a while.
---@readonly
SCHED_BIG_FLINCH = 23
--- Begin chasing an enemy.
---@readonly
SCHED_CHASE_ENEMY = 17
--- Failed to chase enemy.
---@readonly
SCHED_CHASE_ENEMY_FAILED = 18
--- Face current enemy.
---@readonly
SCHED_COMBAT_FACE = 12
--- Will walk around patrolling an area until an enemy is found.
---@readonly
SCHED_COMBAT_PATROL = 75
---@readonly
SCHED_COMBAT_STAND = 15
---@readonly
SCHED_COMBAT_SWEEP = 13
---@readonly
SCHED_COMBAT_WALK = 16
--- When not moving, will perform ACT_COWER.
---@readonly
SCHED_COWER = 40
--- Regular NPC death.
---@readonly
SCHED_DIE = 53
--- Plays NPC death sound (doesn't kill NPC).
---@readonly
SCHED_DIE_RAGDOLL = 54
--- Holsters active weapon. (Only works with NPC's that can holster weapons)
---@readonly
SCHED_DISARM_WEAPON = 49
---@readonly
SCHED_DROPSHIP_DUSTOFF = 79
--- Preform Ducking animation. (Only works with npc_alyx)
---@readonly
SCHED_DUCK_DODGE = 84
--- Search for a place to shoot current enemy.
---@readonly
SCHED_ESTABLISH_LINE_OF_FIRE = 35
--- Fallback from an established line of fire.
---@readonly
SCHED_ESTABLISH_LINE_OF_FIRE_FALLBACK = 36
--- Failed doing current schedule.
---@readonly
SCHED_FAIL = 81
--- Failed to establish a line of fire.
---@readonly
SCHED_FAIL_ESTABLISH_LINE_OF_FIRE = 38
---@readonly
SCHED_FAIL_NOSTOP = 82
--- Failed to take cover.
---@readonly
SCHED_FAIL_TAKE_COVER = 31
--- Fall to ground when in the air.
---@readonly
SCHED_FALL_TO_GROUND = 78
--- Will express fear face. (Only works on NPCs with expressions)
---@readonly
SCHED_FEAR_FACE = 14
---@readonly
SCHED_FLEE_FROM_BEST_SOUND = 29
--- Plays ACT_FLINCH_PHYSICS.
---@readonly
SCHED_FLINCH_PHYSICS = 80
--- Force walk to SaveValue: m_vecLastPosition (debug).
---@readonly
SCHED_FORCED_GO = 71
--- Force run to SaveValue: m_vecLastPosition (debug).
---@readonly
SCHED_FORCED_GO_RUN = 72
--- Pick up item if within a radius of 5 units.
---@readonly
SCHED_GET_HEALTHKIT = 66
--- Take cover and reload weapon.
---@readonly
SCHED_HIDE_AND_RELOAD = 50
--- Idle stance
---@readonly
SCHED_IDLE_STAND = 1
--- Walk to position.
---@readonly
SCHED_IDLE_WALK = 2
--- Walk to random position within a radius of 200 units.
---@readonly
SCHED_IDLE_WANDER = 3
---@readonly
SCHED_INTERACTION_MOVE_TO_PARTNER = 85
---@readonly
SCHED_INTERACTION_WAIT_FOR_PARTNER = 86
---@readonly
SCHED_INVESTIGATE_SOUND = 11
---@readonly
SCHED_MELEE_ATTACK1 = 41
---@readonly
SCHED_MELEE_ATTACK2 = 42
--- Move away from player.
---@readonly
SCHED_MOVE_AWAY = 68
--- Stop moving and continue enemy scan.
---@readonly
SCHED_MOVE_AWAY_END = 70
--- Failed to move away; stop moving.
---@readonly
SCHED_MOVE_AWAY_FAIL = 69
--- Move away from enemy while facing it and checking for new enemies.
---@readonly
SCHED_MOVE_AWAY_FROM_ENEMY = 25
--- Move to the range the weapon is preferably used at.
---@readonly
SCHED_MOVE_TO_WEAPON_RANGE = 34
--- Pick up a new weapon if within a radius of 5 units.
---@readonly
SCHED_NEW_WEAPON = 63
--- Fail safe: Create the weapon that the NPC went to pick up if it was removed during pick up schedule.
---@readonly
SCHED_NEW_WEAPON_CHEAT = 64
--- No schedule is being performed.
---@readonly
SCHED_NONE = 0
--- Prevents movement until COND.NPC_UNFREEZE(68) is set.
---@readonly
SCHED_NPC_FREEZE = 73
--- Run to random position and stop if enemy is heard or found.
---@readonly
SCHED_PATROL_RUN = 76
--- Walk to random position and stop if enemy is heard or found.
---@readonly
SCHED_PATROL_WALK = 74
---@readonly
SCHED_PRE_FAIL_ESTABLISH_LINE_OF_FIRE = 37
---@readonly
SCHED_RANGE_ATTACK1 = 43
---@readonly
SCHED_RANGE_ATTACK2 = 44
--- Stop moving and reload until danger is heard.
---@readonly
SCHED_RELOAD = 51
--- Retreat from the established enemy.
---@readonly
SCHED_RUN_FROM_ENEMY = 32
---@readonly
SCHED_RUN_FROM_ENEMY_FALLBACK = 33
---@readonly
SCHED_RUN_FROM_ENEMY_MOB = 83
--- Run to random position within a radius of 500 units.
---@readonly
SCHED_RUN_RANDOM = 77
---@readonly
SCHED_SCENE_GENERIC = 62
---@readonly
SCHED_SCRIPTED_CUSTOM_MOVE = 59
---@readonly
SCHED_SCRIPTED_FACE = 61
---@readonly
SCHED_SCRIPTED_RUN = 58
---@readonly
SCHED_SCRIPTED_WAIT = 60
---@readonly
SCHED_SCRIPTED_WALK = 57
--- Shoot cover that the enemy is behind.
---@readonly
SCHED_SHOOT_ENEMY_COVER = 39
--- Sets the NPC to a sleep-like state.
---@readonly
SCHED_SLEEP = 87
---@readonly
SCHED_SMALL_FLINCH = 22
---@readonly
SCHED_SPECIAL_ATTACK1 = 45
---@readonly
SCHED_SPECIAL_ATTACK2 = 46
---@readonly
SCHED_STANDOFF = 47
---@readonly
SCHED_SWITCH_TO_PENDING_WEAPON = 65
---@readonly
SCHED_TAKE_COVER_FROM_BEST_SOUND = 28
--- Take cover from current enemy.
---@readonly
SCHED_TAKE_COVER_FROM_ENEMY = 27
--- Flee from SaveValue: vLastKnownLocation
---@readonly
SCHED_TAKE_COVER_FROM_ORIGIN = 30
--- Chase set NPC target.
---@readonly
SCHED_TARGET_CHASE = 21
--- Face NPC target.
---@readonly
SCHED_TARGET_FACE = 20
--- Human victory dance.
---@readonly
SCHED_VICTORY_DANCE = 19
---@readonly
SCHED_WAIT_FOR_SCRIPT = 55
---@readonly
SCHED_WAIT_FOR_SPEAK_FINISH = 67
--- Spot an enemy and go from an idle state to combat state.
---@readonly
SCHED_WAKE_ANGRY = 4

---@enum SCHED : number
---| LAST_SHARED_SCHEDULE # The schedule enum limit
---| SCHED_AISCRIPT # Begins AI script based on NPC's `m_hCine` save value.
---| SCHED_ALERT_FACE # Idle stance and face ideal yaw angles.
---| SCHED_ALERT_FACE_BESTSOUND
---| SCHED_ALERT_REACT_TO_COMBAT_SOUND
---| SCHED_ALERT_SCAN # Rotate 180 degrees and back to check for enemies.
---| SCHED_ALERT_STAND # Remain idle until an enemy is heard or found.
---| SCHED_ALERT_WALK # Walk until an enemy is heard or found.
---| SCHED_AMBUSH # Remain idle until provoked or an enemy is found.
---| SCHED_ARM_WEAPON # Performs ACT_ARM.
---| SCHED_BACK_AWAY_FROM_ENEMY # Back away from enemy. If not possible to back away then go behind enemy.
---| SCHED_BACK_AWAY_FROM_SAVE_POSITION # Requires valid enemy, backs away from SaveValue: m_vSavePosition
---| SCHED_BIG_FLINCH # Heavy damage was taken for the first time in a while.
---| SCHED_CHASE_ENEMY # Begin chasing an enemy.
---| SCHED_CHASE_ENEMY_FAILED # Failed to chase enemy.
---| SCHED_COMBAT_FACE # Face current enemy.
---| SCHED_COMBAT_PATROL # Will walk around patrolling an area until an enemy is found.
---| SCHED_COMBAT_STAND
---| SCHED_COMBAT_SWEEP
---| SCHED_COMBAT_WALK
---| SCHED_COWER # When not moving, will perform ACT_COWER.
---| SCHED_DIE # Regular NPC death.
---| SCHED_DIE_RAGDOLL # Plays NPC death sound (doesn't kill NPC).
---| SCHED_DISARM_WEAPON # Holsters active weapon. (Only works with NPC's that can holster weapons)
---| SCHED_DROPSHIP_DUSTOFF
---| SCHED_DUCK_DODGE # Preform Ducking animation. (Only works with npc_alyx)
---| SCHED_ESTABLISH_LINE_OF_FIRE # Search for a place to shoot current enemy.
---| SCHED_ESTABLISH_LINE_OF_FIRE_FALLBACK # Fallback from an established line of fire.
---| SCHED_FAIL # Failed doing current schedule.
---| SCHED_FAIL_ESTABLISH_LINE_OF_FIRE # Failed to establish a line of fire.
---| SCHED_FAIL_NOSTOP
---| SCHED_FAIL_TAKE_COVER # Failed to take cover.
---| SCHED_FALL_TO_GROUND # Fall to ground when in the air.
---| SCHED_FEAR_FACE # Will express fear face. (Only works on NPCs with expressions)
---| SCHED_FLEE_FROM_BEST_SOUND
---| SCHED_FLINCH_PHYSICS # Plays ACT_FLINCH_PHYSICS.
---| SCHED_FORCED_GO # Force walk to SaveValue: m_vecLastPosition (debug).
---| SCHED_FORCED_GO_RUN # Force run to SaveValue: m_vecLastPosition (debug).
---| SCHED_GET_HEALTHKIT # Pick up item if within a radius of 5 units.
---| SCHED_HIDE_AND_RELOAD # Take cover and reload weapon.
---| SCHED_IDLE_STAND # Idle stance
---| SCHED_IDLE_WALK # Walk to position.
---| SCHED_IDLE_WANDER # Walk to random position within a radius of 200 units.
---| SCHED_INTERACTION_MOVE_TO_PARTNER
---| SCHED_INTERACTION_WAIT_FOR_PARTNER
---| SCHED_INVESTIGATE_SOUND
---| SCHED_MELEE_ATTACK1
---| SCHED_MELEE_ATTACK2
---| SCHED_MOVE_AWAY # Move away from player.
---| SCHED_MOVE_AWAY_END # Stop moving and continue enemy scan.
---| SCHED_MOVE_AWAY_FAIL # Failed to move away; stop moving.
---| SCHED_MOVE_AWAY_FROM_ENEMY # Move away from enemy while facing it and checking for new enemies.
---| SCHED_MOVE_TO_WEAPON_RANGE # Move to the range the weapon is preferably used at.
---| SCHED_NEW_WEAPON # Pick up a new weapon if within a radius of 5 units.
---| SCHED_NEW_WEAPON_CHEAT # Fail safe: Create the weapon that the NPC went to pick up if it was removed during pick up schedule.
---| SCHED_NONE # No schedule is being performed.
---| SCHED_NPC_FREEZE # Prevents movement until COND.NPC_UNFREEZE(68) is set.
---| SCHED_PATROL_RUN # Run to random position and stop if enemy is heard or found.
---| SCHED_PATROL_WALK # Walk to random position and stop if enemy is heard or found.
---| SCHED_PRE_FAIL_ESTABLISH_LINE_OF_FIRE
---| SCHED_RANGE_ATTACK1
---| SCHED_RANGE_ATTACK2
---| SCHED_RELOAD # Stop moving and reload until danger is heard.
---| SCHED_RUN_FROM_ENEMY # Retreat from the established enemy.
---| SCHED_RUN_FROM_ENEMY_FALLBACK
---| SCHED_RUN_FROM_ENEMY_MOB
---| SCHED_RUN_RANDOM # Run to random position within a radius of 500 units.
---| SCHED_SCENE_GENERIC
---| SCHED_SCRIPTED_CUSTOM_MOVE
---| SCHED_SCRIPTED_FACE
---| SCHED_SCRIPTED_RUN
---| SCHED_SCRIPTED_WAIT
---| SCHED_SCRIPTED_WALK
---| SCHED_SHOOT_ENEMY_COVER # Shoot cover that the enemy is behind.
---| SCHED_SLEEP # Sets the NPC to a sleep-like state.
---| SCHED_SMALL_FLINCH
---| SCHED_SPECIAL_ATTACK1
---| SCHED_SPECIAL_ATTACK2
---| SCHED_STANDOFF
---| SCHED_SWITCH_TO_PENDING_WEAPON
---| SCHED_TAKE_COVER_FROM_BEST_SOUND
---| SCHED_TAKE_COVER_FROM_ENEMY # Take cover from current enemy.
---| SCHED_TAKE_COVER_FROM_ORIGIN # Flee from SaveValue: vLastKnownLocation
---| SCHED_TARGET_CHASE # Chase set NPC target.
---| SCHED_TARGET_FACE # Face NPC target.
---| SCHED_VICTORY_DANCE # Human victory dance.
---| SCHED_WAIT_FOR_SCRIPT
---| SCHED_WAIT_FOR_SPEAK_FINISH
---| SCHED_WAKE_ANGRY # Spot an enemy and go from an idle state to combat state.

--- Bitflags used by [Player:ScreenFade](https://wiki.facepunch.com/gmod/Player:ScreenFade).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SCREENFADE
---@enum SCREENFADE
SCREENFADE = {
	--- Instant fade in, slowly fade out (based on fade time given) after the hold time has passed
	IN = 1,
	--- Slowly fade in (based on fade time given), hold time passes, instantly disappear
	OUT = 2,
	--- Instead of blending multiple active screen fades, modulate them. (TODO: What does this mean?) Internally this flag switches what material will be used to render the screen fade. Practically it forces the color to black.
	MODULATE = 4,
	--- Never disappear. Does nothing by itself, as if no flags were given.
	STAYOUT = 8,
	--- Used to purge all currently active screen fade effects, meant to be used in conjunction with flags above as a "priority effect".
	---
	--- Does nothing by itself, acts as if no flags were given
	PURGE = 16,
}

--- Enumerations used by Kinect SDK bindings.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SENSORBONE
---@enum SENSORBONE
SENSORBONE = {
	SHOULDER_RIGHT = 8,
	SHOULDER_LEFT = 4,
	HIP = 0,
	ELBOW_RIGHT = 9,
	KNEE_RIGHT = 17,
	WRIST_RIGHT = 10,
	ANKLE_LEFT = 14,
	FOOT_LEFT = 15,
	WRIST_LEFT = 6,
	FOOT_RIGHT = 19,
	HAND_RIGHT = 11,
	SHOULDER = 2,
	HIP_LEFT = 12,
	HIP_RIGHT = 16,
	HAND_LEFT = 7,
	ANKLE_RIGHT = 18,
	SPINE = 1,
	ELBOW_LEFT = 5,
	KNEE_LEFT = 13,
	HEAD = 3,
}

--- Enumerations describing certain spawnflags. Everything except for SF_PHYS* and SF_WEAPON* is serverside only.
---
--- Spawnflags are set using [Entity:SetKeyValue](https://wiki.facepunch.com/gmod/Entity:SetKeyValue) with **"spawnflags"** as the key, or using [Entity:SetSpawnFlags](https://wiki.facepunch.com/gmod/Entity:SetSpawnFlags), [Entity:AddSpawnFlags](https://wiki.facepunch.com/gmod/Entity:AddSpawnFlags), [Entity:RemoveSpawnFlags](https://wiki.facepunch.com/gmod/Entity:RemoveSpawnFlags).
---
--- * SF_CITIZEN_* spawnflags represent spawnflags only usable on [npc_citizen](https://developer.valvesoftware.com/wiki/Npc_citizen).
--- * SF_NPC_* - Usable on all NPCs
--- * SF_PHYSBOX_* - Usable on [func_physbox](https://developer.valvesoftware.com/wiki/Func_physbox)
--- * SF_PHYSPROP_* - Usable on [prop_physics](https://developer.valvesoftware.com/wiki/Prop_physics) entities
--- * SF_WEAPON_* - Usable on [Weapons](https://wiki.facepunch.com/gmod/Weapon)
---
--- **NOTE**: This is not a full list of available spawnflags, there are **a lot** more, each unique to each entity, you can find out more on the [Valve Developer Community](https://developer.valvesoftware.com/wiki/Main_Page) website for the entities in question.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/SF
--- Citizen that resupplies ammo
---@readonly
SF_CITIZEN_AMMORESUPPLIER = 524288
--- "Follow the player as soon as I spawn"
---@readonly
SF_CITIZEN_FOLLOW = 65536
--- "Work outside the speech semaphore system"
---@readonly
SF_CITIZEN_IGNORE_SEMAPHORE = 2097152
--- Makes the citizen a medic
---@readonly
SF_CITIZEN_MEDIC = 131072
--- Citizen cannot join players squad, and will not able to be commanded by the Half-Life 2 command system for Citizens
---@readonly
SF_CITIZEN_NOT_COMMANDABLE = 1048576
--- Gives the citizen a random head
---@readonly
SF_CITIZEN_RANDOM_HEAD = 262144
--- Gives the citizen a random female head
---@readonly
SF_CITIZEN_RANDOM_HEAD_FEMALE = 8388608
--- Gives the citizen a random male head
---@readonly
SF_CITIZEN_RANDOM_HEAD_MALE = 4194304
--- "Use render bounds instead of human hull for guys sitting in chairs, etc". Must be set before Spawn() is called to take effect
---@readonly
SF_CITIZEN_USE_RENDER_BOUNDS = 16777216
--- Makes the floor turret friendly
---@readonly
SF_FLOOR_TURRET_CITIZEN = 512
--- Do Alternate collision for this NPC (player avoidance)
---@readonly
SF_NPC_ALTCOLLISION = 4096
--- [Think outside PVS](https://developer.valvesoftware.com/wiki/NPC_Sensing)
---@readonly
SF_NPC_ALWAYSTHINK = 1024
--- NPC Drops health kit when it dies. Also works on player.
---@readonly
SF_NPC_DROP_HEALTHKIT = 8
--- Fade Corpse
---@readonly
SF_NPC_FADE_CORPSE = 512
--- If not set, means *teleport* to ground
---@readonly
SF_NPC_FALL_TO_GROUND = 4
--- No IDLE sounds until angry
---@readonly
SF_NPC_GAG = 2
--- Long Visibility/Shoot
---@readonly
SF_NPC_LONG_RANGE = 256
--- Ignore player push - Don't give way to player
---@readonly
SF_NPC_NO_PLAYER_PUSHAWAY = 16384
--- NPC Doesn't drop weapon on death
---@readonly
SF_NPC_NO_WEAPON_DROP = 8192
--- Don't acquire enemies or avoid obstacles
---@readonly
SF_NPC_START_EFFICIENT = 16
--- This entity is a template for the [npc_template_maker](https://developer.valvesoftware.com/wiki/Npc_template_maker). It will not spawn automatically and cannot be used with [point_template](https://developer.valvesoftware.com/wiki/Point_template).
---@readonly
SF_NPC_TEMPLATE = 2048
--- Wait for script
---@readonly
SF_NPC_WAIT_FOR_SCRIPT = 128
--- Wait till seen
---@readonly
SF_NPC_WAIT_TILL_SEEN = 1
--- If set, calls [PhysObj:EnableMotion](https://wiki.facepunch.com/gmod/PhysObj:EnableMotion)( false ) on the func_physbox when the physics are created
---@readonly
SF_PHYSBOX_MOTIONDISABLED = 32768
--- Gravity gun is ALWAYS allowed to pick this up.
---@readonly
SF_PHYSBOX_ALWAYS_PICK_UP = 1048576
--- Gravity gun is NOT allowed to pick this up.
---@readonly
SF_PHYSBOX_NEVER_PICK_UP = 2097152
--- Gravity gun is NOT allowed to punt this entity.
---@readonly
SF_PHYSBOX_NEVER_PUNT = 4194304
--- If set, calls [PhysObj:EnableMotion](https://wiki.facepunch.com/gmod/PhysObj:EnableMotion)( false ) on the func_physbox when the physics are created. See [Physics optimization](https://developer.valvesoftware.com/wiki/Physics_optimization).
---@readonly
SF_PHYSPROP_MOTIONDISABLED = 8
--- Prevent that physbox from being picked up.
---@readonly
SF_PHYSPROP_PREVENT_PICKUP = 512
--- This flag is set if the entity is gib.
---@readonly
SF_PHYSPROP_IS_GIB = 4194304
--- Makes the rollermine friendly.
---@readonly
SF_ROLLERMINE_FRIENDLY = 65536
--- If set before [Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn), the weapon will be constrained and will not simply fall to the ground.
---@readonly
SF_WEAPON_START_CONSTRAINED = 1
--- Player is NOT allowed to pick this up.
---@readonly
SF_WEAPON_NO_PLAYER_PICKUP = 2
--- Physgun is NOT allowed to pick this up.
---@readonly
SF_WEAPON_NO_PHYSCANNON_PUNT = 4

---@enum SF : number
---| SF_CITIZEN_AMMORESUPPLIER # Citizen that resupplies ammo
---| SF_CITIZEN_FOLLOW # "Follow the player as soon as I spawn"
---| SF_CITIZEN_IGNORE_SEMAPHORE # "Work outside the speech semaphore system"
---| SF_CITIZEN_MEDIC # Makes the citizen a medic
---| SF_CITIZEN_NOT_COMMANDABLE # Citizen cannot join players squad, and will not able to be commanded by the Half-Life 2 command system for Citizens
---| SF_CITIZEN_RANDOM_HEAD # Gives the citizen a random head
---| SF_CITIZEN_RANDOM_HEAD_FEMALE # Gives the citizen a random female head
---| SF_CITIZEN_RANDOM_HEAD_MALE # Gives the citizen a random male head
---| SF_CITIZEN_USE_RENDER_BOUNDS # "Use render bounds instead of human hull for guys sitting in chairs, etc". Must be set before Spawn() is called to take effect
---| SF_FLOOR_TURRET_CITIZEN # Makes the floor turret friendly
---| SF_NPC_ALTCOLLISION # Do Alternate collision for this NPC (player avoidance)
---| SF_NPC_ALWAYSTHINK # [Think outside PVS](https://developer.valvesoftware.com/wiki/NPC_Sensing)
---| SF_NPC_DROP_HEALTHKIT # NPC Drops health kit when it dies. Also works on player.
---| SF_NPC_FADE_CORPSE # Fade Corpse
---| SF_NPC_FALL_TO_GROUND # If not set, means *teleport* to ground
---| SF_NPC_GAG # No IDLE sounds until angry
---| SF_NPC_LONG_RANGE # Long Visibility/Shoot
---| SF_NPC_NO_PLAYER_PUSHAWAY # Ignore player push - Don't give way to player
---| SF_NPC_NO_WEAPON_DROP # NPC Doesn't drop weapon on death
---| SF_NPC_START_EFFICIENT # Don't acquire enemies or avoid obstacles
---| SF_NPC_TEMPLATE # This entity is a template for the [npc_template_maker](https://developer.valvesoftware.com/wiki/Npc_template_maker). It will not spawn automatically and cannot be used with [point_template](https://developer.valvesoftware.com/wiki/Point_template).
---| SF_NPC_WAIT_FOR_SCRIPT # Wait for script
---| SF_NPC_WAIT_TILL_SEEN # Wait till seen
---| SF_PHYSBOX_MOTIONDISABLED # If set, calls [PhysObj:EnableMotion](https://wiki.facepunch.com/gmod/PhysObj:EnableMotion)( false ) on the func_physbox when the physics are created
---| SF_PHYSBOX_ALWAYS_PICK_UP # Gravity gun is ALWAYS allowed to pick this up.
---| SF_PHYSBOX_NEVER_PICK_UP # Gravity gun is NOT allowed to pick this up.
---| SF_PHYSBOX_NEVER_PUNT # Gravity gun is NOT allowed to punt this entity.
---| SF_PHYSPROP_MOTIONDISABLED # If set, calls [PhysObj:EnableMotion](https://wiki.facepunch.com/gmod/PhysObj:EnableMotion)( false ) on the func_physbox when the physics are created. See [Physics optimization](https://developer.valvesoftware.com/wiki/Physics_optimization).
---| SF_PHYSPROP_PREVENT_PICKUP # Prevent that physbox from being picked up.
---| SF_PHYSPROP_IS_GIB # This flag is set if the entity is gib.
---| SF_ROLLERMINE_FRIENDLY # Makes the rollermine friendly.
---| SF_WEAPON_START_CONSTRAINED # If set before [Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn), the weapon will be constrained and will not simply fall to the ground.
---| SF_WEAPON_NO_PLAYER_PICKUP # Player is NOT allowed to pick this up.
---| SF_WEAPON_NO_PHYSCANNON_PUNT # Physgun is NOT allowed to pick this up.

--- Used by [GM:ClientSignOnStateChanged](https://wiki.facepunch.com/gmod/GM:ClientSignOnStateChanged).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SIGNONSTATE
---@readonly
SIGNONSTATE_NONE = 0
---@readonly
SIGNONSTATE_CHALLENGE = 1
---@readonly
SIGNONSTATE_CONNECTED = 2
---@readonly
SIGNONSTATE_NEW = 3
---@readonly
SIGNONSTATE_PRESPAWN = 4
---@readonly
SIGNONSTATE_SPAWN = 5
---@readonly
SIGNONSTATE_FULL = 6
---@readonly
SIGNONSTATE_CHANGELEVEL = 7

---@enum SIGNONSTATE : number
---| SIGNONSTATE_NONE
---| SIGNONSTATE_CHALLENGE
---| SIGNONSTATE_CONNECTED
---| SIGNONSTATE_NEW
---| SIGNONSTATE_PRESPAWN
---| SIGNONSTATE_SPAWN
---| SIGNONSTATE_FULL
---| SIGNONSTATE_CHANGELEVEL

--- Enumerations used by [ENTITY:PhysicsSimulate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SIM
--- Don't simulate physics
---@readonly
SIM_NOTHING = 0
--- Vectors in local coordinate system
---@readonly
SIM_LOCAL_ACCELERATION = 1
--- Vectors in local coordinate system
---@readonly
SIM_LOCAL_FORCE = 2
--- Vectors in world coordinate system
---@readonly
SIM_GLOBAL_ACCELERATION = 3
--- Vectors in world coordinate system
---@readonly
SIM_GLOBAL_FORCE = 4

---@enum SIM : number
---| SIM_NOTHING # Don't simulate physics
---| SIM_LOCAL_ACCELERATION # Vectors in local coordinate system
---| SIM_LOCAL_FORCE # Vectors in local coordinate system
---| SIM_GLOBAL_ACCELERATION # Vectors in world coordinate system
---| SIM_GLOBAL_FORCE # Vectors in world coordinate system

--- Sound flags used by [Global.EmitSound](https://wiki.facepunch.com/gmod/Global.EmitSound) and [Entity:EmitSound](https://wiki.facepunch.com/gmod/Entity:EmitSound).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SND
--- To keep the compiler happy
---@readonly
SND_NOFLAGS = 0
--- Change sound volume. If the sound is already being emitted by the entity, its volume will be changed, instead of playing another sound.
---@readonly
SND_CHANGE_VOL = 1
--- Change sound pitch. If the sound is already being emitted by the entity, its pitch will be changed, instead of playing another sound.
---@readonly
SND_CHANGE_PITCH = 2
--- Stop the sound. Used internally for [Entity:StopSound](https://wiki.facepunch.com/gmod/Entity:StopSound).
---@readonly
SND_STOP = 4
--- We're spawning, used in some cases for ambients. Not sent over net, only a param between dll and server.
---@readonly
SND_SPAWNING = 8
--- Sound has an initial delay.
---@readonly
SND_DELAY = 16
--- Stop all looping sounds on the entity.
---@readonly
SND_STOP_LOOPING = 32
--- This sound should be paused if the game is paused.
---@readonly
SND_SHOULDPAUSE = 128
--- If the sound has any associated phoneme (character lip-sync) data, ignore it.
---@readonly
SND_IGNORE_PHONEMES = 256
--- Used to change all sounds (e.g. with SND_CHANGE_VOL) emitted by an entity, regardless of scriptname.
---@readonly
SND_IGNORE_NAME = 512
--- Unused/legacy; does nothing.
---@readonly
SND_DO_NOT_OVERWRITE_EXISTING_ON_CHANNEL = 1024

---@enum SND : number
---| SND_NOFLAGS # To keep the compiler happy
---| SND_CHANGE_VOL # Change sound volume. If the sound is already being emitted by the entity, its volume will be changed, instead of playing another sound.
---| SND_CHANGE_PITCH # Change sound pitch. If the sound is already being emitted by the entity, its pitch will be changed, instead of playing another sound.
---| SND_STOP # Stop the sound. Used internally for [Entity:StopSound](https://wiki.facepunch.com/gmod/Entity:StopSound).
---| SND_SPAWNING # We're spawning, used in some cases for ambients. Not sent over net, only a param between dll and server.
---| SND_DELAY # Sound has an initial delay.
---| SND_STOP_LOOPING # Stop all looping sounds on the entity.
---| SND_SHOULDPAUSE # This sound should be paused if the game is paused.
---| SND_IGNORE_PHONEMES # If the sound has any associated phoneme (character lip-sync) data, ignore it.
---| SND_IGNORE_NAME # Used to change all sounds (e.g. with SND_CHANGE_VOL) emitted by an entity, regardless of scriptname.
---| SND_DO_NOT_OVERWRITE_EXISTING_ON_CHANNEL # Unused/legacy; does nothing.

--- The sound's attenuation, or how fast it drops away. Enumerations used by [Global.EmitSound](https://wiki.facepunch.com/gmod/Global.EmitSound) and [Entity:EmitSound](https://wiki.facepunch.com/gmod/Entity:EmitSound). Information taken from [soundflags.h in Source SDK 2013](https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/sp/src/public/soundflags.h#L53)
---
--- The engine starts running into trouble below 60dB.
---
--- **WARNING**: These enumerations are not provided in Garry's Mod Lua and are listed here only for reference. Use the raw number values instead.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SNDLVL
--- Sound plays everywhere
---@readonly
SNDLVL_NONE = 0
--- Rustling leaves
---@readonly
SNDLVL_20dB = 20
--- Whispering
---@readonly
SNDLVL_25dB = 25
--- Library
---@readonly
SNDLVL_30dB = 30
---@readonly
SNDLVL_35dB = 35
---@readonly
SNDLVL_40dB = 40
--- Refrigerator
---@readonly
SNDLVL_45dB = 45
--- Average home
---@readonly
SNDLVL_50dB = 50
---@readonly
SNDLVL_55dB = 55
--- Normal conversation, clothes dryer
---@readonly
SNDLVL_60dB = 60
--- *The same as SNDLVL_60dB*
---@readonly
SNDLVL_IDLE = 60
--- Washing machine, dishwasher
---@readonly
SNDLVL_65dB = 65
---@readonly
SNDLVL_STATIC = 66
--- Car, vacuum cleaner, mixer, electric sewing machine
---@readonly
SNDLVL_70dB = 70
--- Busy traffic
---@readonly
SNDLVL_75dB = 75
--- *The same as SNDLVL_75dB*
---@readonly
SNDLVL_NORM = 75
--- Mini-bike, alarm clock, noisy restaurant, office tabulator, outboard motor, passing snowmobile
---@readonly
SNDLVL_80dB = 80
--- *The same as SNDLVL_80dB*
---@readonly
SNDLVL_TALKING = 80
--- Average factory, electric shaver
---@readonly
SNDLVL_85dB = 85
--- Screaming child, passing motorcycle, convertible ride on freeway
---@readonly
SNDLVL_90dB = 90
---@readonly
SNDLVL_95dB = 95
--- Subway train, diesel truck, woodworking shop, pneumatic drill, boiler shop, jackhammer
---@readonly
SNDLVL_100dB = 100
--- Helicopter, power mower
---@readonly
SNDLVL_105dB = 105
--- Snowmobile (drivers seat), inboard motorboat, sandblasting
---@readonly
SNDLVL_110dB = 110
--- Car horn, propeller aircraft
---@readonly
SNDLVL_120dB = 120
--- Air raid siren
---@readonly
SNDLVL_130dB = 130
--- Threshold of pain, gunshot, jet engine
---@readonly
SNDLVL_140dB = 140
--- *The same as SNDLVL_140dB*
---@readonly
SNDLVL_GUNFIRE = 140
---@readonly
SNDLVL_150dB = 150
--- Rocket launching
---@readonly
SNDLVL_180dB = 180

---@enum SNDLVL : number
---| SNDLVL_NONE # Sound plays everywhere
---| SNDLVL_20dB # Rustling leaves
---| SNDLVL_25dB # Whispering
---| SNDLVL_30dB # Library
---| SNDLVL_35dB
---| SNDLVL_40dB
---| SNDLVL_45dB # Refrigerator
---| SNDLVL_50dB # Average home
---| SNDLVL_55dB
---| SNDLVL_60dB # Normal conversation, clothes dryer
---| SNDLVL_IDLE # *The same as SNDLVL_60dB*
---| SNDLVL_65dB # Washing machine, dishwasher
---| SNDLVL_STATIC
---| SNDLVL_70dB # Car, vacuum cleaner, mixer, electric sewing machine
---| SNDLVL_75dB # Busy traffic
---| SNDLVL_NORM # *The same as SNDLVL_75dB*
---| SNDLVL_80dB # Mini-bike, alarm clock, noisy restaurant, office tabulator, outboard motor, passing snowmobile
---| SNDLVL_TALKING # *The same as SNDLVL_80dB*
---| SNDLVL_85dB # Average factory, electric shaver
---| SNDLVL_90dB # Screaming child, passing motorcycle, convertible ride on freeway
---| SNDLVL_95dB
---| SNDLVL_100dB # Subway train, diesel truck, woodworking shop, pneumatic drill, boiler shop, jackhammer
---| SNDLVL_105dB # Helicopter, power mower
---| SNDLVL_110dB # Snowmobile (drivers seat), inboard motorboat, sandblasting
---| SNDLVL_120dB # Car horn, propeller aircraft
---| SNDLVL_130dB # Air raid siren
---| SNDLVL_140dB # Threshold of pain, gunshot, jet engine
---| SNDLVL_GUNFIRE # *The same as SNDLVL_140dB*
---| SNDLVL_150dB
---| SNDLVL_180dB # Rocket launching

--- For use with [Entity:PhysicsInit](https://wiki.facepunch.com/gmod/Entity:PhysicsInit), [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid) and [Entity:GetSolid](https://wiki.facepunch.com/gmod/Entity:GetSolid).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SOLID
--- Does not collide with anything.
--- **NOTE**: No physics object will be created when using this with [Entity:PhysicsInit](https://wiki.facepunch.com/gmod/Entity:PhysicsInit).
---@readonly
SOLID_NONE = 0
--- The entity has a brush model defined by the map. Does not collide with other SOLID_BSP entities.
---@readonly
SOLID_BSP = 1
--- Uses the entity's axis-aligned bounding box for collisions.
---@readonly
SOLID_BBOX = 2
--- Uses the entity's object-aligned bounding box for collisions.
---@readonly
SOLID_OBB = 3
--- Same as SOLID_OBB but restricts orientation to the Z-axis.
--- **NOTE**: Seems to be broken.
---@readonly
SOLID_OBB_YAW = 4
--- Always call the entity's `ICollideable::TestCollision` method for traces regardless of the presence of `FSOLID_CUSTOMRAYTEST` or `FSOLID_CUSTOMBOXTEST`. This will only be called back to Lua as [ENTITY:TestCollision](https://wiki.facepunch.com/gmod/ENTITY:TestCollision) for `"anim"` type SENTs.
---@readonly
SOLID_CUSTOM = 5
--- Uses the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ects of the entity.
---@readonly
SOLID_VPHYSICS = 6

---@enum SOLID : number
---| SOLID_NONE # Does not collide with anything. **NOTE**: No physics object will be created when using this with [Entity:PhysicsInit](https://wiki.facepunch.com/gmod/Entity:PhysicsInit).
---| SOLID_BSP # The entity has a brush model defined by the map. Does not collide with other SOLID_BSP entities.
---| SOLID_BBOX # Uses the entity's axis-aligned bounding box for collisions.
---| SOLID_OBB # Uses the entity's object-aligned bounding box for collisions.
---| SOLID_OBB_YAW # Same as SOLID_OBB but restricts orientation to the Z-axis. **NOTE**: Seems to be broken.
---| SOLID_CUSTOM # Always call the entity's `ICollideable::TestCollision` method for traces regardless of the presence of `FSOLID_CUSTOMRAYTEST` or `FSOLID_CUSTOMBOXTEST`. This will only be called back to Lua as [ENTITY:TestCollision](https://wiki.facepunch.com/gmod/ENTITY:TestCollision) for `"anim"` type SENTs.
---| SOLID_VPHYSICS # Uses the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ects of the entity.

--- Enumerations used by [sound.EmitHint](https://wiki.facepunch.com/gmod/sound.EmitHint).
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/SOUND
---@readonly
SOUND_NONE = 0
---@readonly
SOUND_COMBAT = 1
---@readonly
SOUND_WORLD = 2
---@readonly
SOUND_PLAYER = 4
---@readonly
SOUND_DANGER = 8
---@readonly
SOUND_BULLET_IMPACT = 16
--- Considered a scent.
---@readonly
SOUND_CARCASS = 32
--- Considered a scent.
---@readonly
SOUND_MEAT = 64
--- Considered a scent.
---@readonly
SOUND_GARBAGE = 128
--- Keeps certain creatures at bay, such as Antlions.
---@readonly
SOUND_THUMPER = 256
--- Gets the antlion's attention.
---@readonly
SOUND_BUGBAIT = 512
---@readonly
SOUND_PHYSICS_DANGER = 1024
--- Only scares the sniper NPC.
---@readonly
SOUND_DANGER_SNIPERONLY = 2048
---@readonly
SOUND_MOVE_AWAY = 4096
---@readonly
SOUND_PLAYER_VEHICLE = 8192
--- Changes listener's readiness (Player Companion only)
---@readonly
SOUND_READINESS_LOW = 16384
---@readonly
SOUND_READINESS_MEDIUM = 32768
---@readonly
SOUND_READINESS_HIGH = 65536
--- Additional context for SOUND_DANGER
---@readonly
SOUND_CONTEXT_FROM_SNIPER = 1048576
--- Added to SOUND_COMBAT
---@readonly
SOUND_CONTEXT_GUNFIRE = 2097152
--- Explosion going to happen here.
---@readonly
SOUND_CONTEXT_MORTAR = 4194304
--- Only combine can hear sounds marked this way.
---@readonly
SOUND_CONTEXT_COMBINE_ONLY = 8388608
--- React to sound source's origin, not sound's location
---@readonly
SOUND_CONTEXT_REACT_TO_SOURCE = 16777216
--- Context added to SOUND_COMBAT, usually.
---@readonly
SOUND_CONTEXT_EXPLOSION = 33554432
--- Combine do NOT hear this
---@readonly
SOUND_CONTEXT_EXCLUDE_COMBINE = 67108864
--- Treat as a normal danger sound if you see the source, otherwise turn to face source.
---@readonly
SOUND_CONTEXT_DANGER_APPROACH = 134217728
--- Only player allies can hear this sound.
---@readonly
SOUND_CONTEXT_ALLIES_ONLY = 268435456
--- HACK: need this because we're not treating the SOUND_xxx values as true bit values! See switch in OnListened.
---@readonly
SOUND_CONTEXT_PLAYER_VEHICLE = 536870912

---@enum SOUND : number
---| SOUND_NONE
---| SOUND_COMBAT
---| SOUND_WORLD
---| SOUND_PLAYER
---| SOUND_DANGER
---| SOUND_BULLET_IMPACT
---| SOUND_CARCASS # Considered a scent.
---| SOUND_MEAT # Considered a scent.
---| SOUND_GARBAGE # Considered a scent.
---| SOUND_THUMPER # Keeps certain creatures at bay, such as Antlions.
---| SOUND_BUGBAIT # Gets the antlion's attention.
---| SOUND_PHYSICS_DANGER
---| SOUND_DANGER_SNIPERONLY # Only scares the sniper NPC.
---| SOUND_MOVE_AWAY
---| SOUND_PLAYER_VEHICLE
---| SOUND_READINESS_LOW # Changes listener's readiness (Player Companion only)
---| SOUND_READINESS_MEDIUM
---| SOUND_READINESS_HIGH
---| SOUND_CONTEXT_FROM_SNIPER # Additional context for SOUND_DANGER
---| SOUND_CONTEXT_GUNFIRE # Added to SOUND_COMBAT
---| SOUND_CONTEXT_MORTAR # Explosion going to happen here.
---| SOUND_CONTEXT_COMBINE_ONLY # Only combine can hear sounds marked this way.
---| SOUND_CONTEXT_REACT_TO_SOURCE # React to sound source's origin, not sound's location
---| SOUND_CONTEXT_EXPLOSION # Context added to SOUND_COMBAT, usually.
---| SOUND_CONTEXT_EXCLUDE_COMBINE # Combine do NOT hear this
---| SOUND_CONTEXT_DANGER_APPROACH # Treat as a normal danger sound if you see the source, otherwise turn to face source.
---| SOUND_CONTEXT_ALLIES_ONLY # Only player allies can hear this sound.
---| SOUND_CONTEXT_PLAYER_VEHICLE # HACK: need this because we're not treating the SOUND_xxx values as true bit values! See switch in OnListened.

--- ### `STENCIL_NEVER`, `STENCIL_LESS`, `STENCIL_EQUAL`, `STENCIL_LESSEQUAL`, `STENCIL_GREATER`, `STENCIL_NOTEQUAL`, `STENCIL_GREATEREQUAL`, `STENCIL_ALWAYS`
---
--- Enumerations for use with [render.SetStencilCompareFunction](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction).
---
--- The comparison is between the reference value set by [render.SetStencilReferenceValue](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue), and the value of each pixel in the stencil buffer.
---
--- These enumerations are mirrors of [Enums/STENCILCOMPARISONFUNCTION](https://wiki.facepunch.com/gmod/Enums/STENCILCOMPARISONFUNCTION).
---
--- Also see this corresponding MSDN entry: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476101%28v=vs.85%29.aspx.
---
--- Enumerations for use with [render.SetStencilPassOperation](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation), [render.SetStencilFailOperation](https://wiki.facepunch.com/gmod/render.SetStencilFailOperation) and [render.SetStencilZFailOperation](https://wiki.facepunch.com/gmod/render.SetStencilZFailOperation).
---
--- These enumerations are mirrors of [Enums/STENCILOPERATION](https://wiki.facepunch.com/gmod/Enums/STENCILOPERATION).
---
--- ### `STENCIL_KEEP`, `STENCIL_ZERO`, `STENCIL_REPLACE`, `STENCIL_INCRSAT`, `STENCIL_DECRSAT`, `STENCIL_INVERT`, `STENCIL_INCR`, `STENCIL_DECR`
---
--- Enumerations for use with [render.SetStencilCompareFunction](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction).
---
--- The comparison is between the reference value set by [render.SetStencilReferenceValue](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue), and the value of each pixel in the stencil buffer.
---
--- These enumerations are mirrors of [Enums/STENCILCOMPARISONFUNCTION](https://wiki.facepunch.com/gmod/Enums/STENCILCOMPARISONFUNCTION).
---
--- Also see this corresponding MSDN entry: https://msdn.microsoft.com/en-us/library/windows/desktop/ff476101%28v=vs.85%29.aspx.
---
--- Enumerations for use with [render.SetStencilPassOperation](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation), [render.SetStencilFailOperation](https://wiki.facepunch.com/gmod/render.SetStencilFailOperation) and [render.SetStencilZFailOperation](https://wiki.facepunch.com/gmod/render.SetStencilZFailOperation).
---
--- These enumerations are mirrors of [Enums/STENCILOPERATION](https://wiki.facepunch.com/gmod/Enums/STENCILOPERATION).
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/STENCIL
--- Never passes.
---@readonly
STENCIL_NEVER = 1
--- Passes where the reference value is less than the stencil value.
---@readonly
STENCIL_LESS = 2
--- Passes where the reference value is equal to the stencil value.
---@readonly
STENCIL_EQUAL = 3
--- Passes where the reference value is less than or equal to the stencil value.
---@readonly
STENCIL_LESSEQUAL = 4
--- Passes where the reference value is greater than the stencil value.
---@readonly
STENCIL_GREATER = 5
--- Passes where the reference value is not equal to the stencil value.
---@readonly
STENCIL_NOTEQUAL = 6
--- Passes where the reference value is greater than or equal to the stencil value.
---@readonly
STENCIL_GREATEREQUAL = 7
--- Always passes.
---@readonly
STENCIL_ALWAYS = 8
--- Preserves the existing stencil buffer value.
---@readonly
STENCIL_KEEP = 1
--- Sets the value in the stencil buffer to 0.
---@readonly
STENCIL_ZERO = 2
--- Sets the value in the stencil buffer to the reference value, set using [render.SetStencilReferenceValue](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue).
---@readonly
STENCIL_REPLACE = 3
--- Increments the value in the stencil buffer by 1, clamping the result.
---@readonly
STENCIL_INCRSAT = 4
--- Decrements the value in the stencil buffer by 1, clamping the result.
---@readonly
STENCIL_DECRSAT = 5
--- Inverts the value in the stencil buffer.
---@readonly
STENCIL_INVERT = 6
--- Increments the value in the stencil buffer by 1, wrapping around on overflow.
---@readonly
STENCIL_INCR = 7
--- Decrements the value in the stencil buffer by 1, wrapping around on overflow.
---@readonly
STENCIL_DECR = 8

---@enum STENCIL : number
---| STENCIL_NEVER # Never passes.
---| STENCIL_LESS # Passes where the reference value is less than the stencil value.
---| STENCIL_EQUAL # Passes where the reference value is equal to the stencil value.
---| STENCIL_LESSEQUAL # Passes where the reference value is less than or equal to the stencil value.
---| STENCIL_GREATER # Passes where the reference value is greater than the stencil value.
---| STENCIL_NOTEQUAL # Passes where the reference value is not equal to the stencil value.
---| STENCIL_GREATEREQUAL # Passes where the reference value is greater than or equal to the stencil value.
---| STENCIL_ALWAYS # Always passes.
---| STENCIL_KEEP # Preserves the existing stencil buffer value.
---| STENCIL_ZERO # Sets the value in the stencil buffer to 0.
---| STENCIL_REPLACE # Sets the value in the stencil buffer to the reference value, set using [render.SetStencilReferenceValue](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue).
---| STENCIL_INCRSAT # Increments the value in the stencil buffer by 1, clamping the result.
---| STENCIL_DECRSAT # Decrements the value in the stencil buffer by 1, clamping the result.
---| STENCIL_INVERT # Inverts the value in the stencil buffer.
---| STENCIL_INCR # Increments the value in the stencil buffer by 1, wrapping around on overflow.
---| STENCIL_DECR # Decrements the value in the stencil buffer by 1, wrapping around on overflow.

--- Enumerations for use with [render.SetStencilCompareFunction](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction).
---
--- The comparison is between the reference value set by [render.SetStencilReferenceValue](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue), and the value of each pixel in the stencil buffer.
---
--- Clientside only.
--- **NOTE**: These enumerations are also mirrored as [Enums/STENCIL](https://wiki.facepunch.com/gmod/Enums/STENCIL).
---
--- Also see this corresponding MSDN entry: http://msdn.microsoft.com/en-us/library/windows/desktop/ff476101%28v=vs.85%29.aspx.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/STENCILCOMPARISONFUNCTION
--- Never passes.
---@readonly
STENCILCOMPARISONFUNCTION_NEVER = 1
--- Passes where the reference value is less than the stencil value.
---@readonly
STENCILCOMPARISONFUNCTION_LESS = 2
--- Passes where the reference value is equal to the stencil value.
---@readonly
STENCILCOMPARISONFUNCTION_EQUAL = 3
--- Passes where the reference value is less than or equal to the stencil value.
---@readonly
STENCILCOMPARISONFUNCTION_LESSEQUAL = 4
--- Passes where the reference value is greater than the stencil value.
---@readonly
STENCILCOMPARISONFUNCTION_GREATER = 5
--- Passes where the reference value is not equal to the stencil value.
---@readonly
STENCILCOMPARISONFUNCTION_NOTEQUAL = 6
--- Passes where the reference value is greater than or equal to the stencil value.
---@readonly
STENCILCOMPARISONFUNCTION_GREATEREQUAL = 7
--- Always passes.
---@readonly
STENCILCOMPARISONFUNCTION_ALWAYS = 8

---@enum STENCILCOMPARISONFUNCTION : number
---| STENCILCOMPARISONFUNCTION_NEVER # Never passes.
---| STENCILCOMPARISONFUNCTION_LESS # Passes where the reference value is less than the stencil value.
---| STENCILCOMPARISONFUNCTION_EQUAL # Passes where the reference value is equal to the stencil value.
---| STENCILCOMPARISONFUNCTION_LESSEQUAL # Passes where the reference value is less than or equal to the stencil value.
---| STENCILCOMPARISONFUNCTION_GREATER # Passes where the reference value is greater than the stencil value.
---| STENCILCOMPARISONFUNCTION_NOTEQUAL # Passes where the reference value is not equal to the stencil value.
---| STENCILCOMPARISONFUNCTION_GREATEREQUAL # Passes where the reference value is greater than or equal to the stencil value.
---| STENCILCOMPARISONFUNCTION_ALWAYS # Always passes.

--- Enumerations for use with [render.SetStencilPassOperation](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation), [render.SetStencilFailOperation](https://wiki.facepunch.com/gmod/render.SetStencilFailOperation) and [render.SetStencilZFailOperation](https://wiki.facepunch.com/gmod/render.SetStencilZFailOperation). Clientside only.
--- **NOTE**: These enumerations are also mirrored as [Enums/STENCIL](https://wiki.facepunch.com/gmod/Enums/STENCIL).
---
--- Also see this corresponding MSDN entry: http://msdn.microsoft.com/en-us/library/windows/desktop/ff476219%28v=vs.85%29.aspx.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/STENCILOPERATION
--- Preserves the existing stencil buffer value.
---@readonly
STENCILOPERATION_KEEP = 1
--- Sets the value in the stencil buffer to 0.
---@readonly
STENCILOPERATION_ZERO = 2
--- Sets the value in the stencil buffer to the reference value, set using [render.SetStencilReferenceValue](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue).
---@readonly
STENCILOPERATION_REPLACE = 3
--- Increments the value in the stencil buffer by 1, clamping the result.
---@readonly
STENCILOPERATION_INCRSAT = 4
--- Decrements the value in the stencil buffer by 1, clamping the result.
---@readonly
STENCILOPERATION_DECRSAT = 5
--- Inverts the value in the stencil buffer.
---@readonly
STENCILOPERATION_INVERT = 6
--- Increments the value in the stencil buffer by 1, wrapping around on overflow.
---@readonly
STENCILOPERATION_INCR = 7
--- Decrements the value in the stencil buffer by 1, wrapping around on overflow.
---@readonly
STENCILOPERATION_DECR = 8

---@enum STENCILOPERATION : number
---| STENCILOPERATION_KEEP # Preserves the existing stencil buffer value.
---| STENCILOPERATION_ZERO # Sets the value in the stencil buffer to 0.
---| STENCILOPERATION_REPLACE # Sets the value in the stencil buffer to the reference value, set using [render.SetStencilReferenceValue](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue).
---| STENCILOPERATION_INCRSAT # Increments the value in the stencil buffer by 1, clamping the result.
---| STENCILOPERATION_DECRSAT # Decrements the value in the stencil buffer by 1, clamping the result.
---| STENCILOPERATION_INVERT # Inverts the value in the stencil buffer.
---| STENCILOPERATION_INCR # Increments the value in the stencil buffer by 1, wrapping around on overflow.
---| STENCILOPERATION_DECR # Decrements the value in the stencil buffer by 1, wrapping around on overflow.

--- Enumerations used in [GM:PlayerStepSoundTime](https://wiki.facepunch.com/gmod/GM:PlayerStepSoundTime) hook.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/STEPSOUNDTIME
--- Normal step
---@readonly
STEPSOUNDTIME_NORMAL = 0
--- Step on ladder
---@readonly
STEPSOUNDTIME_ON_LADDER = 1
--- Step in water, with water reaching knee
---@readonly
STEPSOUNDTIME_WATER_KNEE = 2
--- Step in water, with water reaching foot
---@readonly
STEPSOUNDTIME_WATER_FOOT = 3

---@enum STEPSOUNDTIME : number
---| STEPSOUNDTIME_NORMAL # Normal step
---| STEPSOUNDTIME_ON_LADDER # Step on ladder
---| STEPSOUNDTIME_WATER_KNEE # Step in water, with water reaching knee
---| STEPSOUNDTIME_WATER_FOOT # Step in water, with water reaching foot

--- Used by:
--- * [Entity:DrawModel](https://wiki.facepunch.com/gmod/Entity:DrawModel)
--- * [ENTITY:Draw](https://wiki.facepunch.com/gmod/ENTITY:Draw)
--- * [ENTITY:DrawTranslucent](https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent)
--- * [WEAPON:PreDrawViewModel](https://wiki.facepunch.com/gmod/WEAPON:PreDrawViewModel)
--- * [WEAPON:PostDrawViewModel](https://wiki.facepunch.com/gmod/WEAPON:PostDrawViewModel)
--- * [WEAPON:ViewModelDrawn](https://wiki.facepunch.com/gmod/WEAPON:ViewModelDrawn)
--- * [GM:PreDrawPlayerHands](https://wiki.facepunch.com/gmod/GM:PreDrawPlayerHands)
--- * [GM:PostDrawPlayerHands](https://wiki.facepunch.com/gmod/GM:PostDrawPlayerHands)
--- * [GM:PreDrawViewModel](https://wiki.facepunch.com/gmod/GM:PreDrawViewModel)
--- * [GM:PostDrawViewModel](https://wiki.facepunch.com/gmod/GM:PostDrawViewModel)
--- * [GM:PrePlayerDraw](https://wiki.facepunch.com/gmod/GM:PrePlayerDraw)
--- * [GM:PostPlayerDraw](https://wiki.facepunch.com/gmod/GM:PostPlayerDraw)
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/STUDIO
--- The current render is for opaque renderables only
---@readonly
STUDIO_RENDER = 1
---@readonly
STUDIO_VIEWXFORMATTACHMENTS = 2
--- The current render is for translucent renderables only
---@readonly
STUDIO_DRAWTRANSLUCENTSUBMODELS = 4
--- The current render is for both opaque and translucent renderables
---@readonly
STUDIO_TWOPASS = 8
---@readonly
STUDIO_STATIC_LIGHTING = 16
---@readonly
STUDIO_WIREFRAME = 32
---@readonly
STUDIO_ITEM_BLINK = 64
---@readonly
STUDIO_NOSHADOWS = 128
---@readonly
STUDIO_WIREFRAME_VCOLLIDE = 256
--- Not a studio flag, but used to flag when we want studio stats
---@readonly
STUDIO_GENERATE_STATS = 16777216
--- Not a studio flag, but used to flag model as using shadow depth material override
---@readonly
STUDIO_SSAODEPTHTEXTURE = 134217728
--- Not a studio flag, but used to flag model as using shadow depth material override
---@readonly
STUDIO_SHADOWDEPTHTEXTURE = 1073741824
--- Not a studio flag, but used to flag model as a non-sorting brush model
---@readonly
STUDIO_TRANSPARENCY = 2147483648
--- Do not update/apply flexes. ([Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight))
---@readonly
STUDIO_SKIP_FLEXES = 1024
--- Do not render decals.
---@readonly
STUDIO_SKIP_DECALS = 268435456

---@enum STUDIO : number
---| STUDIO_RENDER # The current render is for opaque renderables only
---| STUDIO_VIEWXFORMATTACHMENTS
---| STUDIO_DRAWTRANSLUCENTSUBMODELS # The current render is for translucent renderables only
---| STUDIO_TWOPASS # The current render is for both opaque and translucent renderables
---| STUDIO_STATIC_LIGHTING
---| STUDIO_WIREFRAME
---| STUDIO_ITEM_BLINK
---| STUDIO_NOSHADOWS
---| STUDIO_WIREFRAME_VCOLLIDE
---| STUDIO_GENERATE_STATS # Not a studio flag, but used to flag when we want studio stats
---| STUDIO_SSAODEPTHTEXTURE # Not a studio flag, but used to flag model as using shadow depth material override
---| STUDIO_SHADOWDEPTHTEXTURE # Not a studio flag, but used to flag model as using shadow depth material override
---| STUDIO_TRANSPARENCY # Not a studio flag, but used to flag model as a non-sorting brush model
---| STUDIO_SKIP_FLEXES # Do not update/apply flexes. ([Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight))
---| STUDIO_SKIP_DECALS # Do not render decals.

--- Surface flags, used by the [Structures/TraceResult](https://wiki.facepunch.com/gmod/Structures/TraceResult).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SURF
--- Value will hold the light strength
---@readonly
SURF_LIGHT = 1
--- The surface is a 2D skybox
---@readonly
SURF_SKY2D = 2
--- This surface is a skybox, equivalent to HitSky in [Structures/TraceResult](https://wiki.facepunch.com/gmod/Structures/TraceResult)
---@readonly
SURF_SKY = 4
--- This surface is animated water
---@readonly
SURF_WARP = 8
--- This surface is translucent
---@readonly
SURF_TRANS = 16
--- This surface cannot have portals placed on, used by Portal's gun
---@readonly
SURF_NOPORTAL = 32
--- This surface is a trigger
---@readonly
SURF_TRIGGER = 64
--- This surface is an invisible entity, equivalent to HitNoDraw in [Structures/TraceResult](https://wiki.facepunch.com/gmod/Structures/TraceResult)
---@readonly
SURF_NODRAW = 128
--- Make a primary bsp splitter
---@readonly
SURF_HINT = 256
--- This surface can be ignored by impact effects
---@readonly
SURF_SKIP = 512
--- This surface has no lights calculated
---@readonly
SURF_NOLIGHT = 1024
--- Calculate three lightmaps for the surface for bumpmapping
---@readonly
SURF_BUMPLIGHT = 2048
--- No shadows are cast on this surface
---@readonly
SURF_NOSHADOWS = 4096
--- No decals are applied to this surface
---@readonly
SURF_NODECALS = 8192
--- Don't subdivide patches on this surface
---@readonly
SURF_NOCHOP = 16384
--- This surface is part of an entity's hitbox
---@readonly
SURF_HITBOX = 32768

---@enum SURF : number
---| SURF_LIGHT # Value will hold the light strength
---| SURF_SKY2D # The surface is a 2D skybox
---| SURF_SKY # This surface is a skybox, equivalent to HitSky in [Structures/TraceResult](https://wiki.facepunch.com/gmod/Structures/TraceResult)
---| SURF_WARP # This surface is animated water
---| SURF_TRANS # This surface is translucent
---| SURF_NOPORTAL # This surface cannot have portals placed on, used by Portal's gun
---| SURF_TRIGGER # This surface is a trigger
---| SURF_NODRAW # This surface is an invisible entity, equivalent to HitNoDraw in [Structures/TraceResult](https://wiki.facepunch.com/gmod/Structures/TraceResult)
---| SURF_HINT # Make a primary bsp splitter
---| SURF_SKIP # This surface can be ignored by impact effects
---| SURF_NOLIGHT # This surface has no lights calculated
---| SURF_BUMPLIGHT # Calculate three lightmaps for the surface for bumpmapping
---| SURF_NOSHADOWS # No shadows are cast on this surface
---| SURF_NODECALS # No decals are applied to this surface
---| SURF_NOCHOP # Don't subdivide patches on this surface
---| SURF_HITBOX # This surface is part of an entity's hitbox

--- Used by [NPC:GetTaskStatus](https://wiki.facepunch.com/gmod/NPC:GetTaskStatus) and [NPC:SetTaskStatus](https://wiki.facepunch.com/gmod/NPC:SetTaskStatus).
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/TASKSTATUS
--- Just started
---@readonly
TASKSTATUS_NEW = 0
--- Running task & movement.
---@readonly
TASKSTATUS_RUN_MOVE_AND_TASK = 1
--- Just running movement.
---@readonly
TASKSTATUS_RUN_MOVE = 2
--- Just running task.
---@readonly
TASKSTATUS_RUN_TASK = 3
--- Completed, get next task.
---@readonly
TASKSTATUS_COMPLETE = 4

---@enum TASKSTATUS : number
---| TASKSTATUS_NEW # Just started
---| TASKSTATUS_RUN_MOVE_AND_TASK # Running task & movement.
---| TASKSTATUS_RUN_MOVE # Just running movement.
---| TASKSTATUS_RUN_TASK # Just running task.
---| TASKSTATUS_COMPLETE # Completed, get next task.

--- Default defined teams in Garry's Mod. This does not include any custom teams created in custom gamemodes. Enumerations to use with [Player:Team](https://wiki.facepunch.com/gmod/Player:Team)
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/TEAM
--- Connecting team ID, set when player connects to the server
---@readonly
TEAM_CONNECTING = 0
--- Unassigned team ID, set right after player connected
---@readonly
TEAM_UNASSIGNED = 1001
--- Spectator team ID
---@readonly
TEAM_SPECTATOR = 1002

---@enum TEAM : number
---| TEAM_CONNECTING # Connecting team ID, set when player connects to the server
---| TEAM_UNASSIGNED # Unassigned team ID, set right after player connected
---| TEAM_SPECTATOR # Spectator team ID

--- Enumerations used by [render.PushFilterMin](https://wiki.facepunch.com/gmod/render.PushFilterMin) and [render.PushFilterMag](https://wiki.facepunch.com/gmod/render.PushFilterMag).
---
--- See [this](https://msdn.microsoft.com/en-us/library/windows/desktop/bb172615(v=vs.85).aspx) and [this page](https://en.wikipedia.org/wiki/Texture_filtering) for more information on texture filtering.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/TEXFILTER
---@enum TEXFILTER
TEXFILTER = {
	--- Disables any filter override.
	NONE = 0,
	--- Point sampling, no interpolation.
	POINT = 1,
	--- Basic interpolation between 2 samples.
	LINEAR = 2,
	--- Highest quality filter. Most useful for textures on 3D geometry.
	ANISOTROPIC = 3,
}

--- Enumerations used by [draw.SimpleText](https://wiki.facepunch.com/gmod/draw.SimpleText), [draw.DrawText](https://wiki.facepunch.com/gmod/draw.DrawText) and in [Structures/TextData](https://wiki.facepunch.com/gmod/Structures/TextData).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/TEXT_ALIGN
--- Align the text on the left
---@readonly
TEXT_ALIGN_LEFT = 0
--- Align the text in center
---@readonly
TEXT_ALIGN_CENTER = 1
--- Align the text on the right
---@readonly
TEXT_ALIGN_RIGHT = 2
--- Align the text on the top
---@readonly
TEXT_ALIGN_TOP = 3
--- Align the text on the bottom
---@readonly
TEXT_ALIGN_BOTTOM = 4

---@enum TEXT_ALIGN : number
---| TEXT_ALIGN_LEFT # Align the text on the left
---| TEXT_ALIGN_CENTER # Align the text in center
---| TEXT_ALIGN_RIGHT # Align the text on the right
---| TEXT_ALIGN_TOP # Align the text on the top
---| TEXT_ALIGN_BOTTOM # Align the text on the bottom

--- Used by [util.FilterText](https://wiki.facepunch.com/gmod/util.FilterText).
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/TEXT_FILTER
--- Unknown context.
---@readonly
TEXT_FILTER_UNKNOWN = 0
--- Game content, only legally required filtering is performed.
---@readonly
TEXT_FILTER_GAME_CONTENT = 1
--- Chat from another player.
---@readonly
TEXT_FILTER_CHAT = 2
--- Character or item name.
---@readonly
TEXT_FILTER_NAME = 3

---@enum TEXT_FILTER : number
---| TEXT_FILTER_UNKNOWN # Unknown context.
---| TEXT_FILTER_GAME_CONTENT # Game content, only legally required filtering is performed.
---| TEXT_FILTER_CHAT # Chat from another player.
---| TEXT_FILTER_NAME # Character or item name.

--- Bit flags used by [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx). Information taken from [VTF (Valve Texture Format) - Texture flags](https://developer.valvesoftware.com/wiki/Valve_Texture_Format#Texture_flags)
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/TEXTUREFLAGS
--- * `TEXTUREFLAGS_POINTSAMPLE` = `1`
--- * `TEXTUREFLAGS_TRILINEAR` = `2`
--- * `TEXTUREFLAGS_CLAMPS` = `4`
--- * `TEXTUREFLAGS_CLAMPT` = `8`
--- * `TEXTUREFLAGS_ANISOTROPIC` = `16`
--- * `TEXTUREFLAGS_HINT_DXT5` = `32`
--- * `TEXTUREFLAGS_PWL_CORRECTED` = `64`
--- * `TEXTUREFLAGS_NORMAL` = `128`
--- * `TEXTUREFLAGS_NOMIP` = `256`
--- * `TEXTUREFLAGS_NOLOD` = `512`
--- * `TEXTUREFLAGS_ALL_MIPS` = `1024`
--- * `TEXTUREFLAGS_PROCEDURAL` = `2048`
--- * `TEXTUREFLAGS_ONEBITALPHA` = `4096`
--- * `TEXTUREFLAGS_EIGHTBITALPHA` = `8192`
--- * `TEXTUREFLAGS_ENVMAP` = `16384`
--- * `TEXTUREFLAGS_RENDERTARGET` = `32768`
--- * `TEXTUREFLAGS_DEPTHRENDERTARGET` = `65536`
--- * `TEXTUREFLAGS_NODEBUGOVERRIDE` = `131072`
--- * `TEXTUREFLAGS_SINGLECOPY` = `262144`
--- * `TEXTUREFLAGS_STAGING_MEMORY` = `524288`
--- * `TEXTUREFLAGS_IMMEDIATE_CLEANUP` = `1048576`
--- * `TEXTUREFLAGS_IGNORE_PICMIP` = `2097152`
--- * `TEXTUREFLAGS_UNUSED_00400000` = `4194304`
--- * `TEXTUREFLAGS_NODEPTHBUFFER` = `8388608`
--- * `TEXTUREFLAGS_UNUSED_01000000` = `16777216`
--- * `TEXTUREFLAGS_CLAMPU` = `33554432`
--- * `TEXTUREFLAGS_VERTEXTEXTURE` = `67108864`
--- * `TEXTUREFLAGS_SSBUMP` = `134217728`
--- * `TEXTUREFLAGS_UNUSED_10000000` = `268435456`
--- * `TEXTUREFLAGS_BORDER` = `536870912`
--- * `TEXTUREFLAGS_STREAMABLE_COARSE` = `1073741824`
--- * `TEXTUREFLAGS_STREAMABLE_FINE` = `2147483648`
---@alias TEXTUREFLAGS 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 | 4096 | 8192 | 16384 | 32768 | 65536 | 131072 | 262144 | 524288 | 1048576 | 2097152 | 4194304 | 8388608 | 16777216 | 33554432 | 67108864 | 134217728 | 268435456 | 536870912 | 1073741824 | 2147483648 | number

--- Enumerations used by [Structures/AmmoData](https://wiki.facepunch.com/gmod/Structures/AmmoData).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/TRACER
--- Generates no tracer effects
---@readonly
TRACER_NONE = 0
--- Generates tracer effects
---@readonly
TRACER_LINE = 1
--- Unused.
---@readonly
TRACER_RAIL = 2
--- Unused.
---@readonly
TRACER_BEAM = 3
--- Generates tracer and makes whizzing noises if the bullet flies past the player being shot at
---@readonly
TRACER_LINE_AND_WHIZ = 4

---@enum TRACER : number
---| TRACER_NONE # Generates no tracer effects
---| TRACER_LINE # Generates tracer effects
---| TRACER_RAIL # Unused.
---| TRACER_BEAM # Unused.
---| TRACER_LINE_AND_WHIZ # Generates tracer and makes whizzing noises if the bullet flies past the player being shot at

--- Enumerations used in [ENTITY:UpdateTransmitState](https://wiki.facepunch.com/gmod/ENTITY:UpdateTransmitState) hook.
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/TRANSMIT
--- Always transmit the entity
---@readonly
TRANSMIT_ALWAYS = 0
--- Never transmit the entity, default for point entities
---@readonly
TRANSMIT_NEVER = 1
--- Transmit when entity is in players [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community")
---@readonly
TRANSMIT_PVS = 2

---@enum TRANSMIT : number
---| TRANSMIT_ALWAYS # Always transmit the entity
---| TRANSMIT_NEVER # Never transmit the entity, default for point entities
---| TRANSMIT_PVS # Transmit when entity is in players [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community")

--- Enumerations used by [net.ReadType](https://wiki.facepunch.com/gmod/net.ReadType) and returned by [Global.TypeID](https://wiki.facepunch.com/gmod/Global.TypeID)
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Enums/TYPE
--- Invalid type
---@readonly
TYPE_NONE = -1
--- Use TYPE_NONE
---@deprecated Use TYPE_NONE
---@readonly
TYPE_INVALID = -1
--- [nil](https://wiki.facepunch.com/gmod/nil)
---@readonly
TYPE_NIL = 0
--- [boolean](https://wiki.facepunch.com/gmod/boolean)
---@readonly
TYPE_BOOL = 1
--- [light userdata](https://wiki.facepunch.com/gmod/userdata#lightuserdata)
---@readonly
TYPE_LIGHTUSERDATA = 2
--- [number](https://wiki.facepunch.com/gmod/number)
---@readonly
TYPE_NUMBER = 3
--- [string](https://wiki.facepunch.com/gmod/string)
---@readonly
TYPE_STRING = 4
--- [table](https://wiki.facepunch.com/gmod/table)
---@readonly
TYPE_TABLE = 5
--- [function](https://wiki.facepunch.com/gmod/function)
---@readonly
TYPE_FUNCTION = 6
--- [userdata](https://wiki.facepunch.com/gmod/userdata)
---@readonly
TYPE_USERDATA = 7
--- [thread](https://wiki.facepunch.com/gmod/thread)
---@readonly
TYPE_THREAD = 8
--- [Entity](https://wiki.facepunch.com/gmod/Entity) and entity sub-classes including [Player](https://wiki.facepunch.com/gmod/Player), [Weapon](https://wiki.facepunch.com/gmod/Weapon), [NPC](https://wiki.facepunch.com/gmod/NPC), [Vehicle](https://wiki.facepunch.com/gmod/Vehicle), [CSEnt](https://wiki.facepunch.com/gmod/CSEnt), and [NextBot](https://wiki.facepunch.com/gmod/NextBot)
---@readonly
TYPE_ENTITY = 9
--- [Vector](https://wiki.facepunch.com/gmod/Vector)
---@readonly
TYPE_VECTOR = 10
--- [Angle](https://wiki.facepunch.com/gmod/Angle)
---@readonly
TYPE_ANGLE = 11
--- [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)
---@readonly
TYPE_PHYSOBJ = 12
--- [ISave](https://wiki.facepunch.com/gmod/ISave)
---@readonly
TYPE_SAVE = 13
--- [IRestore](https://wiki.facepunch.com/gmod/IRestore)
---@readonly
TYPE_RESTORE = 14
--- [CTakeDamageInfo](https://wiki.facepunch.com/gmod/CTakeDamageInfo)
---@readonly
TYPE_DAMAGEINFO = 15
--- [CEffectData](https://wiki.facepunch.com/gmod/CEffectData)
---@readonly
TYPE_EFFECTDATA = 16
--- [CMoveData](https://wiki.facepunch.com/gmod/CMoveData)
---@readonly
TYPE_MOVEDATA = 17
--- [CRecipientFilter](https://wiki.facepunch.com/gmod/CRecipientFilter)
---@readonly
TYPE_RECIPIENTFILTER = 18
--- [CUserCmd](https://wiki.facepunch.com/gmod/CUserCmd)
---@readonly
TYPE_USERCMD = 19
--- Leftover from GMod 13 Beta
---@deprecated Leftover from GMod 13 Beta
---@readonly
TYPE_SCRIPTEDVEHICLE = 20
--- [IMaterial](https://wiki.facepunch.com/gmod/IMaterial)
---@readonly
TYPE_MATERIAL = 21
--- [Panel](https://wiki.facepunch.com/gmod/Panel)
---@readonly
TYPE_PANEL = 22
--- [CLuaParticle](https://wiki.facepunch.com/gmod/CLuaParticle)
---@readonly
TYPE_PARTICLE = 23
--- [CLuaEmitter](https://wiki.facepunch.com/gmod/CLuaEmitter)
---@readonly
TYPE_PARTICLEEMITTER = 24
--- [ITexture](https://wiki.facepunch.com/gmod/ITexture)
---@readonly
TYPE_TEXTURE = 25
--- [bf_read](https://wiki.facepunch.com/gmod/bf_read)
---@readonly
TYPE_USERMSG = 26
--- [ConVar](https://wiki.facepunch.com/gmod/ConVar)
---@readonly
TYPE_CONVAR = 27
--- [IMesh](https://wiki.facepunch.com/gmod/IMesh)
---@readonly
TYPE_IMESH = 28
--- [VMatrix](https://wiki.facepunch.com/gmod/VMatrix)
---@readonly
TYPE_MATRIX = 29
--- [CSoundPatch](https://wiki.facepunch.com/gmod/CSoundPatch)
---@readonly
TYPE_SOUND = 30
--- [pixelvis_handle_t](https://wiki.facepunch.com/gmod/pixelvis_handle_t)
---@readonly
TYPE_PIXELVISHANDLE = 31
--- dlight_t. Metatable of a [Structures/DynamicLight](https://wiki.facepunch.com/gmod/Structures/DynamicLight)
---@readonly
TYPE_DLIGHT = 32
--- [IVideoWriter](https://wiki.facepunch.com/gmod/IVideoWriter)
---@readonly
TYPE_VIDEO = 33
--- [File](https://wiki.facepunch.com/gmod/File)
---@readonly
TYPE_FILE = 34
--- [CLuaLocomotion](https://wiki.facepunch.com/gmod/CLuaLocomotion)
---@readonly
TYPE_LOCOMOTION = 35
--- [PathFollower](https://wiki.facepunch.com/gmod/PathFollower)
---@readonly
TYPE_PATH = 36
--- [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)
---@readonly
TYPE_NAVAREA = 37
--- [IGModAudioChannel](https://wiki.facepunch.com/gmod/IGModAudioChannel)
---@readonly
TYPE_SOUNDHANDLE = 38
--- [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder)
---@readonly
TYPE_NAVLADDER = 39
--- [CNewParticleEffect](https://wiki.facepunch.com/gmod/CNewParticleEffect)
---@readonly
TYPE_PARTICLESYSTEM = 40
--- [ProjectedTexture](https://wiki.facepunch.com/gmod/ProjectedTexture)
---@readonly
TYPE_PROJECTEDTEXTURE = 41
--- [PhysCollide](https://wiki.facepunch.com/gmod/PhysCollide)
---@readonly
TYPE_PHYSCOLLIDE = 42
--- [SurfaceInfo](https://wiki.facepunch.com/gmod/SurfaceInfo)
---@readonly
TYPE_SURFACEINFO = 43
--- Amount of TYPE_* enums
---@readonly
TYPE_COUNT = 44
--- Metatable of a [Color](https://wiki.facepunch.com/gmod/Color).
---
--- **NOTE**: This doesn't actually represent a unique type returned by [Global.TypeID](https://wiki.facepunch.com/gmod/Global.TypeID), but instead is a hack for networking colors with [net.WriteType](https://wiki.facepunch.com/gmod/net.WriteType).
---@readonly
TYPE_COLOR = 255

---@enum TYPE : number
---| TYPE_NONE # Invalid type
---| TYPE_INVALID # Use TYPE_NONE
---| TYPE_NIL # [nil](https://wiki.facepunch.com/gmod/nil)
---| TYPE_BOOL # [boolean](https://wiki.facepunch.com/gmod/boolean)
---| TYPE_LIGHTUSERDATA # [light userdata](https://wiki.facepunch.com/gmod/userdata#lightuserdata)
---| TYPE_NUMBER # [number](https://wiki.facepunch.com/gmod/number)
---| TYPE_STRING # [string](https://wiki.facepunch.com/gmod/string)
---| TYPE_TABLE # [table](https://wiki.facepunch.com/gmod/table)
---| TYPE_FUNCTION # [function](https://wiki.facepunch.com/gmod/function)
---| TYPE_USERDATA # [userdata](https://wiki.facepunch.com/gmod/userdata)
---| TYPE_THREAD # [thread](https://wiki.facepunch.com/gmod/thread)
---| TYPE_ENTITY # [Entity](https://wiki.facepunch.com/gmod/Entity) and entity sub-classes including [Player](https://wiki.facepunch.com/gmod/Player), [Weapon](https://wiki.facepunch.com/gmod/Weapon), [NPC](https://wiki.facepunch.com/gmod/NPC), [Vehicle](https://wiki.facepunch.com/gmod/Vehicle), [CSEnt](https://wiki.facepunch.com/gmod/CSEnt), and [NextBot](https://wiki.facepunch.com/gmod/NextBot)
---| TYPE_VECTOR # [Vector](https://wiki.facepunch.com/gmod/Vector)
---| TYPE_ANGLE # [Angle](https://wiki.facepunch.com/gmod/Angle)
---| TYPE_PHYSOBJ # [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)
---| TYPE_SAVE # [ISave](https://wiki.facepunch.com/gmod/ISave)
---| TYPE_RESTORE # [IRestore](https://wiki.facepunch.com/gmod/IRestore)
---| TYPE_DAMAGEINFO # [CTakeDamageInfo](https://wiki.facepunch.com/gmod/CTakeDamageInfo)
---| TYPE_EFFECTDATA # [CEffectData](https://wiki.facepunch.com/gmod/CEffectData)
---| TYPE_MOVEDATA # [CMoveData](https://wiki.facepunch.com/gmod/CMoveData)
---| TYPE_RECIPIENTFILTER # [CRecipientFilter](https://wiki.facepunch.com/gmod/CRecipientFilter)
---| TYPE_USERCMD # [CUserCmd](https://wiki.facepunch.com/gmod/CUserCmd)
---| TYPE_SCRIPTEDVEHICLE # Leftover from GMod 13 Beta
---| TYPE_MATERIAL # [IMaterial](https://wiki.facepunch.com/gmod/IMaterial)
---| TYPE_PANEL # [Panel](https://wiki.facepunch.com/gmod/Panel)
---| TYPE_PARTICLE # [CLuaParticle](https://wiki.facepunch.com/gmod/CLuaParticle)
---| TYPE_PARTICLEEMITTER # [CLuaEmitter](https://wiki.facepunch.com/gmod/CLuaEmitter)
---| TYPE_TEXTURE # [ITexture](https://wiki.facepunch.com/gmod/ITexture)
---| TYPE_USERMSG # [bf_read](https://wiki.facepunch.com/gmod/bf_read)
---| TYPE_CONVAR # [ConVar](https://wiki.facepunch.com/gmod/ConVar)
---| TYPE_IMESH # [IMesh](https://wiki.facepunch.com/gmod/IMesh)
---| TYPE_MATRIX # [VMatrix](https://wiki.facepunch.com/gmod/VMatrix)
---| TYPE_SOUND # [CSoundPatch](https://wiki.facepunch.com/gmod/CSoundPatch)
---| TYPE_PIXELVISHANDLE # [pixelvis_handle_t](https://wiki.facepunch.com/gmod/pixelvis_handle_t)
---| TYPE_DLIGHT # dlight_t. Metatable of a [Structures/DynamicLight](https://wiki.facepunch.com/gmod/Structures/DynamicLight)
---| TYPE_VIDEO # [IVideoWriter](https://wiki.facepunch.com/gmod/IVideoWriter)
---| TYPE_FILE # [File](https://wiki.facepunch.com/gmod/File)
---| TYPE_LOCOMOTION # [CLuaLocomotion](https://wiki.facepunch.com/gmod/CLuaLocomotion)
---| TYPE_PATH # [PathFollower](https://wiki.facepunch.com/gmod/PathFollower)
---| TYPE_NAVAREA # [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)
---| TYPE_SOUNDHANDLE # [IGModAudioChannel](https://wiki.facepunch.com/gmod/IGModAudioChannel)
---| TYPE_NAVLADDER # [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder)
---| TYPE_PARTICLESYSTEM # [CNewParticleEffect](https://wiki.facepunch.com/gmod/CNewParticleEffect)
---| TYPE_PROJECTEDTEXTURE # [ProjectedTexture](https://wiki.facepunch.com/gmod/ProjectedTexture)
---| TYPE_PHYSCOLLIDE # [PhysCollide](https://wiki.facepunch.com/gmod/PhysCollide)
---| TYPE_SURFACEINFO # [SurfaceInfo](https://wiki.facepunch.com/gmod/SurfaceInfo)
---| TYPE_COUNT # Amount of TYPE_* enums
---| TYPE_COLOR # Metatable of a [Color](https://wiki.facepunch.com/gmod/Color).  **NOTE**: This doesn't actually represent a unique type returned by [Global.TypeID](https://wiki.facepunch.com/gmod/Global.TypeID), but instead is a hack for networking colors with [net.WriteType](https://wiki.facepunch.com/gmod/net.WriteType).

--- Enumerations used by [ENTITY:Use](https://wiki.facepunch.com/gmod/ENTITY:Use).
---
--- Not to be confused with [Enums/_USE](https://wiki.facepunch.com/gmod/Enums/_USE) used by [Entity:SetUseType](https://wiki.facepunch.com/gmod/Entity:SetUseType).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/USE
---@readonly
USE_OFF = 0
---@readonly
USE_ON = 1
---@readonly
USE_SET = 2
---@readonly
USE_TOGGLE = 3

---@enum USE : number
---| USE_OFF
---| USE_ON
---| USE_SET
---| USE_TOGGLE

--- Enumerations used by [render.RenderView](https://wiki.facepunch.com/gmod/render.RenderView) inside of [Structures/ViewData](https://wiki.facepunch.com/gmod/Structures/ViewData).
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/VIEW
--- Default value
---@readonly
VIEW_MAIN = 0
--- 3D skybox
---@readonly
VIEW_3DSKY = 1
--- Rendering for `_rt_Camera` base texture material (`func_monitor`, `info_camera_link`).
---@readonly
VIEW_MONITOR = 2
--- Water reflection
---@readonly
VIEW_REFLECTION = 3
--- Water refraction
---@readonly
VIEW_REFRACTION = 4
--- Used by `script_intro` entity.
---@readonly
VIEW_INTRO_PLAYER = 5
--- Used by `script_intro` entity.
---@readonly
VIEW_INTRO_CAMERA = 6
--- Internally used for [Global.ProjectedTexture](https://wiki.facepunch.com/gmod/Global.ProjectedTexture) and flashlight.
---@readonly
VIEW_SHADOW_DEPTH_TEXTURE = 7
--- For SSAO depth. Can be accessed via [render.GetResolvedFullFrameDepth](https://wiki.facepunch.com/gmod/render.GetResolvedFullFrameDepth).
---@readonly
VIEW_SSAO = 8

---@enum VIEW : number
---| VIEW_MAIN # Default value
---| VIEW_3DSKY # 3D skybox
---| VIEW_MONITOR # Rendering for `_rt_Camera` base texture material (`func_monitor`, `info_camera_link`).
---| VIEW_REFLECTION # Water reflection
---| VIEW_REFRACTION # Water refraction
---| VIEW_INTRO_PLAYER # Used by `script_intro` entity.
---| VIEW_INTRO_CAMERA # Used by `script_intro` entity.
---| VIEW_SHADOW_DEPTH_TEXTURE # Internally used for [Global.ProjectedTexture](https://wiki.facepunch.com/gmod/Global.ProjectedTexture) and flashlight.
---| VIEW_SSAO # For SSAO depth. Can be accessed via [render.GetResolvedFullFrameDepth](https://wiki.facepunch.com/gmod/render.GetResolvedFullFrameDepth).

--- Enumerations used by [NPC:SetCurrentWeaponProficiency](https://wiki.facepunch.com/gmod/NPC:SetCurrentWeaponProficiency) and
--- [NPC:GetCurrentWeaponProficiency](https://wiki.facepunch.com/gmod/NPC:GetCurrentWeaponProficiency).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/WEAPON_PROFICIENCY
--- The NPC will miss a large majority of their shots.
---@readonly
WEAPON_PROFICIENCY_POOR = 0
--- The NPC will miss about half of their shots.
---@readonly
WEAPON_PROFICIENCY_AVERAGE = 1
--- The NPC will sometimes miss their shots.
---@readonly
WEAPON_PROFICIENCY_GOOD = 2
--- The NPC will rarely miss their shots.
---@readonly
WEAPON_PROFICIENCY_VERY_GOOD = 3
--- The NPC will almost never miss their shots.
---@readonly
WEAPON_PROFICIENCY_PERFECT = 4

---@enum WEAPON_PROFICIENCY : number
---| WEAPON_PROFICIENCY_POOR # The NPC will miss a large majority of their shots.
---| WEAPON_PROFICIENCY_AVERAGE # The NPC will miss about half of their shots.
---| WEAPON_PROFICIENCY_GOOD # The NPC will sometimes miss their shots.
---| WEAPON_PROFICIENCY_VERY_GOOD # The NPC will rarely miss their shots.
---| WEAPON_PROFICIENCY_PERFECT # The NPC will almost never miss their shots.
