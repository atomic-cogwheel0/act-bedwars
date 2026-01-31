scoreboard players set gameOn game 0
scoreboard players set alive game 0

kill @e[type=silverfish]
kill @e[type=item]
kill @e[type=chicken]
kill @e[type=chest_minecart]
kill @e[type=vex]

execute at @e[type=armor_stand,tag=Lobby] run spawnpoint @a[team=!] ~ ~ ~
execute at @e[type=armor_stand,tag=Lobby] run tp @a[team=!] ~ ~ ~ 180 0

gamemode adventure @a[team=!]

team join white @a[team=!,team=!white]
team empty red
team empty yellow
team empty green
team empty blue

clear @a[team=!]

# won't run multiple times :)
schedule function bw:tell_game_time 1t replace

scoreboard objectives setdisplay sidebar wins

worldborder set 240

bossbar set bw:border_bar visible false