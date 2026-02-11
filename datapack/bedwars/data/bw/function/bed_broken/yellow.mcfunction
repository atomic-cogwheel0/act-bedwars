execute as @a[scores={yellowBedsBroken=1..},team=yellow] run tellraw @s [{text:"You can't break your own bed!",color:"dark_red"}]

# do these if no self-bed break has occurred
execute as @a[scores={yellowBedsBroken=1..}] unless entity @s[team=yellow] run tellraw @a[predicate=bw:in_game] [{text:"The yellow bed has been broken by ",color:"dark_purple"},{selector:"@a[scores={yellowBedsBroken=1..}]"}]
execute unless entity @a[scores={yellowBedsBroken=1..}] run tellraw @a[predicate=bw:in_game] [{text:"The yellow bed has been broken",color:"dark_purple"}]

execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] as @a[predicate=bw:in_game] at @s run playsound entity.ghast.warn ambient @s
execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] run scoreboard players set Yellow bedBroken 1

execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] at @e[tag=YellowBed] run setblock ~ ~ ~ end_portal_frame
execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] at @e[tag=YellowBed] run particle dragon_breath ~-.5 ~ ~-.5 .5 1 .5 .2 20 normal @a[predicate=bw:in_bedwars]

execute unless entity @a[scores={yellowBedsBroken=1..},team=yellow] run give @a[team=yellow] trial_key

# self-break
execute if entity @a[scores={yellowBedsBroken=1..},team=yellow] run function bw:replace_bed/yellow

kill @e[type=item,nbt={Item:{id:"minecraft:yellow_bed"}},predicate=bw:in_bedwars]

execute as @a[scores={yellowBedsBroken=1..}] run scoreboard players set @s yellowBedsBroken 0