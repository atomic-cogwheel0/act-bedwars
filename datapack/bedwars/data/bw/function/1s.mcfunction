#restart the function
schedule function bw:1s 1s replace

#incrementing resource counters (spawners, upgrades)
scoreboard players add @e[type=armor_stand, tag=IronS] iron 1
execute if score time game >= firstDiamond config run scoreboard players add @e[type=armor_stand, tag=DiamondS] diamond 1
execute if score time game >= firstEmerald config run scoreboard players add @e[type=armor_stand, tag=EmeraldS] emerald 1

scoreboard players add @e[type=armor_stand, scores={YellowIsland=1..}] iron 1
scoreboard players add @e[type=armor_stand, scores={YellowIsland=2..}] iron 1
scoreboard players add @e[type=armor_stand, scores={YellowIsland=2..}] diamond 1
scoreboard players add @e[type=armor_stand, scores={YellowIsland=3..}] diamond 1
scoreboard players add @e[type=armor_stand, scores={YellowIsland=3..}] emerald 1

scoreboard players add @e[type=armor_stand, scores={RedIsland=1..}] iron 1
scoreboard players add @e[type=armor_stand, scores={RedIsland=2..}] iron 1
scoreboard players add @e[type=armor_stand, scores={RedIsland=2..}] diamond 1
scoreboard players add @e[type=armor_stand, scores={RedIsland=3..}] diamond 1
scoreboard players add @e[type=armor_stand, scores={RedIsland=3..}] emerald 1

scoreboard players add @e[type=armor_stand, scores={BlueIsland=1..}] iron 1
scoreboard players add @e[type=armor_stand, scores={BlueIsland=2..}] iron 1
scoreboard players add @e[type=armor_stand, scores={BlueIsland=2..}] diamond 1
scoreboard players add @e[type=armor_stand, scores={BlueIsland=3..}] diamond 1
scoreboard players add @e[type=armor_stand, scores={BlueIsland=3..}] emerald 1

scoreboard players add @e[type=armor_stand, scores={GreenIsland=1..}] iron 1
scoreboard players add @e[type=armor_stand, scores={GreenIsland=2..}] iron 1
scoreboard players add @e[type=armor_stand, scores={GreenIsland=2..}] diamond 1
scoreboard players add @e[type=armor_stand, scores={GreenIsland=3..}] diamond 1
scoreboard players add @e[type=armor_stand, scores={GreenIsland=3..}] emerald 1

# summon resources when counters reach threshold
execute if score gameOn game matches 1 if entity @a[predicate=bw:in_game] as @e[type=armor_stand,scores={iron=1..}] at @s if score @s iron > ironDelay config run summon item ~ ~ ~ {Item:{id:"iron_ingot",count:1b}}
execute as @e[type=armor_stand, scores={iron=1..}] if score @s iron > ironDelay config run scoreboard players set @s iron 0

execute if score gameOn game matches 1 if entity @a[predicate=bw:in_game] as @e[type=armor_stand,scores={diamond=1..}] at @s if score @s diamond > diamondDelay config run summon item ~ ~ ~ {Item:{id:"diamond",count:1b}}
execute as @e[type=armor_stand, scores={diamond=1..}] if score @s diamond > diamondDelay config run scoreboard players set @s diamond 0

execute if score gameOn game matches 1 if entity @a[predicate=bw:in_game] as @e[type=armor_stand, scores={emerald=1..}] at @s if score @s emerald > emeraldDelay config run summon item ~ ~ ~ {Item:{id:"turtle_scute",count:1b,components:{custom_model_data:{flags:[true]},item_name:{translate:"item.bw.cracked_emerald"}}}}
execute as @e[type=armor_stand, scores={emerald=1..}] if score @s emerald > emeraldDelay config run scoreboard players set @s emerald 0

#first diamond and emerald
execute if score time game = firstDiamond config run execute if entity @a[predicate=bw:in_game] run execute at @e[type=armor_stand, scores={diamond=1..}] run summon item ~ ~ ~ {Item:{id:"diamond",count:1b}}
execute if score time game = firstEmerald config run execute if entity @a[predicate=bw:in_game] run execute at @e[type=armor_stand, scores={emerald=1..}] run summon item ~ ~ ~ {Item:{id:"minecraft:turtle_scute",count:1b,components:{custom_model_data:{flags:[true]},item_name:{translate:"item.bw.cracked_emerald"}}}}

execute if score time game = firstDiamond config run tellraw @a[predicate=bw:in_game] [{text:"The first "},{text:"Diamond","bold":true,color:"aqua"},{text:" has spawned!"}]
execute if score time game = firstEmerald config run tellraw @a[predicate=bw:in_game] [{text:"The first "},{text:"Emerald","bold":true,color:"green"},{text:" has spawned!"}]

