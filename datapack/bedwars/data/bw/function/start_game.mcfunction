# do everything in the bedwars dimension
function bw:map_update

title @a[predicate=bw:in_game] times 0 100 20
title @a[predicate=bw:in_game] subtitle {text:"Game started",color:"light_purple"}
title @a[predicate=bw:in_game] title {text:""}

tellraw @a[predicate=bw:in_game] [{text:"Hints:",bold:true,color:"gold",underlined:true}]
tellraw @a[predicate=bw:in_game] "§7Using the Bedwars Resorce Pack (RP) is highly recommended."
tellraw @a[predicate=bw:in_game] "§7Exchange Cracked Emeralds (normal scutes without the RP) for valuable emeralds at your Basic Trader."
tellraw @a[predicate=bw:in_game] "§7You won't find everything at the Basic Trader. Look on the diamond & emerald islands for more offers."
tellraw @a[predicate=bw:in_game] "§7Look for the airdrop in the center when the border turns red."
tellraw @a[predicate=bw:in_game] "§7You may break blocks on the islands."
tellraw @a[predicate=bw:in_game] "§7An Enchantment Table is available on every diamond island."
tellraw @a[predicate=bw:in_game] "§7Look in your inventory for a few starting items."

# there should be NO players in these teams outside of the game
team leave @a[team=red,predicate=!bw:in_game]
team leave @a[team=blue,predicate=!bw:in_game]
team leave @a[team=green,predicate=!bw:in_game]
team leave @a[team=yellow,predicate=!bw:in_game]

tag @a[team=red] add started_as_red
tag @a[team=blue] add started_as_blue
tag @a[team=green] add started_as_green
tag @a[team=yellow] add started_as_yellow

# clear the arena from entities
kill @e[type=!player,predicate=bw:in_bedwars]
execute in bw:bedwars run fill -120 -1 -120 119 -1 119 air replace obsidian

execute store result score hardcore game run scoreboard players get hardcoreLever game

execute unless data storage world barrier_made in bw:bedwars run function bw:init/barrier

execute if score map game matches 1 in bw:bedwars run function bw:load_map/ships
execute if score map game matches 2 in bw:bedwars run function bw:load_map/mines
execute if score map game matches 4 in bw:bedwars run function bw:load_map/moon
execute if score map game matches 5 in bw:bedwars run function bw:load_map/village
execute if score map game matches 6 in bw:bedwars run function bw:load_map/tunnels
execute if score map game matches 7 in bw:bedwars run function bw:load_map/tree
execute if score map game matches 8 in bw:bedwars run function bw:load_map/crypt
execute if score map game matches 9 in bw:bedwars run function bw:load_map/graveyard

execute if score forceNoon config matches 1 run time set noon

execute at @e[type=armor_stand,tag=Lobby,limit=1] run spawnpoint @a[predicate=bw:in_game] ~ ~ ~

#execute as @a[team=white] run team leave @s

# spawn proofing
execute at @e[type=armor_stand,tag=RedSpawn] run setblock ~ ~-2 ~ bedrock
execute at @e[type=armor_stand,tag=GreenSpawn] run setblock ~ ~-2 ~ bedrock
execute at @e[type=armor_stand,tag=BlueSpawn] run setblock ~ ~-2 ~ bedrock
execute at @e[type=armor_stand,tag=YellowSpawn] run setblock ~ ~-2 ~ bedrock

# mark all Bed stands (used in set_bed_facing)
execute as @e[type=armor_stand] unless entity @s[tag=!RedBed,tag=!YellowBed,tag=!GreenBed,tag=!BlueBed] run tag @s add AnyBed
tag @e[type=armor_stand,tag=IronS] add isSpawner
tag @e[type=armor_stand,tag=DiamondS] add isSpawner
tag @e[type=armor_stand,tag=EmeraldS] add isSpawner
tag @e[type=armor_stand,tag=RedUpgradable] add isSpawner
tag @e[type=armor_stand,tag=BlueUpgradable] add isSpawner
tag @e[type=armor_stand,tag=GreenUpgradable] add isSpawner
tag @e[type=armor_stand,tag=YellowUpgradable] add isSpawner

execute as @a[team=!,team=!white,predicate=bw:in_game] run clear @s

# upper left corner in inventory
execute as @a[team=!,team=!white,predicate=bw:in_game] run item replace entity @s container.9 with lapis_lazuli 32
execute as @a[team=!,team=!white,predicate=bw:in_game] run item replace entity @s container.10 with cyan_dye[item_name={text:"Socrates' Hemlock Drink",color:"aqua"},custom_model_data={flags:[true]},food={can_always_eat:true,nutrition:0,saturation:0},consumable={animation:"drink"},lore=["Ancient item. Deadly. Beware!"]] 6

