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
execute if score gameOn game matches 1 if entity @a as @e[type=armor_stand, scores={iron=1..}] at @s if score @s iron > ironDelay config run summon item ~ ~ ~ {Item:{id:"iron_ingot",count:1b}}
execute as @e[type=armor_stand, scores={iron=1..}] if score @s iron > ironDelay config run scoreboard players set @s iron 0

execute if score gameOn game matches 1 if entity @a as @e[type=armor_stand, scores={diamond=1..}] at @s if score @s diamond > diamondDelay config run summon item ~ ~ ~ {Item:{id:"diamond",count:1b}}
execute as @e[type=armor_stand, scores={diamond=1..}] if score @s diamond > diamondDelay config run scoreboard players set @s diamond 0

execute if score gameOn game matches 1 if entity @a as @e[type=armor_stand, scores={emerald=1..}] at @s if score @s emerald > emeraldDelay config run summon item ~ ~ ~ {Item:{id:"turtle_scute",count:1b}}
execute as @e[type=armor_stand, scores={emerald=1..}] if score @s emerald > emeraldDelay config run scoreboard players set @s emerald 0

#first diamond and emerald
execute if score time game = firstDiamond config run execute if entity @a run execute at @e[type=armor_stand, scores={diamond=1..}] run summon item ~ ~ ~ {Item:{id:"diamond",count:1b}}
execute if score time game = firstEmerald config run execute if entity @a run execute at @e[type=armor_stand, scores={emerald=1..}] run summon item ~ ~ ~ {Item:{id:"minecraft:turtle_scute",count:1b}}

execute if score time game = firstDiamond config run tellraw @a [{text:"The first "},{text:"Diamond","bold":true,color:"aqua"},{text:" has spawned!"}]
execute if score time game = firstEmerald config run tellraw @a [{text:"The first "},{text:"Emerald","bold":true,color:"green"},{text:" has spawned!"}]

#################

# don't despawn items
execute if score persistentItems config matches 1 run execute as @e[type=item] run data merge entity @s {Age:0}

# bridge egg
scoreboard players add @e[type=snowball,tag=bridge] bridge 1

execute at @e[scores={bridge=2..},tag=redwool] run fill ~ ~ ~ ~1 ~-1 ~1 red_wool keep
execute at @e[scores={bridge=2..},tag=bluewool] run fill ~ ~ ~ ~1 ~-1 ~1 blue_wool keep
execute at @e[scores={bridge=2..},tag=greenwool] run fill ~ ~ ~ ~1 ~-1 ~1 green_wool keep
execute at @e[scores={bridge=2..},tag=yellowwool] run fill ~ ~ ~ ~1 ~-1 ~1 yellow_wool keep
execute at @e[scores={bridge=2..},tag=whitewool] run fill ~ ~ ~ ~1 ~-1 ~1 white_wool keep

kill @e[type=snowball,scores={bridge=5..}]

# food supply
execute as @a[team=!] if score gameOn game matches 1 unless entity @s[nbt={Inventory:[{Slot:8b}]}] run item replace entity @s[team=!white] hotbar.8 with beetroot[item_name="Radish",food={nutrition:6,saturation:2,can_always_eat:true}]

# spawn protection
execute as @a[team=!] if score gameOn game matches 1 if score @s deathCalc matches 1.. run gamemode adventure @s[team=!white]
execute as @a[team=!] if score gameOn game matches 1 if score @s deathCalc matches 1.. run effect give @s instant_health
execute as @a[team=!] if score gameOn game matches 1 if score @s deathCalc matches ..0 run gamemode survival @s[team=!white]
execute at @e[type=armor_stand,tag=Lobby,limit=1] run spawnpoint @s ~ ~ ~
execute if score gameOn game matches 1 run gamemode spectator @a[team=white]

execute as @a[x=-120,y=-64,z=-120,dx=240,dy=64,dz=240] run effect give @s resistance 2 42 true

execute as @a[team=!] run execute as @s[team=!white] store result score @s upgrade1 run clear @s sugar 0
execute as @a run execute as @s if score @s upgrade1 matches 1 run function bw:islandupgrade1

execute as @a[team=!] run execute as @s[team=!white] store result score @s upgrade2 run clear @s ink_sac 0
execute as @a run execute as @s if score @s upgrade2 matches 1 run function bw:islandupgrade2

execute as @a[team=!] run execute as @s[team=!white] store result score @s upgrade3 run clear @s glow_ink_sac 0
execute as @a run execute as @s if score @s upgrade3 matches 1 run function bw:islandupgrade3

