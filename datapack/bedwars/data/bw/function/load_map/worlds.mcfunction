function bw:air_fills/fills_air_full

execute in bw:bedwars run fillbiome -125 -5 -125 124 139 124 bw:old_islands

place template worlds:emerald_island -19 47 -19

place template worlds:diamond_island 8 37 -66 clockwise_90
place template worlds:diamond_island -8 37 66 counterclockwise_90
place template worlds:diamond_island -66 37 -8
place template worlds:diamond_island 66 37 8 180

place template worlds:blue_base -32 45 -42 180
place template worlds:green_base 32 45 42
place template worlds:red_base -42 45 32 clockwise_90
place template worlds:yellow_base 42 45 -32 counterclockwise_90

execute as @e[type=item_frame,predicate=bw:in_bedwars] run data merge entity @s {Fixed:1b}
scoreboard players set bedBreak game 130

kill @e[type=item,predicate=bw:in_bedwars]

time set 12750

scoreboard players set villagerType game 1
function bw:setvillagers_unified
