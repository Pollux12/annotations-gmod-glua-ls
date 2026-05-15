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

---@alias _USE
---| number # Raw numeric enum value
---| 0 # CONTINUOUS_USE
---| 1 # ONOFF_USE
---| 2 # DIRECTIONAL_USE
---| 3 # SIMPLE_USE

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

---@alias ACT
---| number # Raw numeric enum value
---| -1 # ACT_INVALID
---| 0 # ACT_RESET
---| 1 # ACT_IDLE
---| 2 # ACT_TRANSITION
---| 3 # ACT_COVER
---| 4 # ACT_COVER_MED
---| 5 # ACT_COVER_LOW
---| 6 # ACT_WALK
---| 7 # ACT_WALK_AIM
---| 8 # ACT_WALK_CROUCH
---| 9 # ACT_WALK_CROUCH_AIM
---| 10 # ACT_RUN
---| 11 # ACT_RUN_AIM
---| 12 # ACT_RUN_CROUCH
---| 13 # ACT_RUN_CROUCH_AIM
---| 14 # ACT_RUN_PROTECTED
---| 15 # ACT_SCRIPT_CUSTOM_MOVE
---| 16 # ACT_RANGE_ATTACK1
---| 17 # ACT_RANGE_ATTACK2
---| 18 # ACT_RANGE_ATTACK1_LOW
---| 19 # ACT_RANGE_ATTACK2_LOW
---| 20 # ACT_DIESIMPLE
---| 21 # ACT_DIEBACKWARD
---| 22 # ACT_DIEFORWARD
---| 23 # ACT_DIEVIOLENT
---| 24 # ACT_DIERAGDOLL
---| 25 # ACT_FLY
---| 26 # ACT_HOVER
---| 27 # ACT_GLIDE
---| 28 # ACT_SWIM
---| 29 # ACT_SWIM_IDLE
---| 30 # ACT_JUMP
---| 31 # ACT_HOP
---| 32 # ACT_LEAP
---| 33 # ACT_LAND
---| 34 # ACT_CLIMB_UP
---| 35 # ACT_CLIMB_DOWN
---| 36 # ACT_CLIMB_DISMOUNT
---| 37 # ACT_SHIPLADDER_UP
---| 38 # ACT_SHIPLADDER_DOWN
---| 39 # ACT_STRAFE_LEFT
---| 40 # ACT_STRAFE_RIGHT
---| 41 # ACT_ROLL_LEFT
---| 42 # ACT_ROLL_RIGHT
---| 43 # ACT_TURN_LEFT
---| 44 # ACT_TURN_RIGHT
---| 45 # ACT_CROUCH
---| 46 # ACT_CROUCHIDLE
---| 47 # ACT_STAND
---| 48 # ACT_USE
---| 49 # ACT_SIGNAL1
---| 50 # ACT_SIGNAL2
---| 51 # ACT_SIGNAL3
---| 52 # ACT_SIGNAL_ADVANCE
---| 53 # ACT_SIGNAL_FORWARD
---| 54 # ACT_SIGNAL_GROUP
---| 55 # ACT_SIGNAL_HALT
---| 56 # ACT_SIGNAL_LEFT
---| 57 # ACT_SIGNAL_RIGHT
---| 58 # ACT_SIGNAL_TAKECOVER
---| 59 # ACT_LOOKBACK_RIGHT
---| 60 # ACT_LOOKBACK_LEFT
---| 61 # ACT_COWER
---| 62 # ACT_SMALL_FLINCH
---| 63 # ACT_BIG_FLINCH
---| 64 # ACT_MELEE_ATTACK1
---| 65 # ACT_MELEE_ATTACK2
---| 66 # ACT_RELOAD
---| 67 # ACT_RELOAD_START
---| 68 # ACT_RELOAD_FINISH
---| 69 # ACT_RELOAD_LOW
---| 70 # ACT_ARM
---| 71 # ACT_DISARM
---| 72 # ACT_DROP_WEAPON
---| 73 # ACT_DROP_WEAPON_SHOTGUN
---| 74 # ACT_PICKUP_GROUND
---| 75 # ACT_PICKUP_RACK
---| 76 # ACT_IDLE_ANGRY
---| 77 # ACT_IDLE_RELAXED
---| 78 # ACT_IDLE_STIMULATED
---| 79 # ACT_IDLE_AGITATED
---| 80 # ACT_IDLE_STEALTH
---| 81 # ACT_IDLE_HURT
---| 82 # ACT_WALK_RELAXED
---| 83 # ACT_WALK_STIMULATED
---| 84 # ACT_WALK_AGITATED
---| 85 # ACT_WALK_STEALTH
---| 86 # ACT_RUN_RELAXED
---| 87 # ACT_RUN_STIMULATED
---| 88 # ACT_RUN_AGITATED
---| 89 # ACT_RUN_STEALTH
---| 90 # ACT_IDLE_AIM_RELAXED
---| 91 # ACT_IDLE_AIM_STIMULATED
---| 92 # ACT_IDLE_AIM_AGITATED
---| 93 # ACT_IDLE_AIM_STEALTH
---| 94 # ACT_WALK_AIM_RELAXED
---| 95 # ACT_WALK_AIM_STIMULATED
---| 96 # ACT_WALK_AIM_AGITATED
---| 97 # ACT_WALK_AIM_STEALTH
---| 98 # ACT_RUN_AIM_RELAXED
---| 99 # ACT_RUN_AIM_STIMULATED
---| 100 # ACT_RUN_AIM_AGITATED
---| 101 # ACT_RUN_AIM_STEALTH
---| 102 # ACT_CROUCHIDLE_STIMULATED
---| 103 # ACT_CROUCHIDLE_AIM_STIMULATED
---| 104 # ACT_CROUCHIDLE_AGITATED
---| 105 # ACT_WALK_HURT
---| 106 # ACT_RUN_HURT
---| 107 # ACT_SPECIAL_ATTACK1
---| 108 # ACT_SPECIAL_ATTACK2
---| 109 # ACT_COMBAT_IDLE
---| 110 # ACT_WALK_SCARED
---| 111 # ACT_RUN_SCARED
---| 112 # ACT_VICTORY_DANCE
---| 113 # ACT_DIE_HEADSHOT
---| 114 # ACT_DIE_CHESTSHOT
---| 115 # ACT_DIE_GUTSHOT
---| 116 # ACT_DIE_BACKSHOT
---| 117 # ACT_FLINCH_HEAD
---| 118 # ACT_FLINCH_CHEST
---| 119 # ACT_FLINCH_STOMACH
---| 120 # ACT_FLINCH_LEFTARM
---| 121 # ACT_FLINCH_RIGHTARM
---| 122 # ACT_FLINCH_LEFTLEG
---| 123 # ACT_FLINCH_RIGHTLEG
---| 124 # ACT_FLINCH_PHYSICS
---| 125 # ACT_IDLE_ON_FIRE
---| 126 # ACT_WALK_ON_FIRE
---| 127 # ACT_RUN_ON_FIRE
---| 128 # ACT_RAPPEL_LOOP
---| 129 # ACT_180_LEFT
---| 130 # ACT_180_RIGHT
---| 131 # ACT_90_LEFT
---| 132 # ACT_90_RIGHT
---| 133 # ACT_STEP_LEFT
---| 134 # ACT_STEP_RIGHT
---| 135 # ACT_STEP_BACK
---| 136 # ACT_STEP_FORE
---| 137 # ACT_GESTURE_RANGE_ATTACK1
---| 138 # ACT_GESTURE_RANGE_ATTACK2
---| 139 # ACT_GESTURE_MELEE_ATTACK1
---| 140 # ACT_GESTURE_MELEE_ATTACK2
---| 141 # ACT_GESTURE_RANGE_ATTACK1_LOW
---| 142 # ACT_GESTURE_RANGE_ATTACK2_LOW
---| 143 # ACT_MELEE_ATTACK_SWING_GESTURE
---| 144 # ACT_GESTURE_SMALL_FLINCH
---| 145 # ACT_GESTURE_BIG_FLINCH
---| 146 # ACT_GESTURE_FLINCH_BLAST
---| 147 # ACT_GESTURE_FLINCH_BLAST_SHOTGUN
---| 148 # ACT_GESTURE_FLINCH_BLAST_DAMAGED
---| 149 # ACT_GESTURE_FLINCH_BLAST_DAMAGED_SHOTGUN
---| 150 # ACT_GESTURE_FLINCH_HEAD
---| 151 # ACT_GESTURE_FLINCH_CHEST
---| 152 # ACT_GESTURE_FLINCH_STOMACH
---| 153 # ACT_GESTURE_FLINCH_LEFTARM
---| 154 # ACT_GESTURE_FLINCH_RIGHTARM
---| 155 # ACT_GESTURE_FLINCH_LEFTLEG
---| 156 # ACT_GESTURE_FLINCH_RIGHTLEG
---| 157 # ACT_GESTURE_TURN_LEFT
---| 158 # ACT_GESTURE_TURN_RIGHT
---| 159 # ACT_GESTURE_TURN_LEFT45
---| 160 # ACT_GESTURE_TURN_RIGHT45
---| 161 # ACT_GESTURE_TURN_LEFT90
---| 162 # ACT_GESTURE_TURN_RIGHT90
---| 163 # ACT_GESTURE_TURN_LEFT45_FLAT
---| 164 # ACT_GESTURE_TURN_RIGHT45_FLAT
---| 165 # ACT_GESTURE_TURN_LEFT90_FLAT
---| 166 # ACT_GESTURE_TURN_RIGHT90_FLAT
---| 167 # ACT_BARNACLE_HIT
---| 168 # ACT_BARNACLE_PULL
---| 169 # ACT_BARNACLE_CHOMP
---| 170 # ACT_BARNACLE_CHEW
---| 171 # ACT_DO_NOT_DISTURB
---| 172 # ACT_VM_DRAW
---| 173 # ACT_VM_HOLSTER
---| 174 # ACT_VM_IDLE
---| 175 # ACT_VM_FIDGET
---| 176 # ACT_VM_PULLBACK
---| 177 # ACT_VM_PULLBACK_HIGH
---| 178 # ACT_VM_PULLBACK_LOW
---| 179 # ACT_VM_THROW
---| 180 # ACT_VM_PULLPIN
---| 181 # ACT_VM_PRIMARYATTACK
---| 182 # ACT_VM_SECONDARYATTACK
---| 183 # ACT_VM_RELOAD
---| 186 # ACT_VM_DRYFIRE
---| 187 # ACT_VM_HITLEFT
---| 188 # ACT_VM_HITLEFT2
---| 189 # ACT_VM_HITRIGHT
---| 190 # ACT_VM_HITRIGHT2
---| 191 # ACT_VM_HITCENTER
---| 192 # ACT_VM_HITCENTER2
---| 193 # ACT_VM_MISSLEFT
---| 194 # ACT_VM_MISSLEFT2
---| 195 # ACT_VM_MISSRIGHT
---| 196 # ACT_VM_MISSRIGHT2
---| 197 # ACT_VM_MISSCENTER
---| 198 # ACT_VM_MISSCENTER2
---| 199 # ACT_VM_HAULBACK
---| 200 # ACT_VM_SWINGHARD
---| 201 # ACT_VM_SWINGMISS
---| 202 # ACT_VM_SWINGHIT
---| 203 # ACT_VM_IDLE_TO_LOWERED
---| 204 # ACT_VM_IDLE_LOWERED
---| 205 # ACT_VM_LOWERED_TO_IDLE
---| 206 # ACT_VM_RECOIL1
---| 207 # ACT_VM_RECOIL2
---| 208 # ACT_VM_RECOIL3
---| 209 # ACT_VM_PICKUP
---| 210 # ACT_VM_RELEASE
---| 211 # ACT_VM_ATTACH_SILENCER
---| 212 # ACT_VM_DETACH_SILENCER
---| 229 # ACT_SLAM_STICKWALL_IDLE
---| 230 # ACT_SLAM_STICKWALL_ND_IDLE
---| 231 # ACT_SLAM_STICKWALL_ATTACH
---| 232 # ACT_SLAM_STICKWALL_ATTACH2
---| 233 # ACT_SLAM_STICKWALL_ND_ATTACH
---| 234 # ACT_SLAM_STICKWALL_ND_ATTACH2
---| 235 # ACT_SLAM_STICKWALL_DETONATE
---| 236 # ACT_SLAM_STICKWALL_DETONATOR_HOLSTER
---| 237 # ACT_SLAM_STICKWALL_DRAW
---| 238 # ACT_SLAM_STICKWALL_ND_DRAW
---| 239 # ACT_SLAM_STICKWALL_TO_THROW
---| 240 # ACT_SLAM_STICKWALL_TO_THROW_ND
---| 241 # ACT_SLAM_STICKWALL_TO_TRIPMINE_ND
---| 242 # ACT_SLAM_THROW_IDLE
---| 243 # ACT_SLAM_THROW_ND_IDLE
---| 244 # ACT_SLAM_THROW_THROW
---| 245 # ACT_SLAM_THROW_THROW2
---| 246 # ACT_SLAM_THROW_THROW_ND
---| 247 # ACT_SLAM_THROW_THROW_ND2
---| 248 # ACT_SLAM_THROW_DRAW
---| 249 # ACT_SLAM_THROW_ND_DRAW
---| 250 # ACT_SLAM_THROW_TO_STICKWALL
---| 251 # ACT_SLAM_THROW_TO_STICKWALL_ND
---| 252 # ACT_SLAM_THROW_DETONATE
---| 253 # ACT_SLAM_THROW_DETONATOR_HOLSTER
---| 254 # ACT_SLAM_THROW_TO_TRIPMINE_ND
---| 255 # ACT_SLAM_TRIPMINE_IDLE
---| 256 # ACT_SLAM_TRIPMINE_DRAW
---| 257 # ACT_SLAM_TRIPMINE_ATTACH
---| 258 # ACT_SLAM_TRIPMINE_ATTACH2
---| 259 # ACT_SLAM_TRIPMINE_TO_STICKWALL_ND
---| 260 # ACT_SLAM_TRIPMINE_TO_THROW_ND
---| 261 # ACT_SLAM_DETONATOR_IDLE
---| 262 # ACT_SLAM_DETONATOR_DRAW
---| 263 # ACT_SLAM_DETONATOR_DETONATE
---| 264 # ACT_SLAM_DETONATOR_HOLSTER
---| 265 # ACT_SLAM_DETONATOR_STICKWALL_DRAW
---| 266 # ACT_SLAM_DETONATOR_THROW_DRAW
---| 267 # ACT_SHOTGUN_RELOAD_START
---| 268 # ACT_SHOTGUN_RELOAD_FINISH
---| 269 # ACT_SHOTGUN_PUMP
---| 270 # ACT_SMG2_IDLE2
---| 271 # ACT_SMG2_FIRE2
---| 272 # ACT_SMG2_DRAW2
---| 273 # ACT_SMG2_RELOAD2
---| 274 # ACT_SMG2_DRYFIRE2
---| 275 # ACT_SMG2_TOAUTO
---| 276 # ACT_SMG2_TOBURST
---| 277 # ACT_PHYSCANNON_UPGRADE
---| 278 # ACT_RANGE_ATTACK_AR1
---| 279 # ACT_RANGE_ATTACK_AR2
---| 280 # ACT_RANGE_ATTACK_AR2_LOW
---| 281 # ACT_RANGE_ATTACK_AR2_GRENADE
---| 282 # ACT_RANGE_ATTACK_HMG1
---| 283 # ACT_RANGE_ATTACK_ML
---| 284 # ACT_RANGE_ATTACK_SMG1
---| 285 # ACT_RANGE_ATTACK_SMG1_LOW
---| 286 # ACT_RANGE_ATTACK_SMG2
---| 287 # ACT_RANGE_ATTACK_SHOTGUN
---| 288 # ACT_RANGE_ATTACK_SHOTGUN_LOW
---| 289 # ACT_RANGE_ATTACK_PISTOL
---| 290 # ACT_RANGE_ATTACK_PISTOL_LOW
---| 291 # ACT_RANGE_ATTACK_SLAM
---| 292 # ACT_RANGE_ATTACK_TRIPWIRE
---| 293 # ACT_RANGE_ATTACK_THROW
---| 294 # ACT_RANGE_ATTACK_SNIPER_RIFLE
---| 295 # ACT_RANGE_ATTACK_RPG
---| 296 # ACT_MELEE_ATTACK_SWING
---| 297 # ACT_RANGE_AIM_LOW
---| 298 # ACT_RANGE_AIM_SMG1_LOW
---| 299 # ACT_RANGE_AIM_PISTOL_LOW
---| 300 # ACT_RANGE_AIM_AR2_LOW
---| 301 # ACT_COVER_PISTOL_LOW
---| 302 # ACT_COVER_SMG1_LOW
---| 303 # ACT_GESTURE_RANGE_ATTACK_AR1
---| 304 # ACT_GESTURE_RANGE_ATTACK_AR2
---| 305 # ACT_GESTURE_RANGE_ATTACK_AR2_GRENADE
---| 306 # ACT_GESTURE_RANGE_ATTACK_HMG1
---| 307 # ACT_GESTURE_RANGE_ATTACK_ML
---| 308 # ACT_GESTURE_RANGE_ATTACK_SMG1
---| 309 # ACT_GESTURE_RANGE_ATTACK_SMG1_LOW
---| 310 # ACT_GESTURE_RANGE_ATTACK_SMG2
---| 311 # ACT_GESTURE_RANGE_ATTACK_SHOTGUN
---| 312 # ACT_GESTURE_RANGE_ATTACK_PISTOL
---| 313 # ACT_GESTURE_RANGE_ATTACK_PISTOL_LOW
---| 314 # ACT_GESTURE_RANGE_ATTACK_SLAM
---| 315 # ACT_GESTURE_RANGE_ATTACK_TRIPWIRE
---| 316 # ACT_GESTURE_RANGE_ATTACK_THROW
---| 317 # ACT_GESTURE_RANGE_ATTACK_SNIPER_RIFLE
---| 318 # ACT_GESTURE_MELEE_ATTACK_SWING
---| 319 # ACT_IDLE_RIFLE
---| 320 # ACT_IDLE_SMG1
---| 321 # ACT_IDLE_ANGRY_SMG1
---| 322 # ACT_IDLE_PISTOL
---| 323 # ACT_IDLE_ANGRY_PISTOL
---| 324 # ACT_IDLE_ANGRY_SHOTGUN
---| 325 # ACT_IDLE_STEALTH_PISTOL
---| 326 # ACT_IDLE_PACKAGE
---| 327 # ACT_WALK_PACKAGE
---| 328 # ACT_IDLE_SUITCASE
---| 329 # ACT_WALK_SUITCASE
---| 330 # ACT_IDLE_SMG1_RELAXED
---| 331 # ACT_IDLE_SMG1_STIMULATED
---| 332 # ACT_WALK_RIFLE_RELAXED
---| 333 # ACT_RUN_RIFLE_RELAXED
---| 334 # ACT_WALK_RIFLE_STIMULATED
---| 335 # ACT_RUN_RIFLE_STIMULATED
---| 336 # ACT_IDLE_AIM_RIFLE_STIMULATED
---| 337 # ACT_WALK_AIM_RIFLE_STIMULATED
---| 338 # ACT_RUN_AIM_RIFLE_STIMULATED
---| 339 # ACT_IDLE_SHOTGUN_RELAXED
---| 340 # ACT_IDLE_SHOTGUN_STIMULATED
---| 341 # ACT_IDLE_SHOTGUN_AGITATED
---| 342 # ACT_WALK_ANGRY
---| 343 # ACT_POLICE_HARASS1
---| 344 # ACT_POLICE_HARASS2
---| 345 # ACT_IDLE_MANNEDGUN
---| 346 # ACT_IDLE_MELEE
---| 347 # ACT_IDLE_ANGRY_MELEE
---| 348 # ACT_IDLE_RPG_RELAXED
---| 349 # ACT_IDLE_RPG
---| 350 # ACT_IDLE_ANGRY_RPG
---| 351 # ACT_COVER_LOW_RPG
---| 352 # ACT_WALK_RPG
---| 353 # ACT_RUN_RPG
---| 354 # ACT_WALK_CROUCH_RPG
---| 355 # ACT_RUN_CROUCH_RPG
---| 356 # ACT_WALK_RPG_RELAXED
---| 357 # ACT_RUN_RPG_RELAXED
---| 358 # ACT_WALK_RIFLE
---| 359 # ACT_WALK_AIM_RIFLE
---| 360 # ACT_WALK_CROUCH_RIFLE
---| 361 # ACT_WALK_CROUCH_AIM_RIFLE
---| 362 # ACT_RUN_RIFLE
---| 363 # ACT_RUN_AIM_RIFLE
---| 364 # ACT_RUN_CROUCH_RIFLE
---| 365 # ACT_RUN_CROUCH_AIM_RIFLE
---| 366 # ACT_RUN_STEALTH_PISTOL
---| 367 # ACT_WALK_AIM_SHOTGUN
---| 368 # ACT_RUN_AIM_SHOTGUN
---| 369 # ACT_WALK_PISTOL
---| 370 # ACT_RUN_PISTOL
---| 371 # ACT_WALK_AIM_PISTOL
---| 372 # ACT_RUN_AIM_PISTOL
---| 373 # ACT_WALK_STEALTH_PISTOL
---| 374 # ACT_WALK_AIM_STEALTH_PISTOL
---| 375 # ACT_RUN_AIM_STEALTH_PISTOL
---| 376 # ACT_RELOAD_PISTOL
---| 377 # ACT_RELOAD_PISTOL_LOW
---| 378 # ACT_RELOAD_SMG1
---| 379 # ACT_RELOAD_SMG1_LOW
---| 380 # ACT_RELOAD_SHOTGUN
---| 381 # ACT_RELOAD_SHOTGUN_LOW
---| 382 # ACT_GESTURE_RELOAD
---| 383 # ACT_GESTURE_RELOAD_PISTOL
---| 384 # ACT_GESTURE_RELOAD_SMG1
---| 385 # ACT_GESTURE_RELOAD_SHOTGUN
---| 386 # ACT_BUSY_LEAN_LEFT
---| 387 # ACT_BUSY_LEAN_LEFT_ENTRY
---| 388 # ACT_BUSY_LEAN_LEFT_EXIT
---| 389 # ACT_BUSY_LEAN_BACK
---| 390 # ACT_BUSY_LEAN_BACK_ENTRY
---| 391 # ACT_BUSY_LEAN_BACK_EXIT
---| 392 # ACT_BUSY_SIT_GROUND
---| 393 # ACT_BUSY_SIT_GROUND_ENTRY
---| 394 # ACT_BUSY_SIT_GROUND_EXIT
---| 395 # ACT_BUSY_SIT_CHAIR
---| 396 # ACT_BUSY_SIT_CHAIR_ENTRY
---| 397 # ACT_BUSY_SIT_CHAIR_EXIT
---| 398 # ACT_BUSY_STAND
---| 399 # ACT_BUSY_QUEUE
---| 400 # ACT_DUCK_DODGE
---| 401 # ACT_DIE_BARNACLE_SWALLOW
---| 402 # ACT_GESTURE_BARNACLE_STRANGLE
---| 403 # ACT_PHYSCANNON_DETACH
---| 404 # ACT_PHYSCANNON_ANIMATE
---| 405 # ACT_PHYSCANNON_ANIMATE_PRE
---| 406 # ACT_PHYSCANNON_ANIMATE_POST
---| 407 # ACT_DIE_FRONTSIDE
---| 408 # ACT_DIE_RIGHTSIDE
---| 409 # ACT_DIE_BACKSIDE
---| 410 # ACT_DIE_LEFTSIDE
---| 411 # ACT_OPEN_DOOR
---| 412 # ACT_DI_ALYX_ZOMBIE_MELEE
---| 413 # ACT_DI_ALYX_ZOMBIE_TORSO_MELEE
---| 414 # ACT_DI_ALYX_HEADCRAB_MELEE
---| 415 # ACT_DI_ALYX_ANTLION
---| 416 # ACT_DI_ALYX_ZOMBIE_SHOTGUN64
---| 417 # ACT_DI_ALYX_ZOMBIE_SHOTGUN26
---| 418 # ACT_READINESS_RELAXED_TO_STIMULATED
---| 419 # ACT_READINESS_RELAXED_TO_STIMULATED_WALK
---| 420 # ACT_READINESS_AGITATED_TO_STIMULATED
---| 421 # ACT_READINESS_STIMULATED_TO_RELAXED
---| 422 # ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED
---| 423 # ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED_WALK
---| 424 # ACT_READINESS_PISTOL_AGITATED_TO_STIMULATED
---| 425 # ACT_READINESS_PISTOL_STIMULATED_TO_RELAXED
---| 426 # ACT_IDLE_CARRY
---| 427 # ACT_WALK_CARRY
---| 428 # ACT_STARTDYING
---| 429 # ACT_DYINGLOOP
---| 430 # ACT_DYINGTODEAD
---| 431 # ACT_RIDE_MANNED_GUN
---| 432 # ACT_VM_SPRINT_ENTER
---| 433 # ACT_VM_SPRINT_IDLE
---| 434 # ACT_VM_SPRINT_LEAVE
---| 435 # ACT_FIRE_START
---| 436 # ACT_FIRE_LOOP
---| 437 # ACT_FIRE_END
---| 438 # ACT_CROUCHING_GRENADEIDLE
---| 439 # ACT_CROUCHING_GRENADEREADY
---| 440 # ACT_CROUCHING_PRIMARYATTACK
---| 441 # ACT_OVERLAY_GRENADEIDLE
---| 442 # ACT_OVERLAY_GRENADEREADY
---| 443 # ACT_OVERLAY_PRIMARYATTACK
---| 444 # ACT_OVERLAY_SHIELD_UP
---| 445 # ACT_OVERLAY_SHIELD_DOWN
---| 446 # ACT_OVERLAY_SHIELD_UP_IDLE
---| 447 # ACT_OVERLAY_SHIELD_ATTACK
---| 448 # ACT_OVERLAY_SHIELD_KNOCKBACK
---| 449 # ACT_SHIELD_UP
---| 450 # ACT_SHIELD_DOWN
---| 451 # ACT_SHIELD_UP_IDLE
---| 452 # ACT_SHIELD_ATTACK
---| 453 # ACT_SHIELD_KNOCKBACK
---| 454 # ACT_CROUCHING_SHIELD_UP
---| 455 # ACT_CROUCHING_SHIELD_DOWN
---| 456 # ACT_CROUCHING_SHIELD_UP_IDLE
---| 457 # ACT_CROUCHING_SHIELD_ATTACK
---| 458 # ACT_CROUCHING_SHIELD_KNOCKBACK
---| 459 # ACT_TURNRIGHT45
---| 460 # ACT_TURNLEFT45
---| 461 # ACT_TURN
---| 462 # ACT_OBJ_ASSEMBLING
---| 463 # ACT_OBJ_DISMANTLING
---| 464 # ACT_OBJ_STARTUP
---| 465 # ACT_OBJ_RUNNING
---| 466 # ACT_OBJ_IDLE
---| 467 # ACT_OBJ_PLACING
---| 468 # ACT_OBJ_DETERIORATING
---| 469 # ACT_OBJ_UPGRADING
---| 470 # ACT_DEPLOY
---| 471 # ACT_DEPLOY_IDLE
---| 472 # ACT_UNDEPLOY
---| 473 # ACT_GRENADE_ROLL
---| 474 # ACT_GRENADE_TOSS
---| 475 # ACT_HANDGRENADE_THROW1
---| 476 # ACT_HANDGRENADE_THROW2
---| 477 # ACT_HANDGRENADE_THROW3
---| 478 # ACT_SHOTGUN_IDLE_DEEP
---| 479 # ACT_SHOTGUN_IDLE4
---| 480 # ACT_GLOCK_SHOOTEMPTY
---| 481 # ACT_GLOCK_SHOOT_RELOAD
---| 482 # ACT_RPG_DRAW_UNLOADED
---| 483 # ACT_RPG_HOLSTER_UNLOADED
---| 484 # ACT_RPG_IDLE_UNLOADED
---| 485 # ACT_RPG_FIDGET_UNLOADED
---| 486 # ACT_CROSSBOW_DRAW_UNLOADED
---| 487 # ACT_CROSSBOW_IDLE_UNLOADED
---| 488 # ACT_CROSSBOW_FIDGET_UNLOADED
---| 489 # ACT_GAUSS_SPINUP
---| 490 # ACT_GAUSS_SPINCYCLE
---| 491 # ACT_TRIPMINE_GROUND
---| 492 # ACT_TRIPMINE_WORLD
---| 493 # ACT_VM_PRIMARYATTACK_SILENCED
---| 494 # ACT_VM_RELOAD_SILENCED
---| 495 # ACT_VM_DRYFIRE_SILENCED
---| 496 # ACT_VM_IDLE_SILENCED
---| 497 # ACT_VM_DRAW_SILENCED
---| 498 # ACT_VM_IDLE_EMPTY_LEFT
---| 499 # ACT_VM_DRYFIRE_LEFT
---| 500 # ACT_PLAYER_IDLE_FIRE
---| 501 # ACT_PLAYER_CROUCH_FIRE
---| 502 # ACT_PLAYER_CROUCH_WALK_FIRE
---| 503 # ACT_PLAYER_WALK_FIRE
---| 504 # ACT_PLAYER_RUN_FIRE
---| 505 # ACT_IDLETORUN
---| 506 # ACT_RUNTOIDLE
---| 507 # ACT_SPRINT
---| 508 # ACT_GET_DOWN_STAND
---| 509 # ACT_GET_UP_STAND
---| 510 # ACT_GET_DOWN_CROUCH
---| 511 # ACT_GET_UP_CROUCH
---| 512 # ACT_PRONE_FORWARD
---| 513 # ACT_PRONE_IDLE
---| 514 # ACT_DEEPIDLE1
---| 515 # ACT_DEEPIDLE2
---| 516 # ACT_DEEPIDLE3
---| 517 # ACT_DEEPIDLE4
---| 518 # ACT_VM_RELOAD_DEPLOYED
---| 519 # ACT_VM_RELOAD_IDLE
---| 520 # ACT_VM_DRAW_DEPLOYED
---| 521 # ACT_VM_DRAW_EMPTY
---| 522 # ACT_VM_PRIMARYATTACK_EMPTY
---| 523 # ACT_VM_RELOAD_EMPTY
---| 524 # ACT_VM_IDLE_EMPTY
---| 525 # ACT_VM_IDLE_DEPLOYED_EMPTY
---| 526 # ACT_VM_IDLE_8
---| 527 # ACT_VM_IDLE_7
---| 528 # ACT_VM_IDLE_6
---| 529 # ACT_VM_IDLE_5
---| 530 # ACT_VM_IDLE_4
---| 531 # ACT_VM_IDLE_3
---| 532 # ACT_VM_IDLE_2
---| 533 # ACT_VM_IDLE_1
---| 534 # ACT_VM_IDLE_DEPLOYED
---| 535 # ACT_VM_IDLE_DEPLOYED_8
---| 536 # ACT_VM_IDLE_DEPLOYED_7
---| 537 # ACT_VM_IDLE_DEPLOYED_6
---| 538 # ACT_VM_IDLE_DEPLOYED_5
---| 539 # ACT_VM_IDLE_DEPLOYED_4
---| 540 # ACT_VM_IDLE_DEPLOYED_3
---| 541 # ACT_VM_IDLE_DEPLOYED_2
---| 542 # ACT_VM_IDLE_DEPLOYED_1
---| 543 # ACT_VM_UNDEPLOY
---| 544 # ACT_VM_UNDEPLOY_8
---| 545 # ACT_VM_UNDEPLOY_7
---| 546 # ACT_VM_UNDEPLOY_6
---| 547 # ACT_VM_UNDEPLOY_5
---| 548 # ACT_VM_UNDEPLOY_4
---| 549 # ACT_VM_UNDEPLOY_3
---| 550 # ACT_VM_UNDEPLOY_2
---| 551 # ACT_VM_UNDEPLOY_1
---| 552 # ACT_VM_UNDEPLOY_EMPTY
---| 553 # ACT_VM_DEPLOY
---| 554 # ACT_VM_DEPLOY_8
---| 555 # ACT_VM_DEPLOY_7
---| 556 # ACT_VM_DEPLOY_6
---| 557 # ACT_VM_DEPLOY_5
---| 558 # ACT_VM_DEPLOY_4
---| 559 # ACT_VM_DEPLOY_3
---| 560 # ACT_VM_DEPLOY_2
---| 561 # ACT_VM_DEPLOY_1
---| 562 # ACT_VM_DEPLOY_EMPTY
---| 563 # ACT_VM_PRIMARYATTACK_8
---| 564 # ACT_VM_PRIMARYATTACK_7
---| 565 # ACT_VM_PRIMARYATTACK_6
---| 566 # ACT_VM_PRIMARYATTACK_5
---| 567 # ACT_VM_PRIMARYATTACK_4
---| 568 # ACT_VM_PRIMARYATTACK_3
---| 569 # ACT_VM_PRIMARYATTACK_2
---| 570 # ACT_VM_PRIMARYATTACK_1
---| 571 # ACT_VM_PRIMARYATTACK_DEPLOYED
---| 572 # ACT_VM_PRIMARYATTACK_DEPLOYED_8
---| 573 # ACT_VM_PRIMARYATTACK_DEPLOYED_7
---| 574 # ACT_VM_PRIMARYATTACK_DEPLOYED_6
---| 575 # ACT_VM_PRIMARYATTACK_DEPLOYED_5
---| 576 # ACT_VM_PRIMARYATTACK_DEPLOYED_4
---| 577 # ACT_VM_PRIMARYATTACK_DEPLOYED_3
---| 578 # ACT_VM_PRIMARYATTACK_DEPLOYED_2
---| 579 # ACT_VM_PRIMARYATTACK_DEPLOYED_1
---| 580 # ACT_VM_PRIMARYATTACK_DEPLOYED_EMPTY
---| 581 # ACT_DOD_DEPLOYED
---| 582 # ACT_DOD_PRONE_DEPLOYED
---| 583 # ACT_DOD_IDLE_ZOOMED
---| 584 # ACT_DOD_WALK_ZOOMED
---| 585 # ACT_DOD_CROUCH_ZOOMED
---| 586 # ACT_DOD_CROUCHWALK_ZOOMED
---| 587 # ACT_DOD_PRONE_ZOOMED
---| 588 # ACT_DOD_PRONE_FORWARD_ZOOMED
---| 589 # ACT_DOD_PRIMARYATTACK_DEPLOYED
---| 590 # ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED
---| 591 # ACT_DOD_RELOAD_DEPLOYED
---| 592 # ACT_DOD_RELOAD_PRONE_DEPLOYED
---| 593 # ACT_DOD_PRIMARYATTACK_PRONE
---| 594 # ACT_DOD_SECONDARYATTACK_PRONE
---| 595 # ACT_DOD_RELOAD_CROUCH
---| 596 # ACT_DOD_RELOAD_PRONE
---| 597 # ACT_DOD_STAND_IDLE
---| 598 # ACT_DOD_STAND_AIM
---| 599 # ACT_DOD_CROUCH_IDLE
---| 600 # ACT_DOD_CROUCH_AIM
---| 601 # ACT_DOD_CROUCHWALK_IDLE
---| 602 # ACT_DOD_CROUCHWALK_AIM
---| 603 # ACT_DOD_WALK_IDLE
---| 604 # ACT_DOD_WALK_AIM
---| 605 # ACT_DOD_RUN_IDLE
---| 606 # ACT_DOD_RUN_AIM
---| 607 # ACT_DOD_STAND_AIM_PISTOL
---| 608 # ACT_DOD_CROUCH_AIM_PISTOL
---| 609 # ACT_DOD_CROUCHWALK_AIM_PISTOL
---| 610 # ACT_DOD_WALK_AIM_PISTOL
---| 611 # ACT_DOD_RUN_AIM_PISTOL
---| 612 # ACT_DOD_PRONE_AIM_PISTOL
---| 613 # ACT_DOD_STAND_IDLE_PISTOL
---| 614 # ACT_DOD_CROUCH_IDLE_PISTOL
---| 615 # ACT_DOD_CROUCHWALK_IDLE_PISTOL
---| 616 # ACT_DOD_WALK_IDLE_PISTOL
---| 617 # ACT_DOD_RUN_IDLE_PISTOL
---| 618 # ACT_DOD_SPRINT_IDLE_PISTOL
---| 619 # ACT_DOD_PRONEWALK_IDLE_PISTOL
---| 620 # ACT_DOD_STAND_AIM_C96
---| 621 # ACT_DOD_CROUCH_AIM_C96
---| 622 # ACT_DOD_CROUCHWALK_AIM_C96
---| 623 # ACT_DOD_WALK_AIM_C96
---| 624 # ACT_DOD_RUN_AIM_C96
---| 625 # ACT_DOD_PRONE_AIM_C96
---| 626 # ACT_DOD_STAND_IDLE_C96
---| 627 # ACT_DOD_CROUCH_IDLE_C96
---| 628 # ACT_DOD_CROUCHWALK_IDLE_C96
---| 629 # ACT_DOD_WALK_IDLE_C96
---| 630 # ACT_DOD_RUN_IDLE_C96
---| 631 # ACT_DOD_SPRINT_IDLE_C96
---| 632 # ACT_DOD_PRONEWALK_IDLE_C96
---| 633 # ACT_DOD_STAND_AIM_RIFLE
---| 634 # ACT_DOD_CROUCH_AIM_RIFLE
---| 635 # ACT_DOD_CROUCHWALK_AIM_RIFLE
---| 636 # ACT_DOD_WALK_AIM_RIFLE
---| 637 # ACT_DOD_RUN_AIM_RIFLE
---| 638 # ACT_DOD_PRONE_AIM_RIFLE
---| 639 # ACT_DOD_STAND_IDLE_RIFLE
---| 640 # ACT_DOD_CROUCH_IDLE_RIFLE
---| 641 # ACT_DOD_CROUCHWALK_IDLE_RIFLE
---| 642 # ACT_DOD_WALK_IDLE_RIFLE
---| 643 # ACT_DOD_RUN_IDLE_RIFLE
---| 644 # ACT_DOD_SPRINT_IDLE_RIFLE
---| 645 # ACT_DOD_PRONEWALK_IDLE_RIFLE
---| 646 # ACT_DOD_STAND_AIM_BOLT
---| 647 # ACT_DOD_CROUCH_AIM_BOLT
---| 648 # ACT_DOD_CROUCHWALK_AIM_BOLT
---| 649 # ACT_DOD_WALK_AIM_BOLT
---| 650 # ACT_DOD_RUN_AIM_BOLT
---| 651 # ACT_DOD_PRONE_AIM_BOLT
---| 652 # ACT_DOD_STAND_IDLE_BOLT
---| 653 # ACT_DOD_CROUCH_IDLE_BOLT
---| 654 # ACT_DOD_CROUCHWALK_IDLE_BOLT
---| 655 # ACT_DOD_WALK_IDLE_BOLT
---| 656 # ACT_DOD_RUN_IDLE_BOLT
---| 657 # ACT_DOD_SPRINT_IDLE_BOLT
---| 658 # ACT_DOD_PRONEWALK_IDLE_BOLT
---| 659 # ACT_DOD_STAND_AIM_TOMMY
---| 660 # ACT_DOD_CROUCH_AIM_TOMMY
---| 661 # ACT_DOD_CROUCHWALK_AIM_TOMMY
---| 662 # ACT_DOD_WALK_AIM_TOMMY
---| 663 # ACT_DOD_RUN_AIM_TOMMY
---| 664 # ACT_DOD_PRONE_AIM_TOMMY
---| 665 # ACT_DOD_STAND_IDLE_TOMMY
---| 666 # ACT_DOD_CROUCH_IDLE_TOMMY
---| 667 # ACT_DOD_CROUCHWALK_IDLE_TOMMY
---| 668 # ACT_DOD_WALK_IDLE_TOMMY
---| 669 # ACT_DOD_RUN_IDLE_TOMMY
---| 670 # ACT_DOD_SPRINT_IDLE_TOMMY
---| 671 # ACT_DOD_PRONEWALK_IDLE_TOMMY
---| 672 # ACT_DOD_STAND_AIM_MP40
---| 673 # ACT_DOD_CROUCH_AIM_MP40
---| 674 # ACT_DOD_CROUCHWALK_AIM_MP40
---| 675 # ACT_DOD_WALK_AIM_MP40
---| 676 # ACT_DOD_RUN_AIM_MP40
---| 677 # ACT_DOD_PRONE_AIM_MP40
---| 678 # ACT_DOD_STAND_IDLE_MP40
---| 679 # ACT_DOD_CROUCH_IDLE_MP40
---| 680 # ACT_DOD_CROUCHWALK_IDLE_MP40
---| 681 # ACT_DOD_WALK_IDLE_MP40
---| 682 # ACT_DOD_RUN_IDLE_MP40
---| 683 # ACT_DOD_SPRINT_IDLE_MP40
---| 684 # ACT_DOD_PRONEWALK_IDLE_MP40
---| 685 # ACT_DOD_STAND_AIM_MP44
---| 686 # ACT_DOD_CROUCH_AIM_MP44
---| 687 # ACT_DOD_CROUCHWALK_AIM_MP44
---| 688 # ACT_DOD_WALK_AIM_MP44
---| 689 # ACT_DOD_RUN_AIM_MP44
---| 690 # ACT_DOD_PRONE_AIM_MP44
---| 691 # ACT_DOD_STAND_IDLE_MP44
---| 692 # ACT_DOD_CROUCH_IDLE_MP44
---| 693 # ACT_DOD_CROUCHWALK_IDLE_MP44
---| 694 # ACT_DOD_WALK_IDLE_MP44
---| 695 # ACT_DOD_RUN_IDLE_MP44
---| 696 # ACT_DOD_SPRINT_IDLE_MP44
---| 697 # ACT_DOD_PRONEWALK_IDLE_MP44
---| 698 # ACT_DOD_STAND_AIM_GREASE
---| 699 # ACT_DOD_CROUCH_AIM_GREASE
---| 700 # ACT_DOD_CROUCHWALK_AIM_GREASE
---| 701 # ACT_DOD_WALK_AIM_GREASE
---| 702 # ACT_DOD_RUN_AIM_GREASE
---| 703 # ACT_DOD_PRONE_AIM_GREASE
---| 704 # ACT_DOD_STAND_IDLE_GREASE
---| 705 # ACT_DOD_CROUCH_IDLE_GREASE
---| 706 # ACT_DOD_CROUCHWALK_IDLE_GREASE
---| 707 # ACT_DOD_WALK_IDLE_GREASE
---| 708 # ACT_DOD_RUN_IDLE_GREASE
---| 709 # ACT_DOD_SPRINT_IDLE_GREASE
---| 710 # ACT_DOD_PRONEWALK_IDLE_GREASE
---| 711 # ACT_DOD_STAND_AIM_MG
---| 712 # ACT_DOD_CROUCH_AIM_MG
---| 713 # ACT_DOD_CROUCHWALK_AIM_MG
---| 714 # ACT_DOD_WALK_AIM_MG
---| 715 # ACT_DOD_RUN_AIM_MG
---| 716 # ACT_DOD_PRONE_AIM_MG
---| 717 # ACT_DOD_STAND_IDLE_MG
---| 718 # ACT_DOD_CROUCH_IDLE_MG
---| 719 # ACT_DOD_CROUCHWALK_IDLE_MG
---| 720 # ACT_DOD_WALK_IDLE_MG
---| 721 # ACT_DOD_RUN_IDLE_MG
---| 722 # ACT_DOD_SPRINT_IDLE_MG
---| 723 # ACT_DOD_PRONEWALK_IDLE_MG
---| 724 # ACT_DOD_STAND_AIM_30CAL
---| 725 # ACT_DOD_CROUCH_AIM_30CAL
---| 726 # ACT_DOD_CROUCHWALK_AIM_30CAL
---| 727 # ACT_DOD_WALK_AIM_30CAL
---| 728 # ACT_DOD_RUN_AIM_30CAL
---| 729 # ACT_DOD_PRONE_AIM_30CAL
---| 730 # ACT_DOD_STAND_IDLE_30CAL
---| 731 # ACT_DOD_CROUCH_IDLE_30CAL
---| 732 # ACT_DOD_CROUCHWALK_IDLE_30CAL
---| 733 # ACT_DOD_WALK_IDLE_30CAL
---| 734 # ACT_DOD_RUN_IDLE_30CAL
---| 735 # ACT_DOD_SPRINT_IDLE_30CAL
---| 736 # ACT_DOD_PRONEWALK_IDLE_30CAL
---| 737 # ACT_DOD_STAND_AIM_GREN_FRAG
---| 738 # ACT_DOD_CROUCH_AIM_GREN_FRAG
---| 739 # ACT_DOD_CROUCHWALK_AIM_GREN_FRAG
---| 740 # ACT_DOD_WALK_AIM_GREN_FRAG
---| 741 # ACT_DOD_RUN_AIM_GREN_FRAG
---| 742 # ACT_DOD_PRONE_AIM_GREN_FRAG
---| 743 # ACT_DOD_SPRINT_AIM_GREN_FRAG
---| 744 # ACT_DOD_PRONEWALK_AIM_GREN_FRAG
---| 745 # ACT_DOD_STAND_AIM_GREN_STICK
---| 746 # ACT_DOD_CROUCH_AIM_GREN_STICK
---| 747 # ACT_DOD_CROUCHWALK_AIM_GREN_STICK
---| 748 # ACT_DOD_WALK_AIM_GREN_STICK
---| 749 # ACT_DOD_RUN_AIM_GREN_STICK
---| 750 # ACT_DOD_PRONE_AIM_GREN_STICK
---| 751 # ACT_DOD_SPRINT_AIM_GREN_STICK
---| 752 # ACT_DOD_PRONEWALK_AIM_GREN_STICK
---| 753 # ACT_DOD_STAND_AIM_KNIFE
---| 754 # ACT_DOD_CROUCH_AIM_KNIFE
---| 755 # ACT_DOD_CROUCHWALK_AIM_KNIFE
---| 756 # ACT_DOD_WALK_AIM_KNIFE
---| 757 # ACT_DOD_RUN_AIM_KNIFE
---| 758 # ACT_DOD_PRONE_AIM_KNIFE
---| 759 # ACT_DOD_SPRINT_AIM_KNIFE
---| 760 # ACT_DOD_PRONEWALK_AIM_KNIFE
---| 761 # ACT_DOD_STAND_AIM_SPADE
---| 762 # ACT_DOD_CROUCH_AIM_SPADE
---| 763 # ACT_DOD_CROUCHWALK_AIM_SPADE
---| 764 # ACT_DOD_WALK_AIM_SPADE
---| 765 # ACT_DOD_RUN_AIM_SPADE
---| 766 # ACT_DOD_PRONE_AIM_SPADE
---| 767 # ACT_DOD_SPRINT_AIM_SPADE
---| 768 # ACT_DOD_PRONEWALK_AIM_SPADE
---| 769 # ACT_DOD_STAND_AIM_BAZOOKA
---| 770 # ACT_DOD_CROUCH_AIM_BAZOOKA
---| 771 # ACT_DOD_CROUCHWALK_AIM_BAZOOKA
---| 772 # ACT_DOD_WALK_AIM_BAZOOKA
---| 773 # ACT_DOD_RUN_AIM_BAZOOKA
---| 774 # ACT_DOD_PRONE_AIM_BAZOOKA
---| 775 # ACT_DOD_STAND_IDLE_BAZOOKA
---| 776 # ACT_DOD_CROUCH_IDLE_BAZOOKA
---| 777 # ACT_DOD_CROUCHWALK_IDLE_BAZOOKA
---| 778 # ACT_DOD_WALK_IDLE_BAZOOKA
---| 779 # ACT_DOD_RUN_IDLE_BAZOOKA
---| 780 # ACT_DOD_SPRINT_IDLE_BAZOOKA
---| 781 # ACT_DOD_PRONEWALK_IDLE_BAZOOKA
---| 782 # ACT_DOD_STAND_AIM_PSCHRECK
---| 783 # ACT_DOD_CROUCH_AIM_PSCHRECK
---| 784 # ACT_DOD_CROUCHWALK_AIM_PSCHRECK
---| 785 # ACT_DOD_WALK_AIM_PSCHRECK
---| 786 # ACT_DOD_RUN_AIM_PSCHRECK
---| 787 # ACT_DOD_PRONE_AIM_PSCHRECK
---| 788 # ACT_DOD_STAND_IDLE_PSCHRECK
---| 789 # ACT_DOD_CROUCH_IDLE_PSCHRECK
---| 790 # ACT_DOD_CROUCHWALK_IDLE_PSCHRECK
---| 791 # ACT_DOD_WALK_IDLE_PSCHRECK
---| 792 # ACT_DOD_RUN_IDLE_PSCHRECK
---| 793 # ACT_DOD_SPRINT_IDLE_PSCHRECK
---| 794 # ACT_DOD_PRONEWALK_IDLE_PSCHRECK
---| 795 # ACT_DOD_STAND_AIM_BAR
---| 796 # ACT_DOD_CROUCH_AIM_BAR
---| 797 # ACT_DOD_CROUCHWALK_AIM_BAR
---| 798 # ACT_DOD_WALK_AIM_BAR
---| 799 # ACT_DOD_RUN_AIM_BAR
---| 800 # ACT_DOD_PRONE_AIM_BAR
---| 801 # ACT_DOD_STAND_IDLE_BAR
---| 802 # ACT_DOD_CROUCH_IDLE_BAR
---| 803 # ACT_DOD_CROUCHWALK_IDLE_BAR
---| 804 # ACT_DOD_WALK_IDLE_BAR
---| 805 # ACT_DOD_RUN_IDLE_BAR
---| 806 # ACT_DOD_SPRINT_IDLE_BAR
---| 807 # ACT_DOD_PRONEWALK_IDLE_BAR
---| 808 # ACT_DOD_STAND_ZOOM_RIFLE
---| 809 # ACT_DOD_CROUCH_ZOOM_RIFLE
---| 810 # ACT_DOD_CROUCHWALK_ZOOM_RIFLE
---| 811 # ACT_DOD_WALK_ZOOM_RIFLE
---| 812 # ACT_DOD_RUN_ZOOM_RIFLE
---| 813 # ACT_DOD_PRONE_ZOOM_RIFLE
---| 814 # ACT_DOD_STAND_ZOOM_BOLT
---| 815 # ACT_DOD_CROUCH_ZOOM_BOLT
---| 816 # ACT_DOD_CROUCHWALK_ZOOM_BOLT
---| 817 # ACT_DOD_WALK_ZOOM_BOLT
---| 818 # ACT_DOD_RUN_ZOOM_BOLT
---| 819 # ACT_DOD_PRONE_ZOOM_BOLT
---| 820 # ACT_DOD_STAND_ZOOM_BAZOOKA
---| 821 # ACT_DOD_CROUCH_ZOOM_BAZOOKA
---| 822 # ACT_DOD_CROUCHWALK_ZOOM_BAZOOKA
---| 823 # ACT_DOD_WALK_ZOOM_BAZOOKA
---| 824 # ACT_DOD_RUN_ZOOM_BAZOOKA
---| 825 # ACT_DOD_PRONE_ZOOM_BAZOOKA
---| 826 # ACT_DOD_STAND_ZOOM_PSCHRECK
---| 827 # ACT_DOD_CROUCH_ZOOM_PSCHRECK
---| 828 # ACT_DOD_CROUCHWALK_ZOOM_PSCHRECK
---| 829 # ACT_DOD_WALK_ZOOM_PSCHRECK
---| 830 # ACT_DOD_RUN_ZOOM_PSCHRECK
---| 831 # ACT_DOD_PRONE_ZOOM_PSCHRECK
---| 832 # ACT_DOD_DEPLOY_RIFLE
---| 833 # ACT_DOD_DEPLOY_TOMMY
---| 834 # ACT_DOD_DEPLOY_MG
---| 835 # ACT_DOD_DEPLOY_30CAL
---| 836 # ACT_DOD_PRONE_DEPLOY_RIFLE
---| 837 # ACT_DOD_PRONE_DEPLOY_TOMMY
---| 838 # ACT_DOD_PRONE_DEPLOY_MG
---| 839 # ACT_DOD_PRONE_DEPLOY_30CAL
---| 840 # ACT_DOD_PRIMARYATTACK_RIFLE
---| 841 # ACT_DOD_SECONDARYATTACK_RIFLE
---| 842 # ACT_DOD_PRIMARYATTACK_PRONE_RIFLE
---| 843 # ACT_DOD_SECONDARYATTACK_PRONE_RIFLE
---| 844 # ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_RIFLE
---| 845 # ACT_DOD_PRIMARYATTACK_DEPLOYED_RIFLE
---| 846 # ACT_DOD_PRIMARYATTACK_BOLT
---| 847 # ACT_DOD_SECONDARYATTACK_BOLT
---| 848 # ACT_DOD_PRIMARYATTACK_PRONE_BOLT
---| 849 # ACT_DOD_SECONDARYATTACK_PRONE_BOLT
---| 850 # ACT_DOD_PRIMARYATTACK_TOMMY
---| 851 # ACT_DOD_PRIMARYATTACK_PRONE_TOMMY
---| 852 # ACT_DOD_SECONDARYATTACK_TOMMY
---| 853 # ACT_DOD_SECONDARYATTACK_PRONE_TOMMY
---| 854 # ACT_DOD_PRIMARYATTACK_MP40
---| 855 # ACT_DOD_PRIMARYATTACK_PRONE_MP40
---| 856 # ACT_DOD_SECONDARYATTACK_MP40
---| 857 # ACT_DOD_SECONDARYATTACK_PRONE_MP40
---| 858 # ACT_DOD_PRIMARYATTACK_MP44
---| 859 # ACT_DOD_PRIMARYATTACK_PRONE_MP44
---| 860 # ACT_DOD_PRIMARYATTACK_GREASE
---| 861 # ACT_DOD_PRIMARYATTACK_PRONE_GREASE
---| 862 # ACT_DOD_PRIMARYATTACK_PISTOL
---| 863 # ACT_DOD_PRIMARYATTACK_PRONE_PISTOL
---| 864 # ACT_DOD_PRIMARYATTACK_C96
---| 865 # ACT_DOD_PRIMARYATTACK_PRONE_C96
---| 866 # ACT_DOD_PRIMARYATTACK_MG
---| 867 # ACT_DOD_PRIMARYATTACK_PRONE_MG
---| 868 # ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_MG
---| 869 # ACT_DOD_PRIMARYATTACK_DEPLOYED_MG
---| 870 # ACT_DOD_PRIMARYATTACK_30CAL
---| 871 # ACT_DOD_PRIMARYATTACK_PRONE_30CAL
---| 872 # ACT_DOD_PRIMARYATTACK_DEPLOYED_30CAL
---| 873 # ACT_DOD_PRIMARYATTACK_PRONE_DEPLOYED_30CAL
---| 874 # ACT_DOD_PRIMARYATTACK_GREN_FRAG
---| 875 # ACT_DOD_PRIMARYATTACK_PRONE_GREN_FRAG
---| 876 # ACT_DOD_PRIMARYATTACK_GREN_STICK
---| 877 # ACT_DOD_PRIMARYATTACK_PRONE_GREN_STICK
---| 878 # ACT_DOD_PRIMARYATTACK_KNIFE
---| 879 # ACT_DOD_PRIMARYATTACK_PRONE_KNIFE
---| 880 # ACT_DOD_PRIMARYATTACK_SPADE
---| 881 # ACT_DOD_PRIMARYATTACK_PRONE_SPADE
---| 882 # ACT_DOD_PRIMARYATTACK_BAZOOKA
---| 883 # ACT_DOD_PRIMARYATTACK_PRONE_BAZOOKA
---| 884 # ACT_DOD_PRIMARYATTACK_PSCHRECK
---| 885 # ACT_DOD_PRIMARYATTACK_PRONE_PSCHRECK
---| 886 # ACT_DOD_PRIMARYATTACK_BAR
---| 887 # ACT_DOD_PRIMARYATTACK_PRONE_BAR
---| 888 # ACT_DOD_RELOAD_GARAND
---| 889 # ACT_DOD_RELOAD_K43
---| 890 # ACT_DOD_RELOAD_BAR
---| 891 # ACT_DOD_RELOAD_MP40
---| 892 # ACT_DOD_RELOAD_MP44
---| 893 # ACT_DOD_RELOAD_BOLT
---| 894 # ACT_DOD_RELOAD_M1CARBINE
---| 895 # ACT_DOD_RELOAD_TOMMY
---| 896 # ACT_DOD_RELOAD_GREASEGUN
---| 897 # ACT_DOD_RELOAD_PISTOL
---| 898 # ACT_DOD_RELOAD_FG42
---| 899 # ACT_DOD_RELOAD_RIFLE
---| 900 # ACT_DOD_RELOAD_RIFLEGRENADE
---| 901 # ACT_DOD_RELOAD_C96
---| 902 # ACT_DOD_RELOAD_CROUCH_BAR
---| 903 # ACT_DOD_RELOAD_CROUCH_RIFLE
---| 904 # ACT_DOD_RELOAD_CROUCH_RIFLEGRENADE
---| 905 # ACT_DOD_RELOAD_CROUCH_BOLT
---| 906 # ACT_DOD_RELOAD_CROUCH_MP44
---| 907 # ACT_DOD_RELOAD_CROUCH_MP40
---| 908 # ACT_DOD_RELOAD_CROUCH_TOMMY
---| 909 # ACT_DOD_RELOAD_CROUCH_BAZOOKA
---| 910 # ACT_DOD_RELOAD_CROUCH_PSCHRECK
---| 911 # ACT_DOD_RELOAD_CROUCH_PISTOL
---| 912 # ACT_DOD_RELOAD_CROUCH_M1CARBINE
---| 913 # ACT_DOD_RELOAD_CROUCH_C96
---| 914 # ACT_DOD_RELOAD_BAZOOKA
---| 915 # ACT_DOD_ZOOMLOAD_BAZOOKA
---| 916 # ACT_DOD_RELOAD_PSCHRECK
---| 917 # ACT_DOD_ZOOMLOAD_PSCHRECK
---| 918 # ACT_DOD_RELOAD_DEPLOYED_FG42
---| 919 # ACT_DOD_RELOAD_DEPLOYED_30CAL
---| 920 # ACT_DOD_RELOAD_DEPLOYED_MG
---| 921 # ACT_DOD_RELOAD_DEPLOYED_MG34
---| 922 # ACT_DOD_RELOAD_DEPLOYED_BAR
---| 923 # ACT_DOD_RELOAD_PRONE_PISTOL
---| 924 # ACT_DOD_RELOAD_PRONE_GARAND
---| 925 # ACT_DOD_RELOAD_PRONE_M1CARBINE
---| 926 # ACT_DOD_RELOAD_PRONE_BOLT
---| 927 # ACT_DOD_RELOAD_PRONE_K43
---| 928 # ACT_DOD_RELOAD_PRONE_MP40
---| 929 # ACT_DOD_RELOAD_PRONE_MP44
---| 930 # ACT_DOD_RELOAD_PRONE_BAR
---| 931 # ACT_DOD_RELOAD_PRONE_GREASEGUN
---| 932 # ACT_DOD_RELOAD_PRONE_TOMMY
---| 933 # ACT_DOD_RELOAD_PRONE_FG42
---| 934 # ACT_DOD_RELOAD_PRONE_RIFLE
---| 935 # ACT_DOD_RELOAD_PRONE_RIFLEGRENADE
---| 936 # ACT_DOD_RELOAD_PRONE_C96
---| 937 # ACT_DOD_RELOAD_PRONE_BAZOOKA
---| 938 # ACT_DOD_ZOOMLOAD_PRONE_BAZOOKA
---| 939 # ACT_DOD_RELOAD_PRONE_PSCHRECK
---| 940 # ACT_DOD_ZOOMLOAD_PRONE_PSCHRECK
---| 941 # ACT_DOD_RELOAD_PRONE_DEPLOYED_BAR
---| 942 # ACT_DOD_RELOAD_PRONE_DEPLOYED_FG42
---| 943 # ACT_DOD_RELOAD_PRONE_DEPLOYED_30CAL
---| 944 # ACT_DOD_RELOAD_PRONE_DEPLOYED_MG
---| 945 # ACT_DOD_RELOAD_PRONE_DEPLOYED_MG34
---| 946 # ACT_DOD_PRONE_ZOOM_FORWARD_RIFLE
---| 947 # ACT_DOD_PRONE_ZOOM_FORWARD_BOLT
---| 948 # ACT_DOD_PRONE_ZOOM_FORWARD_BAZOOKA
---| 949 # ACT_DOD_PRONE_ZOOM_FORWARD_PSCHRECK
---| 950 # ACT_DOD_PRIMARYATTACK_CROUCH
---| 951 # ACT_DOD_PRIMARYATTACK_CROUCH_SPADE
---| 952 # ACT_DOD_PRIMARYATTACK_CROUCH_KNIFE
---| 953 # ACT_DOD_PRIMARYATTACK_CROUCH_GREN_FRAG
---| 954 # ACT_DOD_PRIMARYATTACK_CROUCH_GREN_STICK
---| 955 # ACT_DOD_SECONDARYATTACK_CROUCH
---| 956 # ACT_DOD_SECONDARYATTACK_CROUCH_TOMMY
---| 957 # ACT_DOD_SECONDARYATTACK_CROUCH_MP40
---| 958 # ACT_DOD_HS_IDLE
---| 959 # ACT_DOD_HS_CROUCH
---| 960 # ACT_DOD_HS_IDLE_30CAL
---| 961 # ACT_DOD_HS_IDLE_BAZOOKA
---| 962 # ACT_DOD_HS_IDLE_PSCHRECK
---| 963 # ACT_DOD_HS_IDLE_KNIFE
---| 964 # ACT_DOD_HS_IDLE_MG42
---| 965 # ACT_DOD_HS_IDLE_PISTOL
---| 966 # ACT_DOD_HS_IDLE_STICKGRENADE
---| 967 # ACT_DOD_HS_IDLE_TOMMY
---| 968 # ACT_DOD_HS_IDLE_MP44
---| 969 # ACT_DOD_HS_IDLE_K98
---| 970 # ACT_DOD_HS_CROUCH_30CAL
---| 971 # ACT_DOD_HS_CROUCH_BAZOOKA
---| 972 # ACT_DOD_HS_CROUCH_PSCHRECK
---| 973 # ACT_DOD_HS_CROUCH_KNIFE
---| 974 # ACT_DOD_HS_CROUCH_MG42
---| 975 # ACT_DOD_HS_CROUCH_PISTOL
---| 976 # ACT_DOD_HS_CROUCH_STICKGRENADE
---| 977 # ACT_DOD_HS_CROUCH_TOMMY
---| 978 # ACT_DOD_HS_CROUCH_MP44
---| 979 # ACT_DOD_HS_CROUCH_K98
---| 980 # ACT_DOD_STAND_IDLE_TNT
---| 981 # ACT_DOD_CROUCH_IDLE_TNT
---| 982 # ACT_DOD_CROUCHWALK_IDLE_TNT
---| 983 # ACT_DOD_WALK_IDLE_TNT
---| 984 # ACT_DOD_RUN_IDLE_TNT
---| 985 # ACT_DOD_SPRINT_IDLE_TNT
---| 986 # ACT_DOD_PRONEWALK_IDLE_TNT
---| 987 # ACT_DOD_PLANT_TNT
---| 988 # ACT_DOD_DEFUSE_TNT
---| 989 # ACT_VM_FIZZLE
---| 990 # ACT_MP_STAND_IDLE
---| 991 # ACT_MP_CROUCH_IDLE
---| 992 # ACT_MP_CROUCH_DEPLOYED_IDLE
---| 993 # ACT_MP_CROUCH_DEPLOYED
---| 995 # ACT_MP_DEPLOYED_IDLE
---| 996 # ACT_MP_RUN
---| 997 # ACT_MP_WALK
---| 998 # ACT_MP_AIRWALK
---| 999 # ACT_MP_CROUCHWALK
---| 1000 # ACT_MP_SPRINT
---| 1001 # ACT_MP_JUMP
---| 1002 # ACT_MP_JUMP_START
---| 1003 # ACT_MP_JUMP_FLOAT
---| 1004 # ACT_MP_JUMP_LAND
---| 1005 # ACT_MP_DOUBLEJUMP
---| 1006 # ACT_MP_SWIM
---| 1007 # ACT_MP_DEPLOYED
---| 1008 # ACT_MP_SWIM_DEPLOYED
---| 1009 # ACT_MP_VCD
---| 1010 # ACT_MP_SWIM_IDLE
---| 1011 # ACT_MP_ATTACK_STAND_PRIMARYFIRE
---| 1012 # ACT_MP_ATTACK_STAND_PRIMARYFIRE_DEPLOYED
---| 1013 # ACT_MP_ATTACK_STAND_SECONDARYFIRE
---| 1014 # ACT_MP_ATTACK_STAND_GRENADE
---| 1015 # ACT_MP_ATTACK_CROUCH_PRIMARYFIRE
---| 1016 # ACT_MP_ATTACK_CROUCH_PRIMARYFIRE_DEPLOYED
---| 1017 # ACT_MP_ATTACK_CROUCH_SECONDARYFIRE
---| 1018 # ACT_MP_ATTACK_CROUCH_GRENADE
---| 1019 # ACT_MP_ATTACK_SWIM_PRIMARYFIRE
---| 1020 # ACT_MP_ATTACK_SWIM_SECONDARYFIRE
---| 1021 # ACT_MP_ATTACK_SWIM_GRENADE
---| 1022 # ACT_MP_ATTACK_AIRWALK_PRIMARYFIRE
---| 1023 # ACT_MP_ATTACK_AIRWALK_SECONDARYFIRE
---| 1024 # ACT_MP_ATTACK_AIRWALK_GRENADE
---| 1025 # ACT_MP_RELOAD_STAND
---| 1026 # ACT_MP_RELOAD_STAND_LOOP
---| 1027 # ACT_MP_RELOAD_STAND_END
---| 1028 # ACT_MP_RELOAD_CROUCH
---| 1029 # ACT_MP_RELOAD_CROUCH_LOOP
---| 1030 # ACT_MP_RELOAD_CROUCH_END
---| 1031 # ACT_MP_RELOAD_SWIM
---| 1032 # ACT_MP_RELOAD_SWIM_LOOP
---| 1033 # ACT_MP_RELOAD_SWIM_END
---| 1034 # ACT_MP_RELOAD_AIRWALK
---| 1035 # ACT_MP_RELOAD_AIRWALK_LOOP
---| 1036 # ACT_MP_RELOAD_AIRWALK_END
---| 1037 # ACT_MP_ATTACK_STAND_PREFIRE
---| 1038 # ACT_MP_ATTACK_STAND_POSTFIRE
---| 1039 # ACT_MP_ATTACK_STAND_STARTFIRE
---| 1040 # ACT_MP_ATTACK_CROUCH_PREFIRE
---| 1041 # ACT_MP_ATTACK_CROUCH_POSTFIRE
---| 1042 # ACT_MP_ATTACK_SWIM_PREFIRE
---| 1043 # ACT_MP_ATTACK_SWIM_POSTFIRE
---| 1044 # ACT_MP_STAND_PRIMARY
---| 1045 # ACT_MP_CROUCH_PRIMARY
---| 1046 # ACT_MP_RUN_PRIMARY
---| 1047 # ACT_MP_WALK_PRIMARY
---| 1048 # ACT_MP_AIRWALK_PRIMARY
---| 1049 # ACT_MP_CROUCHWALK_PRIMARY
---| 1050 # ACT_MP_JUMP_PRIMARY
---| 1051 # ACT_MP_JUMP_START_PRIMARY
---| 1052 # ACT_MP_JUMP_FLOAT_PRIMARY
---| 1053 # ACT_MP_JUMP_LAND_PRIMARY
---| 1054 # ACT_MP_SWIM_PRIMARY
---| 1055 # ACT_MP_DEPLOYED_PRIMARY
---| 1056 # ACT_MP_SWIM_DEPLOYED_PRIMARY
---| 1059 # ACT_MP_ATTACK_STAND_PRIMARY
---| 1060 # ACT_MP_ATTACK_STAND_PRIMARY_DEPLOYED
---| 1061 # ACT_MP_ATTACK_CROUCH_PRIMARY
---| 1062 # ACT_MP_ATTACK_CROUCH_PRIMARY_DEPLOYED
---| 1063 # ACT_MP_ATTACK_SWIM_PRIMARY
---| 1064 # ACT_MP_ATTACK_AIRWALK_PRIMARY
---| 1065 # ACT_MP_RELOAD_STAND_PRIMARY
---| 1066 # ACT_MP_RELOAD_STAND_PRIMARY_LOOP
---| 1067 # ACT_MP_RELOAD_STAND_PRIMARY_END
---| 1068 # ACT_MP_RELOAD_CROUCH_PRIMARY
---| 1069 # ACT_MP_RELOAD_CROUCH_PRIMARY_LOOP
---| 1070 # ACT_MP_RELOAD_CROUCH_PRIMARY_END
---| 1071 # ACT_MP_RELOAD_SWIM_PRIMARY
---| 1072 # ACT_MP_RELOAD_SWIM_PRIMARY_LOOP
---| 1073 # ACT_MP_RELOAD_SWIM_PRIMARY_END
---| 1074 # ACT_MP_RELOAD_AIRWALK_PRIMARY
---| 1075 # ACT_MP_RELOAD_AIRWALK_PRIMARY_LOOP
---| 1076 # ACT_MP_RELOAD_AIRWALK_PRIMARY_END
---| 1105 # ACT_MP_ATTACK_STAND_GRENADE_PRIMARY
---| 1106 # ACT_MP_ATTACK_CROUCH_GRENADE_PRIMARY
---| 1107 # ACT_MP_ATTACK_SWIM_GRENADE_PRIMARY
---| 1108 # ACT_MP_ATTACK_AIRWALK_GRENADE_PRIMARY
---| 1109 # ACT_MP_STAND_SECONDARY
---| 1110 # ACT_MP_CROUCH_SECONDARY
---| 1111 # ACT_MP_RUN_SECONDARY
---| 1112 # ACT_MP_WALK_SECONDARY
---| 1113 # ACT_MP_AIRWALK_SECONDARY
---| 1114 # ACT_MP_CROUCHWALK_SECONDARY
---| 1115 # ACT_MP_JUMP_SECONDARY
---| 1116 # ACT_MP_JUMP_START_SECONDARY
---| 1117 # ACT_MP_JUMP_FLOAT_SECONDARY
---| 1118 # ACT_MP_JUMP_LAND_SECONDARY
---| 1119 # ACT_MP_SWIM_SECONDARY
---| 1120 # ACT_MP_ATTACK_STAND_SECONDARY
---| 1121 # ACT_MP_ATTACK_CROUCH_SECONDARY
---| 1122 # ACT_MP_ATTACK_SWIM_SECONDARY
---| 1123 # ACT_MP_ATTACK_AIRWALK_SECONDARY
---| 1124 # ACT_MP_RELOAD_STAND_SECONDARY
---| 1125 # ACT_MP_RELOAD_STAND_SECONDARY_LOOP
---| 1126 # ACT_MP_RELOAD_STAND_SECONDARY_END
---| 1127 # ACT_MP_RELOAD_CROUCH_SECONDARY
---| 1128 # ACT_MP_RELOAD_CROUCH_SECONDARY_LOOP
---| 1129 # ACT_MP_RELOAD_CROUCH_SECONDARY_END
---| 1130 # ACT_MP_RELOAD_SWIM_SECONDARY
---| 1131 # ACT_MP_RELOAD_SWIM_SECONDARY_LOOP
---| 1132 # ACT_MP_RELOAD_SWIM_SECONDARY_END
---| 1133 # ACT_MP_RELOAD_AIRWALK_SECONDARY
---| 1134 # ACT_MP_RELOAD_AIRWALK_SECONDARY_LOOP
---| 1135 # ACT_MP_RELOAD_AIRWALK_SECONDARY_END
---| 1140 # ACT_MP_ATTACK_STAND_GRENADE_SECONDARY
---| 1141 # ACT_MP_ATTACK_CROUCH_GRENADE_SECONDARY
---| 1142 # ACT_MP_ATTACK_SWIM_GRENADE_SECONDARY
---| 1143 # ACT_MP_ATTACK_AIRWALK_GRENADE_SECONDARY
---| 1171 # ACT_MP_STAND_MELEE
---| 1172 # ACT_MP_CROUCH_MELEE
---| 1173 # ACT_MP_RUN_MELEE
---| 1174 # ACT_MP_WALK_MELEE
---| 1175 # ACT_MP_AIRWALK_MELEE
---| 1176 # ACT_MP_CROUCHWALK_MELEE
---| 1177 # ACT_MP_JUMP_MELEE
---| 1178 # ACT_MP_JUMP_START_MELEE
---| 1179 # ACT_MP_JUMP_FLOAT_MELEE
---| 1180 # ACT_MP_JUMP_LAND_MELEE
---| 1181 # ACT_MP_SWIM_MELEE
---| 1182 # ACT_MP_ATTACK_STAND_MELEE
---| 1183 # ACT_MP_ATTACK_STAND_MELEE_SECONDARY
---| 1184 # ACT_MP_ATTACK_CROUCH_MELEE
---| 1185 # ACT_MP_ATTACK_CROUCH_MELEE_SECONDARY
---| 1186 # ACT_MP_ATTACK_SWIM_MELEE
---| 1187 # ACT_MP_ATTACK_AIRWALK_MELEE
---| 1188 # ACT_MP_ATTACK_STAND_GRENADE_MELEE
---| 1189 # ACT_MP_ATTACK_CROUCH_GRENADE_MELEE
---| 1190 # ACT_MP_ATTACK_SWIM_GRENADE_MELEE
---| 1191 # ACT_MP_ATTACK_AIRWALK_GRENADE_MELEE
---| 1258 # ACT_MP_GESTURE_FLINCH
---| 1259 # ACT_MP_GESTURE_FLINCH_PRIMARY
---| 1260 # ACT_MP_GESTURE_FLINCH_SECONDARY
---| 1261 # ACT_MP_GESTURE_FLINCH_MELEE
---| 1264 # ACT_MP_GESTURE_FLINCH_HEAD
---| 1265 # ACT_MP_GESTURE_FLINCH_CHEST
---| 1266 # ACT_MP_GESTURE_FLINCH_STOMACH
---| 1267 # ACT_MP_GESTURE_FLINCH_LEFTARM
---| 1268 # ACT_MP_GESTURE_FLINCH_RIGHTARM
---| 1269 # ACT_MP_GESTURE_FLINCH_LEFTLEG
---| 1270 # ACT_MP_GESTURE_FLINCH_RIGHTLEG
---| 1271 # ACT_MP_GRENADE1_DRAW
---| 1272 # ACT_MP_GRENADE1_IDLE
---| 1273 # ACT_MP_GRENADE1_ATTACK
---| 1274 # ACT_MP_GRENADE2_DRAW
---| 1275 # ACT_MP_GRENADE2_IDLE
---| 1276 # ACT_MP_GRENADE2_ATTACK
---| 1277 # ACT_MP_PRIMARY_GRENADE1_DRAW
---| 1278 # ACT_MP_PRIMARY_GRENADE1_IDLE
---| 1279 # ACT_MP_PRIMARY_GRENADE1_ATTACK
---| 1280 # ACT_MP_PRIMARY_GRENADE2_DRAW
---| 1281 # ACT_MP_PRIMARY_GRENADE2_IDLE
---| 1282 # ACT_MP_PRIMARY_GRENADE2_ATTACK
---| 1283 # ACT_MP_SECONDARY_GRENADE1_DRAW
---| 1284 # ACT_MP_SECONDARY_GRENADE1_IDLE
---| 1285 # ACT_MP_SECONDARY_GRENADE1_ATTACK
---| 1286 # ACT_MP_SECONDARY_GRENADE2_DRAW
---| 1287 # ACT_MP_SECONDARY_GRENADE2_IDLE
---| 1288 # ACT_MP_SECONDARY_GRENADE2_ATTACK
---| 1289 # ACT_MP_MELEE_GRENADE1_DRAW
---| 1290 # ACT_MP_MELEE_GRENADE1_IDLE
---| 1291 # ACT_MP_MELEE_GRENADE1_ATTACK
---| 1292 # ACT_MP_MELEE_GRENADE2_DRAW
---| 1293 # ACT_MP_MELEE_GRENADE2_IDLE
---| 1294 # ACT_MP_MELEE_GRENADE2_ATTACK
---| 1307 # ACT_MP_STAND_BUILDING
---| 1308 # ACT_MP_CROUCH_BUILDING
---| 1309 # ACT_MP_RUN_BUILDING
---| 1310 # ACT_MP_WALK_BUILDING
---| 1311 # ACT_MP_AIRWALK_BUILDING
---| 1312 # ACT_MP_CROUCHWALK_BUILDING
---| 1313 # ACT_MP_JUMP_BUILDING
---| 1314 # ACT_MP_JUMP_START_BUILDING
---| 1315 # ACT_MP_JUMP_FLOAT_BUILDING
---| 1316 # ACT_MP_JUMP_LAND_BUILDING
---| 1317 # ACT_MP_SWIM_BUILDING
---| 1318 # ACT_MP_ATTACK_STAND_BUILDING
---| 1319 # ACT_MP_ATTACK_CROUCH_BUILDING
---| 1320 # ACT_MP_ATTACK_SWIM_BUILDING
---| 1321 # ACT_MP_ATTACK_AIRWALK_BUILDING
---| 1322 # ACT_MP_ATTACK_STAND_GRENADE_BUILDING
---| 1323 # ACT_MP_ATTACK_CROUCH_GRENADE_BUILDING
---| 1324 # ACT_MP_ATTACK_SWIM_GRENADE_BUILDING
---| 1325 # ACT_MP_ATTACK_AIRWALK_GRENADE_BUILDING
---| 1345 # ACT_MP_STAND_PDA
---| 1346 # ACT_MP_CROUCH_PDA
---| 1347 # ACT_MP_RUN_PDA
---| 1348 # ACT_MP_WALK_PDA
---| 1349 # ACT_MP_AIRWALK_PDA
---| 1350 # ACT_MP_CROUCHWALK_PDA
---| 1351 # ACT_MP_JUMP_PDA
---| 1352 # ACT_MP_JUMP_START_PDA
---| 1353 # ACT_MP_JUMP_FLOAT_PDA
---| 1354 # ACT_MP_JUMP_LAND_PDA
---| 1355 # ACT_MP_SWIM_PDA
---| 1356 # ACT_MP_ATTACK_STAND_PDA
---| 1357 # ACT_MP_ATTACK_SWIM_PDA
---| 1377 # ACT_MP_GESTURE_VC_HANDMOUTH
---| 1378 # ACT_MP_GESTURE_VC_FINGERPOINT
---| 1379 # ACT_MP_GESTURE_VC_FISTPUMP
---| 1380 # ACT_MP_GESTURE_VC_THUMBSUP
---| 1381 # ACT_MP_GESTURE_VC_NODYES
---| 1382 # ACT_MP_GESTURE_VC_NODNO
---| 1383 # ACT_MP_GESTURE_VC_HANDMOUTH_PRIMARY
---| 1384 # ACT_MP_GESTURE_VC_FINGERPOINT_PRIMARY
---| 1385 # ACT_MP_GESTURE_VC_FISTPUMP_PRIMARY
---| 1386 # ACT_MP_GESTURE_VC_THUMBSUP_PRIMARY
---| 1387 # ACT_MP_GESTURE_VC_NODYES_PRIMARY
---| 1388 # ACT_MP_GESTURE_VC_NODNO_PRIMARY
---| 1389 # ACT_MP_GESTURE_VC_HANDMOUTH_SECONDARY
---| 1390 # ACT_MP_GESTURE_VC_FINGERPOINT_SECONDARY
---| 1391 # ACT_MP_GESTURE_VC_FISTPUMP_SECONDARY
---| 1392 # ACT_MP_GESTURE_VC_THUMBSUP_SECONDARY
---| 1393 # ACT_MP_GESTURE_VC_NODYES_SECONDARY
---| 1394 # ACT_MP_GESTURE_VC_NODNO_SECONDARY
---| 1395 # ACT_MP_GESTURE_VC_HANDMOUTH_MELEE
---| 1396 # ACT_MP_GESTURE_VC_FINGERPOINT_MELEE
---| 1397 # ACT_MP_GESTURE_VC_FISTPUMP_MELEE
---| 1398 # ACT_MP_GESTURE_VC_THUMBSUP_MELEE
---| 1399 # ACT_MP_GESTURE_VC_NODYES_MELEE
---| 1400 # ACT_MP_GESTURE_VC_NODNO_MELEE
---| 1413 # ACT_MP_GESTURE_VC_HANDMOUTH_BUILDING
---| 1414 # ACT_MP_GESTURE_VC_FINGERPOINT_BUILDING
---| 1415 # ACT_MP_GESTURE_VC_FISTPUMP_BUILDING
---| 1416 # ACT_MP_GESTURE_VC_THUMBSUP_BUILDING
---| 1417 # ACT_MP_GESTURE_VC_NODYES_BUILDING
---| 1418 # ACT_MP_GESTURE_VC_NODNO_BUILDING
---| 1419 # ACT_MP_GESTURE_VC_HANDMOUTH_PDA
---| 1420 # ACT_MP_GESTURE_VC_FINGERPOINT_PDA
---| 1421 # ACT_MP_GESTURE_VC_FISTPUMP_PDA
---| 1422 # ACT_MP_GESTURE_VC_THUMBSUP_PDA
---| 1423 # ACT_MP_GESTURE_VC_NODYES_PDA
---| 1424 # ACT_MP_GESTURE_VC_NODNO_PDA
---| 1428 # ACT_VM_UNUSABLE
---| 1429 # ACT_VM_UNUSABLE_TO_USABLE
---| 1430 # ACT_VM_USABLE_TO_UNUSABLE
---| 1610 # ACT_GMOD_GESTURE_AGREE
---| 1611 # ACT_GMOD_GESTURE_BECON
---| 1612 # ACT_GMOD_GESTURE_BOW
---| 1613 # ACT_GMOD_GESTURE_DISAGREE
---| 1614 # ACT_GMOD_TAUNT_SALUTE
---| 1615 # ACT_GMOD_GESTURE_WAVE
---| 1616 # ACT_GMOD_TAUNT_PERSISTENCE
---| 1617 # ACT_GMOD_TAUNT_MUSCLE
---| 1618 # ACT_GMOD_TAUNT_LAUGH
---| 1619 # ACT_GMOD_GESTURE_POINT
---| 1620 # ACT_GMOD_TAUNT_CHEER
---| 1621 # ACT_HL2MP_RUN_FAST
---| 1622 # ACT_HL2MP_RUN_CHARGING
---| 1623 # ACT_HL2MP_RUN_PANICKED
---| 1624 # ACT_HL2MP_RUN_PROTECTED
---| 1625 # ACT_HL2MP_IDLE_MELEE_ANGRY
---| 1626 # ACT_HL2MP_ZOMBIE_SLUMP_IDLE
---| 1627 # ACT_HL2MP_ZOMBIE_SLUMP_RISE
---| 1628 # ACT_HL2MP_WALK_ZOMBIE_01
---| 1629 # ACT_HL2MP_WALK_ZOMBIE_02
---| 1630 # ACT_HL2MP_WALK_ZOMBIE_03
---| 1631 # ACT_HL2MP_WALK_ZOMBIE_04
---| 1632 # ACT_HL2MP_WALK_ZOMBIE_05
---| 1633 # ACT_HL2MP_WALK_CROUCH_ZOMBIE_01
---| 1634 # ACT_HL2MP_WALK_CROUCH_ZOMBIE_02
---| 1635 # ACT_HL2MP_WALK_CROUCH_ZOMBIE_03
---| 1636 # ACT_HL2MP_WALK_CROUCH_ZOMBIE_04
---| 1637 # ACT_HL2MP_WALK_CROUCH_ZOMBIE_05
---| 1638 # ACT_HL2MP_IDLE_CROUCH_ZOMBIE_01
---| 1639 # ACT_HL2MP_IDLE_CROUCH_ZOMBIE_02
---| 1640 # ACT_GMOD_GESTURE_RANGE_ZOMBIE
---| 1641 # ACT_GMOD_GESTURE_TAUNT_ZOMBIE
---| 1642 # ACT_GMOD_TAUNT_DANCE
---| 1643 # ACT_GMOD_TAUNT_ROBOT
---| 1644 # ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL
---| 1645 # ACT_GMOD_GESTURE_RANGE_FRENZY
---| 1646 # ACT_HL2MP_RUN_ZOMBIE_FAST
---| 1647 # ACT_HL2MP_WALK_ZOMBIE_06
---| 1648 # ACT_ZOMBIE_LEAP_START
---| 1649 # ACT_ZOMBIE_LEAPING
---| 1650 # ACT_ZOMBIE_CLIMB_UP
---| 1651 # ACT_ZOMBIE_CLIMB_START
---| 1652 # ACT_ZOMBIE_CLIMB_END
---| 1653 # ACT_HL2MP_IDLE_MAGIC
---| 1654 # ACT_HL2MP_WALK_MAGIC
---| 1655 # ACT_HL2MP_RUN_MAGIC
---| 1656 # ACT_HL2MP_IDLE_CROUCH_MAGIC
---| 1657 # ACT_HL2MP_WALK_CROUCH_MAGIC
---| 1658 # ACT_HL2MP_GESTURE_RANGE_ATTACK_MAGIC
---| 1659 # ACT_HL2MP_GESTURE_RELOAD_MAGIC
---| 1660 # ACT_HL2MP_JUMP_MAGIC
---| 1661 # ACT_HL2MP_SWIM_IDLE_MAGIC
---| 1662 # ACT_HL2MP_SWIM_MAGIC
---| 1663 # ACT_HL2MP_IDLE_REVOLVER
---| 1664 # ACT_HL2MP_WALK_REVOLVER
---| 1665 # ACT_HL2MP_RUN_REVOLVER
---| 1666 # ACT_HL2MP_IDLE_CROUCH_REVOLVER
---| 1667 # ACT_HL2MP_WALK_CROUCH_REVOLVER
---| 1668 # ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER
---| 1669 # ACT_HL2MP_GESTURE_RELOAD_REVOLVER
---| 1670 # ACT_HL2MP_JUMP_REVOLVER
---| 1671 # ACT_HL2MP_SWIM_IDLE_REVOLVER
---| 1672 # ACT_HL2MP_SWIM_REVOLVER
---| 1673 # ACT_HL2MP_IDLE_CAMERA
---| 1674 # ACT_HL2MP_WALK_CAMERA
---| 1675 # ACT_HL2MP_RUN_CAMERA
---| 1676 # ACT_HL2MP_IDLE_CROUCH_CAMERA
---| 1677 # ACT_HL2MP_WALK_CROUCH_CAMERA
---| 1678 # ACT_HL2MP_GESTURE_RANGE_ATTACK_CAMERA
---| 1679 # ACT_HL2MP_GESTURE_RELOAD_CAMERA
---| 1680 # ACT_HL2MP_JUMP_CAMERA
---| 1681 # ACT_HL2MP_SWIM_IDLE_CAMERA
---| 1682 # ACT_HL2MP_SWIM_CAMERA
---| 1683 # ACT_HL2MP_IDLE_ANGRY
---| 1684 # ACT_HL2MP_WALK_ANGRY
---| 1685 # ACT_HL2MP_RUN_ANGRY
---| 1686 # ACT_HL2MP_IDLE_CROUCH_ANGRY
---| 1687 # ACT_HL2MP_WALK_CROUCH_ANGRY
---| 1688 # ACT_HL2MP_GESTURE_RANGE_ATTACK_ANGRY
---| 1689 # ACT_HL2MP_GESTURE_RELOAD_ANGRY
---| 1690 # ACT_HL2MP_JUMP_ANGRY
---| 1691 # ACT_HL2MP_SWIM_IDLE_ANGRY
---| 1692 # ACT_HL2MP_SWIM_ANGRY
---| 1693 # ACT_HL2MP_IDLE_SCARED
---| 1694 # ACT_HL2MP_WALK_SCARED
---| 1695 # ACT_HL2MP_RUN_SCARED
---| 1696 # ACT_HL2MP_IDLE_CROUCH_SCARED
---| 1697 # ACT_HL2MP_WALK_CROUCH_SCARED
---| 1698 # ACT_HL2MP_GESTURE_RANGE_ATTACK_SCARED
---| 1699 # ACT_HL2MP_GESTURE_RELOAD_SCARED
---| 1700 # ACT_HL2MP_JUMP_SCARED
---| 1701 # ACT_HL2MP_SWIM_IDLE_SCARED
---| 1702 # ACT_HL2MP_SWIM_SCARED
---| 1703 # ACT_HL2MP_IDLE_ZOMBIE
---| 1704 # ACT_HL2MP_WALK_ZOMBIE
---| 1705 # ACT_HL2MP_RUN_ZOMBIE
---| 1706 # ACT_HL2MP_IDLE_CROUCH_ZOMBIE
---| 1707 # ACT_HL2MP_WALK_CROUCH_ZOMBIE
---| 1708 # ACT_HL2MP_GESTURE_RANGE_ATTACK_ZOMBIE
---| 1709 # ACT_HL2MP_GESTURE_RELOAD_ZOMBIE
---| 1710 # ACT_HL2MP_JUMP_ZOMBIE
---| 1711 # ACT_HL2MP_SWIM_IDLE_ZOMBIE
---| 1712 # ACT_HL2MP_SWIM_ZOMBIE
---| 1713 # ACT_HL2MP_IDLE_SUITCASE
---| 1714 # ACT_HL2MP_WALK_SUITCASE
---| 1715 # ACT_HL2MP_RUN_SUITCASE
---| 1716 # ACT_HL2MP_IDLE_CROUCH_SUITCASE
---| 1717 # ACT_HL2MP_WALK_CROUCH_SUITCASE
---| 1718 # ACT_HL2MP_GESTURE_RANGE_ATTACK_SUITCASE
---| 1719 # ACT_HL2MP_GESTURE_RELOAD_SUITCASE
---| 1720 # ACT_HL2MP_JUMP_SUITCASE
---| 1721 # ACT_HL2MP_SWIM_IDLE_SUITCASE
---| 1722 # ACT_HL2MP_SWIM_SUITCASE
---| 1777 # ACT_HL2MP_IDLE
---| 1778 # ACT_HL2MP_WALK
---| 1779 # ACT_HL2MP_RUN
---| 1780 # ACT_HL2MP_IDLE_CROUCH
---| 1781 # ACT_HL2MP_WALK_CROUCH
---| 1782 # ACT_HL2MP_GESTURE_RANGE_ATTACK
---| 1783 # ACT_HL2MP_GESTURE_RELOAD
---| 1784 # ACT_HL2MP_JUMP
---| 1786 # ACT_HL2MP_SWIM
---| 1787 # ACT_HL2MP_IDLE_PISTOL
---| 1788 # ACT_HL2MP_WALK_PISTOL
---| 1789 # ACT_HL2MP_RUN_PISTOL
---| 1790 # ACT_HL2MP_IDLE_CROUCH_PISTOL
---| 1791 # ACT_HL2MP_WALK_CROUCH_PISTOL
---| 1792 # ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
---| 1793 # ACT_HL2MP_GESTURE_RELOAD_PISTOL
---| 1794 # ACT_HL2MP_JUMP_PISTOL
---| 1795 # ACT_HL2MP_SWIM_IDLE_PISTOL
---| 1796 # ACT_HL2MP_SWIM_PISTOL
---| 1797 # ACT_HL2MP_IDLE_SMG1
---| 1798 # ACT_HL2MP_WALK_SMG1
---| 1799 # ACT_HL2MP_RUN_SMG1
---| 1800 # ACT_HL2MP_IDLE_CROUCH_SMG1
---| 1801 # ACT_HL2MP_WALK_CROUCH_SMG1
---| 1802 # ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
---| 1803 # ACT_HL2MP_GESTURE_RELOAD_SMG1
---| 1804 # ACT_HL2MP_JUMP_SMG1
---| 1805 # ACT_HL2MP_SWIM_IDLE_SMG1
---| 1806 # ACT_HL2MP_SWIM_SMG1
---| 1807 # ACT_HL2MP_IDLE_AR2
---| 1808 # ACT_HL2MP_WALK_AR2
---| 1809 # ACT_HL2MP_RUN_AR2
---| 1810 # ACT_HL2MP_IDLE_CROUCH_AR2
---| 1811 # ACT_HL2MP_WALK_CROUCH_AR2
---| 1812 # ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
---| 1813 # ACT_HL2MP_GESTURE_RELOAD_AR2
---| 1814 # ACT_HL2MP_JUMP_AR2
---| 1815 # ACT_HL2MP_SWIM_IDLE_AR2
---| 1816 # ACT_HL2MP_SWIM_AR2
---| 1817 # ACT_HL2MP_IDLE_SHOTGUN
---| 1818 # ACT_HL2MP_WALK_SHOTGUN
---| 1819 # ACT_HL2MP_RUN_SHOTGUN
---| 1820 # ACT_HL2MP_IDLE_CROUCH_SHOTGUN
---| 1821 # ACT_HL2MP_WALK_CROUCH_SHOTGUN
---| 1822 # ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
---| 1823 # ACT_HL2MP_GESTURE_RELOAD_SHOTGUN
---| 1824 # ACT_HL2MP_JUMP_SHOTGUN
---| 1825 # ACT_HL2MP_SWIM_IDLE_SHOTGUN
---| 1826 # ACT_HL2MP_SWIM_SHOTGUN
---| 1827 # ACT_HL2MP_IDLE_RPG
---| 1828 # ACT_HL2MP_WALK_RPG
---| 1829 # ACT_HL2MP_RUN_RPG
---| 1830 # ACT_HL2MP_IDLE_CROUCH_RPG
---| 1831 # ACT_HL2MP_WALK_CROUCH_RPG
---| 1832 # ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
---| 1833 # ACT_HL2MP_GESTURE_RELOAD_RPG
---| 1834 # ACT_HL2MP_JUMP_RPG
---| 1835 # ACT_HL2MP_SWIM_IDLE_RPG
---| 1836 # ACT_HL2MP_SWIM_RPG
---| 1837 # ACT_HL2MP_IDLE_GRENADE
---| 1838 # ACT_HL2MP_WALK_GRENADE
---| 1839 # ACT_HL2MP_RUN_GRENADE
---| 1840 # ACT_HL2MP_IDLE_CROUCH_GRENADE
---| 1841 # ACT_HL2MP_WALK_CROUCH_GRENADE
---| 1842 # ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE
---| 1843 # ACT_HL2MP_GESTURE_RELOAD_GRENADE
---| 1844 # ACT_HL2MP_JUMP_GRENADE
---| 1845 # ACT_HL2MP_SWIM_IDLE_GRENADE
---| 1846 # ACT_HL2MP_SWIM_GRENADE
---| 1847 # ACT_HL2MP_IDLE_DUEL
---| 1848 # ACT_HL2MP_WALK_DUEL
---| 1849 # ACT_HL2MP_RUN_DUEL
---| 1850 # ACT_HL2MP_IDLE_CROUCH_DUEL
---| 1851 # ACT_HL2MP_WALK_CROUCH_DUEL
---| 1852 # ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL
---| 1853 # ACT_HL2MP_GESTURE_RELOAD_DUEL
---| 1854 # ACT_HL2MP_JUMP_DUEL
---| 1855 # ACT_HL2MP_SWIM_IDLE_DUEL
---| 1856 # ACT_HL2MP_SWIM_DUEL
---| 1857 # ACT_HL2MP_IDLE_PHYSGUN
---| 1858 # ACT_HL2MP_WALK_PHYSGUN
---| 1859 # ACT_HL2MP_RUN_PHYSGUN
---| 1860 # ACT_HL2MP_IDLE_CROUCH_PHYSGUN
---| 1861 # ACT_HL2MP_WALK_CROUCH_PHYSGUN
---| 1862 # ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN
---| 1863 # ACT_HL2MP_GESTURE_RELOAD_PHYSGUN
---| 1864 # ACT_HL2MP_JUMP_PHYSGUN
---| 1865 # ACT_HL2MP_SWIM_IDLE_PHYSGUN
---| 1866 # ACT_HL2MP_SWIM_PHYSGUN
---| 1867 # ACT_HL2MP_IDLE_CROSSBOW
---| 1868 # ACT_HL2MP_WALK_CROSSBOW
---| 1869 # ACT_HL2MP_RUN_CROSSBOW
---| 1870 # ACT_HL2MP_IDLE_CROUCH_CROSSBOW
---| 1871 # ACT_HL2MP_WALK_CROUCH_CROSSBOW
---| 1872 # ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
---| 1873 # ACT_HL2MP_GESTURE_RELOAD_CROSSBOW
---| 1874 # ACT_HL2MP_JUMP_CROSSBOW
---| 1875 # ACT_HL2MP_SWIM_IDLE_CROSSBOW
---| 1876 # ACT_HL2MP_SWIM_CROSSBOW
---| 1877 # ACT_HL2MP_IDLE_MELEE
---| 1878 # ACT_HL2MP_WALK_MELEE
---| 1879 # ACT_HL2MP_RUN_MELEE
---| 1880 # ACT_HL2MP_IDLE_CROUCH_MELEE
---| 1881 # ACT_HL2MP_WALK_CROUCH_MELEE
---| 1882 # ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
---| 1883 # ACT_HL2MP_GESTURE_RELOAD_MELEE
---| 1884 # ACT_HL2MP_JUMP_MELEE
---| 1885 # ACT_HL2MP_SWIM_IDLE_MELEE
---| 1886 # ACT_HL2MP_SWIM_MELEE
---| 1887 # ACT_HL2MP_IDLE_SLAM
---| 1888 # ACT_HL2MP_WALK_SLAM
---| 1889 # ACT_HL2MP_RUN_SLAM
---| 1890 # ACT_HL2MP_IDLE_CROUCH_SLAM
---| 1891 # ACT_HL2MP_WALK_CROUCH_SLAM
---| 1892 # ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM
---| 1893 # ACT_HL2MP_GESTURE_RELOAD_SLAM
---| 1894 # ACT_HL2MP_JUMP_SLAM
---| 1895 # ACT_HL2MP_SWIM_IDLE_SLAM
---| 1896 # ACT_HL2MP_SWIM_SLAM
---| 1897 # ACT_VM_CRAWL
---| 1898 # ACT_VM_CRAWL_EMPTY
---| 1899 # ACT_VM_HOLSTER_EMPTY
---| 1900 # ACT_VM_DOWN
---| 1901 # ACT_VM_DOWN_EMPTY
---| 1902 # ACT_VM_READY
---| 1903 # ACT_VM_ISHOOT
---| 1904 # ACT_VM_IIN
---| 1905 # ACT_VM_IIN_EMPTY
---| 1906 # ACT_VM_IIDLE
---| 1907 # ACT_VM_IIDLE_EMPTY
---| 1908 # ACT_VM_IOUT
---| 1909 # ACT_VM_IOUT_EMPTY
---| 1910 # ACT_VM_PULLBACK_HIGH_BAKE
---| 1911 # ACT_VM_HITKILL
---| 1912 # ACT_VM_DEPLOYED_IN
---| 1913 # ACT_VM_DEPLOYED_IDLE
---| 1914 # ACT_VM_DEPLOYED_FIRE
---| 1915 # ACT_VM_DEPLOYED_DRYFIRE
---| 1916 # ACT_VM_DEPLOYED_RELOAD
---| 1917 # ACT_VM_DEPLOYED_RELOAD_EMPTY
---| 1918 # ACT_VM_DEPLOYED_OUT
---| 1919 # ACT_VM_DEPLOYED_IRON_IN
---| 1920 # ACT_VM_DEPLOYED_IRON_IDLE
---| 1921 # ACT_VM_DEPLOYED_IRON_FIRE
---| 1922 # ACT_VM_DEPLOYED_IRON_DRYFIRE
---| 1923 # ACT_VM_DEPLOYED_IRON_OUT
---| 1924 # ACT_VM_DEPLOYED_LIFTED_IN
---| 1925 # ACT_VM_DEPLOYED_LIFTED_IDLE
---| 1926 # ACT_VM_DEPLOYED_LIFTED_OUT
---| 1927 # ACT_VM_RELOADEMPTY
---| 1928 # ACT_VM_IRECOIL1
---| 1929 # ACT_VM_IRECOIL2
---| 1930 # ACT_VM_FIREMODE
---| 1931 # ACT_VM_ISHOOT_LAST
---| 1932 # ACT_VM_IFIREMODE
---| 1933 # ACT_VM_DFIREMODE
---| 1934 # ACT_VM_DIFIREMODE
---| 1935 # ACT_VM_SHOOTLAST
---| 1936 # ACT_VM_ISHOOTDRY
---| 1937 # ACT_VM_DRAW_M203
---| 1938 # ACT_VM_DRAWFULL_M203
---| 1939 # ACT_VM_READY_M203
---| 1940 # ACT_VM_IDLE_M203
---| 1941 # ACT_VM_RELOAD_M203
---| 1942 # ACT_VM_HOLSTER_M203
---| 1943 # ACT_VM_HOLSTERFULL_M203
---| 1944 # ACT_VM_IIN_M203
---| 1945 # ACT_VM_IIDLE_M203
---| 1946 # ACT_VM_IOUT_M203
---| 1947 # ACT_VM_CRAWL_M203
---| 1948 # ACT_VM_DOWN_M203
---| 1949 # ACT_VM_ISHOOT_M203
---| 1950 # ACT_VM_RELOAD_INSERT
---| 1951 # ACT_VM_RELOAD_INSERT_PULL
---| 1952 # ACT_VM_RELOAD_END
---| 1953 # ACT_VM_RELOAD_END_EMPTY
---| 1954 # ACT_VM_RELOAD_INSERT_EMPTY
---| 1955 # ACT_CROSSBOW_HOLSTER_UNLOADED
---| 1956 # ACT_VM_FIRE_TO_EMPTY
---| 1957 # ACT_VM_UNLOAD
---| 1958 # ACT_VM_RELOAD2
---| 1959 # ACT_GMOD_NOCLIP_LAYER
---| 1960 # ACT_HL2MP_IDLE_FIST
---| 1961 # ACT_HL2MP_WALK_FIST
---| 1962 # ACT_HL2MP_RUN_FIST
---| 1963 # ACT_HL2MP_IDLE_CROUCH_FIST
---| 1964 # ACT_HL2MP_WALK_CROUCH_FIST
---| 1965 # ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST
---| 1966 # ACT_HL2MP_GESTURE_RELOAD_FIST
---| 1967 # ACT_HL2MP_JUMP_FIST
---| 1968 # ACT_HL2MP_SWIM_IDLE_FIST
---| 1969 # ACT_HL2MP_SWIM_FIST
---| 1970 # ACT_HL2MP_SIT
---| 1971 # ACT_HL2MP_FIST_BLOCK
---| 1972 # ACT_DRIVE_AIRBOAT
---| 1973 # ACT_DRIVE_JEEP
---| 1974 # ACT_GMOD_SIT_ROLLERCOASTER
---| 1975 # ACT_HL2MP_IDLE_KNIFE
---| 1976 # ACT_HL2MP_WALK_KNIFE
---| 1977 # ACT_HL2MP_RUN_KNIFE
---| 1978 # ACT_HL2MP_IDLE_CROUCH_KNIFE
---| 1979 # ACT_HL2MP_WALK_CROUCH_KNIFE
---| 1980 # ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
---| 1981 # ACT_HL2MP_GESTURE_RELOAD_KNIFE
---| 1982 # ACT_HL2MP_JUMP_KNIFE
---| 1983 # ACT_HL2MP_SWIM_IDLE_KNIFE
---| 1984 # ACT_HL2MP_SWIM_KNIFE
---| 1985 # ACT_HL2MP_IDLE_PASSIVE
---| 1986 # ACT_HL2MP_WALK_PASSIVE
---| 1987 # ACT_HL2MP_RUN_PASSIVE
---| 1988 # ACT_HL2MP_IDLE_CROUCH_PASSIVE
---| 1989 # ACT_HL2MP_WALK_CROUCH_PASSIVE
---| 1990 # ACT_HL2MP_GESTURE_RANGE_ATTACK_PASSIVE
---| 1991 # ACT_HL2MP_GESTURE_RELOAD_PASSIVE
---| 1992 # ACT_HL2MP_JUMP_PASSIVE
---| 1993 # ACT_HL2MP_SWIM_PASSIVE
---| 1994 # ACT_HL2MP_SWIM_IDLE_PASSIVE
---| 1995 # ACT_HL2MP_IDLE_MELEE2
---| 1996 # ACT_HL2MP_WALK_MELEE2
---| 1997 # ACT_HL2MP_RUN_MELEE2
---| 1998 # ACT_HL2MP_IDLE_CROUCH_MELEE2
---| 1999 # ACT_HL2MP_WALK_CROUCH_MELEE2
---| 2000 # ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
---| 2001 # ACT_HL2MP_GESTURE_RELOAD_MELEE2
---| 2002 # ACT_HL2MP_JUMP_MELEE2
---| 2003 # ACT_HL2MP_SWIM_IDLE_MELEE2
---| 2004 # ACT_HL2MP_SWIM_MELEE2
---| 2005 # ACT_HL2MP_SIT_PISTOL
---| 2006 # ACT_HL2MP_SIT_SHOTGUN
---| 2007 # ACT_HL2MP_SIT_SMG1
---| 2008 # ACT_HL2MP_SIT_AR2
---| 2009 # ACT_HL2MP_SIT_PHYSGUN
---| 2010 # ACT_HL2MP_SIT_GRENADE
---| 2011 # ACT_HL2MP_SIT_RPG
---| 2012 # ACT_HL2MP_SIT_CROSSBOW
---| 2013 # ACT_HL2MP_SIT_MELEE
---| 2014 # ACT_HL2MP_SIT_SLAM
---| 2015 # ACT_HL2MP_SIT_FIST
---| 2019 # ACT_GMOD_IN_CHAT
---| 2020 # ACT_GMOD_GESTURE_ITEM_GIVE
---| 2021 # ACT_GMOD_GESTURE_ITEM_DROP
---| 2022 # ACT_GMOD_GESTURE_ITEM_PLACE
---| 2023 # ACT_GMOD_GESTURE_ITEM_THROW
---| 2024 # ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND
---| 2025 # ACT_GMOD_GESTURE_MELEE_SHOVE_1HAND
---| 2026 # ACT_HL2MP_SWIM_IDLE
---| 2027 # ACT_HL2MP_IDLE_COWER
---| 2028 # ACT_GMOD_DEATH
---| 2029 # ACT_DRIVE_POD
---| 2030 # ACT_FLINCH
---| 2031 # ACT_FLINCH_BACK
---| 2032 # ACT_FLINCH_SHOULDER_LEFT
---| 2033 # ACT_FLINCH_SHOULDER_RIGHT
---| 2034 # ACT_HL2MP_SIT_CAMERA
---| 2035 # ACT_HL2MP_SIT_PASSIVE
---| 2036 # ACT_HL2MP_ZOMBIE_SLUMP_ALT_IDLE
---| 2037 # ACT_HL2MP_ZOMBIE_SLUMP_ALT_RISE_FAST
---| 2038 # ACT_HL2MP_ZOMBIE_SLUMP_ALT_RISE_SLOW
---| 2039 # ACT_GMOD_SHOWOFF_STAND_01
---| 2040 # ACT_GMOD_SHOWOFF_STAND_02
---| 2041 # ACT_GMOD_SHOWOFF_STAND_03
---| 2042 # ACT_GMOD_SHOWOFF_STAND_04
---| 2043 # ACT_GMOD_SHOWOFF_DUCK_01
---| 2044 # ACT_GMOD_SHOWOFF_DUCK_02
---| 2045 # LAST_SHARED_ACTIVITY

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

