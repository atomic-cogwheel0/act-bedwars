time set 14000
function bw:fills_air

place template graveyard:emerald -24 46 -24

place template graveyard:diamond -65 46 -40 counterclockwise_90
place template graveyard:diamond 40 46 -65
place template graveyard:diamond -40 46 65 180
place template graveyard:diamond 65 46 40 clockwise_90

place template graveyard:red_island -82 45 5 counterclockwise_90
place template graveyard:blue_island -5 45 -82
place template graveyard:green_island 82 45 -5 clockwise_90
place template graveyard:yellow_island 5 45 82 180

function bw:load_map/graveyard_scattered_islands

scoreboard players set bedBreak game 156

kill @e[type=item]

execute as @e[tag=upgraded_trader] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=nitwit] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=fletcher] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=weaponsmith] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=toolsmith] run data merge entity @s {VillagerData:{type:"taiga"}}
execute as @e[tag=armorer] run data merge entity @s {VillagerData:{type:"taiga"}}

scoreboard players set villagerType game 1
function bw:setvillagers_unified