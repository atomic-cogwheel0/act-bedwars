advancement revoke @s only bw:run_on_killed_by_player

execute summon llama_spit run function bw:on_death/llama_spit_loot_transfer

execute as @a at @s run playsound minecraft:entity.wither.hurt ambient @s ~ ~ ~