# Wiping the map of unwanted entities

# lobby
kill @e[type=snowball,x=-120,y=-64,z=-120,dx=240,dy=64,dz=240]
kill @e[type=arrow,x=-120,y=-64,z=-120,dx=240,dy=64,dz=240]
kill @e[type=tnt,x=-120,y=-64,z=-120,dx=240,dy=64,dz=240]
kill @e[type=fireball,x=-120,y=-64,z=-120,dx=240,dy=64,dz=240]

# too high
kill @e[type=snowball,x=-120,y=160,z=-120,dx=240,dy=160,dz=240]
#kill @e[type=arrow,x=-120,y=160,z=-120,dx=240,dy=160,dz=240]

# bridge egg far outside border
kill @e[type=snowball,x=-400,y=-64,z=-400,dx=279,dy=384,dz=639]
kill @e[type=snowball,x=-400,y=-64,z=-400,dx=639,dy=384,dz=279]

kill @e[type=snowball,x=400,y=-64,z=400,dx=-281,dy=384,dz=-641]
kill @e[type=snowball,x=400,y=-64,z=400,dx=-641,dy=384,dz=-281]

kill @e[type=item,nbt={Item:{id:"minecraft:item_frame"}}]

# Set banishing score, goes down rapidly after effect ends (by countdown or death)
execute as @a[nbt={active_effects:[{id:"minecraft:unluck"}]}] unless entity @s[scores={banishing=20..}] run scoreboard players add @s banishing 1
scoreboard players remove @a[scores={banishing=1..},nbt=!{active_effects:[{id:"minecraft:unluck"}]}] banishing 1

# Kills for out-of-map players
#execute if score gameOn game matches 1 as @e[type=player,x=-160,y=1,z=-160,dx=320,dy=3,dz=320,team=!] run kill @s[team=!white]
execute as @e[type=player,x=-160,y=-192,z=-160,dx=320,dy=64,dz=320] run damage @s 2000 out_of_world

execute if score gameOn game matches 1 as @e[type=player,x=-160,y=1,z=-160,dx=320,dy=3,dz=320,team=!white] run damage @s[team=!] 2000 dragon_breath

# Special arrows
execute at @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},inBlockState:{}}] run summon tnt ~ ~ ~ {fuse:0}
kill @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},inBlockState:{}}]

execute at @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:healing"}}},inBlockState:{}}] run setblock ~ ~ ~ fire keep
kill @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:healing"}}},inBlockState:{}}]

execute at @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:fire_resistance"}}},inBlockState:{}}] run summon vex
kill @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:fire_resistance"}}},inBlockState:{}}]

# lovely bunch of arrows
execute as @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:invisibility"}}},inBlockState:{}},scores={}] at @s run function bw:bunchaarrows
kill @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:invisibility"}}},inBlockState:{}},scores={idk=5..}]

# summon one arrow each tick while in flight
execute as @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:weakness"}}}},scores={}] at @s run summon arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}}}
kill @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:weakness"}}},inBlockState:{}}]

execute as @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:weaving"}}},inBlockState:{}},scores={}] at @s run function bw:prison
kill @e[type=arrow,nbt={item:{components:{"minecraft:potion_contents":{potion:"minecraft:weaving"}}},inBlockState:{}}]

# Bed break detection
execute at @e[type=armor_stand,tag=YellowBed] unless block ~ ~ ~ yellow_bed unless block ~ ~ ~ end_portal_frame run function bw:yellowbedbroken
execute at @e[type=armor_stand,tag=RedBed] unless block ~ ~ ~ red_bed unless block ~ ~ ~ end_portal_frame run function bw:redbedbroken
execute at @e[type=armor_stand,tag=BlueBed] unless block ~ ~ ~ blue_bed unless block ~ ~ ~ end_portal_frame run function bw:bluebedbroken
execute at @e[type=armor_stand,tag=GreenBed] unless block ~ ~ ~ green_bed unless block ~ ~ ~ end_portal_frame run function bw:greenbedbroken

