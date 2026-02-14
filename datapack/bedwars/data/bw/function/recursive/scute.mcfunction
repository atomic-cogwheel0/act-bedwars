scoreboard players remove @s scuteToGive 1
execute as @s[scores={scuteToGive=0..}] on origin run give @s turtle_scute[custom_model_data={flags:[true]},item_name={translate:"item.bw.cracked_emerald"}] 1
execute as @s[scores={scuteToGive=0..}] run function bw:recursive/scute
