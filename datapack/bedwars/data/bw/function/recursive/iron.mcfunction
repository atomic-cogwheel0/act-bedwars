scoreboard players remove @s ironToGive 1
execute as @s[scores={ironToGive=0..}] on origin run give @s iron_ingot 1
execute as @s[scores={ironToGive=0..}] run function bw:recursive/iron