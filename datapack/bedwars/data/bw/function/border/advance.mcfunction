scoreboard players set border game 0

execute store result storage bw:border_macro this.borderAdvanceSize int 1 run scoreboard players get borderAdvanceSize config
execute store result storage bw:border_macro this.borderAdvanceDuration int 1 run scoreboard players get borderAdvanceDuration config
function bw:border/shrink_macro with storage bw:border_macro this

kill @e[type=chest_minecart,predicate=bw:in_bedwars]
#execute at @e[type=armor_stand,tag=Drop] run kill @e[type=item,distance=..3]
execute at @e[type=armor_stand,tag=Drop,predicate=bw:in_bedwars] run summon chest_minecart ~ ~50 ~ {LootTable:"bw:airdrop"}
effect give @e[type=chest_minecart,predicate=bw:in_bedwars] slow_falling infinite 0 true
execute at @e[type=armor_stand,tag=EmeraldS,predicate=bw:in_bedwars,limit=1,sort=random] run summon skeleton ~ ~ ~ {equipment:{mainhand:{id:"iron_sword",count:1b},head:{id:"iron_helmet",count:1}},PersistenceRequired:1b}
