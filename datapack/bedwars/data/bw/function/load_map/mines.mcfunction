function bw:stone_fills/fills_stone_full

execute in bw:bedwars run fillbiome -120 -5 -120 119 159 119 bw:peaceful_islands

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

kill @e[type=item,predicate=bw:in_bedwars]
time set noon

scoreboard players set villagerType game 2
function bw:setvillagers_unified