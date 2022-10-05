scoreboard players enable @a[tag=admin] start
scoreboard players enable @a[tag=admin] stop
scoreboard players reset @a[tag=!admin] start
scoreboard players reset @a[tag=!admin] stop
execute as @a[scores={start=1..}] run function pj:game-engine/summon-marker
execute as @a[scores={start=1..}] run kill @e[type=armor_stand,tag=ball.dropped]
execute as @a[scores={start=1..}] at @e[type=marker,tag=items.marker,sort=random,limit=1] run summon armor_stand ~ ~0.5 ~ {Tags:["ball.dropped"],Silent:1b,Marker:1b,Small:1b,NoGravity:1b,Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:yellow_terracotta",Count:1b}],CustomNameVisible:1b,CustomName:'{"text": "BALL","bold": true, "color": "gold"}'}

# TEAMS
execute if entity @a[scores={start=1..}] if score teams.trigger game.config matches 1 run function pj:game-engine/join-random-team
# START
execute as @a[scores={start=1..}] if score isRunning game.data matches 1 run tellraw @s {"text": "The game can't be started because it is already running.","color": "red"}
execute as @a[scores={start=1..}] if score isRunning game.data matches 1 at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 0
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[sort=random,limit=16] run tag @s add start-player
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] run effect give @s slow_falling 2 1 true
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] run effect give @s blindness 2 1 true
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] run gamemode adventure @s
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] run tag @s add playing
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] at @s run playsound ui.toast.challenge_complete player @s ~ ~ ~ 1 1
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] run bossbar set events name  {"text":"- Next Event -","color": "red"}
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] run bossbar set events color red
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] run bossbar set events max 1200
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] run title @s title [{"text": "GAME STARTS","color": "green","bold": true}]
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] run title @s subtitle [{"text": "Good Luck!","color": "light_purple","bold": true}]

execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace light_blue_carpet
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace lime_carpet
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace white_carpet
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace purple_carpet

execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] run function pj:game-engine/reset-map

execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] run function pj:game-engine/summon-marker
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] run scoreboard objectives remove game.event
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] run scoreboard objectives add game.event dummy
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] run scoreboard players reset @a ball.own
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] if score teams.trigger game.config matches 1 as @a[team=!none] run tp @s -234 74 142
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] if score teams.trigger game.config matches 0 as @a[tag=start-player] run tp @s -234 74 142
execute if score isRunning game.data matches 0 if entity @a[scores={start=1..}] as @a[tag=start-player] run tag @s remove start-player

# STOP
execute as @a[scores={stop=1..}] if score isRunning game.data matches 0 run tellraw @s {"text": "The game can't be stopped because it is not running.","color": "red"}
execute as @a[scores={stop=1..}] if score isRunning game.data matches 0 at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 0
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] run scoreboard players operation goal game.savegoal = Goal game.info
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] as @a run gamemode adventure @s
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] as @a run title @s title [{"text": "GAME STOPPED","color": "red","bold": true}]
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] as @a run title @s subtitle [{"text": "Thanks for playing!","color": "light_purple","bold": true}]
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] run scoreboard players reset * game.info
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] as @a if score teams.trigger game.config matches 1 run tp @a[team=!none] -281 69 140
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] as @a if score teams.trigger game.config matches 0 run tp @a -281 69 140
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] as @a at @s run playsound minecraft:block.respawn_anchor.deplete player @s ~ ~ ~ 1 1
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] run team leave @a
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] run clear @a
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] run kill @e[type=item]
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] run scoreboard players reset @a ball.own
execute if score isRunning game.data matches 1 if entity @a[scores={stop=1..}] run scoreboard players operation Goal game.info = goal game.savegoal

# TIME MODES
execute if entity @a[scores={start=1..}] if score day.trigger game.config matches 0 run function pj:time-modes/day
execute if entity @a[scores={start=1..}] if score day.trigger game.config matches 1 run function pj:time-modes/night

execute as @a[scores={stop=1..}] run scoreboard players set isRunning game.data 0
execute as @a[scores={stop=1..}] run scoreboard players reset @s stop
execute as @a[scores={start=1..}] run scoreboard players set isRunning game.data 1
execute as @a[scores={start=1..}] run scoreboard players reset @s start
