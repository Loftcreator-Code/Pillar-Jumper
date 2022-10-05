function pj:remove-scores

# SCOREBOARDS
scoreboard objectives add powerups.spawn dummy
scoreboard objectives add powerups.dataSpidernest dummy
scoreboard objectives add powerups.effectpad dummy
scoreboard objectives add powerups.jumpPad custom:jump
scoreboard objectives add powerups.bat.hit custom:damage_dealt

scoreboard objectives add game.join custom:leave_game
scoreboard objectives add game.nostuck dummy
scoreboard objectives add game.data dummy
scoreboard objectives add game.info dummy {"text": "PillarJumper","color":"gold"}
scoreboard objectives add game.info.count dummy
scoreboard objectives add game.config dummy
scoreboard objectives add game.event dummy
scoreboard objectives add game.savegoal dummy

scoreboard objectives add start trigger
scoreboard objectives add stop trigger
scoreboard objectives add set-goal trigger

scoreboard objectives add player.posY dummy
scoreboard objectives add player.fallpartic dummy

scoreboard objectives add event.imposter minecraft.custom:minecraft.damage_taken

scoreboard objectives add ball.hit minecraft.custom:minecraft.damage_dealt
scoreboard objectives add ball.hitted minecraft.custom:minecraft.damage_taken
scoreboard objectives add ball.own dummy

scoreboard objectives add music dummy


# TEAMS
team add powerup {"text": "Powerup"}
team modify powerup color aqua

team add red {"text": "RED","color":"red"}
team modify red collisionRule never
team modify red friendlyFire false
team modify red color red
team join red Red

team add blue {"text": "BLUE","color":"blue"}
team modify blue collisionRule never
team modify blue friendlyFire false
team modify blue color blue
team join blue Blue

team add default {"text": "DEFAULT","color":"gray"}
team modify default collisionRule never
team modify default color gray

team add none {"text": "NONE","color":"yellow"}
team modify none collisionRule never
team modify none color yellow

team add write.green
team modify write.green color green
team join write.green Goal

team add write.gold
team modify write.gold color gold
team join write.gold Song:

team add write.gray
team modify write.gray color gray
team join write.gray ===========
team join write.gray Coconut-Mall
team join write.gray Megalovania
team join write.gray NGGYU

# BOSSBARS
bossbar add events {"text":"- Next Event -","color": "red"}
bossbar set events color red
bossbar set events max 1200
bossbar set events visible true

# SET DEFAULTS
scoreboard players set Goal game.info 30
scoreboard players add isRunning game.data 0

execute unless score teams.trigger game.config matches 1 run scoreboard players set teams.trigger game.config 0
execute unless score endless.trigger game.config matches 1 run scoreboard players set endless.trigger game.config 0
execute unless score powerups.trigger game.config matches 1 run scoreboard players set powerups.trigger game.config 0
execute unless score event.trigger game.config matches 1 run scoreboard players set event.trigger game.config 0
execute unless score music.trigger game.config matches 1 run scoreboard players set music.trigger game.config 0
execute unless score day.trigger game.config matches 1 run scoreboard players set day.trigger game.config 0


# GAMERULES
gamerule fallDamage false
gamerule sendCommandFeedback false

# CONFIG SIGNS
setblock -287 70 151 crimson_wall_sign[facing=east,waterlogged=false]{Color:"black",GlowingText:0b,Text1:'{"text":"Free for all","clickEvent":{"action":"run_command","value":"scoreboard players add teams.trigger game.config 1"}}',Text4:'{"text":"Teams"}'}
setblock -287 70 149 crimson_wall_sign[facing=east,waterlogged=false]{Color:"black",GlowingText:0b,Text1:'{"text":"Endless","clickEvent":{"action":"run_command","value":"scoreboard players add endless.trigger game.config 1"}}',Text4:'{"text":"Custom Goal"}'}
setblock -287 70 147 crimson_wall_sign[facing=east,waterlogged=false]{Color:"black",GlowingText:0b,Text1:'{"text":"Events","clickEvent":{"action":"run_command","value":"scoreboard players add event.trigger game.config 1"}}',Text4:'{"text":"No Events"}'}
setblock -287 70 144 crimson_wall_sign[facing=east,waterlogged=false]{Color:"black",GlowingText:0b,Text1:'{"text":"Music","clickEvent":{"action":"run_command","value":"scoreboard players add music.trigger game.config 1"}}',Text4:'{"text":"No Music"}'}
setblock -287 70 142 crimson_wall_sign[facing=east,waterlogged=false]{Color:"black",GlowingText:0b,Text1:'{"text":"Powerups","clickEvent":{"action":"run_command","value":"scoreboard players add powerups.trigger game.config 1"}}',Text4:'{"text":"No Powerups"}'}
setblock -287 70 140 crimson_wall_sign[facing=east,waterlogged=false]{Color:"black",GlowingText:0b,Text1:'{"text":"Day","clickEvent":{"action":"run_command","value":"scoreboard players add day.trigger game.config 1"}}',Text4:'{"text":"Night"}'}

setblock -287 71 146 crimson_wall_sign[facing=east,waterlogged=false]{Color:"black",GlowingText:0b,Text2:'{"text":"Settings","color": "gold","bold": true}',Text3:'{"text":"|","color": "gold","bold": true}',Text4:'{"text":"V","color": "gold","bold": true}'}
setblock -287 71 145 crimson_wall_sign[facing=east,waterlogged=false]{Color:"black",GlowingText:0b,Text2:'{"text":"Sounds/Music:","color": "gold","bold": true}',Text3:'{"text":"Players","color": "yellow","bold": false}'}

# ON ENABLE
clear @a
kill @e[type=item]
scoreboard objectives setdisplay sidebar game.info
scoreboard players reset @a ball.own

# SUCCESS MESSAGE
tellraw @a [{"text": "<Piller Jumper> ", "color": "yellow"},{"text": "Game-Assets Loaded", "color": "white"}]