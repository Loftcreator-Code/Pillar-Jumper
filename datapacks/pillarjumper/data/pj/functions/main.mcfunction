# EFFECTS
effect give @a minecraft:regeneration 3 255 true
effect give @a minecraft:saturation 3 255 true
effect give @a[scores={ball.own=1}] glowing 1 1 true
execute if score isRunning game.data matches 1 if score event.trigger game.config matches 0 run bossbar set events visible true
execute unless score isRunning game.data matches 1 if score event.trigger game.config matches 0 run bossbar set events visible false

# FUNCTIONS
function pj:game-engine/start-game
function pj:game-engine/config
function pj:sidebar
function pj:music/counter

execute if score music.trigger game.config matches 0 unless score reset music matches 1 run scoreboard players set ticks music -90
execute if score music.trigger game.config matches 0 unless score reset music matches 1 run scoreboard players set reset music 1
execute if score music.trigger game.config matches 1 run scoreboard players reset reset music
execute if score music.trigger game.config matches 1 run scoreboard players set ticks music -91
execute if score isRunning game.data matches 1 if score event.trigger game.config matches 0 run function pj:game-engine/events
execute if score isRunning game.data matches 1 if score powerups.trigger game.config matches 0 run function pj:powerups/main
execute if score isRunning game.data matches 1 run function pj:ball/main
execute if score isRunning game.data matches 1 run function pj:game-engine/end-game

# STORE PLAYER DATA
execute as @a at @s store result score @s player.posY run data get entity @s Pos[1]

# SET-GOAL
scoreboard players enable @a[tag=admin] set-goal
execute as @a[scores={set-goal=1..}] run scoreboard players operation Goal game.info = @s set-goal
execute as @a[scores={set-goal=1..}] run tellraw @s [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "The Goal is now set to ","color": "gray"},{"score":{"name":"Goal","objective":"game.info"},"color": "gold"},{"text": ".","color": "gray"}]
execute as @a[scores={set-goal=1..}] at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 1
execute as @a[scores={set-goal=1..}] run scoreboard players reset @s set-goal

# SET TEAM
team join none @a[team=!blue,team=!red,team=!default]
team join powerup @e[nbt={Item:{tag:{pjItem:["yes"]}}},team=!blue,team=!default,team=!none,team=!powerup,team=!red,team=!write.blue]

# RANDOM NUMBER GENERATOR
kill @e[nbt={Item:{tag:{RNG:1b}}}]

#NO STUCK
execute as @a at @s unless block ~ ~1 ~ air run scoreboard players add @s game.nostuck 1
execute as @a[scores={game.nostuck=80..}] at @s unless block ~ ~1 ~ air run tp @s ~ ~3 ~
execute as @a[scores={game.nostuck=1..}] at @s if block ~ ~1 ~ air run scoreboard players reset @s game.nostuck

#Join Game
execute as @a[tag=!playing] if score @s game.join matches 1.. run tp @s -281 69 140
execute as @a[tag=!playing] if score @s game.join matches 1.. run gamemode adventure @s
execute as @a if score isRunning game.data matches 1 if score @s game.join matches 1.. run scoreboard players set @s ball.own 0
execute as @a if score @s game.join matches 1.. run scoreboard players set @s game.join 0

execute as @a unless score @s game.join matches 0.. run tp @s -281 69 140
execute as @a unless score @s game.join matches 0.. run gamemode adventure @s
execute as @a unless score @s game.join matches 0.. run scoreboard players set @s game.join 0


#Start-Player

execute unless score isRunning game.data matches 1 as @a run scoreboard players add start-info game.data 1

scoreboard players reset players game.data
execute unless score isRunning game.data matches 1 as @a run scoreboard players add players game.data 1

execute if score start-info game.data matches 600.. unless score isRunning game.data matches 1 if score players game.data matches 1 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Die Anzahl der Spieler beträgt ","color": "gray","bold": false},{"text": "1/2","color": "gold"},{"text": ". Es wird noch 1 Spieler benötigt.","color": "gray","bold": false}]
execute if score start-info game.data matches 600.. run scoreboard players reset start-info game.data

execute if score startani game.data matches 1.. if score isRunning game.data matches 1 run scoreboard players reset startani game.data


execute if score players game.data matches 2.. unless score isRunning game.data matches 1 run scoreboard players add startani game.data 1
execute unless score players game.data matches 2.. unless score isRunning game.data matches 1 run scoreboard players reset startani game.data



execute if score startani game.data matches 20 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "30","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 20 as @a at @s run playsound block.note_block.hat player @s ~ ~ ~ 1 1

