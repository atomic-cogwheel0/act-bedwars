execute as @e[type=armor_stand,tag=YellowBed] if score @s bedStandFacingDir matches 1 at @s run setblock ~ ~ ~ yellow_bed[facing=east,part=foot]
execute as @e[type=armor_stand,tag=YellowBed] if score @s bedStandFacingDir matches 1 at @s run setblock ~1 ~ ~ yellow_bed[facing=east,part=head]

execute as @e[type=armor_stand,tag=YellowBed] if score @s bedStandFacingDir matches 2 at @s run setblock ~ ~ ~ yellow_bed[facing=south,part=foot]
execute as @e[type=armor_stand,tag=YellowBed] if score @s bedStandFacingDir matches 2 at @s run setblock ~ ~ ~1 yellow_bed[facing=south,part=head]

execute as @e[type=armor_stand,tag=YellowBed] if score @s bedStandFacingDir matches 3 at @s run setblock ~ ~ ~ yellow_bed[facing=west,part=foot]
execute as @e[type=armor_stand,tag=YellowBed] if score @s bedStandFacingDir matches 3 at @s run setblock ~-1 ~ ~ yellow_bed[facing=west,part=head]

execute as @e[type=armor_stand,tag=YellowBed] if score @s bedStandFacingDir matches 4 at @s run setblock ~ ~ ~ yellow_bed[facing=north,part=foot]
execute as @e[type=armor_stand,tag=YellowBed] if score @s bedStandFacingDir matches 4 at @s run setblock ~ ~ ~-1 yellow_bed[facing=north,part=head]