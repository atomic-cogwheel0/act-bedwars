execute as @a[scores={redBedsBroken=1..},team=red] run tellraw @s [{text:"You can't break your own bed!",color:"dark_red"}]

# do these if no self-bed break has occurred
# unknown origin
execute unless entity @a[scores={redBedsBroken=1..}] run tellraw @a [{text:"The red bed has been broken",color:"dark_purple"}]
# known origin
execute as @a[scores={redBedsBroken=1..},team=!red] run tellraw @a [{text:"The red bed has been broken by ",color:"dark_purple"},{selector:"@a[scores={redBedsBroken=1..}]"}]

execute unless entity @a[scores={redBedsBroken=1..},team=red] at @e[type=armor_stand,tag=Lobby] run spawnpoint @a[team=red] ~ ~ ~
execute unless entity @a[scores={redBedsBroken=1..},team=red] at @a run playsound entity.ghast.warn ambient @s
execute unless entity @a[scores={redBedsBroken=1..},team=red] run scoreboard players set Red bedBroken 1
execute unless entity @a[scores={redBedsBroken=1..},team=red] at @e[tag=RedBed] run setblock ~ ~ ~ end_portal_frame

execute unless entity @a[scores={redBedsBroken=1..},team=red] run give @a[team=red] trial_key

# self-break
execute if entity @a[scores={redBedsBroken=1..},team=red] run function bw:replace_bed/red

kill @e[type=item,nbt={Item:{id:"minecraft:red_bed"}}]

execute as @a[scores={redBedsBroken=1..}] run scoreboard players set @s redBedsBroken 0