---@alias AIMR
---| number # Raw numeric enum value
---| -4 # AIMR_ILLEGAL
---| -3 # AIMR_BLOCKED_NPC
---| -2 # AIMR_BLOCKED_WORLD
---| -1 # AIMR_BLOCKED_ENTITY
---| 0 # AIMR_OK
---| 1 # AIMR_CHANGE_TYPE

--- Used by [game.AddAmmoType](https://wiki.facepunch.com/gmod/game.AddAmmoType)'s input structure - the [Structures/AmmoData](https://wiki.facepunch.com/gmod/Structures/AmmoData).
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/AMMO
--- * `AMMO_FORCE_DROP_IF_CARRIED` = `1`
--- * `AMMO_INTERPRET_PLRDAMAGE_AS_DAMAGE_TO_PLAYER` = `2`
--- @alias AMMO 1 | 2 | number

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

---@alias ANALOG
---| number # Raw numeric enum value
---| 0 # ANALOG_MOUSE_X
---| 1 # ANALOG_MOUSE_Y
---| 3 # ANALOG_MOUSE_WHEEL
---| 4 # ANALOG_JOY_X
---| 5 # ANALOG_JOY_Y
---| 6 # ANALOG_JOY_Z
---| 7 # ANALOG_JOY_R
---| 8 # ANALOG_JOY_U
---| 9 # ANALOG_JOY_V

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

---@alias BLEND
---| number # Raw numeric enum value
---| 0 # BLEND_ZERO
---| 1 # BLEND_ONE
---| 2 # BLEND_DST_COLOR
---| 3 # BLEND_ONE_MINUS_DST_COLOR
---| 4 # BLEND_SRC_ALPHA
---| 5 # BLEND_ONE_MINUS_SRC_ALPHA
---| 6 # BLEND_DST_ALPHA
---| 7 # BLEND_ONE_MINUS_DST_ALPHA
---| 8 # BLEND_SRC_ALPHA_SATURATE
---| 9 # BLEND_SRC_COLOR
---| 10 # BLEND_ONE_MINUS_SRC_COLOR

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

---@alias BLENDFUNC
---| number # Raw numeric enum value
---| 0 # BLENDFUNC_ADD
---| 1 # BLENDFUNC_SUBTRACT
---| 2 # BLENDFUNC_REVERSE_SUBTRACT
---| 3 # BLENDFUNC_MIN
---| 4 # BLENDFUNC_MAX

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

---@alias BLOOD_COLOR
---| number # Raw numeric enum value
---| -1 # DONT_BLEED
---| 0 # BLOOD_COLOR_RED
---| 1 # BLOOD_COLOR_YELLOW
---| 2 # BLOOD_COLOR_GREEN
---| 3 # BLOOD_COLOR_MECH
---| 4 # BLOOD_COLOR_ANTLION
---| 5 # BLOOD_COLOR_ZOMBIE
---| 6 # BLOOD_COLOR_ANTLION_WORKER

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

---@alias BONE
---| number # Raw numeric enum value
---| 1 # BONE_PHYSICALLY_SIMULATED
---| 2 # BONE_PHYSICS_PROCEDURAL
---| 4 # BONE_ALWAYS_PROCEDURAL
---| 8 # BONE_SCREEN_ALIGN_SPHERE
---| 16 # BONE_SCREEN_ALIGN_CYLINDER
---| 31 # BONE_CALCULATE_MASK
---| 256 # BONE_USED_BY_HITBOX
---| 512 # BONE_USED_BY_ATTACHMENT
---| 1024 # BONE_USED_BY_VERTEX_LOD0
---| 2048 # BONE_USED_BY_VERTEX_LOD1
---| 4096 # BONE_USED_BY_VERTEX_LOD2
---| 8192 # BONE_USED_BY_VERTEX_LOD3
---| 16384 # BONE_USED_BY_VERTEX_LOD4
---| 32768 # BONE_USED_BY_VERTEX_LOD5
---| 65536 # BONE_USED_BY_VERTEX_LOD6
---| 131072 # BONE_USED_BY_VERTEX_LOD7
---| 261120 # BONE_USED_BY_VERTEX_MASK
---| 262144 # BONE_USED_BY_BONE_MERGE
---| 524032 # BONE_USED_BY_ANYTHING
---| 524032 # BONE_USED_MASK

--- Enumerations used by [Entity:SetSurroundingBoundsType](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBoundsType).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/BOUNDS
--- Sets the bounds in relation to the entity's collision bounds.
---@readonly
BOUNDS_COLLISION = 0
--- Sets the bounds to fit all hitboxes of the entity's model.
---@readonly
BOUNDS_HITBOXES = 2

---@alias BOUNDS
---| number # Raw numeric enum value
---| 0 # BOUNDS_COLLISION
---| 2 # BOUNDS_HITBOXES

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

---@alias BOX
---| number # Raw numeric enum value
---| 0 # BOX_FRONT
---| 1 # BOX_BACK
---| 2 # BOX_RIGHT
---| 3 # BOX_LEFT
---| 4 # BOX_TOP
---| 5 # BOX_BOTTOM

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

---@alias BUTTON_CODE
---| number # Raw numeric enum value
---| -1 # BUTTON_CODE_INVALID
---| 0 # BUTTON_CODE_NONE
---| 171 # BUTTON_CODE_LAST
---| 172 # BUTTON_CODE_COUNT

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

---@alias CAP
---| number # Raw numeric enum value
---| -2147483648 # CAP_SIMPLE_RADIUS_DAMAGE
---| 1 # CAP_MOVE_GROUND
---| 2 # CAP_MOVE_JUMP
---| 4 # CAP_MOVE_FLY
---| 8 # CAP_MOVE_CLIMB
---| 16 # CAP_MOVE_SWIM
---| 32 # CAP_MOVE_CRAWL
---| 64 # CAP_MOVE_SHOOT
---| 128 # CAP_SKIP_NAV_GROUND_CHECK
---| 256 # CAP_USE
---| 1024 # CAP_AUTO_DOORS
---| 2048 # CAP_OPEN_DOORS
---| 4096 # CAP_TURN_HEAD
---| 8192 # CAP_WEAPON_RANGE_ATTACK1
---| 16384 # CAP_WEAPON_RANGE_ATTACK2
---| 32768 # CAP_WEAPON_MELEE_ATTACK1
---| 65536 # CAP_WEAPON_MELEE_ATTACK2
---| 131072 # CAP_INNATE_RANGE_ATTACK1
---| 262144 # CAP_INNATE_RANGE_ATTACK2
---| 524288 # CAP_INNATE_MELEE_ATTACK1
---| 1048576 # CAP_INNATE_MELEE_ATTACK2
---| 2097152 # CAP_USE_WEAPONS
---| 16777216 # CAP_USE_SHOT_REGULATOR
---| 8388608 # CAP_ANIMATEDFACE
---| 33554432 # CAP_FRIENDLY_DMG_IMMUNE
---| 67108864 # CAP_SQUAD
---| 134217728 # CAP_DUCK
---| 268435456 # CAP_NO_HIT_PLAYER
---| 536870912 # CAP_AIM_GUN
---| 1073741824 # CAP_NO_HIT_SQUADMATES

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

---@alias CHAN
---| number # Raw numeric enum value
---| -1 # CHAN_REPLACE
---| 0 # CHAN_AUTO
---| 1 # CHAN_WEAPON
---| 2 # CHAN_VOICE
---| 3 # CHAN_ITEM
---| 4 # CHAN_BODY
---| 5 # CHAN_STREAM
---| 6 # CHAN_STATIC
---| 7 # CHAN_VOICE2
---| 8 # CHAN_VOICE_BASE
---| 136 # CHAN_USER_BASE

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

---@alias CLASS
---| number # Raw numeric enum value
---| 0 # CLASS_NONE
---| 1 # CLASS_PLAYER
---| 2 # CLASS_PLAYER_ALLY
---| 3 # CLASS_PLAYER_ALLY_VITAL
---| 4 # CLASS_ANTLION
---| 5 # CLASS_BARNACLE
---| 6 # CLASS_BULLSEYE
---| 7 # CLASS_CITIZEN_PASSIVE
---| 8 # CLASS_CITIZEN_REBEL
---| 9 # CLASS_COMBINE
---| 10 # CLASS_COMBINE_GUNSHIP
---| 11 # CLASS_CONSCRIPT
---| 12 # CLASS_HEADCRAB
---| 13 # CLASS_MANHACK
---| 14 # CLASS_METROPOLICE
---| 15 # CLASS_MILITARY
---| 16 # CLASS_SCANNER
---| 17 # CLASS_STALKER
---| 18 # CLASS_VORTIGAUNT
---| 19 # CLASS_ZOMBIE
---| 20 # CLASS_PROTOSNIPER
---| 21 # CLASS_MISSILE
---| 22 # CLASS_FLARE
---| 23 # CLASS_EARTH_FAUNA
---| 24 # CLASS_HACKED_ROLLERMINE
---| 25 # CLASS_COMBINE_HUNTER
---| 26 # CLASS_MACHINE
---| 27 # CLASS_HUMAN_PASSIVE
---| 28 # CLASS_HUMAN_MILITARY
---| 29 # CLASS_ALIEN_MILITARY
---| 30 # CLASS_ALIEN_MONSTER
---| 31 # CLASS_ALIEN_PREY
---| 32 # CLASS_ALIEN_PREDATOR
---| 33 # CLASS_INSECT
---| 34 # CLASS_PLAYER_BIOWEAPON
---| 35 # CLASS_ALIEN_BIOWEAPON
---| 36 # CLASS_PORTAL_TURRET

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

---@alias COLLISION_GROUP
---| number # Raw numeric enum value
---| 0 # COLLISION_GROUP_NONE
---| 1 # COLLISION_GROUP_DEBRIS
---| 2 # COLLISION_GROUP_DEBRIS_TRIGGER
---| 3 # COLLISION_GROUP_INTERACTIVE_DEBRIS
---| 4 # COLLISION_GROUP_INTERACTIVE
---| 5 # COLLISION_GROUP_PLAYER
---| 6 # COLLISION_GROUP_BREAKABLE_GLASS
---| 7 # COLLISION_GROUP_VEHICLE
---| 8 # COLLISION_GROUP_PLAYER_MOVEMENT
---| 9 # COLLISION_GROUP_NPC
---| 10 # COLLISION_GROUP_IN_VEHICLE
---| 11 # COLLISION_GROUP_WEAPON
---| 12 # COLLISION_GROUP_VEHICLE_CLIP
---| 13 # COLLISION_GROUP_PROJECTILE
---| 14 # COLLISION_GROUP_DOOR_BLOCKER
---| 15 # COLLISION_GROUP_PASSABLE_DOOR
---| 16 # COLLISION_GROUP_DISSOLVING
---| 17 # COLLISION_GROUP_PUSHAWAY
---| 18 # COLLISION_GROUP_NPC_ACTOR
---| 19 # COLLISION_GROUP_NPC_SCRIPTED
---| 20 # COLLISION_GROUP_WORLD
---| 21 # LAST_SHARED_COLLISION_GROUP
---| 22 # COLLISION_GROUP_HL2_SPIT

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

---@alias CONTENTS
---| number # Raw numeric enum value
---| 0 # CONTENTS_EMPTY
---| 1 # CONTENTS_SOLID
---| 2 # CONTENTS_WINDOW
---| 4 # CONTENTS_AUX
---| 8 # CONTENTS_GRATE
---| 16 # CONTENTS_SLIME
---| 32 # CONTENTS_WATER
---| 64 # CONTENTS_BLOCKLOS
---| 128 # CONTENTS_OPAQUE
---| 256 # CONTENTS_TESTFOGVOLUME
---| 512 # CONTENTS_TEAM4
---| 1024 # CONTENTS_TEAM3
---| 2048 # CONTENTS_TEAM1
---| 4096 # CONTENTS_TEAM2
---| 8192 # CONTENTS_IGNORE_NODRAW_OPAQUE
---| 16384 # CONTENTS_MOVEABLE
---| 32768 # CONTENTS_AREAPORTAL
---| 65536 # CONTENTS_PLAYERCLIP
---| 131072 # CONTENTS_MONSTERCLIP
---| 262144 # CONTENTS_CURRENT_0
---| 1048576 # CONTENTS_CURRENT_180
---| 2097152 # CONTENTS_CURRENT_270
---| 524288 # CONTENTS_CURRENT_90
---| 8388608 # CONTENTS_CURRENT_DOWN
---| 4194304 # CONTENTS_CURRENT_UP
---| 67108864 # CONTENTS_DEBRIS
---| 134217728 # CONTENTS_DETAIL
---| 1073741824 # CONTENTS_HITBOX
---| 536870912 # CONTENTS_LADDER
---| 33554432 # CONTENTS_MONSTER
---| 16777216 # CONTENTS_ORIGIN
---| 268435456 # CONTENTS_TRANSLUCENT
---| 128 # LAST_VISIBLE_CONTENTS
---| 255 # ALL_VISIBLE_CONTENTS

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

---@alias CREATERENDERTARGETFLAGS
---| number # Raw numeric enum value
---| 1 # CREATERENDERTARGETFLAGS_HDR
---| 2 # CREATERENDERTARGETFLAGS_AUTOMIPMAP
---| 4 # CREATERENDERTARGETFLAGS_UNFILTERABLE_OK

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

---@alias CT
---| number # Raw numeric enum value
---| 0 # CT_DEFAULT
---| 1 # CT_DOWNTRODDEN
---| 2 # CT_REFUGEE
---| 3 # CT_REBEL
---| 4 # CT_UNIQUE

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

---@alias D
---| number # Raw numeric enum value
---| 0 # D_ER
---| 1 # D_HT
---| 2 # D_FR
---| 3 # D_LI
---| 4 # D_NU

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

---@alias DEATH_NOTICE
---| number # Raw numeric enum value
---| 1 # DEATH_NOTICE_FRIENDLY_VICTIM
---| 2 # DEATH_NOTICE_FRIENDLY_ATTACKER

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

---@alias DISPSURF
---| number # Raw numeric enum value
---| 1 # DISPSURF_SURFACE
---| 2 # DISPSURF_WALKABLE
---| 4 # DISPSURF_BUILDABLE
---| 8 # DISPSURF_SURFPROP1
---| 16 # DISPSURF_SURFPROP2

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

---@alias DMG
---| number # Raw numeric enum value
---| 0 # DMG_GENERIC
---| 1 # DMG_CRUSH
---| 2 # DMG_BULLET
---| 4 # DMG_SLASH
---| 8 # DMG_BURN
---| 16 # DMG_VEHICLE
---| 32 # DMG_FALL
---| 64 # DMG_BLAST
---| 128 # DMG_CLUB
---| 256 # DMG_SHOCK
---| 512 # DMG_SONIC
---| 1024 # DMG_ENERGYBEAM
---| 2048 # DMG_PREVENT_PHYSICS_FORCE
---| 4096 # DMG_NEVERGIB
---| 8192 # DMG_ALWAYSGIB
---| 16384 # DMG_DROWN
---| 32768 # DMG_PARALYZE
---| 65536 # DMG_NERVEGAS
---| 131072 # DMG_POISON
---| 262144 # DMG_RADIATION
---| 524288 # DMG_DROWNRECOVER
---| 1048576 # DMG_ACID
---| 2097152 # DMG_SLOWBURN
---| 4194304 # DMG_REMOVENORAGDOLL
---| 8388608 # DMG_PHYSGUN
---| 16777216 # DMG_PLASMA
---| 33554432 # DMG_AIRBOAT
---| 67108864 # DMG_DISSOLVE
---| 134217728 # DMG_BLAST_SURFACE
---| 268435456 # DMG_DIRECT
---| 536870912 # DMG_BUCKSHOT
---| 1073741824 # DMG_SNIPER
---| 2147483648 # DMG_MISSILEDEFENSE

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

---@alias DOCK
---| number # Raw numeric enum value
---| 0 # NODOCK
---| 1 # FILL
---| 2 # LEFT
---| 3 # RIGHT
---| 4 # TOP
---| 5 # BOTTOM

--- Internal globals for SimpleDoF.
---@realm client
---@source https://wiki.facepunch.com/gmod/Enums/DOF
---@readonly
DOF_OFFSET = 256
---@readonly
DOF_SPACING = 512

---@alias DOF
---| number # Raw numeric enum value
---| 256 # DOF_OFFSET
---| 512 # DOF_SPACING

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

---@alias EF
---| number # Raw numeric enum value
---| 1 # EF_BONEMERGE
---| 128 # EF_BONEMERGE_FASTCULL
---| 2 # EF_BRIGHTLIGHT
---| 4 # EF_DIMLIGHT
---| 8 # EF_NOINTERP
---| 16 # EF_NOSHADOW
---| 32 # EF_NODRAW
---| 64 # EF_NORECEIVESHADOW
---| 256 # EF_ITEM_BLINK
---| 512 # EF_PARENT_ANIMATES
---| 1024 # EF_FOLLOWBONE
---| 8192 # EF_NOFLASHLIGHT

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

---@alias EFL
---| number # Raw numeric enum value
---| 1 # EFL_KILLME
---| 2 # EFL_DORMANT
---| 4 # EFL_NOCLIP_ACTIVE
---| 8 # EFL_SETTING_UP_BONES
---| 16 # EFL_KEEP_ON_RECREATE_ENTITIES
---| 16 # EFL_HAS_PLAYER_CHILD
---| 32 # EFL_DIRTY_SHADOWUPDATE
---| 64 # EFL_NOTIFY
---| 128 # EFL_FORCE_CHECK_TRANSMIT
---| 256 # EFL_BOT_FROZEN
---| 512 # EFL_SERVER_ONLY
---| 1024 # EFL_NO_AUTO_EDICT_ATTACH
---| 2048 # EFL_DIRTY_ABSTRANSFORM
---| 4096 # EFL_DIRTY_ABSVELOCITY
---| 8192 # EFL_DIRTY_ABSANGVELOCITY
---| 16384 # EFL_DIRTY_SURROUNDING_COLLISION_BOUNDS
---| 32768 # EFL_DIRTY_SPATIAL_PARTITION
---| 131072 # EFL_IN_SKYBOX
---| 262144 # EFL_USE_PARTITION_WHEN_NOT_SOLID
---| 524288 # EFL_TOUCHING_FLUID
---| 1048576 # EFL_IS_BEING_LIFTED_BY_BARNACLE
---| 2097152 # EFL_NO_ROTORWASH_PUSH
---| 4194304 # EFL_NO_THINK_FUNCTION
---| 8388608 # EFL_NO_GAME_PHYSICS_SIMULATION
---| 16777216 # EFL_CHECK_UNTOUCH
---| 33554432 # EFL_DONTBLOCKLOS
---| 67108864 # EFL_DONTWALKON
---| 134217728 # EFL_NO_DISSOLVE
---| 268435456 # EFL_NO_MEGAPHYSCANNON_RAGDOLL
---| 536870912 # EFL_NO_WATER_VELOCITY_CHANGE
---| 1073741824 # EFL_NO_PHYSCANNON_INTERACTION
---| -2147483648 # EFL_NO_DAMAGE_FORCES

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

---@alias FCVAR
---| number # Raw numeric enum value
---| 128 # FCVAR_ARCHIVE
---| 16777216 # FCVAR_ARCHIVE_XBOX
---| 16384 # FCVAR_CHEAT
---| 1073741824 # FCVAR_CLIENTCMD_CAN_EXECUTE
---| 8 # FCVAR_CLIENTDLL
---| 65536 # FCVAR_DEMO
---| 131072 # FCVAR_DONTRECORD
---| 4 # FCVAR_GAMEDLL
---| 262144 # FCVAR_LUA_CLIENT
---| 524288 # FCVAR_LUA_SERVER
---| 4096 # FCVAR_NEVER_AS_STRING
---| 0 # FCVAR_NONE
---| 256 # FCVAR_NOTIFY
---| 4194304 # FCVAR_NOT_CONNECTED
---| 1024 # FCVAR_PRINTABLEONLY
---| 32 # FCVAR_PROTECTED
---| 8192 # FCVAR_REPLICATED
---| 536870912 # FCVAR_SERVER_CANNOT_QUERY
---| 268435456 # FCVAR_SERVER_CAN_EXECUTE
---| 64 # FCVAR_SPONLY
---| 2048 # FCVAR_UNLOGGED
---| 1 # FCVAR_UNREGISTERED
---| 512 # FCVAR_USERINFO

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

---@alias FFT
---| number # Raw numeric enum value
---| 0 # FFT_256
---| 1 # FFT_512
---| 2 # FFT_1024
---| 3 # FFT_2048
---| 4 # FFT_4096
---| 5 # FFT_8192
---| 6 # FFT_16384
---| 7 # FFT_32768

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

---@alias FL
---| number # Raw numeric enum value
---| 1 # FL_ONGROUND
---| 2 # FL_DUCKING
---| 4 # FL_ANIMDUCKING
---| 8 # FL_WATERJUMP
---| 16 # FL_ONTRAIN
---| 32 # FL_INRAIN
---| 64 # FL_FROZEN
---| 128 # FL_ATCONTROLS
---| 256 # FL_CLIENT
---| 512 # FL_FAKECLIENT
---| 1024 # FL_INWATER
---| 2048 # FL_FLY
---| 4096 # FL_SWIM
---| 8192 # FL_CONVEYOR
---| 16384 # FL_NPC
---| 32768 # FL_GODMODE
---| 65536 # FL_NOTARGET
---| 131072 # FL_AIMTARGET
---| 262144 # FL_PARTIALGROUND
---| 524288 # FL_STATICPROP
---| 1048576 # FL_GRAPHED
---| 2097152 # FL_GRENADE
---| 4194304 # FL_STEPMOVEMENT
---| 8388608 # FL_DONTTOUCH
---| 16777216 # FL_BASEVELOCITY
---| 33554432 # FL_WORLDBRUSH
---| 67108864 # FL_OBJECT
---| 134217728 # FL_KILLME
---| 268435456 # FL_ONFIRE
---| 536870912 # FL_DISSOLVING
---| 1073741824 # FL_TRANSRAGDOLL
---| -2147483648 # FL_UNBLOCKABLE_BY_PLAYER

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

---@alias FORCE
---| number # Raw numeric enum value
---| 1 # FORCE_STRING
---| 2 # FORCE_NUMBER
---| 3 # FORCE_BOOL
---| 4 # FORCE_ANGLE
---| 5 # FORCE_COLOR
---| 6 # FORCE_VECTOR

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

---@alias FSASYNC
---| number # Raw numeric enum value
---| -8 # FSASYNC_ERR_NOT_MINE
---| -7 # FSASYNC_ERR_RETRY_LATER
---| -6 # FSASYNC_ERR_ALIGNMENT
---| -5 # FSASYNC_ERR_FAILURE
---| -4 # FSASYNC_ERR_READING
---| -3 # FSASYNC_ERR_NOMEMORY
---| -2 # FSASYNC_ERR_UNKNOWNID
---| -1 # FSASYNC_ERR_FILEOPEN
---| 0 # FSASYNC_OK
---| 1 # FSASYNC_STATUS_PENDING
---| 2 # FSASYNC_STATUS_INPROGRESS
---| 3 # FSASYNC_STATUS_ABORTED
---| 4 # FSASYNC_STATUS_UNSERVICED

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

---@alias FSOLID
---| number # Raw numeric enum value
---| 1 # FSOLID_CUSTOMRAYTEST
---| 2 # FSOLID_CUSTOMBOXTEST
---| 4 # FSOLID_NOT_SOLID
---| 8 # FSOLID_TRIGGER
---| 16 # FSOLID_NOT_STANDABLE
---| 32 # FSOLID_VOLUME_CONTENTS
---| 64 # FSOLID_FORCE_WORLD_ALIGNED
---| 128 # FSOLID_USE_TRIGGER_BOUNDS
---| 256 # FSOLID_ROOT_PARENT_ALIGNED
---| 512 # FSOLID_TRIGGER_TOUCH_DEBRIS
---| 10 # FSOLID_MAX_BITS

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
--- Like FVPHYSICS_NO_NPC_IMPACT_DMG, but only checks for NPCs. Usually set on Combine Balls fired by Combine Soldiers.
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

---@alias FVPHYSICS
---| number # Raw numeric enum value
---| 2 # FVPHYSICS_CONSTRAINT_STATIC
---| 512 # FVPHYSICS_DMG_DISSOLVE
---| 1 # FVPHYSICS_DMG_SLICE
---| 32 # FVPHYSICS_HEAVY_OBJECT
---| 16 # FVPHYSICS_MULTIOBJECT_ENTITY
---| 1024 # FVPHYSICS_NO_IMPACT_DMG
---| 2048 # FVPHYSICS_NO_NPC_IMPACT_DMG
---| 128 # FVPHYSICS_NO_PLAYER_PICKUP
---| 32768 # FVPHYSICS_NO_SELF_COLLISIONS
---| 8 # FVPHYSICS_PART_OF_RAGDOLL
---| 64 # FVPHYSICS_PENETRATING
---| 4 # FVPHYSICS_PLAYER_HELD
---| 256 # FVPHYSICS_WAS_THROWN

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

---@alias GESTURE_SLOT
---| number # Raw numeric enum value
---| 0 # GESTURE_SLOT_ATTACK_AND_RELOAD
---| 1 # GESTURE_SLOT_GRENADE
---| 2 # GESTURE_SLOT_JUMP
---| 3 # GESTURE_SLOT_SWIM
---| 4 # GESTURE_SLOT_FLINCH
---| 5 # GESTURE_SLOT_VCD
---| 6 # GESTURE_SLOT_CUSTOM

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

---@alias GLOBAL
---| number # Raw numeric enum value
---| 0 # GLOBAL_OFF
---| 1 # GLOBAL_ON
---| 2 # GLOBAL_DEAD

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

---@alias GMOD_CHANNEL
---| number # Raw numeric enum value
---| 0 # GMOD_CHANNEL_STOPPED
---| 1 # GMOD_CHANNEL_PLAYING
---| 2 # GMOD_CHANNEL_PAUSED
---| 3 # GMOD_CHANNEL_STALLED

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
--- @alias GOALTYPE 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | number

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

---@alias HITGROUP
---| number # Raw numeric enum value
---| 0 # HITGROUP_GENERIC
---| 1 # HITGROUP_HEAD
---| 2 # HITGROUP_CHEST
---| 3 # HITGROUP_STOMACH
---| 4 # HITGROUP_LEFTARM
---| 5 # HITGROUP_RIGHTARM
---| 6 # HITGROUP_LEFTLEG
---| 7 # HITGROUP_RIGHTLEG
---| 10 # HITGROUP_GEAR

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

---@alias HUD
---| number # Raw numeric enum value
---| 1 # HUD_PRINTNOTIFY
---| 2 # HUD_PRINTCONSOLE
---| 3 # HUD_PRINTTALK
---| 4 # HUD_PRINTCENTER

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

---@alias HULL
---| number # Raw numeric enum value
---| 0 # HULL_HUMAN
---| 1 # HULL_SMALL_CENTERED
---| 2 # HULL_WIDE_HUMAN
---| 3 # HULL_TINY
---| 4 # HULL_WIDE_SHORT
---| 5 # HULL_MEDIUM
---| 6 # HULL_TINY_CENTERED
---| 7 # HULL_LARGE
---| 8 # HULL_LARGE_CENTERED
---| 9 # HULL_MEDIUM_TALL

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

---@alias IMAGE_FORMAT
---| number # Raw numeric enum value
---| -1 # IMAGE_FORMAT_DEFAULT
---| 0 # IMAGE_FORMAT_RGBA8888
---| 1 # IMAGE_FORMAT_ABGR8888
---| 2 # IMAGE_FORMAT_RGB888
---| 3 # IMAGE_FORMAT_BGR888
---| 4 # IMAGE_FORMAT_RGB565
---| 11 # IMAGE_FORMAT_ARGB8888
---| 12 # IMAGE_FORMAT_BGRA8888
---| 25 # IMAGE_FORMAT_RGBA16161616
---| 24 # IMAGE_FORMAT_RGBA16161616F

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

---@alias IN
---| number # Raw numeric enum value
---| 1 # IN_ATTACK
---| 2 # IN_JUMP
---| 4 # IN_DUCK
---| 8 # IN_FORWARD
---| 16 # IN_BACK
---| 32 # IN_USE
---| 64 # IN_CANCEL
---| 128 # IN_LEFT
---| 256 # IN_RIGHT
---| 512 # IN_MOVELEFT
---| 1024 # IN_MOVERIGHT
---| 2048 # IN_ATTACK2
---| 4096 # IN_RUN
---| 8192 # IN_RELOAD
---| 16384 # IN_ALT1
---| 32768 # IN_ALT2
---| 65536 # IN_SCORE
---| 131072 # IN_SPEED
---| 262144 # IN_WALK
---| 524288 # IN_ZOOM
---| 1048576 # IN_WEAPON1
---| 2097152 # IN_WEAPON2
---| 4194304 # IN_BULLRUSH
---| 8388608 # IN_GRENADE1
---| 16777216 # IN_GRENADE2

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

---@alias JOYSTICK
---| number # Raw numeric enum value
---| 114 # JOYSTICK_FIRST
---| 114 # JOYSTICK_FIRST_BUTTON
---| 145 # JOYSTICK_LAST_BUTTON
---| 146 # JOYSTICK_FIRST_POV_BUTTON
---| 149 # JOYSTICK_LAST_POV_BUTTON
---| 150 # JOYSTICK_FIRST_AXIS_BUTTON
---| 161 # JOYSTICK_LAST_AXIS_BUTTON
---| 161 # JOYSTICK_LAST

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

---@alias KEY
---| number # Raw numeric enum value
---| 0 # KEY_FIRST
---| 0 # KEY_NONE
---| 1 # KEY_0
---| 2 # KEY_1
---| 3 # KEY_2
---| 4 # KEY_3
---| 5 # KEY_4
---| 6 # KEY_5
---| 7 # KEY_6
---| 8 # KEY_7
---| 9 # KEY_8
---| 10 # KEY_9
---| 11 # KEY_A
---| 12 # KEY_B
---| 13 # KEY_C
---| 14 # KEY_D
---| 15 # KEY_E
---| 16 # KEY_F
---| 17 # KEY_G
---| 18 # KEY_H
---| 19 # KEY_I
---| 20 # KEY_J
---| 21 # KEY_K
---| 22 # KEY_L
---| 23 # KEY_M
---| 24 # KEY_N
---| 25 # KEY_O
---| 26 # KEY_P
---| 27 # KEY_Q
---| 28 # KEY_R
---| 29 # KEY_S
---| 30 # KEY_T
---| 31 # KEY_U
---| 32 # KEY_V
---| 33 # KEY_W
---| 34 # KEY_X
---| 35 # KEY_Y
---| 36 # KEY_Z
---| 37 # KEY_PAD_0
---| 38 # KEY_PAD_1
---| 39 # KEY_PAD_2
---| 40 # KEY_PAD_3
---| 41 # KEY_PAD_4
---| 42 # KEY_PAD_5
---| 43 # KEY_PAD_6
---| 44 # KEY_PAD_7
---| 45 # KEY_PAD_8
---| 46 # KEY_PAD_9
---| 47 # KEY_PAD_DIVIDE
---| 48 # KEY_PAD_MULTIPLY
---| 49 # KEY_PAD_MINUS
---| 50 # KEY_PAD_PLUS
---| 51 # KEY_PAD_ENTER
---| 52 # KEY_PAD_DECIMAL
---| 53 # KEY_LBRACKET
---| 54 # KEY_RBRACKET
---| 55 # KEY_SEMICOLON
---| 56 # KEY_APOSTROPHE
---| 57 # KEY_BACKQUOTE
---| 58 # KEY_COMMA
---| 59 # KEY_PERIOD
---| 60 # KEY_SLASH
---| 61 # KEY_BACKSLASH
---| 62 # KEY_MINUS
---| 63 # KEY_EQUAL
---| 64 # KEY_ENTER
---| 65 # KEY_SPACE
---| 66 # KEY_BACKSPACE
---| 67 # KEY_TAB
---| 68 # KEY_CAPSLOCK
---| 69 # KEY_NUMLOCK
---| 70 # KEY_ESCAPE
---| 71 # KEY_SCROLLLOCK
---| 72 # KEY_INSERT
---| 73 # KEY_DELETE
---| 74 # KEY_HOME
---| 75 # KEY_END
---| 76 # KEY_PAGEUP
---| 77 # KEY_PAGEDOWN
---| 78 # KEY_BREAK
---| 79 # KEY_LSHIFT
---| 80 # KEY_RSHIFT
---| 81 # KEY_LALT
---| 82 # KEY_RALT
---| 83 # KEY_LCONTROL
---| 84 # KEY_RCONTROL
---| 85 # KEY_LWIN
---| 86 # KEY_RWIN
---| 87 # KEY_APP
---| 88 # KEY_UP
---| 89 # KEY_LEFT
---| 90 # KEY_DOWN
---| 91 # KEY_RIGHT
---| 92 # KEY_F1
---| 93 # KEY_F2
---| 94 # KEY_F3
---| 95 # KEY_F4
---| 96 # KEY_F5
---| 97 # KEY_F6
---| 98 # KEY_F7
---| 99 # KEY_F8
---| 100 # KEY_F9
---| 101 # KEY_F10
---| 102 # KEY_F11
---| 103 # KEY_F12
---| 104 # KEY_CAPSLOCKTOGGLE
---| 105 # KEY_NUMLOCKTOGGLE
---| 106 # KEY_LAST
---| 106 # KEY_SCROLLLOCKTOGGLE
---| 107 # KEY_COUNT
---| 114 # KEY_XBUTTON_A
---| 115 # KEY_XBUTTON_B
---| 116 # KEY_XBUTTON_X
---| 117 # KEY_XBUTTON_Y
---| 118 # KEY_XBUTTON_LEFT_SHOULDER
---| 119 # KEY_XBUTTON_RIGHT_SHOULDER
---| 120 # KEY_XBUTTON_BACK
---| 121 # KEY_XBUTTON_START
---| 122 # KEY_XBUTTON_STICK1
---| 123 # KEY_XBUTTON_STICK2
---| 146 # KEY_XBUTTON_UP
---| 147 # KEY_XBUTTON_RIGHT
---| 148 # KEY_XBUTTON_DOWN
---| 149 # KEY_XBUTTON_LEFT
---| 150 # KEY_XSTICK1_RIGHT
---| 151 # KEY_XSTICK1_LEFT
---| 152 # KEY_XSTICK1_DOWN
---| 153 # KEY_XSTICK1_UP
---| 154 # KEY_XBUTTON_LTRIGGER
---| 155 # KEY_XBUTTON_RTRIGGER
---| 156 # KEY_XSTICK2_RIGHT
---| 157 # KEY_XSTICK2_LEFT
---| 158 # KEY_XSTICK2_DOWN
---| 159 # KEY_XSTICK2_UP

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

---@alias kRenderFx
---| number # Raw numeric enum value
---| 0 # kRenderFxNone
---| 1 # kRenderFxPulseSlow
---| 2 # kRenderFxPulseFast
---| 3 # kRenderFxPulseSlowWide
---| 4 # kRenderFxPulseFastWide
---| 5 # kRenderFxFadeSlow
---| 6 # kRenderFxFadeFast
---| 7 # kRenderFxSolidSlow
---| 8 # kRenderFxSolidFast
---| 9 # kRenderFxStrobeSlow
---| 10 # kRenderFxStrobeFast
---| 11 # kRenderFxStrobeFaster
---| 12 # kRenderFxFlickerSlow
---| 13 # kRenderFxFlickerFast
---| 14 # kRenderFxNoDissipation
---| 15 # kRenderFxDistort
---| 16 # kRenderFxHologram
---| 17 # kRenderFxExplode
---| 18 # kRenderFxGlowShell
---| 19 # kRenderFxClampMinScale
---| 20 # kRenderFxEnvRain
---| 21 # kRenderFxEnvSnow
---| 22 # kRenderFxSpotlight
---| 23 # kRenderFxRagdoll
---| 24 # kRenderFxPulseFastWider

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

---@alias MASK
---| number # Raw numeric enum value
---| 4294967295 # MASK_ALL
---| 16449 # MASK_BLOCKLOS
---| 33570881 # MASK_BLOCKLOS_AND_NPCS
---| 16515072 # MASK_CURRENT
---| 65547 # MASK_DEADSOLID
---| 33701899 # MASK_NPCSOLID
---| 147467 # MASK_NPCSOLID_BRUSHONLY
---| 131083 # MASK_NPCWORLDSTATIC
---| 16513 # MASK_OPAQUE
---| 33570945 # MASK_OPAQUE_AND_NPCS
---| 33636363 # MASK_PLAYERSOLID
---| 81931 # MASK_PLAYERSOLID_BRUSHONLY
---| 1174421507 # MASK_SHOT
---| 100679691 # MASK_SHOT_HULL
---| 33570819 # MASK_SHOT_PORTAL
---| 33570827 # MASK_SOLID
---| 16395 # MASK_SOLID_BRUSHONLY
---| 48 # MASK_SPLITAREAPORTAL
---| 24705 # MASK_VISIBLE
---| 33579137 # MASK_VISIBLE_AND_NPCS
---| 16432 # MASK_WATER

--- Enumerations used in [Structures/TraceResult](https://wiki.facepunch.com/gmod/Structures/TraceResult) and [Structures/SurfacePropertyData](https://wiki.facepunch.com/gmod/Structures/SurfacePropertyData), and by [Entity:GetMaterialType](https://wiki.facepunch.com/gmod/Entity:GetMaterialType).
---
--- # These aren't VMT materials!
---
--- [Material types](https://developer.valvesoftware.com/wiki/Material_Types) are a [holdover from GoldSrc](https://developer.valvesoftware.com/wiki/Material_surface_properties) and Quake before it. They were previously used to classify textures and entities into categories, defining their physical properties. In practice, this really only changed impact sounds and effects, and player footstep sounds. For example, `func_breakable` (in GoldSrc) used it to select which gibs to spawn when broken. Raw texture files were given these properties by assigning them to a material. These were tracked in the single file `materials.txt`, which contained mappings of material types to texture names. Materials are indexed using a letter—for example `MAT_METAL` was indexed in `materials.txt` with the letter "M". The value of `MAT_METAL` is 77, because the ASCII value for M is 77. Some entities could also be assigned materials directly in their [keyvalues](https://wiki.facepunch.com/gmod/Entity:GetSaveTable) using the same system.
---
--- In Source, materials were moved out of the single `materials.txt` file; now every texture has its own associated [material](https://wiki.facepunch.com/gmod/Materials_and_Textures) file, called [VMT](https://developer.valvesoftware.com/wiki/VMT) (**V**alve **M**aterial **T**ype). VMTs contain all the information legacy materials used to provide and more, including including shader, transparency, physical properties, animations...
---
--- Rather than place the properties directly inside the VMT (which would prevent them from being assigned directly to entities like legacy materials could), [surface properties](https://wiki.facepunch.com/gmod/Structures/SurfacePropertyData) were added, which can be selected in the VMT using the `$surfaceprop` key. Surface properties are what determine impact sounds, buoyancy, friction, and other such properties. These do not use letters as identifiers and instead use [string names](https://wiki.facepunch.com/gmod/util.GetSurfaceIndex). You can view the surface properties Garry's Mod loads by looking in the `GarrysMod/sourceengine/scripts/surfaceproperties.txt` file.
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

---@alias MAT
---| number # Raw numeric enum value
---| 65 # MAT_ANTLION
---| 66 # MAT_BLOODYFLESH
---| 67 # MAT_CONCRETE
---| 68 # MAT_DIRT
---| 69 # MAT_EGGSHELL
---| 70 # MAT_FLESH
---| 71 # MAT_GRATE
---| 72 # MAT_ALIENFLESH
---| 73 # MAT_CLIP
---| 74 # MAT_SNOW
---| 76 # MAT_PLASTIC
---| 77 # MAT_METAL
---| 78 # MAT_SAND
---| 79 # MAT_FOLIAGE
---| 80 # MAT_COMPUTER
---| 83 # MAT_SLOSH
---| 84 # MAT_TILE
---| 85 # MAT_GRASS
---| 86 # MAT_VENT
---| 87 # MAT_WOOD
---| 88 # MAT_DEFAULT
---| 89 # MAT_GLASS
---| 90 # MAT_WARPSHIELD

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
--- **WARNING**: The primitive type `MATERIAL_LINES` does not currently work and will not produce any visual effect if used.
---
--- For more information, see [Line Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#lines)
---@readonly
MATERIAL_LINES = 1
--- Creates triangles from groupings of 3 vertices.
---
--- TThe `primitiveCount` argument of [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin) should be the total number of triangles that the Mesh will contain.
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
--- **WARNING**: The primitive type `MATERIAL_LINE_STRIP` does not currently work and will not produce any visual effect if used.
---
--- For more information, see [Line Strip Primitives](https://wiki.facepunch.com/gmod/mesh_primitives#linestrips)
---@readonly
MATERIAL_LINE_STRIP = 4
--- **WARNING**: The primitive type `MATERIAL_LINE_LOOP` does not currently work and will not produce any visual effect if used.
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

---@alias MATERIAL
---| number # Raw numeric enum value
---| 0 # MATERIAL_POINTS
---| 1 # MATERIAL_LINES
---| 2 # MATERIAL_TRIANGLES
---| 3 # MATERIAL_TRIANGLE_STRIP
---| 4 # MATERIAL_LINE_STRIP
---| 5 # MATERIAL_LINE_LOOP
---| 6 # MATERIAL_POLYGON
---| 7 # MATERIAL_QUADS

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

---@alias MATERIAL_CULLMODE
---| number # Raw numeric enum value
---| 0 # MATERIAL_CULLMODE_CCW
---| 1 # MATERIAL_CULLMODE_CW
---| 2 # MATERIAL_CULLMODE_NONE

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

---@alias MATERIAL_FOG
---| number # Raw numeric enum value
---| 0 # MATERIAL_FOG_NONE
---| 1 # MATERIAL_FOG_LINEAR
---| 2 # MATERIAL_FOG_LINEAR_BELOW_FOG_Z

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

---@alias MATERIAL_LIGHT
---| number # Raw numeric enum value
---| 0 # MATERIAL_LIGHT_DISABLE
---| 1 # MATERIAL_LIGHT_POINT
---| 2 # MATERIAL_LIGHT_DIRECTIONAL
---| 3 # MATERIAL_LIGHT_SPOT

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

---@alias MATERIAL_RT_DEPTH
---| number # Raw numeric enum value
---| 0 # MATERIAL_RT_DEPTH_SHARED
---| 1 # MATERIAL_RT_DEPTH_SEPARATE
---| 2 # MATERIAL_RT_DEPTH_NONE
---| 3 # MATERIAL_RT_DEPTH_ONLY

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

---@alias MOUSE
---| number # Raw numeric enum value
---| 107 # MOUSE_FIRST
---| 107 # MOUSE_LEFT
---| 108 # MOUSE_RIGHT
---| 109 # MOUSE_MIDDLE
---| 110 # MOUSE_4
---| 111 # MOUSE_5
---| 112 # MOUSE_WHEEL_UP
---| 113 # MOUSE_WHEEL_DOWN
---| 113 # MOUSE_LAST
---| 7 # MOUSE_COUNT

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

---@alias MOVECOLLIDE
---| number # Raw numeric enum value
---| 0 # MOVECOLLIDE_DEFAULT
---| 1 # MOVECOLLIDE_FLY_BOUNCE
---| 2 # MOVECOLLIDE_FLY_CUSTOM
---| 3 # MOVECOLLIDE_FLY_SLIDE
---| 4 # MOVECOLLIDE_COUNT

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

---@alias MOVETYPE
---| number # Raw numeric enum value
---| 0 # MOVETYPE_NONE
---| 1 # MOVETYPE_ISOMETRIC
---| 2 # MOVETYPE_WALK
---| 3 # MOVETYPE_STEP
---| 4 # MOVETYPE_FLY
---| 5 # MOVETYPE_FLYGRAVITY
---| 6 # MOVETYPE_VPHYSICS
---| 7 # MOVETYPE_PUSH
---| 8 # MOVETYPE_NOCLIP
---| 9 # MOVETYPE_LADDER
---| 10 # MOVETYPE_OBSERVER
---| 11 # MOVETYPE_CUSTOM

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

---@alias NAV
---| number # Raw numeric enum value
---| -1 # NAV_NONE
---| 0 # NAV_GROUND
---| 1 # NAV_JUMP
---| 2 # NAV_FLY
---| 3 # NAV_CLIMB

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

---@alias NAV_MESH
---| number # Raw numeric enum value
---| 0 # NAV_MESH_INVALID
---| 1 # NAV_MESH_CROUCH
---| 2 # NAV_MESH_JUMP
---| 4 # NAV_MESH_PRECISE
---| 8 # NAV_MESH_NO_JUMP
---| 16 # NAV_MESH_STOP
---| 32 # NAV_MESH_RUN
---| 64 # NAV_MESH_WALK
---| 128 # NAV_MESH_AVOID
---| 256 # NAV_MESH_TRANSIENT
---| 512 # NAV_MESH_DONT_HIDE
---| 1024 # NAV_MESH_STAND
---| 2048 # NAV_MESH_NO_HOSTAGES
---| 4096 # NAV_MESH_STAIRS
---| 8192 # NAV_MESH_NO_MERGE
---| 16384 # NAV_MESH_OBSTACLE_TOP
---| 32768 # NAV_MESH_CLIFF
---| 65536 # NAV_MESH_BLOCKED_LUA
---| 268435456 # NAV_MESH_BLOCKED_PROPDOOR
---| 536870912 # NAV_MESH_FUNC_COST
---| 1073741824 # NAV_MESH_HAS_ELEVATOR
---| -2147483648 # NAV_MESH_NAV_BLOCKER

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
--- @alias NavCorner 0 | 1 | 2 | 3 | 4 | number

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
--- @alias NavDir 0 | 1 | 2 | 3 | number

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
--- @alias NavTraverseType 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | number

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

---@alias NOTIFY
---| number # Raw numeric enum value
---| 0 # NOTIFY_GENERIC
---| 1 # NOTIFY_ERROR
---| 2 # NOTIFY_UNDO
---| 3 # NOTIFY_HINT
---| 4 # NOTIFY_CLEANUP

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

---@alias NPC_STATE
---| number # Raw numeric enum value
---| -1 # NPC_STATE_INVALID
---| 0 # NPC_STATE_NONE
---| 1 # NPC_STATE_IDLE
---| 2 # NPC_STATE_ALERT
---| 3 # NPC_STATE_COMBAT
---| 4 # NPC_STATE_SCRIPT
---| 5 # NPC_STATE_PLAYDEAD
---| 6 # NPC_STATE_PRONE
---| 7 # NPC_STATE_DEAD

--- Various count enums.
---@realm server
---@source https://wiki.facepunch.com/gmod/Enums/NUM
--- Amount of [Enums/CLASS](https://wiki.facepunch.com/gmod/Enums/CLASS). Used by [Global.Add_NPC_Class](https://wiki.facepunch.com/gmod/Global.Add_NPC_Class).
---@readonly
NUM_AI_CLASSES = 36
--- Amount of [Enums/HULL](https://wiki.facepunch.com/gmod/Enums/HULL).
---@readonly
NUM_HULLS = 10

---@alias NUM
---| number # Raw numeric enum value
---| 36 # NUM_AI_CLASSES
---| 10 # NUM_HULLS

--- Enumerations used by [Player:SetObserverMode](https://wiki.facepunch.com/gmod/Player:SetObserverMode), [Player:GetObserverMode](https://wiki.facepunch.com/gmod/Player:GetObserverMode) and [Player:Spectate](https://wiki.facepunch.com/gmod/Player:Spectate).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/OBS_MODE
--- Not spectating
---@readonly
OBS_MODE_NONE = 0
--- Camera doesn't move, but adjusts camera angles to follow the spectated target
---@readonly
OBS_MODE_DEATHCAM = 1
--- TF2-like freezecam
---@readonly
OBS_MODE_FREEZECAM = 2
--- Same as OBS_MODE_CHASE, but you can't rotate the view
---@readonly
OBS_MODE_FIXED = 3
--- First person cam
---@readonly
OBS_MODE_IN_EYE = 4
--- Chase cam, 3rd person cam, free rotation around the spectated target
---@readonly
OBS_MODE_CHASE = 5
--- Free roam/noclip-alike. Does not work from [GM:PlayerDeath](https://wiki.facepunch.com/gmod/GM:PlayerDeath)
---@readonly
OBS_MODE_ROAMING = 6

---@alias OBS_MODE
---| number # Raw numeric enum value
---| 0 # OBS_MODE_NONE
---| 1 # OBS_MODE_DEATHCAM
---| 2 # OBS_MODE_FREEZECAM
---| 3 # OBS_MODE_FIXED
---| 4 # OBS_MODE_IN_EYE
---| 5 # OBS_MODE_CHASE
---| 6 # OBS_MODE_ROAMING

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

---@alias PATTACH
---| number # Raw numeric enum value
---| 0 # PATTACH_ABSORIGIN
---| 1 # PATTACH_ABSORIGIN_FOLLOW
---| 2 # PATTACH_CUSTOMORIGIN
---| 3 # PATTACH_POINT
---| 4 # PATTACH_POINT_FOLLOW
---| 5 # PATTACH_WORLDORIGIN

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

---@alias PLAYER
---| number # Raw numeric enum value
---| 0 # PLAYER_IDLE
---| 1 # PLAYER_WALK
---| 2 # PLAYER_JUMP
---| 3 # PLAYER_SUPERJUMP
---| 4 # PLAYER_DIE
---| 5 # PLAYER_ATTACK1
---| 6 # PLAYER_IN_VEHICLE
---| 7 # PLAYER_RELOAD
---| 8 # PLAYER_START_AIMING
---| 9 # PLAYER_LEAVE_AIMING

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

---@alias PLAYERANIMEVENT
---| number # Raw numeric enum value
---| 0 # PLAYERANIMEVENT_ATTACK_PRIMARY
---| 1 # PLAYERANIMEVENT_ATTACK_SECONDARY
---| 2 # PLAYERANIMEVENT_ATTACK_GRENADE
---| 3 # PLAYERANIMEVENT_RELOAD
---| 4 # PLAYERANIMEVENT_RELOAD_LOOP
---| 5 # PLAYERANIMEVENT_RELOAD_END
---| 6 # PLAYERANIMEVENT_JUMP
---| 7 # PLAYERANIMEVENT_SWIM
---| 8 # PLAYERANIMEVENT_DIE
---| 9 # PLAYERANIMEVENT_FLINCH_CHEST
---| 10 # PLAYERANIMEVENT_FLINCH_HEAD
---| 11 # PLAYERANIMEVENT_FLINCH_LEFTARM
---| 12 # PLAYERANIMEVENT_FLINCH_RIGHTARM
---| 13 # PLAYERANIMEVENT_FLINCH_LEFTLEG
---| 14 # PLAYERANIMEVENT_FLINCH_RIGHTLEG
---| 15 # PLAYERANIMEVENT_DOUBLEJUMP
---| 16 # PLAYERANIMEVENT_CANCEL
---| 17 # PLAYERANIMEVENT_SPAWN
---| 18 # PLAYERANIMEVENT_SNAP_YAW
---| 19 # PLAYERANIMEVENT_CUSTOM
---| 20 # PLAYERANIMEVENT_CUSTOM_GESTURE
---| 21 # PLAYERANIMEVENT_CUSTOM_SEQUENCE
---| 22 # PLAYERANIMEVENT_CUSTOM_GESTURE_SEQUENCE
---| 23 # PLAYERANIMEVENT_CANCEL_RELOAD

--- Enumerations used by [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel), `ENT.RenderGroup` in [Structures/ENT](https://wiki.facepunch.com/gmod/Structures/ENT) and [Entity:GetRenderGroup](https://wiki.facepunch.com/gmod/Entity:GetRenderGroup).
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/RENDERGROUP
--- Huge static prop, possibly leftover from goldsrc
---@readonly
RENDERGROUP_STATIC_HUGE = 0
--- Huge opaque entity, possibly leftover from goldsrc
---@readonly
RENDERGROUP_OPAQUE_HUGE = 1
--- Static props?
---@readonly
RENDERGROUP_STATIC = 6
--- For non transparent/solid entities.
---
--- For scripted entities, this will have [ENTITY:Draw](https://wiki.facepunch.com/gmod/ENTITY:Draw) called
---@readonly
RENDERGROUP_OPAQUE = 7
--- For translucent/transparent entities
---
--- For scripted entities, this will have [ENTITY:DrawTranslucent](https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent) called
---@readonly
RENDERGROUP_TRANSLUCENT = 8
--- For both translucent/transparent and opaque/solid anim entities
---
--- For scripted entities, this will have both, [ENTITY:Draw](https://wiki.facepunch.com/gmod/ENTITY:Draw) and [ENTITY:DrawTranslucent](https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent) called
---@readonly
RENDERGROUP_BOTH = 9
--- Solid weapon view models
---@readonly
RENDERGROUP_VIEWMODEL = 10
--- Transparent overlays etc
---@readonly
RENDERGROUP_VIEWMODEL_TRANSLUCENT = 11
--- For brush entities
---@readonly
RENDERGROUP_OPAQUE_BRUSH = 12
--- Unclassfied. Won't get drawn.
---@readonly
RENDERGROUP_OTHER = 13

---@alias RENDERGROUP
---| number # Raw numeric enum value
---| 0 # RENDERGROUP_STATIC_HUGE
---| 1 # RENDERGROUP_OPAQUE_HUGE
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

---@alias RENDERMODE
---| number # Raw numeric enum value
---| 0 # RENDERMODE_NORMAL
---| 1 # RENDERMODE_TRANSCOLOR
---| 2 # RENDERMODE_TRANSTEXTURE
---| 3 # RENDERMODE_GLOW
---| 4 # RENDERMODE_TRANSALPHA
---| 5 # RENDERMODE_TRANSADD
---| 6 # RENDERMODE_ENVIROMENTAL
---| 7 # RENDERMODE_TRANSADDFRAMEBLEND
---| 8 # RENDERMODE_TRANSALPHADD
---| 9 # RENDERMODE_WORLDGLOW
---| 10 # RENDERMODE_NONE

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

---@alias RT_SIZE
---| number # Raw numeric enum value
---| 0 # RT_SIZE_NO_CHANGE
---| 1 # RT_SIZE_DEFAULT
---| 2 # RT_SIZE_PICMIP
---| 3 # RT_SIZE_HDR
---| 4 # RT_SIZE_FULL_FRAME_BUFFER
---| 5 # RT_SIZE_OFFSCREEN
---| 6 # RT_SIZE_FULL_FRAME_BUFFER_ROUNDED_UP
---| 7 # RT_SIZE_REPLAY_SCREENSHOT
---| 8 # RT_SIZE_LITERAL
---| 9 # RT_SIZE_LITERAL_PICMIP

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

---@alias SCHED
---| number # Raw numeric enum value
---| 88 # LAST_SHARED_SCHEDULE
---| 56 # SCHED_AISCRIPT
---| 5 # SCHED_ALERT_FACE
---| 6 # SCHED_ALERT_FACE_BESTSOUND
---| 7 # SCHED_ALERT_REACT_TO_COMBAT_SOUND
---| 8 # SCHED_ALERT_SCAN
---| 9 # SCHED_ALERT_STAND
---| 10 # SCHED_ALERT_WALK
---| 52 # SCHED_AMBUSH
---| 48 # SCHED_ARM_WEAPON
---| 24 # SCHED_BACK_AWAY_FROM_ENEMY
---| 26 # SCHED_BACK_AWAY_FROM_SAVE_POSITION
---| 23 # SCHED_BIG_FLINCH
---| 17 # SCHED_CHASE_ENEMY
---| 18 # SCHED_CHASE_ENEMY_FAILED
---| 12 # SCHED_COMBAT_FACE
---| 75 # SCHED_COMBAT_PATROL
---| 15 # SCHED_COMBAT_STAND
---| 13 # SCHED_COMBAT_SWEEP
---| 16 # SCHED_COMBAT_WALK
---| 40 # SCHED_COWER
---| 53 # SCHED_DIE
---| 54 # SCHED_DIE_RAGDOLL
---| 49 # SCHED_DISARM_WEAPON
---| 79 # SCHED_DROPSHIP_DUSTOFF
---| 84 # SCHED_DUCK_DODGE
---| 35 # SCHED_ESTABLISH_LINE_OF_FIRE
---| 36 # SCHED_ESTABLISH_LINE_OF_FIRE_FALLBACK
---| 81 # SCHED_FAIL
---| 38 # SCHED_FAIL_ESTABLISH_LINE_OF_FIRE
---| 82 # SCHED_FAIL_NOSTOP
---| 31 # SCHED_FAIL_TAKE_COVER
---| 78 # SCHED_FALL_TO_GROUND
---| 14 # SCHED_FEAR_FACE
---| 29 # SCHED_FLEE_FROM_BEST_SOUND
---| 80 # SCHED_FLINCH_PHYSICS
---| 71 # SCHED_FORCED_GO
---| 72 # SCHED_FORCED_GO_RUN
---| 66 # SCHED_GET_HEALTHKIT
---| 50 # SCHED_HIDE_AND_RELOAD
---| 1 # SCHED_IDLE_STAND
---| 2 # SCHED_IDLE_WALK
---| 3 # SCHED_IDLE_WANDER
---| 85 # SCHED_INTERACTION_MOVE_TO_PARTNER
---| 86 # SCHED_INTERACTION_WAIT_FOR_PARTNER
---| 11 # SCHED_INVESTIGATE_SOUND
---| 41 # SCHED_MELEE_ATTACK1
---| 42 # SCHED_MELEE_ATTACK2
---| 68 # SCHED_MOVE_AWAY
---| 70 # SCHED_MOVE_AWAY_END
---| 69 # SCHED_MOVE_AWAY_FAIL
---| 25 # SCHED_MOVE_AWAY_FROM_ENEMY
---| 34 # SCHED_MOVE_TO_WEAPON_RANGE
---| 63 # SCHED_NEW_WEAPON
---| 64 # SCHED_NEW_WEAPON_CHEAT
---| 0 # SCHED_NONE
---| 73 # SCHED_NPC_FREEZE
---| 76 # SCHED_PATROL_RUN
---| 74 # SCHED_PATROL_WALK
---| 37 # SCHED_PRE_FAIL_ESTABLISH_LINE_OF_FIRE
---| 43 # SCHED_RANGE_ATTACK1
---| 44 # SCHED_RANGE_ATTACK2
---| 51 # SCHED_RELOAD
---| 32 # SCHED_RUN_FROM_ENEMY
---| 33 # SCHED_RUN_FROM_ENEMY_FALLBACK
---| 83 # SCHED_RUN_FROM_ENEMY_MOB
---| 77 # SCHED_RUN_RANDOM
---| 62 # SCHED_SCENE_GENERIC
---| 59 # SCHED_SCRIPTED_CUSTOM_MOVE
---| 61 # SCHED_SCRIPTED_FACE
---| 58 # SCHED_SCRIPTED_RUN
---| 60 # SCHED_SCRIPTED_WAIT
---| 57 # SCHED_SCRIPTED_WALK
---| 39 # SCHED_SHOOT_ENEMY_COVER
---| 87 # SCHED_SLEEP
---| 22 # SCHED_SMALL_FLINCH
---| 45 # SCHED_SPECIAL_ATTACK1
---| 46 # SCHED_SPECIAL_ATTACK2
---| 47 # SCHED_STANDOFF
---| 65 # SCHED_SWITCH_TO_PENDING_WEAPON
---| 28 # SCHED_TAKE_COVER_FROM_BEST_SOUND
---| 27 # SCHED_TAKE_COVER_FROM_ENEMY
---| 30 # SCHED_TAKE_COVER_FROM_ORIGIN
---| 21 # SCHED_TARGET_CHASE
---| 20 # SCHED_TARGET_FACE
---| 19 # SCHED_VICTORY_DANCE
---| 55 # SCHED_WAIT_FOR_SCRIPT
---| 67 # SCHED_WAIT_FOR_SPEAK_FINISH
---| 4 # SCHED_WAKE_ANGRY

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

---@alias SF
---| number # Raw numeric enum value
---| 524288 # SF_CITIZEN_AMMORESUPPLIER
---| 65536 # SF_CITIZEN_FOLLOW
---| 2097152 # SF_CITIZEN_IGNORE_SEMAPHORE
---| 131072 # SF_CITIZEN_MEDIC
---| 1048576 # SF_CITIZEN_NOT_COMMANDABLE
---| 262144 # SF_CITIZEN_RANDOM_HEAD
---| 8388608 # SF_CITIZEN_RANDOM_HEAD_FEMALE
---| 4194304 # SF_CITIZEN_RANDOM_HEAD_MALE
---| 16777216 # SF_CITIZEN_USE_RENDER_BOUNDS
---| 512 # SF_FLOOR_TURRET_CITIZEN
---| 4096 # SF_NPC_ALTCOLLISION
---| 1024 # SF_NPC_ALWAYSTHINK
---| 8 # SF_NPC_DROP_HEALTHKIT
---| 512 # SF_NPC_FADE_CORPSE
---| 4 # SF_NPC_FALL_TO_GROUND
---| 2 # SF_NPC_GAG
---| 256 # SF_NPC_LONG_RANGE
---| 16384 # SF_NPC_NO_PLAYER_PUSHAWAY
---| 8192 # SF_NPC_NO_WEAPON_DROP
---| 16 # SF_NPC_START_EFFICIENT
---| 2048 # SF_NPC_TEMPLATE
---| 128 # SF_NPC_WAIT_FOR_SCRIPT
---| 1 # SF_NPC_WAIT_TILL_SEEN
---| 32768 # SF_PHYSBOX_MOTIONDISABLED
---| 1048576 # SF_PHYSBOX_ALWAYS_PICK_UP
---| 2097152 # SF_PHYSBOX_NEVER_PICK_UP
---| 4194304 # SF_PHYSBOX_NEVER_PUNT
---| 8 # SF_PHYSPROP_MOTIONDISABLED
---| 512 # SF_PHYSPROP_PREVENT_PICKUP
---| 4194304 # SF_PHYSPROP_IS_GIB
---| 65536 # SF_ROLLERMINE_FRIENDLY
---| 1 # SF_WEAPON_START_CONSTRAINED
---| 2 # SF_WEAPON_NO_PLAYER_PICKUP
---| 4 # SF_WEAPON_NO_PHYSCANNON_PUNT

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

---@alias SIGNONSTATE
---| number # Raw numeric enum value
---| 0 # SIGNONSTATE_NONE
---| 1 # SIGNONSTATE_CHALLENGE
---| 2 # SIGNONSTATE_CONNECTED
---| 3 # SIGNONSTATE_NEW
---| 4 # SIGNONSTATE_PRESPAWN
---| 5 # SIGNONSTATE_SPAWN
---| 6 # SIGNONSTATE_FULL
---| 7 # SIGNONSTATE_CHANGELEVEL

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

---@alias SIM
---| number # Raw numeric enum value
---| 0 # SIM_NOTHING
---| 1 # SIM_LOCAL_ACCELERATION
---| 2 # SIM_LOCAL_FORCE
---| 3 # SIM_GLOBAL_ACCELERATION
---| 4 # SIM_GLOBAL_FORCE

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

---@alias SND
---| number # Raw numeric enum value
---| 0 # SND_NOFLAGS
---| 1 # SND_CHANGE_VOL
---| 2 # SND_CHANGE_PITCH
---| 4 # SND_STOP
---| 8 # SND_SPAWNING
---| 16 # SND_DELAY
---| 32 # SND_STOP_LOOPING
---| 128 # SND_SHOULDPAUSE
---| 256 # SND_IGNORE_PHONEMES
---| 512 # SND_IGNORE_NAME
---| 1024 # SND_DO_NOT_OVERWRITE_EXISTING_ON_CHANNEL

--- The sound's attenuation; how fast it drops away, enumerations used by [Global.EmitSound](https://wiki.facepunch.com/gmod/Global.EmitSound) and [Entity:EmitSound](https://wiki.facepunch.com/gmod/Entity:EmitSound). Information taken from [soundflags.h in Source SDK 2013](https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/sp/src/public/soundflags.h#L53)
---
--- The engine starts running into trouble below 60dB.
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
---@realm shared
---@source https://wiki.facepunch.com/gmod/Enums/SNDLVL
--- * `SNDLVL_NONE` = `0`
--- * `SNDLVL_20dB` = `20`
--- * `SNDLVL_25dB` = `25`
--- * `SNDLVL_30dB` = `30`
--- * `SNDLVL_35dB` = `35`
--- * `SNDLVL_40dB` = `40`
--- * `SNDLVL_45dB` = `45`
--- * `SNDLVL_50dB` = `50`
--- * `SNDLVL_55dB` = `55`
--- * `SNDLVL_60dB` = `60`
--- * `SNDLVL_IDLE` = `60`
--- * `SNDLVL_65dB` = `65`
--- * `SNDLVL_STATIC` = `66`
--- * `SNDLVL_70dB` = `70`
--- * `SNDLVL_75dB` = `75`
--- * `SNDLVL_NORM` = `75`
--- * `SNDLVL_80dB` = `80`
--- * `SNDLVL_TALKING` = `80`
--- * `SNDLVL_85dB` = `85`
--- * `SNDLVL_90dB` = `90`
--- * `SNDLVL_95dB` = `95`
--- * `SNDLVL_100dB` = `100`
--- * `SNDLVL_105dB` = `105`
--- * `SNDLVL_110dB` = `110`
--- * `SNDLVL_120dB` = `120`
--- * `SNDLVL_130dB` = `130`
--- * `SNDLVL_140dB` = `140`
--- * `SNDLVL_GUNFIRE` = `140`
--- * `SNDLVL_150dB` = `150`
--- * `SNDLVL_180dB` = `180`
--- @alias SNDLVL 0 | 20 | 25 | 30 | 35 | 40 | 45 | 50 | 55 | 60 | 60 | 65 | 66 | 70 | 75 | 75 | 80 | 80 | 85 | 90 | 95 | 100 | 105 | 110 | 120 | 130 | 140 | 140 | 150 | 180 | number

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

---@alias SOLID
---| number # Raw numeric enum value
---| 0 # SOLID_NONE
---| 1 # SOLID_BSP
---| 2 # SOLID_BBOX
---| 3 # SOLID_OBB
---| 4 # SOLID_OBB_YAW
---| 5 # SOLID_CUSTOM
---| 6 # SOLID_VPHYSICS

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

---@alias SOUND
---| number # Raw numeric enum value
---| 0 # SOUND_NONE
---| 1 # SOUND_COMBAT
---| 2 # SOUND_WORLD
---| 4 # SOUND_PLAYER
---| 8 # SOUND_DANGER
---| 16 # SOUND_BULLET_IMPACT
---| 32 # SOUND_CARCASS
---| 64 # SOUND_MEAT
---| 128 # SOUND_GARBAGE
---| 256 # SOUND_THUMPER
---| 512 # SOUND_BUGBAIT
---| 1024 # SOUND_PHYSICS_DANGER
---| 2048 # SOUND_DANGER_SNIPERONLY
---| 4096 # SOUND_MOVE_AWAY
---| 8192 # SOUND_PLAYER_VEHICLE
---| 16384 # SOUND_READINESS_LOW
---| 32768 # SOUND_READINESS_MEDIUM
---| 65536 # SOUND_READINESS_HIGH
---| 1048576 # SOUND_CONTEXT_FROM_SNIPER
---| 2097152 # SOUND_CONTEXT_GUNFIRE
---| 4194304 # SOUND_CONTEXT_MORTAR
---| 8388608 # SOUND_CONTEXT_COMBINE_ONLY
---| 16777216 # SOUND_CONTEXT_REACT_TO_SOURCE
---| 33554432 # SOUND_CONTEXT_EXPLOSION
---| 67108864 # SOUND_CONTEXT_EXCLUDE_COMBINE
---| 134217728 # SOUND_CONTEXT_DANGER_APPROACH
---| 268435456 # SOUND_CONTEXT_ALLIES_ONLY
---| 536870912 # SOUND_CONTEXT_PLAYER_VEHICLE

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

---@alias STENCIL
---| number # Raw numeric enum value
---| 1 # STENCIL_NEVER
---| 2 # STENCIL_LESS
---| 3 # STENCIL_EQUAL
---| 4 # STENCIL_LESSEQUAL
---| 5 # STENCIL_GREATER
---| 6 # STENCIL_NOTEQUAL
---| 7 # STENCIL_GREATEREQUAL
---| 8 # STENCIL_ALWAYS
---| 1 # STENCIL_KEEP
---| 2 # STENCIL_ZERO
---| 3 # STENCIL_REPLACE
---| 4 # STENCIL_INCRSAT
---| 5 # STENCIL_DECRSAT
---| 6 # STENCIL_INVERT
---| 7 # STENCIL_INCR
---| 8 # STENCIL_DECR

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

---@alias STENCILCOMPARISONFUNCTION
---| number # Raw numeric enum value
---| 1 # STENCILCOMPARISONFUNCTION_NEVER
---| 2 # STENCILCOMPARISONFUNCTION_LESS
---| 3 # STENCILCOMPARISONFUNCTION_EQUAL
---| 4 # STENCILCOMPARISONFUNCTION_LESSEQUAL
---| 5 # STENCILCOMPARISONFUNCTION_GREATER
---| 6 # STENCILCOMPARISONFUNCTION_NOTEQUAL
---| 7 # STENCILCOMPARISONFUNCTION_GREATEREQUAL
---| 8 # STENCILCOMPARISONFUNCTION_ALWAYS

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

---@alias STENCILOPERATION
---| number # Raw numeric enum value
---| 1 # STENCILOPERATION_KEEP
---| 2 # STENCILOPERATION_ZERO
---| 3 # STENCILOPERATION_REPLACE
---| 4 # STENCILOPERATION_INCRSAT
---| 5 # STENCILOPERATION_DECRSAT
---| 6 # STENCILOPERATION_INVERT
---| 7 # STENCILOPERATION_INCR
---| 8 # STENCILOPERATION_DECR

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

---@alias STEPSOUNDTIME
---| number # Raw numeric enum value
---| 0 # STEPSOUNDTIME_NORMAL
---| 1 # STEPSOUNDTIME_ON_LADDER
---| 2 # STEPSOUNDTIME_WATER_KNEE
---| 3 # STEPSOUNDTIME_WATER_FOOT

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

---@alias STUDIO
---| number # Raw numeric enum value
---| 1 # STUDIO_RENDER
---| 2 # STUDIO_VIEWXFORMATTACHMENTS
---| 4 # STUDIO_DRAWTRANSLUCENTSUBMODELS
---| 8 # STUDIO_TWOPASS
---| 16 # STUDIO_STATIC_LIGHTING
---| 32 # STUDIO_WIREFRAME
---| 64 # STUDIO_ITEM_BLINK
---| 128 # STUDIO_NOSHADOWS
---| 256 # STUDIO_WIREFRAME_VCOLLIDE
---| 16777216 # STUDIO_GENERATE_STATS
---| 134217728 # STUDIO_SSAODEPTHTEXTURE
---| 1073741824 # STUDIO_SHADOWDEPTHTEXTURE
---| 2147483648 # STUDIO_TRANSPARENCY

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

---@alias SURF
---| number # Raw numeric enum value
---| 1 # SURF_LIGHT
---| 2 # SURF_SKY2D
---| 4 # SURF_SKY
---| 8 # SURF_WARP
---| 16 # SURF_TRANS
---| 32 # SURF_NOPORTAL
---| 64 # SURF_TRIGGER
---| 128 # SURF_NODRAW
---| 256 # SURF_HINT
---| 512 # SURF_SKIP
---| 1024 # SURF_NOLIGHT
---| 2048 # SURF_BUMPLIGHT
---| 4096 # SURF_NOSHADOWS
---| 8192 # SURF_NODECALS
---| 16384 # SURF_NOCHOP
---| 32768 # SURF_HITBOX

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

---@alias TASKSTATUS
---| number # Raw numeric enum value
---| 0 # TASKSTATUS_NEW
---| 1 # TASKSTATUS_RUN_MOVE_AND_TASK
---| 2 # TASKSTATUS_RUN_MOVE
---| 3 # TASKSTATUS_RUN_TASK
---| 4 # TASKSTATUS_COMPLETE

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

---@alias TEAM
---| number # Raw numeric enum value
---| 0 # TEAM_CONNECTING
---| 1001 # TEAM_UNASSIGNED
---| 1002 # TEAM_SPECTATOR

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

---@alias TEXT_ALIGN
---| number # Raw numeric enum value
---| 0 # TEXT_ALIGN_LEFT
---| 1 # TEXT_ALIGN_CENTER
---| 2 # TEXT_ALIGN_RIGHT
---| 3 # TEXT_ALIGN_TOP
---| 4 # TEXT_ALIGN_BOTTOM

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

---@alias TEXT_FILTER
---| number # Raw numeric enum value
---| 0 # TEXT_FILTER_UNKNOWN
---| 1 # TEXT_FILTER_GAME_CONTENT
---| 2 # TEXT_FILTER_CHAT
---| 3 # TEXT_FILTER_NAME

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
--- @alias TEXTUREFLAGS 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 | 4096 | 8192 | 16384 | 32768 | 65536 | 131072 | 262144 | 524288 | 1048576 | 2097152 | 4194304 | 8388608 | 16777216 | 33554432 | 67108864 | 134217728 | 268435456 | 536870912 | 1073741824 | 2147483648 | number

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

---@alias TRACER
---| number # Raw numeric enum value
---| 0 # TRACER_NONE
---| 1 # TRACER_LINE
---| 2 # TRACER_RAIL
---| 3 # TRACER_BEAM
---| 4 # TRACER_LINE_AND_WHIZ

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

---@alias TRANSMIT
---| number # Raw numeric enum value
---| 0 # TRANSMIT_ALWAYS
---| 1 # TRANSMIT_NEVER
---| 2 # TRANSMIT_PVS

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

---@alias TYPE
---| number # Raw numeric enum value
---| -1 # TYPE_NONE
---| -1 # TYPE_INVALID
---| 0 # TYPE_NIL
---| 1 # TYPE_BOOL
---| 2 # TYPE_LIGHTUSERDATA
---| 3 # TYPE_NUMBER
---| 4 # TYPE_STRING
---| 5 # TYPE_TABLE
---| 6 # TYPE_FUNCTION
---| 7 # TYPE_USERDATA
---| 8 # TYPE_THREAD
---| 9 # TYPE_ENTITY
---| 10 # TYPE_VECTOR
---| 11 # TYPE_ANGLE
---| 12 # TYPE_PHYSOBJ
---| 13 # TYPE_SAVE
---| 14 # TYPE_RESTORE
---| 15 # TYPE_DAMAGEINFO
---| 16 # TYPE_EFFECTDATA
---| 17 # TYPE_MOVEDATA
---| 18 # TYPE_RECIPIENTFILTER
---| 19 # TYPE_USERCMD
---| 20 # TYPE_SCRIPTEDVEHICLE
---| 21 # TYPE_MATERIAL
---| 22 # TYPE_PANEL
---| 23 # TYPE_PARTICLE
---| 24 # TYPE_PARTICLEEMITTER
---| 25 # TYPE_TEXTURE
---| 26 # TYPE_USERMSG
---| 27 # TYPE_CONVAR
---| 28 # TYPE_IMESH
---| 29 # TYPE_MATRIX
---| 30 # TYPE_SOUND
---| 31 # TYPE_PIXELVISHANDLE
---| 32 # TYPE_DLIGHT
---| 33 # TYPE_VIDEO
---| 34 # TYPE_FILE
---| 35 # TYPE_LOCOMOTION
---| 36 # TYPE_PATH
---| 37 # TYPE_NAVAREA
---| 38 # TYPE_SOUNDHANDLE
---| 39 # TYPE_NAVLADDER
---| 40 # TYPE_PARTICLESYSTEM
---| 41 # TYPE_PROJECTEDTEXTURE
---| 42 # TYPE_PHYSCOLLIDE
---| 43 # TYPE_SURFACEINFO
---| 44 # TYPE_COUNT
---| 255 # TYPE_COLOR

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

---@alias USE
---| number # Raw numeric enum value
---| 0 # USE_OFF
---| 1 # USE_ON
---| 2 # USE_SET
---| 3 # USE_TOGGLE

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

---@alias VIEW
---| number # Raw numeric enum value
---| 0 # VIEW_MAIN
---| 1 # VIEW_3DSKY
---| 2 # VIEW_MONITOR
---| 3 # VIEW_REFLECTION
---| 4 # VIEW_REFRACTION
---| 5 # VIEW_INTRO_PLAYER
---| 6 # VIEW_INTRO_CAMERA
---| 7 # VIEW_SHADOW_DEPTH_TEXTURE
---| 8 # VIEW_SSAO

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

---@alias WEAPON_PROFICIENCY
---| number # Raw numeric enum value
---| 0 # WEAPON_PROFICIENCY_POOR
---| 1 # WEAPON_PROFICIENCY_AVERAGE
---| 2 # WEAPON_PROFICIENCY_GOOD
---| 3 # WEAPON_PROFICIENCY_VERY_GOOD
---| 4 # WEAPON_PROFICIENCY_PERFECT
