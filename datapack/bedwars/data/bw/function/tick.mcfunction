# Wiping the map of unwanted entities

# lobby
kill @e[type=#bw:lobby_forbidden,predicate=bw:in_lobby]

# bridge egg too high or outside border
execute in bw:bedwars run kill @e[type=snowball,tag=bridge,predicate=!bw:inside_map]

#execute in bw:bedwars run kill @e[type=item,predicate=bw:in_bedwars,nbt={Item:{id:"minecraft:item_frame"}}]

# Set banishing score, goes down rapidly after effect ends (by countdown or death)
execute as @a[predicate=bw:effect/unluck] unless entity @s[scores={banishing=20..}] run scoreboard players add @s banishing 1
scoreboard players remove @a[scores={banishing=1..},predicate=!bw:effect/unluck] banishing 1

# Kills for out-of-map players
#execute if score gameOn game matches 1 as @e[type=player,x=-160,y=1,z=-160,dx=320,dy=3,dz=320,team=!] run kill @s[team=!white]
execute in bw:lobby as @e[type=player,x=-160,y=-192,z=-160,dx=320,dy=64,dz=320,predicate=bw:in_lobby] if score @s deathCalc matches ..-1 run damage @s 2000 out_of_world
execute in bw:lobby as @e[type=player,x=-160,y=-192,z=-160,dx=320,dy=64,dz=320,predicate=bw:in_lobby] if score @s deathCalc matches 0.. at @s run tp ~ ~64 ~

# fell down from the map
execute in bw:bedwars if score gameOn game matches 1 as @e[type=player,team=!white,team=!,x=-160,y=1,z=-160,dx=320,dy=3,dz=320,predicate=bw:in_bedwars] run damage @s 2000 bw:fell_off

# Ships map poisonous water
execute in bw:bedwars if score map game matches 1 if score gameOn game matches 1 as @a[team=!white,team=!,x=-120,y=0,z=-120,dx=240,dy=320,dz=240,predicate=bw:in_bedwars] at @s if block ~ ~ ~ water if block ~ ~-1 ~ water run damage @s 3 bw:fell_into_water
execute in bw:bedwars if score map game matches 1 if score gameOn game matches 1 as @a[team=!white,team=!,x=-120,y=0,z=-120,dx=240,dy=320,dz=240,predicate=bw:in_bedwars] at @s if block ~ ~ ~ water if block ~ ~1 ~ water run damage @s 3 bw:fell_into_water

# Special arrows
execute as @e[type=arrow,predicate=bw:in_bedwars] run function bw:arrow/handler

# Bed break detection
execute at @e[type=armor_stand,tag=YellowBed,predicate=bw:in_bedwars] unless block ~ ~ ~ yellow_bed unless block ~ ~ ~ end_portal_frame run function bw:bed_broken/yellow
execute at @e[type=armor_stand,tag=RedBed,predicate=bw:in_bedwars] unless block ~ ~ ~ red_bed unless block ~ ~ ~ end_portal_frame run function bw:bed_broken/red
execute at @e[type=armor_stand,tag=BlueBed,predicate=bw:in_bedwars] unless block ~ ~ ~ blue_bed unless block ~ ~ ~ end_portal_frame run function bw:bed_broken/blue
execute at @e[type=armor_stand,tag=GreenBed,predicate=bw:in_bedwars] unless block ~ ~ ~ green_bed unless block ~ ~ ~ end_portal_frame run function bw:bed_broken/green

# ensure players in other dims can't modify game behavior
scoreboard players set @a[predicate=!bw:in_bedwars] redBedsBroken 0
scoreboard players set @a[predicate=!bw:in_bedwars] blueBedsBroken 0
scoreboard players set @a[predicate=!bw:in_bedwars] greenBedsBroken 0
scoreboard players set @a[predicate=!bw:in_bedwars] yellowBedsBroken 0

# Bridge egg
tag @e[type=egg,tag=!bridge_spawner,nbt={Item:{components:{"minecraft:custom_data":{bridge:1b}}}}] add bridge_spawner
execute as @e[type=egg,tag=bridge_spawner] at @s run function bw:entities/bridge_egg/tick

# Fireball
# don't check bridge snowball NBT to improve performance
execute as @e[type=snowball,tag=!bridge,nbt={Item:{components:{"minecraft:custom_data":{fireball:1b}}}}] at @s run function bw:entities/fireball

# Death reset
execute as @a[scores={deathReset=1..},predicate=bw:in_game] run function bw:on_death/death_reset

# Villagers' facing directions
execute as @e[type=#bw:trader,predicate=bw:in_game] at @s unless entity @e[type=shulker,distance=..5] run rotate @s facing entity @p
execute as @e[type=#bw:trader,predicate=bw:in_game] at @s if entity @n[type=shulker,distance=..5] run rotate @s facing entity @n[type=shulker]

# Set gamemode when someone rejoins
execute as @a[tag=!joined] run scoreboard players set @s leave 1
tag @a[tag=!joined] add joined

# enable the trigger for everyone :)
scoreboard players enable @a[scores={leave=1..}] tpToBw

execute unless score noTP config matches 1 if score gameOn game matches 0 as @a[scores={leave=1..}] run execute at @e[type=armor_stand,tag=Lobby,limit=1,predicate=bw:in_lobby] run tp @s ~ ~ ~ 270 0
execute unless score noTP config matches 1 as @a[scores={leave=1..},team=] run gamemode adventure @s
execute unless score noTP config matches 1 as @a[scores={leave=1..},team=] run team join white

execute if score noTP config matches 1 as @a[scores={leave=1..}] run tellraw @s "Bedwars available!"
execute if score noTP config matches 1 as @a[scores={leave=1..}] run tellraw @s "Join from the pause menu (TP to Bedwars option)"

scoreboard players set @a[scores={leave=1..}] leave 0

# Teleport to Lobby dialog trigger
execute if score gameOn game matches 0 as @a[scores={tpToBw=1}] at @e[type=armor_stand,tag=Lobby,limit=1,predicate=bw:in_lobby] run tp @s ~ ~ ~ 270 0
execute if score gameOn game matches 1 as @a[scores={tpToBw=1},predicate=!bw:in_bedwars] at @e[type=armor_stand,tag=Lobby,limit=1,predicate=bw:in_lobby] run tp @s ~ ~ ~ 270 0
execute if score gameOn game matches 1 as @a[scores={tpToBw=1},predicate=bw:in_bedwars] run tellraw @s {text: "Game running! Lobby unavailable for you",color:"red"}
gamemode adventure @a[scores={tpToBw=1}]
team join white @a[scores={tpToBw=1}]
# Teleport to Game Map
execute if score gameOn game matches 0 as @a[scores={tpToBw=2}] in bw:bedwars run tp @s 0 128 0
execute if score gameOn game matches 0 as @a[scores={tpToBw=2}] run effect give @s slow_falling 3 0 true
execute if score gameOn game matches 1 as @a[scores={tpToBw=2}] run tellraw @s {text: "Game running! Game Map unavailable",color:"red"}

scoreboard players enable @a[scores={tpToBw=1..}] tpToBw
scoreboard players set @a[scores={tpToBw=1..}] tpToBw 0

# Safe mode, set gamemode in lobby
execute if score gameOn game matches 0 if score safeMode config matches 1 as @a[team=!,predicate=bw:in_lobby] run gamemode adventure @s

# Parkour master
execute as @e[tag=Parkour] at @s run scoreboard players set @a[distance=..2,scores={parkourMessage=0}] parkourMessage 1
execute as @e[tag=Parkour] at @s run scoreboard players set @a[distance=2..] parkourMessage 0
execute as @a[scores={parkourMessage=1}] run tellraw @s {text:"Well done! You found me. Continue by jumping on the animals.",color:"gold"}
execute as @a[scores={parkourMessage=1}] at @s run playsound entity.villager.yes ambient @s ~ ~ ~
execute as @a[scores={parkourMessage=1}] run scoreboard players set @s parkourMessage 2

# Cyanide
execute as @a[scores={cyanide=1..}] run damage @s 2000 bw:dignity

# Double jump
execute as @e[type=armor_stand,tag=jump] run kill @s

execute if score doubleJumpEnabled config matches 1 if score gameOn game matches 1 as @a[tag=!has_jumped,tag=can_jump,predicate=bw:in_bedwars] if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{type_specific:{type:"minecraft:player",input:{jump:1b},gamemode:["survival"]},flags:{is_on_ground:0b,is_flying:0b}}} unless items entity @s hotbar.* wind_charge store result score @s doJump run clear @s wind_charge 2
execute as @a[scores={doJump=1..}] at @s run summon armor_stand ~ ~-.15 ~ {Invisible:1b,Silent:1b,NoGravity:1b,Tags:["jump"]}
execute as @a[scores={doJump=1..}] run effect give @s jump_boost infinite 255 true
effect give @e[type=armor_stand,tag=jump] wind_charged infinite 5 true
execute as @a[tag=!has_jumped,tag=can_jump,scores={doJump=1..}] run tag @s add has_jumped
execute as @a[scores={doJump=1..}] run scoreboard players set @s doJump 0

execute as @a[tag=has_jumped] if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{flags:{is_on_ground:1b}}} run effect clear @s jump_boost
execute as @a[tag=has_jumped] if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{flags:{is_on_ground:1b}}} run tag @s remove has_jumped

execute as @a[tag=can_jump] if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{flags:{is_on_ground:1b}}} run tag @s remove can_jump
execute as @a[tag=!has_jumped] if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{type_specific:{type:"minecraft:player",input:{jump:0b}},flags:{is_on_ground:0b,is_flying:0b}}} run tag @s add can_jump

# Happy ghast
execute as @a[scores={ghastSpawning=1..}] at @s run function bw:entities/happy_ghast/summon

execute as @e[type=happy_ghast,tag=player_spawned,predicate=!bw:happy_ghast_valid] at @s run function bw:entities/happy_ghast/remove