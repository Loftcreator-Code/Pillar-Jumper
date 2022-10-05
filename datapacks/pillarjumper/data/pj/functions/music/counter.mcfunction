# GENERAL
execute if score ticks music matches -80.. run scoreboard players add ticks music 1
execute if score ticks music matches -80.. if score ticks music matches 2.. run scoreboard players add timer music 1
execute if score ticks music matches -80.. if score ticks music matches 2.. run scoreboard players set ticks music 0

# ANTI NO SONG
scoreboard players add song music 0
execute if score song music matches 0 run scoreboard players set ticks music -90

#execute if score song music matches 1 run scoreboard players set ticks music -90

# RESHUFFLE
execute if score ticks music matches -90 store result score song music run loot spawn 0 0 0 loot pj:choose_song
execute if score ticks music matches -90 run scoreboard players set timer music 0
execute if score ticks music matches -90 run scoreboard players set ticks music -80

# PLAY SONG
execute if score song music matches 1 if score ticks music matches 1 as @a at @s run function pj:music/coconut-mall
execute if score song music matches 1 if score ticks music matches -40 as @a run title @s actionbar [{"text": "Next playing: ","color": "green"},{"text": "Coconut Mall","color": "gray"}]

execute if score song music matches 2 if score ticks music matches 1 as @a at @s run function pj:music/megalovania
execute if score song music matches 2 if score ticks music matches -40 as @a run title @s actionbar [{"text": "Next playing: ","color": "green"},{"text": "Megalovania","color": "gray"}]

execute if score song music matches 3 if score ticks music matches 1 as @a at @s run function pj:music/never-gonna-give-you-up
execute if score song music matches 3 if score ticks music matches -40 as @a run title @s actionbar [{"text": "Next playing: ","color": "green"},{"text": "Never Gonna Give You Up","color": "gray"}]

