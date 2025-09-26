scoreboard players set gameOn game 0
scoreboard objectives setdisplay sidebar wins
tellraw @a {text:"Game session forcefully terminated... :(",color:"red",bold:true}
