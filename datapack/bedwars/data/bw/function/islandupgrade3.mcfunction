execute if entity @e[type=armor_stand,scores={RedIsland=2}] as @s[team=red] run execute as @e[type=armor_stand,tag=RedUpgradable] run scoreboard players set @s RedIsland 3
execute if entity @e[type=armor_stand,scores={YellowIsland=2}] as @s[team=yellow] run execute as @e[type=armor_stand,tag=YellowUpgradable] run scoreboard players set @s YellowIsland 3
execute if entity @e[type=armor_stand,scores={GreenIsland=2}] as @s[team=green] run execute as @e[type=armor_stand,tag=GreenUpgradable] run scoreboard players set @s GreenIsland 3
execute if entity @e[type=armor_stand,scores={BlueIsland=2}] as @s[team=blue] run execute as @e[type=armor_stand,tag=BlueUpgradable] run scoreboard players set @s BlueIsland 3

execute if entity @e[type=armor_stand,scores={RedIsland=3}] as @s[team=red] run clear @s glow_ink_sac
execute if entity @e[type=armor_stand,scores={YellowIsland=3}] as @s[team=yellow] run clear @s glow_ink_sac
execute if entity @e[type=armor_stand,scores={GreenIsland=3}] as @s[team=green] run clear @s glow_ink_sac
execute if entity @e[type=armor_stand,scores={BlueIsland=3}] as @s[team=blue] run clear @s glow_ink_sac
