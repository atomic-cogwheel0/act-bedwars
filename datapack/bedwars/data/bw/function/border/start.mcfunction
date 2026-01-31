execute at @a run playsound entity.ender_dragon.ambient ambient @a ~ ~ ~
scoreboard players set borderStarted game 1
execute as @a[team=!] run give @s[team=!white] crossbow[unbreakable={}]
execute as @a[team=!] run give @s[team=!white] trial_key

bossbar set bw:border_bar name "Beds break soon..."
bossbar set bw:border_bar color yellow
execute store result score border bossbarCalc run worldborder get
execute store result bossbar bw:border_bar max run scoreboard players operation border bossbarCalc -= bedBreak game

function bw:border/advance