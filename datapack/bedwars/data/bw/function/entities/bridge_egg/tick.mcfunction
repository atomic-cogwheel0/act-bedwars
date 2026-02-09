data merge entity @s[tag=!bridge_egg_named] {CustomName:"Bridge Egg",CustomNameVisible:1b}
tag @s[tag=!bridge_egg_named] add bridge_egg_named

execute on origin if entity @s[team=red] run return run summon snowball ~ ~ ~ {Tags:["bridge","redwool"],NoGravity:1b}
execute on origin if entity @s[team=blue] run return run summon snowball ~ ~ ~ {Tags:["bridge","bluewool"],NoGravity:1b}
execute on origin if entity @s[team=green] run return run summon snowball ~ ~ ~ {Tags:["bridge","greenwool"],NoGravity:1b}
execute on origin if entity @s[team=yellow] run return run summon snowball ~ ~ ~ {Tags:["bridge","yellowwool"],NoGravity:1b}
execute on origin run summon snowball ~ ~ ~ {Tags:["bridge","whitewool"],NoGravity:1b}