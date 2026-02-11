time set day
function bw:air_fills/fills_air_full

execute in bw:bedwars run fillbiome -125 -5 -125 124 139 124 bw:peaceful_islands

place template village:emerald -20 32 -20

place template village:diamond -40 23 -40
place template village:diamond 40 23 -40 clockwise_90
place template village:diamond -40 23 40 counterclockwise_90
place template village:diamond 40 23 40 180

place template village:red_base 54 27 53
place template village:blue_base -71 27 54
place template village:green_base -71 27 -71
place template village:yellow_base 53 27 -71

scoreboard players set bedBreak game 122

kill @e[type=item,predicate=bw:in_bedwars]

scoreboard players set villagerType game 1
function bw:setvillagers_unified