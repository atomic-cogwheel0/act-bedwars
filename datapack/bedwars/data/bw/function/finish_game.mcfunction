scoreboard players set gameOn game 0
scoreboard players set alive game 0

kill @e[type=silverfish,predicate=bw:in_bedwars]
kill @e[type=item,predicate=bw:in_bedwars]
kill @e[type=chicken,predicate=bw:in_bedwars]
kill @e[type=chest_minecart,predicate=bw:in_bedwars]
kill @e[type=vex,predicate=bw:in_bedwars]

execute at @e[type=armor_stand,tag=Lobby] run tp @a[team=!,predicate=bw:in_game] ~ ~ ~ 270 0

gamemode adventure @a[team=!,predicate=bw:in_game]

team join white @a[team=!,team=!white,predicate=bw:in_game]
team empty red
team empty yellow
team empty green
team empty blue

clear @a[team=!,predicate=bw:in_game]
effect clear @a[team=!,predicate=bw:in_game]

# won't run multiple times :)
schedule function bw:tell_game_time 1t replace

scoreboard objectives setdisplay sidebar wins

execute in bw:bedwars run worldborder set 240

bossbar set bw:border_bar visible false