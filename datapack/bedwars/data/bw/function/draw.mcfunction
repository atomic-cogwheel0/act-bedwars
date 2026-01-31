title @a times 0 100 20
title @a title [{text:"It's a draw!",color:"gray"}]

tellraw @a {text:"No one won.",bold:true,color:"gray"}

execute as @a at @s run playsound minecraft:item.goat_horn.sound.5 ambient @s ~ ~ ~

function bw:finish_game