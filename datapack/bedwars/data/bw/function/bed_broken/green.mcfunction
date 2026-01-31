execute as @a[scores={greenBedsBroken=1..},team=green] run tellraw @s [{text:"You can't break your own bed!",color:"dark_red"}]

# do these if no self-bed break has occurred
execute as @a[scores={greenBedsBroken=1..}] unless entity @s[team=green] run tellraw @a [{text:"The green bed has been broken by ",color:"dark_purple"},{selector:"@a[scores={greenBedsBroken=1..}]"}]
execute unless entity @a[scores={greenBedsBroken=1..}] run tellraw @a [{text:"The green bed has been broken",color:"dark_purple"}]

execute unless entity @a[scores={greenBedsBroken=1..},team=green] at @e[type=armor_stand,tag=Lobby] run spawnpoint @a[team=green] ~ ~ ~
execute unless entity @a[scores={greenBedsBroken=1..},team=green] at @a run playsound entity.ghast.warn ambient @s
execute unless entity @a[scores={greenBedsBroken=1..},team=green] run scoreboard players set Green bedBroken 1
execute unless entity @a[scores={greenBedsBroken=1..},team=green] at @e[tag=GreenBed] run setblock ~ ~ ~ end_portal_frame

execute unless entity @a[scores={greenBedsBroken=1..},team=green] run give @a[team=green] trial_key

# self-break
execute if entity @a[scores={greenBedsBroken=1..},team=green] run function bw:replace_bed/green

kill @e[type=item,nbt={Item:{id:"minecraft:green_bed"}}]

execute as @a[scores={greenBedsBroken=1..}] run scoreboard players set @s greenBedsBroken 0