#################

# disable crafting
recipe take @a *

# don't despawn items
execute if score gameOn game matches 1 if score persistentItems config matches 1 run execute as @e[type=item,predicate=bw:in_bedwars] run data modify entity @s Age set value 0

# bridge egg
scoreboard players add @e[type=snowball,tag=bridge] bridge 1
execute as @e[type=snowball,predicate=bw:in_bedwars,tag=bridge,scores={bridge=2..}] run function bw:entities/bridge_egg/fill

# food supply
execute as @a[team=!,team=!white,predicate=bw:in_bedwars] if score gameOn game matches 1 unless entity @s[nbt={Inventory:[{Slot:8b}]}] run item replace entity @s hotbar.8 with beetroot[item_name={translate:"item.bw.food"},food={nutrition:6,saturation:2,can_always_eat:true}]

# spawn protection
execute as @a[team=!,team=!white,predicate=bw:in_game] if score gameOn game matches 1 if score @s deathCalc matches 1.. run gamemode adventure @s
execute as @a[team=!,predicate=bw:in_game] if score gameOn game matches 1 if score @s deathCalc matches 1.. run effect give @s instant_health 1 20 true
execute as @a[team=!,team=!white,predicate=bw:in_game] if score gameOn game matches 1 if score @s deathCalc matches ..0 run gamemode survival @s

execute if score gameOn game matches 1 run gamemode spectator @a[team=white,predicate=bw:in_game]

execute as @a[predicate=bw:in_lobby] run effect give @s resistance 2 42 true
execute if score gameOn game matches 0 as @a[predicate=bw:in_lobby] run effect give @s saturation 2 42 true

# upgrades
execute as @a[team=!,team=!white,predicate=bw:in_bedwars] run execute store result score @s upgrade1 run clear @s sugar 0
execute as @a run execute if score @s upgrade1 matches 1.. run function bw:upgrade/island1

execute as @a[team=!,team=!white,predicate=bw:in_bedwars] run execute store result score @s upgrade2 run clear @s ink_sac 0
execute as @a run execute if score @s upgrade2 matches 1.. run function bw:upgrade/island2

execute as @a[team=!,team=!white,predicate=bw:in_bedwars] run execute store result score @s upgrade3 run clear @s glow_ink_sac 0
execute as @a run execute if score @s upgrade3 matches 1.. run function bw:upgrade/island3

execute as @a[team=!,team=!white,predicate=bw:in_bedwars] run execute store result score @s alarmBought run clear @s nether_star
execute as @a run execute if score @s alarmBought matches 1.. run function bw:upgrade/bed_alarm

# respawning players with a delay
execute as @a[team=red] if score @s deathCalc matches 0 run tp @s @e[type=armor_stand, tag=RedSpawn, limit=1]
execute as @a[team=blue] if score @s deathCalc matches 0 run tp @s @e[type=armor_stand, tag=BlueSpawn, limit=1]
execute as @a[team=green] if score @s deathCalc matches 0 run tp @s @e[type=armor_stand, tag=GreenSpawn, limit=1]
execute as @a[team=yellow] if score @s deathCalc matches 0 run tp @s @e[type=armor_stand, tag=YellowSpawn, limit=1]

execute as @a[team=!,team=!white] if score @s deathCalc matches 1.. at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 0.3
execute as @a[team=!,team=!white] if score @s deathCalc matches 1.. run title @s actionbar [{text:"Respawning in "},{score:{name:"@s",objective:"deathCalc"},color:"yellow"},{text:"..."}]
execute as @a[team=!,team=!white] if score @s deathCalc matches 0 run title @s actionbar [{text:""}]

execute if score gameOn game matches 1 as @a[predicate=bw:in_game] run execute if score @s deathCalc matches 0 run effect give @s saturation 1 1 true
execute if score gameOn game matches 1 as @a[predicate=bw:in_game] run execute if score @s deathCalc matches 0 run effect give @s instant_health 1 2 true

scoreboard players remove @a deathCalc 1

#execute as @a[team=!,predicate=bw:in_game] at @e[type=armor_stand,tag=Lobby,limit=1] run spawnpoint @s ~ ~ ~

# border handling
execute store result score borderSize game in bw:bedwars run worldborder get
execute if score gameOn game matches 1 run scoreboard players add border game 1