execute if score startani game.data matches 220 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "20","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 220 as @a at @s run playsound block.note_block.hat player @s ~ ~ ~ 1 1

execute if score startani game.data matches 320 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "15","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 320 as @a at @s run playsound block.note_block.hat player @s ~ ~ ~ 1 1

execute if score startani game.data matches 420 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "10","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 420 as @a at @s run playsound block.note_block.hat player @s ~ ~ ~ 1 1

execute if score startani game.data matches 520 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "5","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 520 as @a at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 0
execute if score startani game.data matches 540 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "4","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 540 as @a at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 0
execute if score startani game.data matches 560 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "3","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 560 as @a at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 1
execute if score startani game.data matches 580 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "2","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 580 as @a at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 1
execute if score startani game.data matches 600 run tellraw @a [{"text": "[","color": "dark_gray","bold": false},{"text": "Pillar ","color": "red","bold": true}, {"text": "Jumper","color": "aqua","bold": true},{"text": "] ","color": "dark_gray","bold": false},{"text": "-> ","color": "gold","bold": false},{"text": "Das Spiel startet in ","color": "gray","bold": false},{"text": "1","color": "gold","bold": true},{"text": " Sekunden.","color": "gray","bold": false}]
execute if score startani game.data matches 600 as @a at @s run playsound block.note_block.pling player @s ~ ~ ~ 1 2

