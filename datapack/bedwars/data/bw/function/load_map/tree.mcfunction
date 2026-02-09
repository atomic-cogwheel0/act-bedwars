time set noon
function bw:air_fills/fills_air_full

execute in bw:bedwars run fillbiome -120 -5 -120 119 159 119 bw:peaceful_islands

place template tree:emerald -18 37 -18

place template tree:diamond -40 30 -25
place template tree:diamond 25 30 -40 clockwise_90
place template tree:diamond -25 30 40 counterclockwise_90
place template tree:diamond 40 30 25 180

place template tree:red_island -60 30 -13 clockwise_90
place template tree:blue_island 13 30 -60 180
place template tree:green_island 60 30 13 counterclockwise_90
place template tree:yellow_island -13 30 60

scoreboard players set bedBreak game 138

kill @e[type=item,predicate=bw:in_bedwars]

scoreboard players set villagerType game 1
function bw:setvillagers_unified
