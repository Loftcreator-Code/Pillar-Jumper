# COUNTER
execute as @a[scores={ball.own=1}] run scoreboard players add @s game.info.count 1
execute as @a[scores={ball.own=0,game.info.count=1..}] run scoreboard players reset @s game.info.count

# INFO/ADD
execute if score teams.trigger game.config matches 0 as @a[scores={game.info.count=80..}] run scoreboard players add @s game.info 1
execute if score teams.trigger game.config matches 1 as @a[scores={game.info.count=80..},team=red] run scoreboard players add Red game.info 1
execute if score teams.trigger game.config matches 1 as @a[scores={game.info.count=80..},team=blue] run scoreboard players add Blue game.info 1

execute as @a[scores={game.info.count=80..}] run scoreboard players reset @s game.info.count

# END
execute as @a if score endless.trigger game.config matches 0 if score @s game.info = Goal game.info run tag @s add game.win
execute as @a[tag=game.win] run scoreboard players operation goal game.savegoal = Goal game.info
execute as @a[tag=game.win] run kill @e[type=armor_stand,tag=ball.dropped]
execute as @a[tag=game.win] if score teams.trigger game.config matches 0 run tp @a -281 69 140
execute as @a[tag=game.win] if score teams.trigger game.config matches 1 run tp @a[team=!none] -281 69 140
execute as @a[tag=game.win] run title @a title {"selector":"@s","color":"gold"}
execute as @a[tag=game.win] run title @a subtitle {"text": "won the game!","color": "light_purple"}
execute as @a[tag=game.win] at @s run playsound entity.firework_rocket.launch player @a ~ ~ ~ 1 1
execute as @a[tag=game.win] at @s run playsound entity.firework_rocket.large_blast player @a ~ ~ ~ 1 1
execute as @a[tag=game.win] run scoreboard players reset * game.info
execute as @a[tag=game.win] run scoreboard players operation Goal game.info = goal game.savegoal
execute as @a[tag=game.win] run scoreboard players reset goal game.savegoal
execute as @a[tag=game.win] run scoreboard players set isRunning game.data 0
execute as @a[tag=game.win] run clear @a
execute as @a[tag=game.win] run kill @e[type=item]
execute as @a[tag=game.win] run tag @s remove game.win
execute as @a[tag=game.win] run team leave @a
execute as @a[tag=game.win] run tag @s remove playing
execute as @a[tag=game.win] run scoreboard players reset @a ball.own

# END-RED
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run kill @e[type=armor_stand,tag=ball.dropped]
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info if score teams.trigger game.config matches 0 run tp @a -281 69 140
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info if score teams.trigger game.config matches 1 run tp @a[team=!none] -281 69 140
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run title @a title {"text": "RED","color":"red"}
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run title @a subtitle {"text": "team won the game!","color": "light_purple"}
execute at @a if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run playsound entity.firework_rocket.launch player @a ~ ~ ~ 1 1
execute at @a if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run playsound entity.firework_rocket.large_blast player @a ~ ~ ~ 1 1
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run clear @a
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run kill @e[type=item]
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run team leave @a
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run scoreboard players set isRunning game.data 0
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run tag @a add team.win
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run scoreboard players reset @a ball.own
execute if score endless.trigger game.config matches 0 if score Red game.info = Goal game.info run scoreboard players reset * game.info
execute if entity @a[tag=team.win] run scoreboard players set Goal game.info 30
execute if entity @a[tag=team.win] run tag @a remove team.win

# END-BLUE
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run kill @e[type=armor_stand,tag=ball.dropped]
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info if score teams.trigger game.config matches 0 run tp @a -281 69 140
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info if score teams.trigger game.config matches 1 run tp @a[team=!none] -281 69 140
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run title @a title {"text": "BLUE","color":"blue"}
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run title @a subtitle {"text": "team won the game!","color": "light_purple"}
execute at @a if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run playsound entity.firework_rocket.launch player @a ~ ~ ~ 1 1
execute at @a if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run playsound entity.firework_rocket.large_blast player @a ~ ~ ~ 1 1
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run clear @a
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run kill @e[type=item]
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run team leave @a
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run scoreboard players set isRunning game.data 0
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run tag @a add team.win
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run scoreboard players reset @a ball.own
execute if score endless.trigger game.config matches 0 if score Blue game.info = Goal game.info run scoreboard players reset * game.info
execute if entity @a[tag=team.win] run scoreboard players set Goal game.info 30
execute if entity @a[tag=team.win] run tag @a remove team.win

# ENDLESS
execute as @a if score endless.trigger game.config matches 1 unless score Goal game.info matches 0 run scoreboard players set Goal game.info 0