execute if score border game >= borderStartTime config if score borderStarted game matches 0 run function bw:border/start
execute if score borderStarted game matches 1 if score border game >= borderAdvanceDelay config if score borderSize game > borderMinSize config run function bw:border/advance
execute if score borderSize game <= borderMinSize config run bossbar set bw:border_bar name "Border finished advancing"

execute if score borderSize game <= bedBreak game if score deathMatch game matches 0 run function bw:border/deathmatch

execute if score borderStarted game matches 0 run scoreboard players operation in GameBar = borderStartTime config
execute if score borderStarted game matches 1 run scoreboard players operation in GameBar = borderAdvanceDelay config
# update display
scoreboard players operation in GameBar -= border game
scoreboard players operation size GameBar = borderSize game

# refresh bossbar
execute unless score borderStarted game matches 1 run scoreboard players operation border bossbarCalc = borderStartTime config
execute unless score borderStarted game matches 1 run execute store result bossbar bw:border_bar value run scoreboard players operation border bossbarCalc -= border game
execute if score borderStarted game matches 1 run scoreboard players operation border bossbarCalc = borderSize game
execute if score borderStarted game matches 1 unless score deathMatch game matches 1 store result bossbar bw:border_bar value run scoreboard players operation border bossbarCalc -= bedBreak game
execute if score borderStarted game matches 1 if score deathMatch game matches 1 store result bossbar bw:border_bar value run scoreboard players operation border bossbarCalc -= borderMinSize config

# player counting, victory
scoreboard players set playerCount game 0

execute store result score inred game run team list red
execute store result score inblue game run team list blue
execute store result score ingreen game run team list green
execute store result score inyellow game run team list yellow

scoreboard players operation playerCount game += inred game
scoreboard players operation playerCount game += inblue game
scoreboard players operation playerCount game += ingreen game
scoreboard players operation playerCount game += inyellow game

execute if score gameOn game matches 1 if score inyellow game matches 0 if score inblue game matches 0 if score ingreen game matches 0 as @a[team=red,limit=1] run tellraw @a[predicate=bw:in_game] [{text:"The red team won!",color:"red"}]
execute if score gameOn game matches 1 if score inred game matches 0 if score inyellow game matches 0 if score ingreen game matches 0 as @a[team=blue,limit=1] run tellraw @a[predicate=bw:in_game] [{text:"The blue team won!",color:"blue"}]
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score inyellow game matches 0 as @a[team=green,limit=1] run tellraw @a[predicate=bw:in_game] [{text:"The green team won!",color:"green"}]
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score ingreen game matches 0 as @a[team=yellow,limit=1] run tellraw @a[predicate=bw:in_game] [{text:"The yellow team won!",color:"yellow"}]

execute if score gameOn game matches 1 if score inyellow game matches 0 if score inblue game matches 0 if score ingreen game matches 0 as @a[team=red] run function bw:victory
execute if score gameOn game matches 1 if score inred game matches 0 if score inyellow game matches 0 if score ingreen game matches 0 as @a[team=blue] run function bw:victory
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score inyellow game matches 0 as @a[team=green] run function bw:victory
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score ingreen game matches 0 as @a[team=yellow] run function bw:victory

# teams are empty, only ghosts remain (draw situation)
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score ingreen game matches 0 if score inyellow game matches 0 if entity @a[team=white] run function bw:draw

execute if entity @a[team=red] run scoreboard players operation Red GameBar = inred game
execute if entity @a[team=blue] run scoreboard players operation Blue GameBar = inblue game
execute if entity @a[team=green] run scoreboard players operation Green GameBar = ingreen game
execute if entity @a[team=yellow] run scoreboard players operation Yellow GameBar = inyellow game

# update game bar
scoreboard players operation Alive GameBar = alive game

# disable the closest diamond spawner to empty teams
execute at @e[tag=RedSpawn] as @e[type=armor_stand,tag=DiamondS,sort=nearest,limit=1] if score inred game matches 0 run scoreboard players set @s diamond 0
execute at @e[tag=BlueSpawn] as @e[type=armor_stand,tag=DiamondS,sort=nearest,limit=1] if score inblue game matches 0 run scoreboard players set @s diamond 0
execute at @e[tag=GreenSpawn] as @e[type=armor_stand,tag=DiamondS,sort=nearest,limit=1] if score ingreen game matches 0 run scoreboard players set @s diamond 0
execute at @e[tag=YellowSpawn] as @e[type=armor_stand,tag=DiamondS,sort=nearest,limit=1] if score inyellow game matches 0 run scoreboard players set @s diamond 0

