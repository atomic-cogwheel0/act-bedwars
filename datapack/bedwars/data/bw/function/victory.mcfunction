title @a[predicate=bw:in_game] times 0 100 20
title @a[predicate=bw:in_game] subtitle {text:"Congratulations!",color:"gray"}
title @a[predicate=bw:in_game] title [{text:"You ",color:"dark_aqua"},{text:"W",color:"dark_green"},{text:"O",color:"dark_red"},{text:"N",color:"dark_blue"},{text:"!",color:"yellow"}]

execute as @a[predicate=bw:in_game] at @s run playsound item.goat_horn.sound.1 ambient @s ~ ~ ~
scoreboard players add @s wins 1

function bw:finish_game