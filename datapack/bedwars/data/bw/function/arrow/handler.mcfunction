## midair effects

# summon one arrow each tick while in flight (chaos arrow)
execute at @s[predicate=!bw:arrow/in_block,predicate=bw:arrow/weakness] summon arrow run data modify entity @s item.components."minecraft:potion_contents".potion set value "harming"

# only arrows on ground will be handled from now on
execute unless entity @s[predicate=bw:arrow/in_block] run return fail

## on ground effects

execute as @s[predicate=bw:arrow/weakness] run return run kill @s

execute at @s[predicate=bw:arrow/harming] run summon tnt ~ ~ ~ {fuse:0}
execute as @s[predicate=bw:arrow/harming] run return run kill @s

execute at @s[predicate=bw:arrow/healing] run setblock ~ ~ ~ fire keep
execute as @s[predicate=bw:arrow/healing] run return run kill @s

execute at @s[predicate=bw:arrow/fire_resistance] run summon vex
execute as @s[predicate=bw:arrow/fire_resistance] run return run kill @s

# lovely bunch of arrows
execute as @s[predicate=bw:arrow/invisibility] at @s run function bw:arrow/bunchaarrows
execute as @s[predicate=bw:arrow/invisibility,scores={idk=5..}] run return run kill @s

execute as @s[predicate=bw:arrow/weaving] at @s run function bw:arrow/prison
execute as @s[predicate=bw:arrow/weaving] run return run kill @s
