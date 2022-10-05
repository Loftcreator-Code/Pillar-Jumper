# HEADER
function pj:animation

# PLACEHOLDER
scoreboard players set =========== game.info -9

# SONG DISPLAY
scoreboard players set Song: game.info -10

execute if score song music matches 1 run scoreboard players set Coconut-Mall game.info -11
execute unless score song music matches 1 run scoreboard players reset Coconut-Mall game.info

execute if score song music matches 2 run scoreboard players set Megalovania game.info -11
execute unless score song music matches 2 run scoreboard players reset Megalovania game.info

execute if score song music matches 3 run scoreboard players set NGGYU game.info -11
execute unless score song music matches 3 run scoreboard players reset NGGYU game.info