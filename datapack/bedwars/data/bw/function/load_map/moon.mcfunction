time set midnight
function bw:air_fills/fills_air_full

place template moon_base:emerald -24 37 -24
place template moon_base:cluster -8 60 -8

place template moon_base:diamond -60 40 -40
place template moon_base:diamond 40 40 -60 clockwise_90
place template moon_base:diamond -40 40 60 counterclockwise_90
place template moon_base:diamond 60 40 40 180

place template moon_base:red_base -68 25 13 180
place template moon_base:blue_base -13 25 -68 counterclockwise_90
place template moon_base:green_base 68 25 -13
place template moon_base:yellow_base 13 25 68 clockwise_90

scoreboard players set bedBreak game 168

kill @e[type=item]

scoreboard players set villagerType game 1
function bw:setvillagers_unified
