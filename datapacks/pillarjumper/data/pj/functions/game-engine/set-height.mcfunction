execute as @e[tag=height.set,sort=random,limit=1,tag=!height] at @s store result score @s game.height run loot spawn 0 0 0 loot pj:choose_event

tag @e[tag=height.set,scores={game.height=1},limit=1,tag=!height] add height
execute as @e[tag=height.set,scores={game.height=2},limit=1,tag=!height] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 andesite_slab
execute as @e[tag=height.set,scores={game.height=2},limit=1,tag=!height] at @s run tp @s ~ ~0.5 ~
tag @e[tag=height.set,scores={game.height=2},limit=1,tag=!height] add height
execute as @e[tag=height.set,scores={game.height=3},limit=1,tag=!height] at @s run fill ~1 ~ ~1 ~-1 ~ ~-1 andesite
execute as @e[tag=height.set,scores={game.height=3},limit=1,tag=!height] at @s run tp @s ~ ~1 ~
tag @e[tag=height.set,scores={game.height=3},limit=1,tag=!height] add height
tag @e[tag=height] remove height.set

execute if entity @e[tag=height.set] run function pj:game-engine/set-height