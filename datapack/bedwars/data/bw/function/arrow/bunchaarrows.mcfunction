summon minecraft:arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},Motion:[.1414d,.8d,.1414d]}
summon minecraft:arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},Motion:[.1414d,.8d,-.1414d]}
summon minecraft:arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},Motion:[-.1414d,.8d,.1414d]}
summon minecraft:arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},Motion:[-.1414d,.8d,-.1414d]}
summon minecraft:arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},Motion:[-.2d,.8d,0d]}
summon minecraft:arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},Motion:[.2d,.8d,0d]}
summon minecraft:arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},Motion:[0d,.8d,.2d]}
summon minecraft:arrow ~ ~ ~ {item:{id:"minecraft:arrow",components:{"minecraft:potion_contents":{potion:"minecraft:harming"}}},Motion:[0d,.8d,-.2d]}
scoreboard players add @s idk 1
execute as @s positioned ~ ~ ~ if score @s idk matches ..5 run schedule function bw:arrow/bunchaarrows 1s