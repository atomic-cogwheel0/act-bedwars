title @s times 0 100 20
title @s subtitle {text:"Congratulations!",color:"gray"}
title @s title [{text:"You",color:"dark_aqua"},{text:" W",color:"dark_green"},{text:"O",color:"dark_red"},{text:"N",color:"dark_blue"},{text:"!",color:"yellow"}]
scoreboard players set gameOn game 0
scoreboard players set alive game 0
kill @e[type=silverfish]
kill @e[type=item]
kill @e[type=chicken]
kill @e[type=chest_minecart]
kill @e[type=vex]
execute at @a as @a run playsound minecraft:item.goat_horn.sound.1 ambient @s ~ ~ ~
execute at @e[type=armor_stand,tag=Lobby] run spawnpoint @a[team=!] ~ ~ ~
execute at @e[type=armor_stand,tag=Lobby] run tp @a[team=!] ~ ~ ~ 180 0
gamemode adventure @a[team=!]
scoreboard players set borderShrink game 2
team join white @s
team join white @a[team=!,team=!white]
team empty red
team empty yellow
team empty green
team empty blue
clear @a

# won't run multiple times :)
schedule function bw:tell_game_time 1t replace

scoreboard players add @s wins 1
scoreboard objectives setdisplay sidebar wins