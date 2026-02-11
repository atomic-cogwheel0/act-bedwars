advancement revoke @s only bw:run_on_killed_by_player

execute unless entity @s[predicate=bw:in_game] run return fail

execute summon llama_spit run function bw:on_death/llama_spit_loot_transfer

particle poof ~-.5 ~ ~-.5 .5 1 .5 .05 20 normal @a[predicate=bw:in_bedwars]
execute as @a[predicate=bw:in_game] at @s run playsound minecraft:entity.wither.hurt ambient @s ~ ~ ~