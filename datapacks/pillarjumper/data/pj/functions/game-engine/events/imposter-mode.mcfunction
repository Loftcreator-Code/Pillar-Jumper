execute if score count game.event matches 1201 run title @a times 0 5 0
execute if score count game.event matches 1201 run title @a title [{"text":"I","color": "gold","bold": true}]
execute if score count game.event matches 1201 run title @a subtitle [{"text":"instant kill","color": "gray"}]
execute if score count game.event matches 1202 run title @a title [{"text":"I","color": "red","bold": false},{"text":"m","color": "gold","bold": true}]
execute if score count game.event matches 1203 run title @a title [{"text":"Im","color": "red","bold": false},{"text":"p","color": "gold","bold": true}]
execute if score count game.event matches 1204 run title @a title [{"text":"Imp","color": "red","bold": false},{"text":"o","color": "gold","bold": true}]
execute if score count game.event matches 1205 run title @a title [{"text":"Impo","color": "red","bold": false},{"text":"s","color": "gold","bold": true}]
execute if score count game.event matches 1206 run title @a title [{"text":"Impos","color": "red","bold": false},{"text":"t","color": "gold","bold": true}]
execute if score count game.event matches 1207 run title @a title [{"text":"Impost","color": "red","bold": false},{"text":"e","color": "gold","bold": true}]
execute if score count game.event matches 1208 run title @a title [{"text":"Imposte","color": "red","bold": false},{"text":"r","color": "gold","bold": true}]
execute if score count game.event matches 1209 run title @a title [{"text":"Imposter","color": "red","bold": false},{"text":" ","color": "gold","bold": true}]
execute if score count game.event matches 1210 run title @a title [{"text":"Imposter ","color": "red","bold": false},{"text":"M","color": "gold","bold": true}]
execute if score count game.event matches 1211 run title @a title [{"text":"Imposter M","color": "red","bold": false},{"text":"o","color": "gold","bold": true}]
execute if score count game.event matches 1212 run title @a title [{"text":"Imposter Mo","color": "red","bold": false},{"text":"d","color": "gold","bold": true}]
execute if score count game.event matches 1213 run title @a title [{"text":"Imposter Mod","color": "red","bold": false},{"text":"e","color": "gold","bold": true}]
execute if score count game.event matches 1214 run title @a reset
execute if score count game.event matches 1214 run title @a title [{"text":"Imposter Mode","color": "red"}]
execute if score count game.event matches 1214 run title @a subtitle [{"text":"instant kill","color": "gray"}]

execute if score count game.event matches 1201 as @a at @s run playsound item.goat_horn.sound.3 player @s ~ ~ ~ 1 1
execute if score count game.event matches 1201 run bossbar set events name {"text":"Imposter Mode","color": "red"}
execute if score count game.event matches 1201 run bossbar set events color red
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. run scoreboard players set @s ball.own 0
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. run effect give @s slow_falling 2 1 true
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. run effect give @s blindness 1 1 true
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. run title @s actionbar [{"text": "YOU DIED","color": "red","bold": true}]
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. at @s run tag @s add playsound.death
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. run tp @s -234 74 142
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. at @s run playsound block.anvil.land player @s ~ ~ ~ 1 1
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. at @s run scoreboard players set @s player.fallpartic 1
execute if score count game.event matches 1201..1800 as @a if score @s event.imposter matches 1.. run tag @s remove playsound.death
scoreboard players reset @a event.imposter