scoreboard players remove @s emeraldToGive 1
execute as @s[scores={emeraldToGive=0..}] on origin run give @s emerald 1
execute as @s[scores={emeraldToGive=0..}] run function bw:recursive_emerald