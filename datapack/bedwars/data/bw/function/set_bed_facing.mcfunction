execute as @e[type=armor_stand,tag=AnyBed] at @s if block ~1 ~ ~ #beds run scoreboard players set @s bedStandFacingDir 1
execute as @e[type=armor_stand,tag=AnyBed] at @s if block ~ ~ ~1 #beds run scoreboard players set @s bedStandFacingDir 2
execute as @e[type=armor_stand,tag=AnyBed] at @s if block ~-1 ~ ~ #beds run scoreboard players set @s bedStandFacingDir 3
execute as @e[type=armor_stand,tag=AnyBed] at @s if block ~ ~ ~-1 #beds run scoreboard players set @s bedStandFacingDir 4