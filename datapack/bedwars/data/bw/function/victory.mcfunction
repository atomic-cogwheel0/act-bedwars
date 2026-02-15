# title duration is the same for winners and losers
title @a[predicate=bw:in_game] times 0 100 20

title @s[predicate=bw:in_game] title [{text:"You ",color:"dark_aqua"},{text:"W",color:"dark_green"},{text:"O",color:"dark_red"},{text:"N",color:"dark_blue"},{text:"!",color:"yellow"}]
title @s[predicate=bw:in_game] subtitle {text:"Congratulations!",color:"gray"}

# get losers
execute as @s[team=red] run tag @a[tag=!started_as_red,predicate=bw:in_game] add lost_game
execute as @s[team=blue] run tag @a[tag=!started_as_blue,predicate=bw:in_game] add lost_game
execute as @s[team=green] run tag @a[tag=!started_as_green,predicate=bw:in_game] add lost_game
execute as @s[team=yellow] run tag @a[tag=!started_as_yellow,predicate=bw:in_game] add lost_game

title @a[tag=lost_game] title [{text:"You lost.",color:"dark_gray"}]
title @a[tag=lost_game] subtitle {text:"Maybe next time.",color:"gray"}

execute at @s run playsound item.goat_horn.sound.1 ambient @s ~ ~ ~

# play the losing sound only once
stopsound @a[tag=lost_game] ambient item.goat_horn.sound.6
execute as @a[tag=lost_game] at @s run playsound item.goat_horn.sound.6 ambient @s ~ ~ ~

scoreboard players add @s wins 1

tag @a remove lost_game

function bw:finish_game