scoreboard players set border game 0
worldborder add -10 20

kill @e[type=chest_minecart]
#execute at @e[type=armor_stand,tag=Drop] run kill @e[type=item,distance=..3]
execute at @e[type=armor_stand,tag=Drop] run summon chest_minecart ~ ~50 ~ {LootTable:"chests/end_city_treasure"}
effect give @e[type=chest_minecart] slow_falling infinite 0 true
execute at @e[type=armor_stand,tag=EmeraldS,limit=1,sort=random] run summon skeleton ~ ~ ~ {equipment:{mainhand:{id:"iron_sword",count:1b},head:{id:"iron_helmet",count:1}},PersistenceRequired:1b}