execute if score startani game.data matches 610 run title @a times 0 10 0
execute if score startani game.data matches 610..621 as @a at @s run playsound block.note_block.hat player @s ~ ~ ~ 1 1
execute if score startani game.data matches 610 run title @a title {"text": "P","color": "gold","bold": true}
execute if score startani game.data matches 611 run title @a title {"text": "Pi","color": "gold","bold": true}
execute if score startani game.data matches 612 run title @a title {"text": "Pil","color": "gold","bold": true}
execute if score startani game.data matches 613 run title @a title {"text": "Pill","color": "gold","bold": true}
execute if score startani game.data matches 614 run title @a title {"text": "Pilla","color": "gold","bold": true}
execute if score startani game.data matches 615 run title @a title {"text": "Pillar","color": "gold","bold": true}
execute if score startani game.data matches 616 run title @a title {"text": "Pillar J","color": "gold","bold": true}
execute if score startani game.data matches 617 run title @a title {"text": "Pillar Ju","color": "gold","bold": true}
execute if score startani game.data matches 618 run title @a title {"text": "Pillar Jum","color": "gold","bold": true}
execute if score startani game.data matches 619 run title @a title {"text": "Pillar Jump","color": "gold","bold": true}
execute if score startani game.data matches 620 run title @a title {"text": "Pillar Jumpe","color": "gold","bold": true}
execute if score startani game.data matches 621 run title @a title {"text": "Pillar Jumper","color": "gold","bold": true}
execute if score startani game.data matches 630..655 as @a at @s run playsound block.note_block.hat player @s ~ ~ ~ 1 1
execute if score startani game.data matches 630 run title @a title [{"text": "P","color": "gold","bold": true},{"text": "illar Jumper","color": "gold","bold": true}]
execute if score startani game.data matches 631 run title @a title [{"text": "P","color": "gold","bold": true},{"text": "i","color": "white","bold": true},{"text": "llar Jumper","color": "gold","bold": true}]
execute if score startani game.data matches 632 run title @a title [{"text": "Pi","color": "gold","bold": true},{"text": "l","color": "white","bold": true},{"text": "lar Jumper","color": "gold","bold": true}]
execute if score startani game.data matches 633 run title @a title [{"text": "Pil","color": "gold","bold": true},{"text": "l","color": "white","bold": true},{"text": "ar Jumper","color": "gold","bold": true}]
execute if score startani game.data matches 634 run title @a title [{"text": "Pill","color": "gold","bold": true},{"text": "a","color": "white","bold": true},{"text": "r Jumper","color": "gold","bold": true}]
execute if score startani game.data matches 635 run title @a title [{"text": "Pilla","color": "gold","bold": true},{"text": "r","color": "white","bold": true},{"text": " Jumper","color": "gold","bold": true}]
execute if score startani game.data matches 636 run title @a title [{"text": "Pillar","color": "gold","bold": true},{"text": " ","color": "white","bold": true},{"text": "Jumper","color": "gold","bold": true}]
execute if score startani game.data matches 637 run title @a title [{"text": "Pillar ","color": "gold","bold": true},{"text": "J","color": "white","bold": true},{"text": "umper","color": "gold","bold": true}]
execute if score startani game.data matches 638 run title @a title [{"text": "Pillar J","color": "gold","bold": true},{"text": "u","color": "white","bold": true},{"text": "mper","color": "gold","bold": true}]
execute if score startani game.data matches 639 run title @a title [{"text": "Pillar Ju","color": "gold","bold": true},{"text": "m","color": "white","bold": true},{"text": "per","color": "gold","bold": true}]
execute if score startani game.data matches 640 run title @a title [{"text": "Pillar Jum","color": "gold","bold": true},{"text": "p","color": "white","bold": true},{"text": "er","color": "gold","bold": true}]
execute if score startani game.data matches 641 run title @a title [{"text": "Pillar Jump","color": "gold","bold": true},{"text": "e","color": "white","bold": true},{"text": "r","color": "gold","bold": true}]
execute if score startani game.data matches 642 run title @a title [{"text": "Pillar Jumpe","color": "gold","bold": true},{"text": "r","color": "white","bold": true}]
execute if score startani game.data matches 644 run title @a title {"text": "Pillar Jumper","color": "gold","bold": true}
execute if score startani game.data matches 645 run title @a title {"text": "Pillar Jumpe","color": "gold","bold": true}
execute if score startani game.data matches 646 run title @a title {"text": "Pillar Jump","color": "gold","bold": true}
execute if score startani game.data matches 647 run title @a title {"text": "Pillar Jum","color": "gold","bold": true}
execute if score startani game.data matches 648 run title @a title {"text": "Pillar Ju","color": "gold","bold": true}
execute if score startani game.data matches 649 run title @a title {"text": "Pillar J","color": "gold","bold": true}
execute if score startani game.data matches 650 run title @a title {"text": "Pillar","color": "gold","bold": true}
execute if score startani game.data matches 651 run title @a title {"text": "Pilla","color": "gold","bold": true}
execute if score startani game.data matches 652 run title @a title {"text": "Pill","color": "gold","bold": true}
execute if score startani game.data matches 653 run title @a title {"text": "Pil","color": "gold","bold": true}
execute if score startani game.data matches 654 run title @a title {"text": "Pi","color": "gold","bold": true}
execute if score startani game.data matches 655 run title @a title {"text": "P","color": "gold","bold": true}
execute if score startani game.data matches 656 run title @a reset
execute if score startani game.data matches 660 as @a[sort=random,limit=16] run tag @s add start-player
execute if score startani game.data matches 660 as @a[tag=start-player] run scoreboard players reset @a ball.own
execute if score startani game.data matches 660 as @a[tag=start-player] run effect give @s slow_falling 2 1 true
execute if score startani game.data matches 660 as @a[tag=start-player] run effect give @s blindness 2 1 true
execute if score startani game.data matches 660 as @a[tag=start-player] run gamemode adventure @s
execute if score startani game.data matches 660 as @a[tag=start-player] run tag @s add playing
execute if score startani game.data matches 660 as @a[tag=start-player] at @s run playsound ui.toast.challenge_complete player @s ~ ~ ~ 1 1
execute if score startani game.data matches 660 run bossbar set events name  {"text":"- Next Event -","color": "red"}
execute if score startani game.data matches 660 run bossbar set events color red
execute if score startani game.data matches 660 run bossbar set events max 1200
execute if score startani game.data matches 660 as @a[tag=start-player] run title @s title [{"text": "GAME STARTS","color": "green","bold": true}]
execute if score startani game.data matches 660 as @a[tag=start-player] run title @s subtitle [{"text": "Good Luck!","color": "light_purple","bold": true}]
execute if score startani game.data matches 660 as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace light_blue_carpet
execute if score startani game.data matches 660 as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace lime_carpet
execute if score startani game.data matches 660 as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace white_carpet
execute if score startani game.data matches 660 as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace purple_carpet
execute if score startani game.data matches 660 run function pj:game-engine/reset-map
execute if score startani game.data matches 660 run function pj:game-engine/summon-marker
execute if score startani game.data matches 660 run scoreboard objectives remove game.event
execute if score startani game.data matches 660 run scoreboard objectives add game.event dummy
execute if score startani game.data matches 660 if score teams.trigger game.config matches 1 as @a[team=!none] run tp @s -234 74 142
execute if score startani game.data matches 660 if score teams.trigger game.config matches 0 as @a[tag=start-player] run tp @s -234 74 142
execute if score startani game.data matches 660 if score day.trigger game.config matches 0 run function pj:time-modes/day
execute if score startani game.data matches 660 if score day.trigger game.config matches 1 run function pj:time-modes/night
execute if score startani game.data matches 660 run scoreboard players set isRunning game.data 1
execute if score startani game.data matches 660 run tag @a[tag=start-player] remove start-player
execute if score startani game.data matches 660 run scoreboard players reset startani game.data
