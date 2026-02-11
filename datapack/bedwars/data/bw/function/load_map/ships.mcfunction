function bw:air_fills/fills_air_full

execute in bw:bedwars run fillbiome -125 -5 -125 124 139 124 bw:deadly_waters

fill -120 1 -120 119 16 119 water replace air
fill -120 1 -120 119 1 119 sand

place template ships:emerald_island -20 1 -23

place template ships:diamond_island -7 9 -50 counterclockwise_90
place template ships:diamond_island 12 9 50 clockwise_90
place template ships:diamond_island -50 9 3 180
place template ships:diamond_island 50 9 -12

place template ships:ship_blue -27 15 -50 180
place template ships:ship_green 33 15 50
place template ships:ship_red -50 15 24 clockwise_90
place template ships:ship_yellow 50 15 -32 counterclockwise_90

# trapdoors become waterlogged when placed, don't do that
fill -120 15 -120 119 15 119 oak_trapdoor[facing=north,half=top,open=true,waterlogged=false] replace oak_trapdoor[facing=north,half=top,open=true,waterlogged=true]
fill -120 15 -120 119 15 119 oak_trapdoor[facing=east,half=top,open=true,waterlogged=false] replace oak_trapdoor[facing=east,half=top,open=true,waterlogged=true]
fill -120 15 -120 119 15 119 oak_trapdoor[facing=south,half=top,open=true,waterlogged=false] replace oak_trapdoor[facing=south,half=top,open=true,waterlogged=true]
fill -120 15 -120 119 15 119 oak_trapdoor[facing=west,half=top,open=true,waterlogged=false] replace oak_trapdoor[facing=west,half=top,open=true,waterlogged=true]

execute as @e[type=item_frame,predicate=bw:in_bedwars] run data merge entity @s {Fixed:1b}
scoreboard players set bedBreak game 144

kill @e[type=item,predicate=bw:in_bedwars]

time set midnight

scoreboard players set villagerType game 3
function bw:setvillagers_unified
