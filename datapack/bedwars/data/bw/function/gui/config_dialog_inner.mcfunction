$dialog show @s { \
  "type": "minecraft:multi_action", \
  "title": "Bedwars Game Configuration", \
  "external_title": "Configure...", \
  "body": [ \
    { \
      "type": "minecraft:plain_message", \
      "contents": {"text": "For operators only!", "bold": true} \
    }, \
    { \
      "type": "minecraft:item", \
      "item": { \
        "id": "minecraft:knowledge_book" \
      }, \
      "description": "Only server operators are able to reset and save the configuration.", \
      "show_decorations": false, \
      "show_tooltip": false \
    } \
  ], \
  "inputs": [ \
    { \
      "type": "minecraft:boolean", \
      "key": "hardcoreLever", \
      "label": { \
        "text": "Hardcore Mode" \
      }, \
      "initial": $(hardcoreLever) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "borderStartTime", \
      "label": "Time until Border Starts", \
      "label_format": "%s: %s seconds", \
      "start": 0, \
      "end": 3600, \
      "step": 60, \
      "initial": $(borderStartTime) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "borderAdvanceDelay", \
      "label": "Time between Borders", \
      "label_format": "%s: %s seconds", \
      "start": 20, \
      "end": 600, \
      "step": 20, \
      "initial": $(borderAdvanceDelay) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "borderAdvanceDuration", \
      "label": "Border Shrinking Duration", \
      "label_format": "%s: %s seconds", \
      "start": 0, \
      "end": $(borderAdvanceDelay), \
      "step": 5, \
      "initial": $(borderAdvanceDuration) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "borderAdvanceSize", \
      "label": "Border Shrinking Size", \
      "label_format": "%s: %s blocks", \
      "start": 2, \
      "end": 26, \
      "step": 2, \
      "initial": $(borderAdvanceSize) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "borderMinSize", \
      "label": "Minimal Border Width", \
      "label_format": "%s: %s blocks", \
      "start": 40, \
      "end": 120, \
      "step": 5, \
      "initial": $(borderMinSize) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "respawnDelayNormal", \
      "label": "Normal Respawn Delay", \
      "label_format": "%s: %s seconds", \
      "start": 0, \
      "end": 30, \
      "step": 1, \
      "initial": $(respawnDelayNormal) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "respawnDelayBanished", \
      "label": "Banished Respawn Delay", \
      "label_format": "%s: %s seconds", \
      "start": 0, \
      "end": 60, \
      "step": 1, \
      "initial": $(respawnDelayBanished) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "ironDelay", \
      "label": "Iron Spawning Delay", \
      "label_format": "%s: %s seconds", \
      "start": 1, \
      "end": 20, \
      "step": 1, \
      "initial": $(ironDelay) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "firstDiamond", \
      "label": "Time until First Diamond", \
      "label_format": "%s: %s seconds", \
      "start": 0, \
      "end": 240, \
      "step": 10, \
      "initial": $(firstDiamond) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "diamondDelay", \
      "label": "Diamond Spawning Delay", \
      "label_format": "%s: %s seconds", \
      "start": 5, \
      "end": 125, \
      "step": 5, \
      "initial": $(diamondDelay) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "firstEmerald", \
      "label": "Time until First Emerald", \
      "label_format": "%s: %s seconds", \
      "start": 0, \
      "end": 240, \
      "step": 10, \
      "initial": $(firstEmerald) \
    }, \
    { \
      "type": "minecraft:number_range", \
      "key": "emeraldDelay", \
      "label": "Emerald Spawning Delay", \
      "label_format": "%s: %s seconds", \
      "start": 5, \
      "end": 125, \
      "step": 5, \
      "initial": $(emeraldDelay) \
    }, \
    { \
      "type": "minecraft:boolean", \
      "key": "doubleJumpEnabled", \
      "label": { \
        "text": "Enable Double Jumping" \
      }, \
      "initial": $(doubleJumpEnabled) \
    }, \
    { \
      "type": "minecraft:boolean", \
      "key": "persistentItems", \
      "label": { \
        "text": "Persistent Items" \
      }, \
      "initial": $(persistentItems) \
    }, \
    { \
      "type": "minecraft:boolean", \
      "key": "enableBossbar", \
      "label": { \
        "text": "Enable Time Tracking Bar" \
      }, \
      "initial": $(enableBossbar) \
    } \
  ], \
  "can_close_with_escape": true, \
  "pause": false, \
  "after_action": "close", \
  "exit_action": { \
    "label": "Exit without Saving Changes" \
  }, \
  "actions": [ \
    { \
      "label": {"text": "Reset Configuration", "color": "red"}, \
      "action": { \
        "type": "minecraft:run_command", \
        "command": "function bw:gui/helper/reset_config" \
      } \
    }, \
    { \
      "label": "Save Configuration", \
      "action": { \
        "type": "minecraft:dynamic/run_command", \
        "template": "function bw:gui/helper/save_config  {borderStartTime: \u0024(borderStartTime), \
                                                          borderAdvanceDelay: \u0024(borderAdvanceDelay), \
                                                          borderAdvanceDuration: \u0024(borderAdvanceDuration), \
                                                          borderAdvanceSize: \u0024(borderAdvanceSize), \
                                                          borderMinSize: \u0024(borderMinSize), \
                                                          respawnDelayNormal: \u0024(respawnDelayNormal), \
                                                          respawnDelayBanished: \u0024(respawnDelayBanished), \
                                                          ironDelay: \u0024(ironDelay), \
                                                          diamondDelay: \u0024(diamondDelay), \
                                                          emeraldDelay: \u0024(emeraldDelay), \
                                                          firstDiamond: \u0024(firstDiamond), \
                                                          firstEmerald: \u0024(firstEmerald), \
                                                          doubleJumpEnabled: \u0024(doubleJumpEnabled), \
                                                          persistentItems: \u0024(persistentItems), \
                                                          enableBossbar: \u0024(enableBossbar), \
                                                          hardcoreLever: \u0024(hardcoreLever)}" \
      } \
    } \
  ] \
}