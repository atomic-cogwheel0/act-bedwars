execute as @a[scores={blueBedsBroken=1..},team=blue] run tellraw @s [{text:"You can't break your own bed!",color:"dark_red"}]

# do these if no self-bed break has occurred
execute as @a[scores={blueBedsBroken=1..}] unless entity @s[team=blue] run tellraw @a [{text:"The blue bed has been broken by ",color:"dark_purple"},{selector:"@a[scores={blueBedsBroken=1..}]"}]
execute unless entity @a[scores={blueBedsBroken=1..}] run tellraw @a [{text:"The blue bed has been broken",color:"dark_purple"}]

execute unless entity @a[scores={blueBedsBroken=1..},team=blue] at @e[type=armor_stand,tag=Lobby] run spawnpoint @a[team=blue] ~ ~ ~
execute unless entity @a[scores={blueBedsBroken=1..},team=blue] at @a run playsound entity.ghast.warn ambient @s
execute unless entity @a[scores={blueBedsBroken=1..},team=blue] run scoreboard players set Blue bedBroken 1
execute unless entity @a[scores={blueBedsBroken=1..},team=blue] at @e[tag=BlueBed] run setblock ~ ~ ~ end_portal_frame

execute unless entity @a[scores={blueBedsBroken=1..},team=blue] run give @a[team=blue] trial_key

# self-break
execute if entity @a[scores={blueBedsBroken=1..},team=blue] run function bw:replacebluebed

kill @e[type=item,nbt={Item:{id:"minecraft:blue_bed"}}]

execute as @a[scores={blueBedsBroken=1..}] run scoreboard players set @s blueBedsBroken 0