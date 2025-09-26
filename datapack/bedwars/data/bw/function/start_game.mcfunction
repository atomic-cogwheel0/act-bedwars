function bw:map_update

title @a times 0 100 20
title @a subtitle {text:"Game started",color:"light_purple"}
title @a title {text:""}

tellraw @a [{text:"Hints:",bold:true,color:"gold",underlined:true}]
tellraw @a "§7Using the Bedwars Resorce Pack (RP) is highly recommended."
tellraw @a "§7Exchange Cracked Emeralds (normal scutes without the RP) for valuable emeralds at your Basic Trader."
tellraw @a "§7You won't find everything at the Basic Trader. Look on the diamond & emerald islands for more offers."
tellraw @a "§7Look for the airdrop in the center when the border turns red."
tellraw @a "§7You may break blocks on the islands."
tellraw @a "§7An Enchantment Table is available on every diamond island."

#function bw:clones

recipe take @a *

#clear the arena from entities
kill @e[x=-120,y=0,z=-120,dx=240,dy=320,dz=240,type=!player]
fill -120 -1 -120 119 -1 119 air replace obsidian

execute store result score hardcore game run scoreboard players get hardcoreLever game

execute if score map game matches 1 run function bw:loadships
execute if score map game matches 2 run function bw:loadmines
execute if score map game matches 4 run function bw:loadmoon
execute if score map game matches 5 run function bw:loadvillage
execute if score map game matches 6 run function bw:loadtunnels
execute if score map game matches 7 run function bw:loadtree
execute if score map game matches 8 run function bw:loadcrypt

execute at @e[type=armor_stand,tag=Lobby] run spawnpoint @a ~ ~ ~

#execute as @a[team=white] run team leave @s

# spawn proofing
execute at @e[type=armor_stand,tag=RedSpawn] run setblock ~ ~-2 ~ bedrock
execute at @e[type=armor_stand,tag=GreenSpawn] run setblock ~ ~-2 ~ bedrock
execute at @e[type=armor_stand,tag=BlueSpawn] run setblock ~ ~-2 ~ bedrock
execute at @e[type=armor_stand,tag=YellowSpawn] run setblock ~ ~-2 ~ bedrock

execute as @a[team=!] run clear @s[team=!white]

execute as @a[team=!] run give @s[team=!white] lapis_lazuli 32
execute as @a[team=!] run give @s[team=!white] cyan_dye[item_name={text:"Socrates' Hemlock Drink",color:"aqua"},food={can_always_eat:true,nutrition:0,saturation:0},consumable={animation:"drink"},lore=["Ancient item. Deadly. Beware!"]] 6

effect give @a instant_health 1 100
effect give @a saturation 1 100

scoreboard players set @e[type=armor_stand] iron 0
scoreboard players set @e[type=armor_stand] emerald 0
scoreboard players set @e[type=armor_stand] diamond 0

scoreboard players set @e[type=armor_stand] RedIsland 0
scoreboard players set @e[type=armor_stand] BlueIsland 0
scoreboard players set @e[type=armor_stand] GreenIsland 0
scoreboard players set @e[type=armor_stand] YellowIsland 0

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

scoreboard players set @a deathCountdown 100

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

execute as @a[team=!] run execute as @s[team=!white] run scoreboard players add alive game 1

worldborder set 240

scoreboard players set border game 0
scoreboard players set borderShrink game 0
scoreboard players set deathMatch game 0

scoreboard players set time game 0

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

execute as @a at @a run playsound item.goat_horn.sound.2 ambient @s ~ ~ ~

# wait for armor stands to take up final position
schedule function bw:set_bed_facing 20t