execute as @a[team=!] run execute as @s[team=!white] store result score @s alarmBought run clear @s nether_star
execute as @a run execute as @s if score @s alarmBought matches 1 run function bw:setalarm

# respawning players with a delay
execute as @a[team=red] if score @s deathCalc matches 0 run tp @s @e[type=armor_stand, tag=RedSpawn, limit=1]
execute as @a[team=blue] if score @s deathCalc matches 0 run tp @s @e[type=armor_stand, tag=BlueSpawn, limit=1]
execute as @a[team=green] if score @s deathCalc matches 0 run tp @s @e[type=armor_stand, tag=GreenSpawn, limit=1]
execute as @a[team=yellow] if score @s deathCalc matches 0 run tp @s @e[type=armor_stand, tag=YellowSpawn, limit=1]

execute as @a[team=!] if score @s deathCalc matches 1.. at @s run playsound entity.experience_orb.pickup ambient @s[team=!white] ~ ~ ~ 0.3
execute as @a[team=!] if score @s deathCalc matches 1.. run title @s[team=!white] actionbar [{text:"Respawning in "},{score:{name:"@s",objective:"deathCalc"},color:"yellow"},{text:"..."}]
execute as @a[team=!] if score @s deathCalc matches 0 run title @s[team=!white] actionbar [{text:""}]

execute if score gameOn game matches 1 as @a run execute if score @s deathCalc matches 0 run effect give @s saturation 1 1 true
execute if score gameOn game matches 1 as @a run execute if score @s deathCalc matches 0 run effect give @s instant_health 1 2 true

scoreboard players remove @a deathCalc 1

# border handling
execute store result score borderSize game run worldborder get
execute if score gameOn game matches 1 run scoreboard players add border game 1

execute if score border game >= borderStartTime config if score borderStarted game matches 0 run function bw:borderstart
execute if score borderStarted game matches 1 if score border game >= borderAdvanceDelay config if score borderSize game > borderMinSize config run function bw:border
execute if score borderSize game <= bedBreak game if score deathMatch game matches 0 run function bw:deathmatch

execute if score borderStarted game matches 0 run scoreboard players operation in: GameBar = borderStartTime config
execute if score borderStarted game matches 1 run scoreboard players operation in: GameBar = borderAdvanceDelay config
scoreboard players operation in: GameBar -= border game

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

execute if score gameOn game matches 1 if score inyellow game matches 0 if score inblue game matches 0 if score ingreen game matches 0 as @a[team=red,limit=1] run tellraw @a [{text:"The red team won!",color:"red"}]
execute if score gameOn game matches 1 if score inred game matches 0 if score inyellow game matches 0 if score ingreen game matches 0 as @a[team=blue,limit=1] run tellraw @a [{text:"The blue team won!",color:"blue"}]
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score inyellow game matches 0 as @a[team=green,limit=1] run tellraw @a [{text:"The green team won!",color:"green"}]
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score ingreen game matches 0 as @a[team=yellow,limit=1] run tellraw @a [{text:"The yellow team won!",color:"yellow"}]

execute if score gameOn game matches 1 if score inyellow game matches 0 if score inblue game matches 0 if score ingreen game matches 0 as @a[team=red] run function bw:victory
execute if score gameOn game matches 1 if score inred game matches 0 if score inyellow game matches 0 if score ingreen game matches 0 as @a[team=blue] run function bw:victory
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score inyellow game matches 0 as @a[team=green] run function bw:victory
execute if score gameOn game matches 1 if score inred game matches 0 if score inblue game matches 0 if score ingreen game matches 0 as @a[team=yellow] run function bw:victory

execute if entity @a[team=red] run scoreboard players operation Red GameBar = inred game
execute if entity @a[team=blue] run scoreboard players operation Blue GameBar = inblue game
execute if entity @a[team=green] run scoreboard players operation Green GameBar = ingreen game
execute if entity @a[team=yellow] run scoreboard players operation Yellow GameBar = inyellow game

scoreboard players operation Alive: GameBar = alive game

# disable the closest diamond spawner to empty teams
execute at @e[tag=RedSpawn] as @e[type=armor_stand,tag=DiamondS,sort=nearest,limit=1] if score inred game matches 0 run scoreboard players set @s diamond 0
execute at @e[tag=BlueSpawn] as @e[type=armor_stand,tag=DiamondS,sort=nearest,limit=1] if score inblue game matches 0 run scoreboard players set @s diamond 0
execute at @e[tag=GreenSpawn] as @e[type=armor_stand,tag=DiamondS,sort=nearest,limit=1] if score ingreen game matches 0 run scoreboard players set @s diamond 0
execute at @e[tag=YellowSpawn] as @e[type=armor_stand,tag=DiamondS,sort=nearest,limit=1] if score inyellow game matches 0 run scoreboard players set @s diamond 0

