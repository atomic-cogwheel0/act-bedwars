execute as @n[type=block_display] store result score @s display_light run data get entity @s brightness.sky
execute as @n[type=block_display] run scoreboard players remove @s display_light 1
execute as @n[type=block_display] if score @s display_light matches ..-1 run scoreboard players set @s display_light 15
execute as @n[type=block_display] store result entity @s brightness.sky int 1 run scoreboard players get @s display_light