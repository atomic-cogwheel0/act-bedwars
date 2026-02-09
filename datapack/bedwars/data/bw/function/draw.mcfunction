title @a[predicate=bw:in_game] times 0 100 20
title @a[predicate=bw:in_game] subtitle {text:"No one won.",bold:true,color:"gray"}
title @a[predicate=bw:in_game] title [{text:"It's a draw!",color:"gray"}]

execute as @a[predicate=bw:in_game] at @s run playsound item.goat_horn.sound.5 ambient @s ~ ~ ~

function bw:finish_game