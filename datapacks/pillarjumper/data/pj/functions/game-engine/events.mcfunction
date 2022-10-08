execute run bossbar set events players @a

execute run scoreboard players add count game.event 1
execute if score time game.event matches 0.. run scoreboard players remove time game.event 1

execute unless score data game.event matches 1 run execute store result bossbar events value run scoreboard players get count game.event

execute if score count game.event matches 1200 run kill @e[type=item]
execute if score count game.event matches 1200 run scoreboard players set data game.event 1
execute if score count game.event matches 1200 run scoreboard players set time game.event 600
execute if score count game.event matches 1200 run bossbar set events max 600
execute unless score id game.event matches 1.. if score count game.event matches 1200 store result score id game.event run loot spawn 0 0 0 loot pj:choose_event

execute if score data game.event matches 1 run execute store result bossbar events value run scoreboard players get time game.event

execute if score id game.event matches 1 run function pj:game-engine/events/narrowing-pillars

execute if score id game.event matches 2 run function pj:game-engine/events/falling-pillars

execute if score id game.event matches 3 run function pj:game-engine/events/speed-mode

execute if score id game.event matches 4 run function pj:game-engine/events/imposter-mode

execute if score id game.event matches 5 run function pj:game-engine/events/pillar-run


execute if score count game.event matches 1800 as @e[tag=items.marker] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 air
execute if score count game.event matches 1800 run function pj:game-engine/reset-map
execute if score count game.event matches 1800 run function pj:game-engine/summon-marker
execute if score count game.event matches 1800 if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 blackstone replace andesite
execute if score count game.event matches 1800 if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 polished_blackstone replace cobblestone
execute if score count game.event matches 1800 if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 crying_obsidian replace stone
execute if score count game.event matches 1800 if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 blackstone_slab replace andesite_slab
execute if score count game.event matches 1800 if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 polished_blackstone_brick_slab replace cobblestone_slab
execute if score count game.event matches 1800 if score day.trigger game.config matches 1 run fill -260 56 116 -203 63 173 polished_blackstone_slab replace stone_slab
execute if score count game.event matches 1800 run effect give @a blindness 1 255 true
execute if score count game.event matches 1800 run scoreboard players reset data game.event
execute if score count game.event matches 1800 run scoreboard players reset id game.event
execute if score count game.event matches 1800 run bossbar set events name  {"text":"- Next Event -","color": "red"}
execute if score count game.event matches 1800 run kill @e[type=item]
execute if score count game.event matches 1800 run bossbar set events color red
execute if score count game.event matches 1800 run bossbar set events max 1200
execute if score count game.event matches 1800 run scoreboard players reset count game.event