# Bridge egg
#execute as @e[type=egg,nbt={Item:{components:{"minecraft:custom_data":{bridge:1b}}}}] at @s on origin run say alma
execute as @e[type=egg,nbt={Item:{components:{"minecraft:custom_data":{bridge:1b}}}}] at @s on origin if entity @s[team=red] run summon snowball ~ ~ ~ {Tags:["bridge","redwool"],NoGravity:1b}
execute as @e[type=egg,nbt={Item:{components:{"minecraft:custom_data":{bridge:1b}}}}] at @s on origin if entity @s[team=blue] run summon snowball ~ ~ ~ {Tags:["bridge","bluewool"],NoGravity:1b}
execute as @e[type=egg,nbt={Item:{components:{"minecraft:custom_data":{bridge:1b}}}}] at @s on origin if entity @s[team=green] run summon snowball ~ ~ ~ {Tags:["bridge","greenwool"],NoGravity:1b}
execute as @e[type=egg,nbt={Item:{components:{"minecraft:custom_data":{bridge:1b}}}}] at @s on origin if entity @s[team=yellow] run summon snowball ~ ~ ~ {Tags:["bridge","yellowwool"],NoGravity:1b}
execute as @e[type=egg,nbt={Item:{components:{"minecraft:custom_data":{bridge:1b}}}}] at @s on origin unless entity @s[team=!white,team=!] run summon snowball ~ ~ ~ {Tags:["bridge","whitewool"],NoGravity:1b}

execute as @e[type=egg,nbt={Item:{components:{"minecraft:custom_data":{bridge:1b}}}},nbt=!{CustomNameVisible:1b}] run data merge entity @s {CustomName:"Bridge Egg",CustomNameVisible:1b}

# Fireball
execute at @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{fireball:1b}}}}] run summon fireball ~ ~ ~ {Tags:["fireball"], NoGravity:1b,ExplosionPower:4}
execute as @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{fireball:1b}}}}] at @s run data modify entity @n[type=fireball] Motion set from entity @s Motion
execute as @e[type=fireball] store result entity @s acceleration_power double 0.00001 run data get entity @s Motion[0] 5264
kill @e[type=snowball,nbt={Item:{components:{"minecraft:custom_data":{fireball:1b}}}}]

# Double jump
#execute as @e[type=minecraft:wind_charge] at @s store result entity @s Motion[0] double 10 run data get entity @p Motion[0] -10
#execute as @e[type=minecraft:wind_charge] at @s store result entity @s Motion[1] double 10 run data get entity @p Motion[1] 10
#execute as @e[type=minecraft:wind_charge] at @s store result entity @s Motion[2] double 10 run data get entity @p Motion[2] -10
# -10 -10 -10 is good

# Death reset
execute as @a[scores={deathReset=1..}] run function bw:dr

# Villagers' facing directions
execute as @e[type=villager] at @s unless entity @e[type=shulker,limit=1,sort=nearest,distance=..5] run rotate @s facing entity @p
execute as @e[type=villager] at @s if entity @e[type=shulker,limit=1,sort=nearest,distance=..5] run rotate @s facing entity @n[type=shulker]
execute as @e[type=wandering_trader] at @s run rotate @s facing entity @p

# Set gamemode when someone rejoins
execute as @a[tag=!joined] run scoreboard players set @s leave 1
tag @a[tag=!joined] add joined

execute if score gameOn game matches 0 as @a[scores={leave=1..}] run execute at @e[type=armor_stand,tag=Lobby,limit=1] run tp @s ~ ~ ~ 180 0
execute as @a[scores={leave=1..},team=] run gamemode adventure @s
execute as @a[scores={leave=1..},team=] run team join white
scoreboard players set @a[scores={leave=1..}] leave 0

# Safe mode, set gamemode in lobby
execute if score gameOn game matches 0 as @a[x=-120,y=-64,z=-120,dx=240,dy=64,dz=240] if score safeMode config matches 1 run gamemode adventure @s[team=!]

# Ships map poisonous water
execute if score map game matches 1 if score gameOn game matches 1 as @a[x=-120,y=0,z=-120,dx=240,dy=320,dz=240,team=!white] at @s[team=!] if block ~ ~ ~ water if block ~ ~-1 ~ water run damage @s 3 drown
execute if score map game matches 1 if score gameOn game matches 1 as @a[x=-120,y=0,z=-120,dx=240,dy=320,dz=240,team=!white] at @s[team=!] if block ~ ~ ~ water if block ~ ~1 ~ water run damage @s 3 drown

# Parkour master
execute as @e[tag=Parkour] at @s run scoreboard players set @a[distance=..2,scores={parkourMessage=0}] parkourMessage 1
execute as @e[tag=Parkour] at @s run scoreboard players set @a[distance=2..] parkourMessage 0
execute as @a[scores={parkourMessage=1}] run tellraw @s {text:"Well done! You found me. Continue by jumping on the animals.",color:"gold"}
execute as @a[scores={parkourMessage=1}] at @s run playsound minecraft:entity.villager.yes ambient @s ~ ~ ~
execute as @a[scores={parkourMessage=1}] run scoreboard players set @s parkourMessage 2

# Cyanide
execute as @a[scores={cyanide=1..}] run damage @s 2000 cramming