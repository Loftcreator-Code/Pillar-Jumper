# TEAMS [FREE FOR ALL / TEAMS]
execute if score teams.trigger game.config matches 2.. run scoreboard players set teams.trigger game.config 0
execute if score teams.trigger game.config matches 0 run data merge block -287 70 151 {Text1:'{"text":"-Free for All-","color": "gold","bold": true, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add teams.trigger game.config 1"}}',Text4:'{"text":"Teams","color": "red", "bold": false}'}
execute if score teams.trigger game.config matches 1 run data merge block -287 70 151 {Text1:'{"text":"Free for All","color": "red","bold": false, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add teams.trigger game.config 1"}}',Text4:'{"text":"-Teams-","color": "gold", "bold": true}'}

# ENDLESS [CUSTOM GOAL / ENDLESS]
execute if score endless.trigger game.config matches 2.. run scoreboard players set endless.trigger game.config 0
execute if score endless.trigger game.config matches 0 run data merge block -287 70 149 {Text1:'{"text":"-Custom Goal-","color": "gold","bold": true, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add endless.trigger game.config 1"}}',Text4:'{"text":"Endless","color": "red", "bold": false}'}
execute if score endless.trigger game.config matches 1 run data merge block -287 70 149 {Text1:'{"text":"Custom Goal","color": "red","bold": false, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add endless.trigger game.config 1"}}',Text4:'{"text":"-Endless-","color": "gold", "bold": true}'}

# POWERUPS [NO POWERUPS / POWERUPS]
execute if score powerups.trigger game.config matches 2.. run scoreboard players set powerups.trigger game.config 0
execute if score powerups.trigger game.config matches 0 run data merge block -287 70 142 {Text1:'{"text":"-Powerups-","color": "gold","bold": true, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add powerups.trigger game.config 1"}}',Text4:'{"text":"No Powerups","color": "red", "bold": false}'}
execute if score powerups.trigger game.config matches 1 run data merge block -287 70 142 {Text1:'{"text":"Powerups","color": "red","bold": false, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add powerups.trigger game.config 1"}}',Text4:'{"text":"-No Powerups-","color": "gold", "bold": true}'}

# TIME [DAY / NIGHT]
execute if score day.trigger game.config matches 2.. run scoreboard players set day.trigger game.config 0
execute if score day.trigger game.config matches 0 run data merge block -287 70 140 {Text1:'{"text":"-Day-","color": "gold","bold": true, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add day.trigger game.config 1"}}',Text4:'{"text":"Night","color": "red", "bold": false}'}
execute if score day.trigger game.config matches 1 run data merge block -287 70 140 {Text1:'{"text":"Day","color": "red","bold": false, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add day.trigger game.config 1"}}',Text4:'{"text":"-Night-","color": "gold", "bold": true}'}

# EVENTS
execute if score event.trigger game.config matches 2.. run scoreboard players set event.trigger game.config 0
execute if score event.trigger game.config matches 0 run data merge block -287 70 147 {Text1:'{"text":"-Events-","color": "gold","bold": true, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add event.trigger game.config 1"}}',Text4:'{"text":"No Events","color": "red", "bold": false}'}
execute if score event.trigger game.config matches 1 run data merge block -287 70 147 {Text1:'{"text":"Events","color": "red","bold": false, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add event.trigger game.config 1"}}',Text4:'{"text":"-No Events-","color": "gold", "bold": true}'}

# TMusic
execute if score music.trigger game.config matches 2.. run scoreboard players set music.trigger game.config 0
execute if score music.trigger game.config matches 0 run data merge block -287 70 144 {Text1:'{"text":"-Music-","color": "gold","bold": true, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add music.trigger game.config 1"}}',Text2:'{"text":"IN BEARBEITUNG...","color": "green", "bold": false}',Text4:'{"text":"No Music","color": "red", "bold": false}'}
execute if score music.trigger game.config matches 1 run data merge block -287 70 144 {Text1:'{"text":"Music","color": "red","bold": false, "clickEvent":{"action":"run_command","value":"execute if entity @s[tag=admin] run scoreboard players add music.trigger game.config 1"}}',Text2:'{"text":"IN BEARBEITUNG...","color": "green", "bold": false}',Text4:'{"text":"-No Music-","color": "gold", "bold": true}'}