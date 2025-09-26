# villagerType 1: normal air villagers
# villagerType 2: underground villagers
# villagerType 3: ships villagers


execute as @e[tag=basic_trader] run data merge entity @s {Offers:{Recipes:[]}}

execute as @e[tag=RedSpawn] at @s run data modify entity @n[tag=basic_trader] Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:4}, sell:{id:"red_wool", count:16}}
execute as @e[tag=BlueSpawn] at @s run data modify entity @n[tag=basic_trader] Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:4}, sell:{id:"blue_wool", count:16}}
execute as @e[tag=YellowSpawn] at @s run data modify entity @n[tag=basic_trader] Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:4}, sell:{id:"yellow_wool", count:16}}
execute as @e[tag=GreenSpawn] at @s run data modify entity @n[tag=basic_trader] Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:4}, sell:{id:"green_wool", count:16}}

execute as @e[tag=basic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:24}, sell:{id:"end_stone", count:8}}

execute as @e[tag=basic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:16}, sell:{id:"stone_axe", count:1, components:{attribute_modifiers:[{slot:"mainhand", type:"attack_damage", amount:5, operation:"add_value", id:"bw:set_axe_damage"}]}}}

execute if score villagerType game matches 1 as @e[tag=basic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:16}, sell:{id:"stone_pickaxe", count:1}}
execute if score villagerType game matches 2 as @e[tag=basic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:16}, sell:{id:"stone_pickaxe", components:{enchantments:{"efficiency":2}}, count:1}}
execute if score villagerType game matches 3 as @e[tag=basic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:16}, buyB:{id:"diamond", count:2}, sell:{id:"trident", count:1, components:{enchantments:{"loyalty":1}, damage:208}}}

execute as @e[tag=basic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:8}, sell:{id:"arrow", count:2}}

execute as @e[tag=basic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:6}, sell:{id:"firework_rocket", count:3, components:{tooltip_display:{hidden_components:["fireworks","firework_explosion"]}, fireworks:{flight_duration:5, explosions:[{shape:"large_ball", has_trail:true, colors:[4368896,11158016,11141186], fade_colors:[43586,17066]}]}, custom_name:{text:"Long Range Firework Rocket",italic:false}, lore:[{text:"You can shoot fireworks from crossbows",italic:true}]}}}

execute as @e[tag=basic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"turtle_scute", count:1}, sell:{id:"emerald", count:1}}



execute as @e[tag=upgraded_trader] run data merge entity @s {Offers:{Recipes:[]}}

execute as @e[tag=upgraded_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:2}, sell:{id:"egg", count:1, components:{custom_data:{bridge:1b}, custom_name:{text:"Bridge Egg",italic:false}}}}

execute as @e[tag=upgraded_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:16}, sell:{id:"diamond", count:1}}

execute as @e[tag=upgraded_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:8}, sell:{id:"cooked_porkchop", count:1}}

execute as @e[tag=upgraded_trader] run data modify entity @s Offers.Recipes append value {maxUses:1, buy:{id:"iron_ingot", count:24}, sell:{id:"sugar", count:1, components:{custom_name:{text:"Iron Upgrade Key",italic:false,color:"gray"}, lore:[{text:"When bought:",italic:true},{text:"+1 iron every 3 seconds",italic:true}]}}}

execute as @e[tag=upgraded_trader] run data modify entity @s Offers.Recipes append value {maxUses:1, buy:{id:"iron_ingot", count:48}, buyB:{id:"diamond", count:8}, sell:{id:"ink_sac", count:1, components:{custom_name:{text:"Diamond Upgrade Key",italic:false,color:"aqua"}, lore:[{text:"When bought:",italic:true},{text:"+1 iron every 3 seconds",italic:true},{text:"+1 diamond every 20 seconds",italic:true}]}}}

execute as @e[tag=upgraded_trader] run data modify entity @s Offers.Recipes append value {maxUses:1, buy:{id:"diamond", count:24}, sell:{id:"glow_ink_sac", count:1, components:{custom_name:{text:"Emerald Upgrade Key",italic:false,color:"green"}, lore:[{text:"When bought:",italic:true},{text:"+1 diamond every 20 seconds",italic:true},{text:"+1 emerald every 40 seconds",italic:true}]}}}

