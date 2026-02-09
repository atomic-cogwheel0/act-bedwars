execute if score gameOn game matches 1 run tellraw @s {text:"Game is running. Please edit the configuration later.",color:"red"}
execute if score gameOn game matches 1 run return fail

$scoreboard players set borderStartTime config $(borderStartTime)
$scoreboard players set borderAdvanceDelay config $(borderAdvanceDelay)
$scoreboard players set borderAdvanceDuration config $(borderAdvanceDuration)
$scoreboard players set borderAdvanceSize config $(borderAdvanceSize)
$scoreboard players set borderMinSize config $(borderMinSize)
$scoreboard players set respawnDelayNormal config $(respawnDelayNormal)
$scoreboard players set respawnDelayBanished config $(respawnDelayBanished)
$scoreboard players set ironDelay config $(ironDelay)
$scoreboard players set diamondDelay config $(diamondDelay)
$scoreboard players set emeraldDelay config $(emeraldDelay)
$scoreboard players set firstDiamond config $(diamondDelay)
$scoreboard players set firstEmerald config $(emeraldDelay)
$scoreboard players set doubleJumpEnabled config $(doubleJumpEnabled)
$scoreboard players set persistentItems config $(persistentItems)
$scoreboard players set enableBossbar config $(enableBossbar)

$scoreboard players set hardcoreLever game $(hardcoreLever)