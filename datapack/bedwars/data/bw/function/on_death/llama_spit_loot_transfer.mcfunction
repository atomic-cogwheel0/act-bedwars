data modify entity @s Owner set from entity @p UUID

    #execute on origin run say OLD ORIGIN
    #execute on origin run execute on attacker run say OLD ATTACKER

execute on origin run scoreboard players set @s doneDrops 1

execute store result score @s ironToGive run execute on origin run clear @s iron_ingot
execute store result score @s diamondToGive run execute on origin run clear @s diamond
execute store result score @s emeraldToGive run execute on origin run clear @s emerald
execute store result score @s scuteToGive run execute on origin run clear @s turtle_scute

tellraw @a ["They §lhad§r ",{score:{name:"@s",objective:"ironToGive"},color:"gray"},"⓪, ",{score:{name:"@s",objective:"diamondToGive"},color:"aqua"},"① and ",{score:{name:"@s",objective:"scuteToGive"},color:"dark_green"},"+",{score:{name:"@s",objective:"emeraldToGive"},color:"green"},"②."]

# the nearest llama spit to the position of the llama spit itself => it will be correctly selected
# it's impossible that two spits get conflicting positions, as luckily one player can only summon one per tick (dies at most once per tick)

execute on origin on attacker run data modify entity @n[type=llama_spit] Owner set from entity @s UUID

    #execute on origin run say NEW ORIGIN

# won't bother anything
tp 0 1000 0

# do the transfers one tick later, mutual kills in the same tick will result in a resource swap
tag @s add canTransfer
schedule function bw:on_death/do_transfers 1t