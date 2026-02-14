# act-bedwars
Minecraft datapack + resource pack providing instant access to a variety of bedwars maps and gameplay

NO mods or plugins required!

Newest version: 1.21.11 ONLY! (earlier versions for 1.21.8)

# Setup
Create a **new singleplayer world**, with **commands/cheats enabled**, add the datapack from the world creation screen (More > Data Packs > Open Pack Folder, move the ZIP file there, and move the new option to the right panel), then finally create the world.

It's important to use the resource pack, as it will provide some custom textures and translation strings (in en-US only).

The game will then create an empty world with a prebuilt lobby. From there you're ready to play, get a few people to join. Join into teams, select the map you wish to play on using the signs, then press the start sign. To switch between underground maps like Mines or Tunnels and open air maps, use the Map Type selector signs.

Recommended maps to try the datapack on are `Ships` and `Crypt`.

# Versions
**Important:** most unique versions of the datapack are incompatible and the game will not run correctly when upgrading an existing world that has another version installed (not without hassle)! Just start a different world (and copy the `wins` scoreboard over).

# Gameplay
**8 unique Bedwars maps**: hand-crafted and tested, with unique underground and open-air maps. Play on the maps Tree, Village, Crypt, Graveyard, Moon Base, Ships, Tunnels & Mines!

**Villager-based trading system:** provides a very Vanilla-like experience, with different traders dispersed among the islands. Look around for special & valuable trades. Every team has access to their own basic trades.

**Upgrades:** You can purchase upgrades for the resource spawner found on your island at the Upgraded Trader on the diamond island.

**Cracked Emeralds:** Spawners spawn cracked emeralds. These can be converted on the bed islands, at the Basic Traders.

**Looting players:** Currencies (iron, diamond, emerald) are transferred to the killer on a kill (or lost on a death). All other items are preserved.

**Double jumps:** Wind Charges can be used either as projectiles or as fuel for double jumps midair (configurable).

**Persistent items:** The game can be configured to never despawn items.

**Border:** The world border starts to advance inwards (by default at 15 minutes into the gameplay). All beds will be broken when the border reaches them, the exact time varies wildly between maps (about 40-55 minutes of elapsed time by default). By default the border moves 5 blocks every 6 minutes.

**Loot boxes:** There are 3 Vaults on the emerald island (Resources, Armor and Combat, indicated by items). Players get one key when the border starts to shrink and another when their bed is broken. A key can open any one of the 3 Vaults.

**Exotic Loot:** Every time the border advances, a loot minecart is spawned in the center. You can get gold from it, which can be used for unique trades at the Exotic Trader somewhere on the emerald island.

**Emerald Island Protectors:** Skeletons & Wither Skeletons spawn on the emerald island (when the game starts and when the border advances) to make everyone's life a bit more exciting.

**Enchanting:** Every player starts out with 32 Lapis Lazuli to work with, there's an enchantment table with a few bookshelves on every diamond island.

**Potions of Big & Small**, **Bed Alarms**, **Bridge Eggs**, **Arrows of TNT, Fire, Vexing and Imprisonment**, **Silverfish**, **Fireworks & Crossbows**, **HP Boosts**, **Fireballs**, **Happy Ghasts** etc...

# Maps
**Tree:** Map around a massive central tree, light atmosphere. _The airdrop spawns on the treetop!_
**Village:** Play in vanilla structures!
**Moon Base:** Futuristic satellites, space bases & space station with some space debris thrown in!
**Crypt:** Play in a medieval setting, in abandoned churches and a little castle area!
**Graveyard:** Unique atmosphere created by the quiet ambience of fireflies and a shattered island layout.
**Ships:** Classic bedwars map with a twist: you play over water, not floating in air. Tridents also available here!
**Mines:** An underground map. No bridging here, you have to tunnel your way towards the center. Don't get lost in the maze of the mineshaft!
**Tunnels:** A mix of underground and midair maps.

# Hardcore
You can switch to hardcore in the lobby using the Configure... sign, or by using the lever accessible through the door on the right from the map selection room.
The game is the same, except for that players only start with 1 maximum HP (at most 3 HP with HP Boost items).

# Customization
Customization is done via the Configure... sign in the lobby. Take your time to read through the many options!

_Alternatively, you can directly edit the `config` scoreboard if you wish.
You can use the commands `/scoreboard players set borderStartTime config <seconds>`, `/scoreboard players set borderAdvanceDelay config <seconds>`, `/scoreboard players set borderMinSize config <blocks>`, to set the in-game time the border starts shrinking, the delay between shrinkages and the minimum border size.
See `/scoreboard objectives setdisplay sidebar config` for extra configurable parameters, like persistent items, double jumping, respawn delays etc._

# Server setup
It's easiest to add a save file created in singleplayer to a dedicated server; however you can add the datapack to an already generated server world.
The datapack should setup and the lobby should be added automatically after a server restart. If this does not happen, run `/execute in bw:lobby run function bw:init/init`. 

# Creating new worlds
Run the command `/function bw:map_creation/eggs` to get the spawn eggs for the armor stand based map system.

Run the command `/function bw:map_creation/villagers` to get spawn eggs for the traders. They'll lack trades by default, that's normal.

When creating a new world, you have to build: 4 colored player islands, diamond & emerald islands. Remember to place one of every armor stand from `bw:map_creation/eggs` and one of every villager profession. Make sure the Bed Marker Armor Stands are at the foot of the bed.

Add a sign to `map_creation/signs.mcfunction` which will select your map (with a new map ID number in the command ran by the sign), then place the sign in the lobby.

Add a new `load_map/***.mcfunction` which will load your structures in your desired positions, using any `load.mcfunction` as a template. The bedBreak value is the border radius which breaks every bed.

You have to modify: `start_game.mcfunction` to run your `load_map/***.mcfunction` when the selected map matches your ID.

Also add a new line to `map_update.mcfunction` to set a display name for your map.

Then you're ready to go.

You have to modify: `start_game.mcfunction` to run your `load***.mcfunction` when the selected map matches your ID.

Also add a new line to `map_update.mcfunction` to set a display name for your map.

Then you're ready to go.
