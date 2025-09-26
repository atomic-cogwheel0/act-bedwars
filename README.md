# act-bedwars
Minecraft datapack + resource pack providing instant access to a variety of bedwars maps and gameplay

NO mods or plugins required!

Version 1.21.8 ONLY!

# Setup
Create a new singleplayer world, add the datapack on the world creation screen, then create the world.

It's important to use the resource pack, as it will provide some custom textures and translation strings (in en-US only).

The game will then create an empty world with a prebuilt lobby. From there you're ready to play, get a few people to join. Join into teams, select the map you wish to play on using the signs, then press the start sign. To switch between underground maps like Mines or Tunnels and open air maps, use the Map Type selector signs.

Recommended maps to try the datapack on are `Ships` and `Crypt`.

# Gameplay
**Villager-based trading system:** provides a very Vanilla-like experience, with different traders dispersed on the islands. Look around for special & valuable trades.

**Upgrades:** You can purchase upgrades for the resource spawner on your island on the diamond island.

**Cracked Emeralds:** Spawners spawn cracked emeralds. These can be converted at the Basic Traders.

**Looting players:** Currencies (iron, diamond, emerald) are transferred on a kill or lost on a death. Other items are preserved.

**Border:** The world border starts to advance inwards at 15 minutes into the gameplay. The beds will be broken when the border reaches them, the exact time varies wildly between maps (about 40-55 minutes of elapsed time). By default the border moves 2 blocks every 6 minutes.

**Loot boxes:** 3 Vaults are on the emerald island (Resources, Armor and Combat), players get a key when the border starts to shrink and when their bed is broken. The key can be used to open any of the 3 Vaults freely.

**Exotic Loot:** Every time the border advances, a loot minecart is spawned in the center. You can get gold from it, which can be used for unique trades at the Exotic Trader somewhere on the emerald island.

**Emerald Island Protectors:** Skeletons & Wither Skeletons spawn on the emerald island (when the game starts and when the border advances) to make everyone's life a bit more exciting.

**Enchanting:** Every player gets 32 lapis to work with, there's an enchantment table with bookshelves on every diamond island.

**Potions of Big & Small**, **Bed Alarms**, **Bridge Eggs**, **Arrows of TNT, Fire, Vexing and Imprisonment**, **Silverfish**, **Fireworks & Crossbows**, **HP Boosts**, **Fireballs** etc...

# Customization

You can use the commands `/scoreboard players set borderStart game <seconds>`, `/scoreboard players set borderDelay game <seconds>`, `/scoreboard players set borderSize game <blocks>`, to set the in-game time the border starts shrinking, the delay between shrinkages and the initial border size.

# Hardcore
You can switch to hardcore in the lobby with a lever accessible on the right from the map selection room.
The game is the same just with 1HP (maximum of 3 with HP Boost items).

# Server setup
It's easiest to add a world created in singleplayer to a dedicated server; however you can add the datapack to an already generated server world.
Just remember to delete the region files for the spawn area. Then run `/function bw:init` to spawn the lobby.

# Creating new worlds
Run the command `/function bw:eggs` to get the spawn eggs for the armor stand based map system.

Run the command `/function bw:villagers` to get spawn eggs for the traders. They'll lack trades by default, that's normal.

When creating a new world, you have to build: 4 colored player islands, diamond & emerald islands. Remember to place one of every armor stand from `bw:eggs` and one of every villager profession. Make sure the Bed Marker Armor Stands are at the foot of the bed.

Add a sign to `signs.mcfunction` which will select your map (with a new map ID number in the command ran by the sign), then place the sign in the lobby.

Add a new `load***.mcfunction` which will load your structures in your desired positions, using any `load.mcfunction` as a template. The bedBreak value is the border radius which breaks every bed.

You have to modify: `start_game.mcfunction` to run your `load***.mcfunction` when the selected map matches your ID.

Also add a new line to `map_update.mcfunction` to set a display name for your map.

Then you're ready to go.
