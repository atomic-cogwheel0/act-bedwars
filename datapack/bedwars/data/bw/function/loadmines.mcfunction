function bw:fills_stone
# is this needed?
#fill -120 1 -120 119 16 119 water
#fill -120 1 -120 119 1 119 sand

#function bw:stone_fills/fills_stone9
place template mines:main_mineshaft -23 46 -23
place template mines:diamond_room2 49 53 -2
place template mines:diamond_room2 -49 53 2 180
place template mines:diamond_room2 2 53 49 clockwise_90
place template mines:diamond_room2 -2 53 -49 counterclockwise_90
place template mines:red_base 50 52 -50 180
place template mines:yellow_base -50 52 -50 clockwise_90
place template mines:green_base -50 52 50
place template mines:blue_base 50 52 50 counterclockwise_90

scoreboard players set bedBreak game 106

kill @e[type=item]
time set noon

scoreboard players set villagerType game 2
function bw:setvillagers_unified