
attribute @s max_health modifier remove bw:hp0
attribute @s max_health modifier remove bw:hp1
attribute @s max_health modifier remove bw:hp2

attribute @s max_health modifier add bw:hp0 -19 add_value
execute if score @s hpboost matches 1.. run attribute @s max_health modifier add bw:hp1 1 add_value
execute if score @s hpboost matches 2.. run attribute @s max_health modifier add bw:hp2 1 add_value