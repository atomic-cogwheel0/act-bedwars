execute as @a[scores={yellowBedsBroken=1..},team=yellow] run tellraw @s [{text:"You can't break your own bed!",color:"dark_red"}]

# do these if no self-bed break has occurred
execute as @a[scores={yellowBedsBroken=1..}] unless entity @s[team=yellow] run tellraw @a [{text:"The yellow bed has been broken by ",color:"dark_purple"},{selector:"@a[scores={yellowBedsBroken=1..}]"}]
execute unless entity @a[scores={yellowBedsBroken=1..}] run tellraw @a [{text:"The yellow bed has been broken",color:"dark_purple"}]

execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] at @e[type=armor_stand,tag=Lobby] run spawnpoint @a[team=yellow] ~ ~ ~
execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] at @a run playsound entity.ghast.warn ambient @s
execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] run scoreboard players set Yellow bedBroken 1
execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] at @e[tag=YellowBed] run setblock ~ ~ ~ end_portal_frame

execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] run give @a[team=yellow] trial_key

# self-break
execute if entity @a[scores={yellowBedsBroken=1..},team=yellow] run function bw:replaceyellowbed

kill @e[type=item,nbt={Item:{id:"minecraft:yellow_bed"}}]

execute as @a[scores={yellowBedsBroken=1..}] run scoreboard players set @s yellowBedsBroken 0