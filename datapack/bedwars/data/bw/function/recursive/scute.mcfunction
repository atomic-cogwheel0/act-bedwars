scoreboard players remove @s scuteToGive 1
execute as @s[scores={scuteToGive=0..}] on origin run give @s turtle_scute 1
execute as @s[scores={scuteToGive=0..}] run function bw:recursive/scute
