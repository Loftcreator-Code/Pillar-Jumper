# SUMMON THE ITEM [1 / INVERTOR SHARD]
summon item ~ ~ ~ {Glowing:1b,CustomName:'{"text": "Invertor Shard", "color": "aqua", "italic": false}',CustomNameVisible:1b,PickupDelay:0,Tags:["notCollected"],Item:{id:"minecraft:prismarine_shard",Count:1b,tag:{pjItem:["yes","invertorShard"],display:{Name:'[{"text": "Invertor Shard ", "color": "aqua", "italic": false},{"text": "[", "color": "dark_gray"},{"keybind": "key.drop", "color": "dark_gray", "bold": true},{"text": "]", "color": "dark_gray"}]',Lore:['{"text":"rotates a player at 90°","color": "gray","italic": true}']}}}}
execute as @e[tag=notCollected,distance=..1] run team join powerup