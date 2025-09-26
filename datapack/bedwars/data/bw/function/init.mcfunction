scoreboard objectives add deathReset deathCount
scoreboard objectives add killed totalKillCount

scoreboard objectives add game dummy
scoreboard objectives add GameBar dummy
scoreboard objectives add wins dummy Wins

scoreboard objectives add hp health
scoreboard objectives setdisplay below_name hp
scoreboard objectives setdisplay list hp
scoreboard objectives modify hp rendertype hearts

scoreboard objectives add hpboost dummy
scoreboard objectives add banishing dummy
scoreboard objectives add cyanide dummy

scoreboard objectives add deathCountdown dummy
scoreboard objectives add deathCalc dummy

scoreboard objectives add IronLost dummy
scoreboard objectives add DiamondsLost dummy
scoreboard objectives add EmeraldsLost dummy
scoreboard objectives add ScutesLost dummy

scoreboard objectives add doneDrops dummy

scoreboard objectives add ironToGive dummy
scoreboard objectives add diamondToGive dummy
scoreboard objectives add emeraldToGive dummy
scoreboard objectives add scuteToGive dummy

scoreboard objectives add diamond dummy
scoreboard objectives add emerald dummy
scoreboard objectives add iron dummy

scoreboard objectives add bridge dummy

scoreboard objectives add YellowIsland dummy
scoreboard objectives add RedIsland dummy
scoreboard objectives add BlueIsland dummy
scoreboard objectives add GreenIsland dummy

scoreboard objectives add upgrade1 dummy
scoreboard objectives add upgrade2 dummy
scoreboard objectives add upgrade3 dummy

scoreboard objectives add alarmBought dummy

scoreboard objectives add yellowBedsBroken minecraft.mined:minecraft.yellow_bed
scoreboard objectives add greenBedsBroken minecraft.mined:minecraft.green_bed
scoreboard objectives add blueBedsBroken minecraft.mined:minecraft.blue_bed
scoreboard objectives add redBedsBroken minecraft.mined:minecraft.red_bed

scoreboard objectives add leave minecraft.custom:leave_game
scoreboard objectives add parkourMessage dummy

scoreboard objectives add idk dummy

scoreboard objectives add bedStandFacingDir dummy

scoreboard objectives add bedBroken dummy

scoreboard players set Map: GameBar -1
scoreboard players set Map: wins -1

scoreboard players set Hardcore: GameBar -1
scoreboard players set Hardcore: wins -1

scoreboard players set map game 0
scoreboard players set gameOn game 0
scoreboard players set safeMode game 1
scoreboard players set hardcore game 0
scoreboard players set firstDiamond game 90
scoreboard players set firstEmerald game 180

scoreboard objectives setdisplay sidebar wins

say "scores done"

team add red
team add yellow
team add green
team add blue
team add white
team add CurrentMap
team add HardcoreOn
team add border
team add players
say "teams done"

team modify blue color blue
team modify red color red
team modify yellow color yellow
team modify green color green
say "team color set"

team modify blue friendlyFire false
team modify red friendlyFire false
team modify yellow friendlyFire false
team modify green friendlyFire false

team modify CurrentMap suffix " None"
team join CurrentMap Map:

team modify HardcoreOn suffix " Off"
team join HardcoreOn Hardcore:

team modify border prefix "Border "
team join border in:

team modify players suffix " Players:"
team join players Blue
team join players Green
team join players Red
team join players Yellow

team modify blue prefix "[blue] "
team modify red prefix "[red] "
team modify yellow prefix "[yellow] "
team modify green prefix "[green] "
say "teams set"

kill @e[type=!player]

place template bw:lobby1 -16 -40 -11
place template bw:lobby2 12 -40 -11

execute at @e[type=armor_stand,tag=Lobby,limit=1] run spawnpoint @s ~ ~ ~

fill -121 0 -121 120 0 120 barrier
fill -121 1 -120 -121 16 119 barrier
fill -120 1 -121 119 16 -121 barrier
fill 120 1 119 120 16 -120 barrier
fill 119 1 120 -120 16 120 barrier

forceload add -10 -10 10 10

gamerule announceAdvancements false
gamerule commandBlockOutput false
gamerule commandModificationBlockLimit 10000000
gamerule doDaylightCycle false
gamerule doImmediateRespawn true
gamerule doInsomnia false
gamerule doLimitedCrafting true
gamerule doMobLoot false
gamerule doMobSpawning false
gamerule doPatrolSpawning false
gamerule doTraderSpawning false
gamerule doWardenSpawning false
gamerule keepInventory true
gamerule randomTickSpeed 0
gamerule locatorBar false

data modify storage world created set value 1

say "world setup done"

function bw:1s
