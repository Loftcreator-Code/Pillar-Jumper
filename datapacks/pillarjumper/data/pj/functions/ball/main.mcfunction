# GET
execute if entity @a[scores={ball.hit=1..}] if entity @a[scores={ball.hitted=1..,ball.own=1}] run title @a actionbar [{"selector": "@a[scores={ball.hit=1..},sort=nearest,limit=1]","color": "gray"},{"text": " gathered the ball from ","color": "red"},{"selector": "@a[scores={ball.hitted=1..},sort=nearest,limit=1]","color": "gray"}]
execute as @a[scores={ball.hit=1..}] if entity @a[scores={ball.hitted=1..,ball.own=1..}] run scoreboard players set @s ball.own 1
execute as @a[scores={ball.hitted=1..}] if entity @a[scores={ball.hit=1..,ball.own=1..}] run scoreboard players set @s ball.own 0
scoreboard players reset @a[scores={ball.hit=1..}] ball.hit
scoreboard players reset @a[scores={ball.hitted=1..}] ball.hitted

# ANTI MULTI BALL OWNERS
scoreboard players set count ball.own 0
execute as @a[scores={ball.own=1..}] run scoreboard players add count ball.own 1
execute if score count ball.own matches 2.. run scoreboard players set @a ball.own 0
execute if score count ball.own matches 2.. run scoreboard players set @a[sort=random,limit=1] ball.own 1
execute as @a[scores={ball.own=1}] at @s run particle dust_color_transition 1 1 0 2 1 0 0 ~ ~ ~ 0 0 0 0 1 normal

# DISPLAY
execute as @a[scores={ball.own=1},nbt=!{Inventory: [{id: "minecraft:yellow_terracotta", Slot: -106b, Count: 1b, tag: {Ball: 1b}}]}] run clear @s yellow_terracotta{Ball: 1b}
execute as @a[scores={ball.own=1},nbt=!{Inventory: [{id: "minecraft:yellow_terracotta", Slot: -106b, Count: 1b, tag: {Ball: 1b}}]}] run item replace entity @s weapon.offhand with yellow_terracotta{Ball: 1b, display: {Name: '{"text": "BALL","color":"gold","italic": false}'}}

execute as @a[nbt={Inventory: [{id: "minecraft:yellow_terracotta", Slot: -106b, Count: 1b, tag: {Ball: 1b}}]}] unless score @s ball.own matches 1 run clear @s yellow_terracotta{Ball: 1b}


execute as @a[scores={ball.own=1},nbt=!{Inventory: [{id: "minecraft:yellow_banner", Slot: 103b, Count: 1b, tag: {Ball: 1b}}]}] run clear @s yellow_banner{Ball: 1b}
execute as @a[scores={ball.own=1},nbt=!{Inventory: [{id: "minecraft:yellow_banner", Slot: 103b, Count: 1b, tag: {Ball: 1b}}]}] run item replace entity @s armor.head with yellow_banner{Ball: 1b, display: {Name: '{"text": "BALL","color":"gold","italic": false}'}}

execute as @a[nbt={Inventory: [{id: "minecraft:yellow_banner", Slot: 103b, Count: 1b, tag: {Ball: 1b}}]}] unless score @s ball.own matches 1 run clear @s yellow_banner{Ball: 1b}

kill @e[nbt={Item: {tag: {Ball: 1b}}}]

# FALL OFF MAP
execute as @a[scores={player.posY=..58,ball.own=1..}] run scoreboard players set @s ball.own 0
execute as @a[scores={player.posY=..58}] run effect give @s slow_falling 2 1 true
execute as @a[scores={player.posY=..58}] run effect give @s blindness 1 1 true
execute as @a[scores={player.posY=..58}] run title @s actionbar [{"text": "YOU DIED","color": "red","bold": true}]
execute as @a[scores={player.posY=..58}] at @s run tag @s add playsound.death
execute as @a[scores={player.posY=..58}] run tp @s -234 74 142
execute as @a[tag=playsound.death] at @s run playsound block.anvil.land player @s ~ ~ ~ 1 1
execute as @a[tag=playsound.death] at @s run scoreboard players set @s player.fallpartic 1
execute as @a[tag=playsound.death] run tag @s remove playsound.death

execute as @a[scores={player.fallpartic=1..}] run scoreboard players add @s player.fallpartic 1
execute as @a[scores={player.fallpartic=1..40},team=red] at @s run particle dust 1 0 0 2 ~ ~ ~ 0 0 0 0 1 normal
execute as @a[scores={player.fallpartic=1..40},team=blue] at @s run particle dust 0 0 1 2 ~ ~ ~ 0 0 0 0 1 normal
execute as @a[scores={player.fallpartic=1..40},team=none] at @s run particle cloud ~ ~ ~ 0 0 0 0 1 normal
execute as @a[scores={player.fallpartic=40..}] run scoreboard players reset @s player.fallpartic

# BALL DROP
execute unless entity @e[type=armor_stand,tag=ball.dropped] if score count ball.own matches 0 run title @a title ""
execute unless entity @e[type=armor_stand,tag=ball.dropped] if score count ball.own matches 0 run title @a subtitle {"text": "Ball dropped","color": "gold"}
execute unless entity @e[type=armor_stand,tag=ball.dropped] if score count ball.own matches 0 as @a at @s run playsound block.note_block.pling player @a ~ ~ ~ 1 1
execute unless entity @e[type=armor_stand,tag=ball.dropped] if score count ball.own matches 0 at @e[type=marker,tag=items.marker,sort=random,limit=1] run summon armor_stand ~ ~0.5 ~ {Tags:["ball.dropped"],Silent:1b,Marker:1b,Small:1b,NoGravity:1b,Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:yellow_terracotta",Count:1b}],CustomNameVisible:1b,CustomName:'{"text": "BALL","bold": true, "color": "gold"}'}

# PICKUP BALL
execute as @e[tag=ball.dropped] at @s if entity @a[distance=..2] as @a[distance=..2,sort=nearest,limit=1] run scoreboard players reset @a ball.own
execute as @e[tag=ball.dropped] at @s if entity @a[distance=..2] as @a[distance=..2,sort=nearest,limit=1] run title @a actionbar [{"selector": "@s","color": "gray"},{"text": " picked up the ball","color": "gold"}]
execute as @e[tag=ball.dropped] at @s if entity @a[distance=..2] as @a at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 2
execute as @e[tag=ball.dropped] at @s if entity @a[distance=..2] as @a[distance=..2,sort=nearest,limit=1] run scoreboard players set @s ball.own 1
execute as @e[tag=ball.dropped] at @s if entity @a[distance=..2] run kill @s

execute as @a unless score @s ball.own matches -100000000.. run scoreboard players add @s ball.own 0