# the Alarm that you can buy at the exotic trader
execute if score redAlarm game matches 1 as @a[team=!red] at @s if entity @e[tag=RedBed,distance=..5,limit=1] run tellraw @a[team=red] {text:"Your bed is under attack!",color:"dark_purple"}
execute if score redAlarm game matches 1 as @a[team=!red] at @s if entity @e[tag=RedBed,distance=..5,limit=1] run scoreboard players set redAlarm game 0

execute if score blueAlarm game matches 1 as @a[team=!blue] at @s if entity @e[tag=BlueBed,distance=..5,limit=1] run tellraw @a[team=blue] {text:"Your bed is under attack!",color:"dark_purple"}
execute if score blueAlarm game matches 1 as @a[team=!blue] at @s if entity @e[tag=BlueBed,distance=..5,limit=1] run scoreboard players set blueAlarm game 0

execute if score greenAlarm game matches 1 as @a[team=!green] at @s if entity @e[tag=GreenBed,distance=..5,limit=1] run tellraw @a[team=green] {text:"Your bed is under attack!",color:"dark_purple"}
execute if score greenAlarm game matches 1 as @a[team=!green] at @s if entity @e[tag=GreenBed,distance=..5,limit=1] run scoreboard players set greenAlarm game 0

execute if score yellowAlarm game matches 1 as @a[team=!yellow] at @s if entity @e[tag=YellowBed,distance=..5,limit=1] run tellraw @a[team=yellow] {text:"Your bed is under attack!",color:"dark_purple"}
execute if score yellowAlarm game matches 1 as @a[team=!yellow] at @s if entity @e[tag=YellowBed,distance=..5,limit=1] run scoreboard players set yellowAlarm game 0

# health boost
execute as @a store result score @s hpboost run clear @s pink_dye[custom_data={hpboost:1b}] 0

execute unless score hardcore game matches 1 as @a[scores={hpboost=0}] run attribute @s max_health base set 20
execute unless score hardcore game matches 1 as @a[scores={hpboost=1}] run attribute @s max_health base set 22
execute unless score hardcore game matches 1 as @a[scores={hpboost=2..}] run attribute @s max_health base set 24

execute if score hardcore game matches 1 as @a[scores={hpboost=0}] run attribute @s max_health base set 1
execute if score hardcore game matches 1 as @a[scores={hpboost=1}] run attribute @s max_health base set 2
execute if score hardcore game matches 1 as @a[scores={hpboost=2..}] run attribute @s max_health base set 3

# potions of big and small
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s scale base set 2
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s movement_speed base set 0.082
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s block_break_speed base set 1.25
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s block_interaction_range base set 8
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s step_height base set 1.2
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run effect give @s resistance 2 3 true
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s jump_strength base set 0.8

execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] run attribute @s scale base set 0.5
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] run attribute @s movement_speed base set 0.114
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] run attribute @s entity_interaction_range base set 3.75
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] run attribute @s block_interaction_range base set 3.75
execute if score gameOn game matches 1 as @a[team=!] if entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] run attribute @s step_height base set 0.3

execute if score gameOn game matches 1 as @a[team=!] unless entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] unless entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s scale base set 1
execute if score gameOn game matches 1 as @a[team=!] unless entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] unless entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s movement_speed base set 0.1
execute if score gameOn game matches 1 as @a[team=!] unless entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] unless entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s entity_interaction_range base set 5
execute if score gameOn game matches 1 as @a[team=!] unless entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] unless entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s block_interaction_range base set 5
execute if score gameOn game matches 1 as @a[team=!] unless entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] unless entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s block_break_speed base set 1
execute if score gameOn game matches 1 as @a[team=!] unless entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] unless entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s step_height base set 0.6
execute if score gameOn game matches 1 as @a[team=!] unless entity @s[nbt={active_effects:[{id:"minecraft:luck"}]}] unless entity @s[nbt={active_effects:[{id:"minecraft:infested"}]}] run attribute @s jump_strength base set 0.42

# rescue stuck villagers
execute as @e[type=villager] at @s if block ~ ~ ~ minecraft:obsidian if block ~ ~1 ~ obsidian run tp ~ ~1 ~

# update time
execute if score gameOn game matches 1 run scoreboard players add time game 1
scoreboard players operation Time: GameBar = time game

# refresh map name display
function bw:map_update
