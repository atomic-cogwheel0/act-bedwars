time set day
function bw:fills_air

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

kill @e[type=item]

scoreboard players set villagerType game 1
function bw:setvillagers_unified