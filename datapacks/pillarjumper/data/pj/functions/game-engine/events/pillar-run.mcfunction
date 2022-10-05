execute if score count game.event matches 1201 run title @a times 0 5 0
execute if score count game.event matches 1201 run title @a subtitle [{"text":"RUN!!!","color": "gray"}]
execute if score count game.event matches 1201 run title @a title [{"text":"P","color": "aqua","bold": true}]
execute if score count game.event matches 1202 run title @a title [{"text":"P","color": "blue","bold": false},{"text":"i","color": "aqua","bold": true}]
execute if score count game.event matches 1203 run title @a title [{"text":"Pi","color": "blue","bold": false},{"text":"l","color": "aqua","bold": true}]
execute if score count game.event matches 1204 run title @a title [{"text":"Pil","color": "blue","bold": false},{"text":"l","color": "aqua","bold": true}]
execute if score count game.event matches 1205 run title @a title [{"text":"Pill","color": "blue","bold": false},{"text":"a","color": "aqua","bold": true}]
execute if score count game.event matches 1206 run title @a title [{"text":"Pilla","color": "blue","bold": false},{"text":"r","color": "aqua","bold": true}]
execute if score count game.event matches 1207 run title @a title [{"text":"Pillar","color": "blue","bold": false},{"text":" ","color": "aqua","bold": true}]
execute if score count game.event matches 1208 run title @a title [{"text":"Pillar ","color": "blue","bold": false},{"text":"R","color": "aqua","bold": true}]
execute if score count game.event matches 1209 run title @a title [{"text":"Pillar R","color": "blue","bold": false},{"text":"u","color": "aqua","bold": true}]
execute if score count game.event matches 1210 run title @a title [{"text":"Pillar Ru","color": "blue","bold": false},{"text":"n","color": "aqua","bold": true}]
execute if score count game.event matches 1211 run title @a reset
execute if score count game.event matches 1212 run title @a title [{"text":"Pillar Run","color": "blue"}]
execute if score count game.event matches 1212 run title @a subtitle [{"text":"RUN!!!","color": "gray"}]

execute if score count game.event matches 1201 as @a at @s run playsound item.goat_horn.sound.4 player @s ~ ~ ~ 1 1
execute if score count game.event matches 1201 run bossbar set events name {"text":"Pillar Run","color": "aqua"}
execute if score count game.event matches 1201 run bossbar set events color blue

execute if score count game.event matches 1201..1800 as @a at @s run tag @e[tag=items.marker,distance=..2.5] add del.marker

execute as @e[tag=del.marker,scores={game.event=20..}] at @s if entity @e[tag=ball.dropped,distance=..2] run kill @e[tag=ball.dropped]
tag @e[tag=del.marker,scores={game.event=20..}] remove effectpad
execute as @e[tag=del.marker] run scoreboard players add @s game.event 1
execute as @e[tag=del.marker,scores={game.event=1..30}] at @s run fill ~-1 56 ~-1 ~1 ~ ~1 bedrock replace andesite
execute as @e[tag=del.marker,scores={game.event=1..30}] if score day.trigger game.config matches 1 at @s run fill ~-1 56 ~-1 ~1 ~ ~1 shroomlight replace polished_blackstone
execute as @e[tag=del.marker,scores={game.event=20..}] at @s run fill ~-1 ~ ~-1 ~1 ~ ~1 air
execute as @e[tag=del.marker,scores={game.event=25..}] at @s run fill ~-1 ~ ~-1 ~1 ~-1 ~1 air
execute as @e[tag=del.marker,scores={game.event=30..}] at @s run fill ~-1 ~ ~-1 ~1 ~-2 ~1 air
execute as @e[tag=del.marker,scores={game.event=35..}] at @s run fill ~-1 ~ ~-1 ~1 ~-3 ~1 air
execute as @e[tag=del.marker,scores={game.event=40..}] at @s run fill ~-1 56 ~-1 ~1 ~ ~1 air

execute as @e[tag=del.marker,scores={game.event=95..}] at @s run clone ~1 26 ~1 ~-1 28 ~-1 ~-1 56 ~-1
execute as @e[tag=del.marker,scores={game.event=96..}] at @s run clone ~1 26 ~1 ~-1 29 ~-1 ~-1 56 ~-1
execute as @e[tag=del.marker,scores={game.event=97..}] at @s run clone ~1 26 ~1 ~-1 30 ~-1 ~-1 56 ~-1
execute as @e[tag=del.marker,scores={game.event=98..}] at @s run clone ~1 26 ~1 ~-1 31 ~-1 ~-1 56 ~-1
execute as @e[tag=del.marker,scores={game.event=99..}] at @s run clone ~1 26 ~1 ~-1 32 ~-1 ~-1 56 ~-1
execute as @e[tag=del.marker,scores={game.event=100..}] at @s run clone ~1 26 ~1 ~-1 33 ~-1 ~-1 56 ~-1

execute as @e[tag=del.marker,scores={game.event=95..102}] if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 blackstone replace andesite
execute as @e[tag=del.marker,scores={game.event=95..102}] if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 polished_blackstone replace cobblestone
execute as @e[tag=del.marker,scores={game.event=95..102}] if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 crying_obsidian replace stone
execute as @e[tag=del.marker,scores={game.event=95..102}] if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 blackstone_slab replace andesite_slab
execute as @e[tag=del.marker,scores={game.event=95..102}] if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 polished_blackstone_brick_slab replace cobblestone_slab
execute as @e[tag=del.marker,scores={game.event=95..102}] if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 polished_blackstone_slab replace stone_slab

execute as @e[tag=del.marker,scores={game.event=102..}] at @s run tag @s remove del.marker
execute as @e[scores={game.event=102..}] at @s run scoreboard players reset @s game.event