# the Alarm that you can buy at the exotic trader
execute if score redAlarm game matches 1.. as @a[team=!red] at @s if entity @e[tag=RedBed,distance=..10,limit=1] run tellraw @a[team=red] {text:"Your bed is under attack!",color:"dark_purple"}
execute if score redAlarm game matches 1.. as @a[team=!red] at @s if entity @e[tag=RedBed,distance=..10,limit=1] run scoreboard players remove redAlarm game 1

execute if score blueAlarm game matches 1.. as @a[team=!blue] at @s if entity @e[tag=BlueBed,distance=..10,limit=1] run tellraw @a[team=blue] {text:"Your bed is under attack!",color:"dark_purple"}
execute if score blueAlarm game matches 1.. as @a[team=!blue] at @s if entity @e[tag=BlueBed,distance=..10,limit=1] run scoreboard players remove blueAlarm game 1

execute if score greenAlarm game matches 1.. as @a[team=!green] at @s if entity @e[tag=GreenBed,distance=..10,limit=1] run tellraw @a[team=green] {text:"Your bed is under attack!",color:"dark_purple"}
execute if score greenAlarm game matches 1.. as @a[team=!green] at @s if entity @e[tag=GreenBed,distance=..10,limit=1] run scoreboard players remove greenAlarm game 1

execute if score yellowAlarm game matches 1.. as @a[team=!yellow] at @s if entity @e[tag=YellowBed,distance=..10,limit=1] run tellraw @a[team=yellow] {text:"Your bed is under attack!",color:"dark_purple"}
execute if score yellowAlarm game matches 1.. as @a[team=!yellow] at @s if entity @e[tag=YellowBed,distance=..10,limit=1] run scoreboard players remove yellowAlarm game 1

# health boost
execute as @a store result score @s hpboost run clear @s pink_dye[custom_data={hpboost:1b}] 0

execute unless score hardcore game matches 1 as @a[predicate=bw:in_game] run function bw:hp/set_normal
execute if score hardcore game matches 1 as @a[predicate=bw:in_game] run function bw:hp/set_hardcore
execute as @a[predicate=!bw:in_game] run function bw:hp/reset
#execute if score gameOn game matches 0 as @a[predicate=bw:in_game] run function bw:hp/reset

# potions
# functions should run once when potionBig/Small changes (tracked in potion*Applied)

# remove potion effects when neither potion is applied
execute as @a[tag=!potionBig] unless entity @s[tag=!potionBigApplied] run function bw:potions/remove_big
execute as @a[tag=!potionSmall] unless entity @s[tag=!potionSmallApplied] run function bw:potions/remove_small
tag @a[tag=!potionBig,tag=potionBigApplied] remove potionBigApplied
tag @a[tag=!potionSmall,tag=potionSmallApplied] remove potionSmallApplied

# potion of big
execute if score gameOn game matches 1 as @a[team=!,team=!white,predicate=bw:effect/infested,predicate=bw:in_game] run tag @s add potionBig
execute as @a[tag=potionBig,predicate=!bw:in_game] run tag @s remove potionBig
execute as @a[tag=potionBig,predicate=!bw:effect/infested] run tag @a remove potionBig

execute as @a[tag=potionBig,tag=!potionBigApplied] run function bw:potions/big
tag @a[tag=potionBig,tag=!potionBigApplied] add potionBigApplied

# potion of small
execute if score gameOn game matches 1 as @a[team=!,team=!white,predicate=bw:effect/luck,predicate=bw:in_game] run tag @s add potionSmall
execute as @a[tag=potionSmall,predicate=!bw:in_game] run tag @s remove potionSmall
execute as @a[tag=potionSmall,predicate=!bw:effect/luck] run tag @a remove potionSmall

execute as @a[tag=potionSmall,tag=!potionSmallApplied] run function bw:potions/small
tag @a[tag=potionSmall,tag=!potionSmallApplied] add potionSmallApplied

# rescue stuck villagers
execute as @e[type=villager,predicate=bw:in_bedwars] at @s if block ~ ~ ~ obsidian if block ~ ~1 ~ obsidian run tp ~ ~1 ~

# update time
execute if score gameOn game matches 1 run scoreboard players add time game 1
scoreboard players operation Time GameBar = time game

execute as @e[type=happy_ghast,predicate=bw:in_bedwars,nbt={equipment:{body:{count:1,id:"minecraft:orange_harness"}}}] run attribute @s flying_speed modifier add bw:destructive_happy_ghast 1 add_multiplied_base
execute as @e[type=happy_ghast,predicate=bw:in_bedwars,nbt={equipment:{body:{count:1,id:"minecraft:orange_harness"}}}] at @s run summon arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}}}

# refresh map name display
function bw:map_update