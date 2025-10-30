execute if score gameOn game matches 1 as @s[team=!] run scoreboard players operation @s[team=!white] deathCalc = respawnDelayNormal config
execute if score gameOn game matches 1 as @s[team=!,scores={banishing=1..}] run scoreboard players operation @s[team=!white] deathCalc = respawnDelayBanished config

execute at @e[type=armor_stand,tag=Lobby,limit=1] run spawnpoint @s ~ ~ ~

execute if score Green bedBroken matches 1 run execute as @s[team=green] run scoreboard players remove alive game 1
execute if score Green bedBroken matches 1 run execute as @s[team=green] run execute at @e[type=armor_stand,tag=DeadSpawn,limit=1] run spawnpoint @s ~ ~ ~
execute if score Green bedBroken matches 1 run execute as @s[team=green] run team join white @s

execute if score Red bedBroken matches 1 run execute as @s[team=red] run scoreboard players remove alive game 1
execute if score Red bedBroken matches 1 run execute as @s[team=red] run execute at @e[type=armor_stand,tag=DeadSpawn,limit=1] run spawnpoint @s ~ ~ ~
execute if score Red bedBroken matches 1 run execute as @s[team=red] run team join white @s

execute if score Blue bedBroken matches 1 run execute as @s[team=blue] run scoreboard players remove alive game 1
execute if score Blue bedBroken matches 1 run execute as @s[team=blue] run execute at @e[type=armor_stand,tag=DeadSpawn,limit=1] run spawnpoint @s ~ ~ ~
execute if score Blue bedBroken matches 1 run execute as @s[team=blue] run team join white @s

execute if score Yellow bedBroken matches 1 run execute as @s[team=yellow] run scoreboard players remove alive game 1
execute if score Yellow bedBroken matches 1 run execute as @s[team=yellow] run execute at @e[type=armor_stand,tag=DeadSpawn,limit=1] run spawnpoint @s ~ ~ ~
execute if score Yellow bedBroken matches 1 run execute as @s[team=yellow] run team join white @s

execute as @s[team=white] run gamemode spectator @s
execute as @s[team=!white,team=!] run gamemode adventure @s

# player kills handle resources differently in transfer_loot_via_llama_spit
execute if score @s doneDrops matches 0 store result score @s IronLost run clear @s iron_ingot
execute if score @s doneDrops matches 0 store result score @s DiamondsLost run clear @s diamond
execute if score @s doneDrops matches 0 store result score @s EmeraldsLost run clear @s emerald
execute if score @s doneDrops matches 0 store result score @s ScutesLost run clear @s turtle_scute

execute if score @s doneDrops matches 0 run tellraw @a ["They §lhad§r ",{score:{name:"@s",objective:"IronLost"},color:"gray"},"⓪, ",{score:{name:"@s",objective:"DiamondsLost"},color:"aqua"},"① and ",{score:{name:"@s",objective:"ScutesLost"},color:"dark_green"},"+",{score:{name:"@s",objective:"EmeraldsLost"},color:"green"},"②."]

scoreboard players set @s doneDrops 0

scoreboard players set @s DiamondsLost 0
scoreboard players set @s EmeraldsLost 0
scoreboard players set @s ScutesLost 0
scoreboard players set @s IronLost 0

scoreboard players set @s deathReset 0
scoreboard players set @s cyanide 0
scoreboard players set @s banishing 0