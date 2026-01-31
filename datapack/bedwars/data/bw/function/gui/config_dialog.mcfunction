
execute store result storage bw:config_macro this.borderStartTime int 1 run scoreboard players get borderStartTime config
execute store result storage bw:config_macro this.borderAdvanceDelay int 1 run scoreboard players get borderAdvanceDelay config
execute store result storage bw:config_macro this.borderMinSize byte 1 run scoreboard players get borderMinSize config
execute store result storage bw:config_macro this.respawnDelayNormal int 1 run scoreboard players get respawnDelayNormal config
execute store result storage bw:config_macro this.respawnDelayBanished int 1 run scoreboard players get respawnDelayBanished config
execute store result storage bw:config_macro this.ironDelay int 1 run scoreboard players get ironDelay config
execute store result storage bw:config_macro this.diamondDelay int 1 run scoreboard players get diamondDelay config
execute store result storage bw:config_macro this.emeraldDelay int 1 run scoreboard players get emeraldDelay config
execute store result storage bw:config_macro this.firstDiamond int 1 run scoreboard players get firstDiamond config
execute store result storage bw:config_macro this.firstEmerald int 1 run scoreboard players get firstEmerald config
execute store result storage bw:config_macro this.persistentItems byte 1 run scoreboard players get persistentItems config
execute store result storage bw:config_macro this.doubleJumpEnabled byte 1 run scoreboard players get doubleJumpEnabled config
execute store result storage bw:config_macro this.enableBossbar byte 1 run scoreboard players get enableBossbar config

function bw:gui/config_dialog_inner with storage bw:config_macro this