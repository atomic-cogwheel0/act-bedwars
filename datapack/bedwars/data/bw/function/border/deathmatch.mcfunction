execute at @e[type=armor_stand,tag=BlueBed,predicate=bw:in_bedwars] run setblock ~ ~ ~ air
execute at @e[type=armor_stand,tag=RedBed,predicate=bw:in_bedwars] run setblock ~ ~ ~ air
execute at @e[type=armor_stand,tag=GreenBed,predicate=bw:in_bedwars] run setblock ~ ~ ~ air
execute at @e[type=armor_stand,tag=YellowBed,predicate=bw:in_bedwars] run setblock ~ ~ ~ air
scoreboard players set deathMatch game 1

bossbar set bw:border_bar name "Border closing..."
bossbar set bw:border_bar color red
execute store result score border bossbarCalc run worldborder get
execute store result bossbar bw:border_bar max run scoreboard players operation border bossbarCalc -= borderMinSize config
