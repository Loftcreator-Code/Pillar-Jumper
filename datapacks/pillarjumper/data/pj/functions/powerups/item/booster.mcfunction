# SUMMON THE ITEM [ 2 / BOOSTER]
summon item ~ ~ ~ {Glowing:1b,CustomName:'{"text": "Booster", "color": "aqua", "italic": false}',CustomNameVisible:1b,PickupDelay:0,Tags:["notCollected"],Item:{id:"minecraft:firework_rocket",Count:1b,tag:{pjItem:["yes","booster"],display:{Name:'[{"text": "Booster ", "color": "aqua", "italic": false},{"text": "[", "color": "dark_gray"},{"keybind": "key.drop", "color": "dark_gray", "bold": true},{"text": "]", "color": "dark_gray"}]',Lore:['{"text":"boosts a player into the air","color": "gray","italic": true}']}}}}
execute as @e[tag=notCollected,distance=..1] run team join powerup