execute as @s[team=red] run scoreboard players operation redAlarm game = @s alarmBought
execute as @s[team=yellow] run scoreboard players operation yellowAlarm game = @s alarmBought
execute as @s[team=green] run scoreboard players operation greenAlarm game = @s alarmBought
execute as @s[team=blue] run scoreboard players operation blueAlarm game = @s alarmBought

scoreboard players set @s alarmBought 0