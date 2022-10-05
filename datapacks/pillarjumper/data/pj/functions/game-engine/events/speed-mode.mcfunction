execute if score count game.event matches 1201 run title @a times 0 5 0
execute if score count game.event matches 1201 run title @a title [{"text":"S","color": "white","bold": true}]
execute if score count game.event matches 1201 run title @a subtitle [{"text":"you are very fast","color": "gray"}]
execute if score count game.event matches 1202 run title @a title [{"text":"S","color": "light_purple","bold": false},{"text":"p","color": "white","bold": true}]
execute if score count game.event matches 1203 run title @a title [{"text":"Sp","color": "light_purple","bold": false},{"text":"e","color": "white","bold": true}]
execute if score count game.event matches 1204 run title @a title [{"text":"Spe","color": "light_purple","bold": false},{"text":"e","color": "white","bold": true}]
execute if score count game.event matches 1205 run title @a title [{"text":"Spee","color": "light_purple","bold": false},{"text":"d","color": "white","bold": true}]
execute if score count game.event matches 1206 run title @a title [{"text":"Speed","color": "light_purple","bold": false},{"text":" ","color": "white","bold": true}]
execute if score count game.event matches 1207 run title @a title [{"text":"Speed ","color": "light_purple","bold": false},{"text":"M","color": "white","bold": true}]
execute if score count game.event matches 1208 run title @a title [{"text":"Speed M","color": "light_purple","bold": false},{"text":"o","color": "white","bold": true}]
execute if score count game.event matches 1209 run title @a title [{"text":"Speed Mo","color": "light_purple","bold": false},{"text":"d","color": "white","bold": true}]
execute if score count game.event matches 1210 run title @a title [{"text":"Speed Mod","color": "light_purple","bold": false},{"text":"e","color": "white","bold": true}]
execute if score count game.event matches 1211 run title @a reset
execute if score count game.event matches 1212 run title @a title [{"text":"Speed Mode","color": "light_purple"}]
execute if score count game.event matches 1212 run title @a subtitle [{"text":"you are very fast","color": "gray"}]

execute if score count game.event matches 1201 as @a at @s run playsound item.goat_horn.sound.2 player @s ~ ~ ~ 1 1
execute if score count game.event matches 1201 run bossbar set events name {"text":"Speed Mode","color": "light_purple"}
execute if score count game.event matches 1201 run bossbar set events color pink

execute if score count game.event matches 1201..1800 as @a run effect give @s speed 1 5 true
execute if score count game.event matches 1201..1800 as @a at @s run particle dust 2 0 1 1 ~ ~0.5 ~ 0 0 0 0 1 normal
execute if score count game.event matches 1201..1800 as @a at @s run particle dust 2 0 1 1 ~ ~1 ~ 0 0 0 0 1 normal
execute if score count game.event matches 1201..1800 as @a at @s run particle dust 2 0 1 1 ~ ~1.5 ~ 0 0 0 0 1 normal