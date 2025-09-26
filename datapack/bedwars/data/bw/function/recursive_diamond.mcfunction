scoreboard players remove @s diamondToGive 1
execute as @s[scores={diamondToGive=0..}] on origin run give @s diamond 1
execute as @s[scores={diamondToGive=0..}] run function bw:recursive_diamond