execute as @e[tag=upgraded_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:4}, sell:{id:"obsidian", count:4}}



execute as @e[tag=fletcher] run data merge entity @s {Offers:{Recipes:[]}}

execute as @e[tag=fletcher] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:8}, buyB:{id:"arrow", count:2}, sell:{id:"tipped_arrow", count:2, components:{tooltip_display:{hidden_components:["potion_contents","potion_duration_scale"]}, potion_contents:{potion:"fire_resistance"}, custom_name:{text:"Arrow of §7Vexing",italic:false}}}}

execute as @e[tag=fletcher] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:48}, buyB:{id:"arrow", count:20}, sell:{id:"tipped_arrow", count:1, components:{tooltip_display:{hidden_components:["potion_contents","potion_duration_scale"]}, potion_contents:{potion:weakness}, custom_name:{text:"Arrow of §4§kCHAOS",italic:false}, lore:[{text:"§4§oHandle with care!",italic:true}]}}}

execute as @e[tag=fletcher] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:4}, buyB:{id:"arrow", count:2}, sell:{id:"tipped_arrow", count:2, components:{tooltip_display:{hidden_components:["potion_contents","potion_duration_scale"]}, potion_contents:{potion:healing}, custom_name:{text:"Arrow of the §cEternal Flame",italic:false}}}}

execute as @e[tag=fletcher] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:5}, buyB:{id:"arrow", count:1}, sell:{id:"tipped_arrow", count:1, components:{tooltip_display:{hidden_components:["potion_contents","potion_duration_scale"]}, potion_contents:{potion:weaving}, custom_name:{text:"Obsidian Arrow of §l§8Unending Imprisonment§r, Forged at the Dawn of Time by §4§kO§r§4§oPtho-Ulkhûr, the Deathless§r§4§kO",italic:false}}}}

execute as @e[tag=fletcher] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:3}, sell:{id:"firework_rocket", count:3, components:{tooltip_display:{hidden_components:["fireworks","firework_explosion"]}, fireworks:{flight_duration:0, explosions:[{shape:"large_ball", has_trail:true, colors:[11743532,15435844], fade_colors:[11250603,14602026]}]}, custom_name:{text:"Short Range Firework Rocket",italic:false}, lore:[{text:"You can shoot fireworks from crossbows",italic:true}]}}}

execute as @e[tag=fletcher] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:4}, sell:{id:"wind_charge", count:1}}



execute as @e[tag=weaponsmith] run data merge entity @s {Offers:{Recipes:[]}}

execute as @e[tag=weaponsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:4}, sell:{id:"iron_sword", count:1}}

execute as @e[tag=weaponsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:12}, sell:{id:"diamond_sword", count:1, components:{enchantments:{"sharpness":1,"knockback":1}}}}

execute as @e[tag=weaponsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:16}, sell:{id:"diamond_axe", count:1, components:{custom_name:{text:"Sharp Axe",italic:false}, enchantments:{"sharpness":3}}}}

execute as @e[tag=weaponsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:2}, sell:{id:"splash_potion", count:1, components:{potion_contents:{potion:harming}}}}

execute as @e[tag=weaponsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:4}, sell:{id:"potion", count:1, components:{potion_contents:{potion:invisibility}}}}

execute as @e[tag=weaponsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:16}, buyB:{id:"diamond", count:10}, sell:{id:"snowball", count:1, components:{custom_data:{fireball:1b}, custom_name:{text:"Fireball",bold:true,italic:false,color:"red"}}}}



execute as @e[tag=armorer] run data merge entity @s {Offers:{Recipes:[]}}

execute as @e[tag=armorer] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:4}, sell:{id:"iron_chestplate", count:1}}

execute as @e[tag=armorer] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:4}, sell:{id:"iron_leggings", count:1}}

