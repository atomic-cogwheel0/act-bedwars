time set 14000
function bw:air_fills/fills_air_full

execute in bw:bedwars run fillbiome -125 -5 -125 124 139 124 bw:peaceful_islands

place template crypt:emerald -24 46 -20

place template crypt:diamond -50 42 -40
place template crypt:diamond 40 42 -50 clockwise_90
place template crypt:diamond -40 42 50 counterclockwise_90
place template crypt:diamond 50 40 42 180

place template crypt:red_base -58 50 13 180
place template crypt:blue_base -13 50 -58 counterclockwise_90
place template crypt:green_base 58 50 -13
place template crypt:yellow_base 13 50 58 clockwise_90

scoreboard players set bedBreak game 154

kill @e[type=item,predicate=bw:in_bedwars]

execute as @e[type=#bw:trader,tag=basic_trader] run data merge entity @s {VillagerData:{type:"taiga"},equipment:{mainhand:{id:"iron_sword",count:1}}}
execute as @e[type=#bw:trader,tag=nitwit] run data merge entity @s {VillagerData:{type:"taiga"},equipment:{mainhand:{id:"iron_axe",count:1}}}

execute as @e[type=#bw:trader,tag=upgraded_trader] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[type=#bw:trader,tag=nitwit] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[type=#bw:trader,tag=fletcher] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[type=#bw:trader,tag=weaponsmith] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[type=#bw:trader,tag=toolsmith] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[type=#bw:trader,tag=armorer] run data merge entity @s {VillagerData:{type:"taiga"}}

execute as @e[type=sheep,predicate=bw:in_bedwars] run data merge entity @s {Invulnerable:0b}
execute as @e[type=sheep,predicate=bw:in_bedwars] at @s run rotate @s facing entity @n[type=armor_stand]

scoreboard players set villagerType game 1
function bw:setvillagers_unified