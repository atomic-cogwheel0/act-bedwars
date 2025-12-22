time set 14000
function bw:fills_air

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

kill @e[type=item]

execute as @e[tag=basic_trader] run data merge entity @s {VillagerData:{type:"taiga"},equipment:{mainhand:{id:"iron_sword",count:1}}}
execute as @e[tag=nitwit] run data merge entity @s {VillagerData:{type:"taiga"},equipment:{mainhand:{id:"iron_axe",count:1}}}

execute as @e[tag=upgraded_trader] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=nitwit] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=fletcher] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=weaponsmith] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=toolsmith] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=armorer] run data merge entity @s {VillagerData:{type:"taiga"}}

execute as @e[type=sheep] run data merge entity @s {Invulnerable:0b}

execute as @e[type=sheep] at @s run tp @s ~ ~ ~ facing entity @e[type=armor_stand,sort=nearest,limit=1]

scoreboard players set villagerType game 1
function bw:setvillagers_unified