execute as @e[tag=armorer] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:3}, sell:{id:"potion", count:1, components:{tooltip_display:{hidden_components:["potion_contents","potion_duration_scale"]}, potion_contents:{custom_color:11141290, custom_effects:[{id:"minecraft:infested", duration:3000}]}, custom_name:{text:"Potion of §5§lBig",italic:false}, lore:[{text:"Bizánci Leviatán",italic:true}]}}}

execute as @e[tag=armorer] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:3}, sell:{id:"potion", count:1, components:{tooltip_display:{hidden_components:["potion_contents","potion_duration_scale"]}, potion_contents:{custom_color:16755200, custom_effects:[{id:"minecraft:luck", duration:3000}]}, custom_name:{text:"Potion of §6§oSmall",italic:false}, lore:[{text:"Kisegér",italic:true}]}}}

execute as @e[tag=armorer] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:8}, buyB:{id:"emerald", count:6}, sell:{id:"shield", count:1, components:{enchantments:{"unbreaking":1}}}}



execute as @e[tag=toolsmith] run data merge entity @s {Offers:{Recipes:[]}}

execute as @e[tag=toolsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:4}, sell:{id:"iron_pickaxe", count:1}}

execute as @e[tag=toolsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"diamond", count:4}, sell:{id:"iron_axe", count:1}}

execute as @e[tag=toolsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:8}, sell:{id:"diamond_pickaxe", count:1}}

execute as @e[tag=toolsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"emerald", count:16}, sell:{id:"diamond_axe", count:1, components:{custom_name:{text:"Efficient Axe",italic:false}, enchantments:{"efficiency":2}}}}

execute as @e[tag=toolsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:4}, buyB:{id:"diamond", count:4}, sell:{id:"shears", count:1}}

execute as @e[tag=toolsmith] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"iron_ingot", count:16}, sell:{id:"cyan_dye", count:1, components:{custom_name:{text:"Socrates' Hemlock Drink",italic:false,color:"aqua"}, food:{can_always_eat:true, nutrition:0, saturation:0}, consumable:{animation:"drink"}, lore:["Ancient item. Deadly. Beware!"]}}}



execute as @e[tag=exotic_trader] run data merge entity @s {Offers:{Recipes:[]}}

execute unless score villagerType game matches 3 as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:1}, sell:{id:"ender_pearl", count:1}}
execute if score villagerType game matches 3 as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:8}, buyB:{id:"emerald", count:8}, sell:{id:"diamond_boots", count:1, components:{enchantments:{"frost_walker":1}, custom_name:{text:"Exotic Shoes",italic:false}}}}

execute unless score villagerType game matches 2 as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:4}, sell:{id:"infested_deepslate", count:8}}
execute if score villagerType game matches 2 as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:4}, sell:{id:"silverfish_spawn_egg", count:5}}

execute as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:4}, buyB:{id:"arrow", count:1}, sell:{id:"tipped_arrow", count:1, components:{tooltip_display:{hidden_components:["potion_contents","potion_duration_scale"]}, potion_contents:{potion:harming}, custom_name:{text:"TNT Arrow",italic:false,bold:true,color:"red"}}}}

execute as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:3}, sell:{id:"pink_dye", count:1, components:{custom_name:{text:"§dHP Boost",italic:false}, custom_data:{hpboost:1b}}}}

execute as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:2}, sell:{id:"splash_potion", count:1, components:{tooltip_display:{hidden_components:["potion_contents","potion_duration_scale"]}, potion_contents:{custom_color:8663322, custom_effects:[{id:"minecraft:unluck", duration:300}]}, custom_name:{text:"Potion of Banishing",italic:false}, lore:[{text:"Makes the respawn timer longer",italic:true}]}}}

execute as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:16}, buyB:{id:"emerald", count:24}, sell:{id:"crossbow", count:1, components:{max_damage:151, enchantments:{"multishot":1}, custom_name:{text:"Exotic Crossbow",italic:false}}}}

execute as @e[tag=exotic_trader] run data modify entity @s Offers.Recipes append value {maxUses:1600000, buy:{id:"gold_ingot", count:6}, sell:{id:"nether_star", count:1, components:{custom_name:{text:"Bed Alarm",italic:false}}}}





