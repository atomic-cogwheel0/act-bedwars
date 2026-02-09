scoreboard players set @s ghastSpawning 0
execute if entity @s[predicate=!bw:in_bedwars] run return fail

execute if entity @s[team=red] run summon happy_ghast ~ ~ ~ {equipment:{body:{count:1,id:"minecraft:red_harness"}}}
execute if entity @s[team=blue] run summon happy_ghast ~ ~ ~ {equipment:{body:{count:1,id:"minecraft:blue_harness"}}}
execute if entity @s[team=yellow] run summon happy_ghast ~ ~ ~ {equipment:{body:{count:1,id:"minecraft:yellow_harness"}}}
execute if entity @s[team=green] run summon happy_ghast ~ ~ ~ {equipment:{body:{count:1,id:"minecraft:green_harness"}}}

execute if entity @s[team=!red,team=!yellow,team=!green,team=!blue] at @s run summon happy_ghast ~ ~ ~ {equipment:{body:{count:1,id:"minecraft:white_harness"}}}

tag @n[type=happy_ghast] add player_spawned
attribute @n[type=happy_ghast] scale modifier add bw:happy_ghast -0.5 add_multiplied_base
ride @s mount @n[type=happy_ghast]