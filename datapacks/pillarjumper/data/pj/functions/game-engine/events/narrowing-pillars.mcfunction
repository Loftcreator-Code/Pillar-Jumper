execute if score count game.event matches 1201 run title @a times 0 5 0
execute if score count game.event matches 1201 run title @a title [{"text":"N","color": "white","bold": true}]
execute if score count game.event matches 1201 run title @a subtitle [{"text":"creates a smaller playground","color": "gray"}]
execute if score count game.event matches 1202 run title @a title [{"text":"N","color": "light_purple","bold": false},{"text":"a","color": "white","bold": true}]
execute if score count game.event matches 1203 run title @a title [{"text":"Na","color": "light_purple","bold": false},{"text":"r","color": "white","bold": true}]
execute if score count game.event matches 1204 run title @a title [{"text":"Nar","color": "light_purple","bold": false},{"text":"r","color": "white","bold": true}]
execute if score count game.event matches 1205 run title @a title [{"text":"Narr","color": "light_purple","bold": false},{"text":"o","color": "white","bold": true}]
execute if score count game.event matches 1206 run title @a title [{"text":"Narro","color": "light_purple","bold": false},{"text":"w","color": "white","bold": true}]
execute if score count game.event matches 1207 run title @a title [{"text":"Narrow","color": "light_purple","bold": false},{"text":"i","color": "white","bold": true}]
execute if score count game.event matches 1208 run title @a title [{"text":"Narrowi","color": "light_purple","bold": false},{"text":"n","color": "white","bold": true}]
execute if score count game.event matches 1209 run title @a title [{"text":"Narrowin","color": "light_purple","bold": false},{"text":"g","color": "white","bold": true}]
execute if score count game.event matches 1210 run title @a title [{"text":"Narrowing","color": "light_purple","bold": false},{"text":" ","color": "white","bold": true}]
execute if score count game.event matches 1211 run title @a title [{"text":"Narrowing ","color": "light_purple","bold": false},{"text":"P","color": "white","bold": true}]
execute if score count game.event matches 1212 run title @a title [{"text":"Narrowing P","color": "light_purple","bold": false},{"text":"i","color": "white","bold": true}]
execute if score count game.event matches 1213 run title @a title [{"text":"Narrowing Pi","color": "light_purple","bold": false},{"text":"l","color": "white","bold": true}]
execute if score count game.event matches 1214 run title @a title [{"text":"Narrowing Pil","color": "light_purple","bold": false},{"text":"l","color": "white","bold": true}]
execute if score count game.event matches 1215 run title @a title [{"text":"Narrowing Pill","color": "light_purple","bold": false},{"text":"a","color": "white","bold": true}]
execute if score count game.event matches 1216 run title @a title [{"text":"Narrowing Pilla","color": "light_purple","bold": false},{"text":"r","color": "white","bold": true}]
execute if score count game.event matches 1217 run title @a title [{"text":"Narrowing Pillar","color": "light_purple","bold": false},{"text":"s","color": "white","bold": true}]
execute if score count game.event matches 1217 run title @a reset
execute if score count game.event matches 1218 run title @a title [{"text":"Narrowing Pillars","color": "light_purple"}]
execute if score count game.event matches 1218 run title @a subtitle [{"text":"creates a smaller playground","color": "gray"}]
execute if score count game.event matches 1201 as @a at @s run playsound item.goat_horn.sound.0 player @s ~ ~ ~ 1 1
execute if score count game.event matches 1201 run bossbar set events name {"text":"Narrowing Pillars","color": "light_purple"}
execute if score count game.event matches 1201 run bossbar set events color pink
execute if score count game.event matches 1220 positioned -231.0 63 145.0 as @e[tag=items.marker,distance=30..] at @s run fill ~-1 56 ~-1 ~1 ~ ~1 air
execute if score count game.event matches 1230 positioned -231.0 63 145.0 as @e[tag=items.marker,distance=25..] at @s run fill ~-1 56 ~-1 ~1 ~ ~1 air
execute if score count game.event matches 1240 positioned -231.0 63 145.0 as @e[tag=items.marker,distance=20..] at @s run fill ~-1 56 ~-1 ~1 ~ ~1 air
execute if score count game.event matches 1250 positioned -231.0 63 145.0 as @e[tag=items.marker,distance=15..] at @s run fill ~-1 56 ~-1 ~1 ~ ~1 air
execute if score count game.event matches 1250 positioned -231.0 63 145.0 as @e[tag=items.marker,distance=15..] at @s run kill @s
execute if score count game.event matches 1250 run kill @e[type=item]
execute if score count game.event matches 1250 positioned -231.0 63 145.0 if entity @e[tag=ball.dropped,distance=15..] run kill @e[tag=ball.dropped]