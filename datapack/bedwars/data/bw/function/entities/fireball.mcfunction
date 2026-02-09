
summon fireball ~ ~ ~ {Tags:["fireball"],NoGravity:1b,ExplosionPower:4}

execute store result entity @n[type=fireball] Motion[0] double 0.00001 run data get entity @s Motion[0] 5264
execute store result entity @n[type=fireball] Motion[1] double 0.00001 run data get entity @s Motion[1] 5264
execute store result entity @n[type=fireball] Motion[2] double 0.00001 run data get entity @s Motion[2] 5264

#execute as @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{fireball:1b}}}}] at @s run data modify entity @n[type=fireball] Motion set from entity @s Motion
#execute as @e[type=fireball] store result entity @s acceleration_power double 0.00001 run data get entity @s Motion[0] 5264

kill @s