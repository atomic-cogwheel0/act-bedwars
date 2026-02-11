scoreboard objectives add deathReset deathCount

scoreboard objectives add config dummy
scoreboard objectives add game dummy
scoreboard objectives add GameBar dummy
scoreboard objectives add wins dummy Wins

scoreboard objectives modify GameBar displayname "Game Stats"
scoreboard objectives modify wins displayname "Wins"

scoreboard objectives add hp health
scoreboard objectives setdisplay below_name hp
scoreboard objectives setdisplay list hp
scoreboard objectives modify hp rendertype hearts

scoreboard objectives add hpboost dummy
scoreboard objectives add banishing dummy
scoreboard objectives add cyanide used:cyan_dye
scoreboard objectives add ghastSpawning used:ghast_tear

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

scoreboard objectives add doJump dummy

scoreboard objectives add bossbarCalc dummy

scoreboard objectives add tpToBw trigger

# default scoreboard values

scoreboard players set Map GameBar -1
scoreboard players set Hardcore GameBar -1
scoreboard players set Map wins -1
scoreboard players set Hardcore wins -1

scoreboard players set map game 0
scoreboard players set gameOn game 0
scoreboard players set hardcore game 0

# default config
function bw:init/default_config

scoreboard players set safeMode config 1

# don't edit unless you know you want to
scoreboard players set noTP config 0

scoreboard objectives setdisplay sidebar wins

say "scores done"

team add red
team add yellow
team add green
team add blue
team add white
# display teams (adds prefixes and suffixes to GameBar displays)
team add CurrentMap
team add HardcoreOn
team add border
team add players
team add colon
team add bedBreak
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

team modify CurrentMap suffix ": None"
team join CurrentMap Map

team modify HardcoreOn suffix ": Unknown"
team join HardcoreOn Hardcore

team modify border prefix "Border "
team modify border suffix ":"
team join border in
team join border size

team modify bedBreak prefix "Bed breaks "
team modify bedBreak suffix ":"
team join bedBreak at

team modify colon suffix ":"
team join colon Alive
team join colon Time

team modify players suffix " Players:"
team join players Blue
team join players Green
team join players Red
team join players Yellow

team modify blue prefix "[blue] "
team modify red prefix "[red] "
team modify yellow prefix "[yellow] "
team modify green prefix "[green] "
team modify white suffix " (ghost)"
say "teams set"

gamerule max_block_modifications 2147483647

execute in bw:bedwars run forceload add -128 -128 127 127
execute in bw:lobby run forceload add -128 -128 127 127

execute in bw:lobby run fillbiome -125 -64 -125 124 100 124 bw:peaceful_islands

place template bw:lobby1 -16 -55 -11
place template bw:lobby2 12 -55 -11 none none 1 0 strict

execute if score noTP config matches 0 in bw:lobby at @e[type=armor_stand,tag=Lobby,limit=1] run setworldspawn ~ ~ ~

gamerule show_advancement_messages false
gamerule command_block_output false
gamerule log_admin_commands false
gamerule send_command_feedback false
gamerule advance_time false
gamerule advance_weather false
gamerule immediate_respawn true
gamerule limited_crafting true
gamerule mob_drops false
gamerule spawn_phantoms false
gamerule spawn_mobs false
gamerule spawn_patrols false
gamerule spawn_wardens false
gamerule spawn_wandering_traders false
gamerule keep_inventory true
gamerule random_tick_speed 0
gamerule locator_bar false

data modify storage world created set value 1

say "world setup done"

tellraw @s {atlas:"items",sprite:"item/diamond"}

function bw:1s