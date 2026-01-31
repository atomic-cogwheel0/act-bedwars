title @s times 0 100 20
title @s subtitle {text:"Congratulations!",color:"gray"}
title @s title [{text:"You ",color:"dark_aqua"},{text:"W",color:"dark_green"},{text:"O",color:"dark_red"},{text:"N",color:"dark_blue"},{text:"!",color:"yellow"}]

execute at @a as @a run playsound minecraft:item.goat_horn.sound.1 ambient @s ~ ~ ~
scoreboard players add @s wins 1

function bw:finish_game