effect give @a[predicate=bw:in_game] instant_health 1 100
effect give @a[predicate=bw:in_game] saturation 1 100

scoreboard players set @e[type=armor_stand,tag=isSpawner] iron 0
scoreboard players set @e[type=armor_stand,tag=isSpawner] emerald 0
scoreboard players set @e[type=armor_stand,tag=isSpawner] diamond 0

scoreboard players set @e[type=armor_stand,tag=RedUpgradable] RedIsland 0
scoreboard players set @e[type=armor_stand,tag=BlueUpgradable] BlueIsland 0
scoreboard players set @e[type=armor_stand,tag=GreenUpgradable] GreenIsland 0
scoreboard players set @e[type=armor_stand,tag=YellowUpgradable] YellowIsland 0

scoreboard players set Red bedBroken 0
scoreboard players set Green bedBroken 0
scoreboard players set Blue bedBroken 0
scoreboard players set Yellow bedBroken 0

scoreboard players set @a redBedsBroken 0
scoreboard players set @a yellowBedsBroken 0
scoreboard players set @a greenBedsBroken 0
scoreboard players set @a blueBedsBroken 0

scoreboard players set @a DiamondsLost 0
scoreboard players set @a EmeraldsLost 0
scoreboard players set @a IronLost 0

scoreboard players set @a deathReset 0

scoreboard players set @a alarmBought 0
scoreboard players set redAlarm game 0
scoreboard players set blueAlarm game 0
scoreboard players set greenAlarm game 0
scoreboard players set yellowAlarm game 0

scoreboard players set alive game 0

scoreboard players set @a doneDrops 0

item replace entity @a[team=red] armor.head with leather_helmet[dyed_color=16718602] 1
item replace entity @a[team=blue] armor.head with leather_helmet[dyed_color=144340] 1
item replace entity @a[team=green] armor.head with leather_helmet[dyed_color=185363] 1
item replace entity @a[team=yellow] armor.head with leather_helmet[dyed_color=16772874] 1

execute unless entity @a[team=red] run scoreboard players reset Red GameBar
execute unless entity @a[team=blue] run scoreboard players reset Blue GameBar
execute unless entity @a[team=green] run scoreboard players reset Green GameBar
execute unless entity @a[team=yellow] run scoreboard players reset Yellow GameBar

execute as @a[team=!,team=!white] run scoreboard players add alive game 1

execute in bw:bedwars run worldborder set 240

scoreboard players set border game 0
scoreboard players set borderStarted game 0
scoreboard players set deathMatch game 0

scoreboard players set time game 0

# setup "Border breaks at:" text
scoreboard players operation at GameBar = bedBreak game

# setup bossbars to track border
bossbar remove bw:border_bar
bossbar add bw:border_bar "Waiting for Border..."
bossbar set bw:border_bar color green
bossbar set bw:border_bar style notched_20
execute store result bossbar bw:border_bar max run scoreboard players get borderStartTime config
execute unless score enableBossbar config matches 1 run bossbar set bw:border_bar visible false
execute if score enableBossbar config matches 1 run bossbar set bw:border_bar visible true
bossbar set bw:border_bar players @a[predicate=bw:in_game]

# wither skeletons don't fit on map 2
execute unless score map game matches 2 at @e[type=armor_stand, tag=EmeraldS] run summon wither_skeleton ~ ~ ~ {equipment:{mainhand:{id:"bow",count:1b,components:{enchantments:{"mending":1,"punch":1}}},head:{id:"iron_helmet",count:1}},PersistenceRequired:1b}
execute if score map game matches 2 at @e[type=armor_stand, tag=EmeraldS] run summon skeleton ~ ~ ~ {equipment:{mainhand:{id:"bow",count:1b,components:{enchantments:{"mending":1,"punch":1,"flame":1}}},head:{id:"iron_helmet",count:1}},PersistenceRequired:1b}
execute at @e[type=armor_stand, tag=EmeraldS] run summon skeleton ~ ~ ~ {equipment:{mainhand:{id:"iron_sword",count:1b},head:{id:"iron_helmet",count:1}},PersistenceRequired:1b}

tp @a[team=red] @e[type=armor_stand,tag=RedSpawn,limit=1] 
tp @a[team=blue] @e[type=armor_stand,tag=BlueSpawn,limit=1] 
tp @a[team=green] @e[type=armor_stand,tag=GreenSpawn,limit=1] 
tp @a[team=yellow] @e[type=armor_stand,tag=YellowSpawn,limit=1]

scoreboard players set @s cyanide 0
xp set @a 0 levels

scoreboard players set gameOn game 1
scoreboard objectives setdisplay sidebar GameBar

execute as @a at @s run playsound item.goat_horn.sound.2 ambient @s ~ ~ ~

# wait for armor stands to take up final position (fall down, etc.)
schedule function bw:set_bed_facing 20t