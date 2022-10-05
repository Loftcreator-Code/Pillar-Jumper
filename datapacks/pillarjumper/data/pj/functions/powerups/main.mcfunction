# POWERUP INDEX
# ID   NAME
#  1   invertor-shard
#  2   booster
#  3   spidernest

# SPAWN
scoreboard players add timer powerups.spawn 1
execute if score timer powerups.spawn matches 200 run title @a actionbar [{"text": "A powerup just spawned","color": "green"}]
execute if score timer powerups.spawn matches 200 store result score powerup.id powerups.spawn run loot spawn 0 0 0 loot pj:choose_powerup
execute if score timer powerups.spawn matches 261.. run scoreboard players set timer powerups.spawn 0

execute if score timer powerups.spawn matches 200 if score powerup.id powerups.spawn matches 1 as @e[tag=items.marker,sort=random,limit=1] at @s run function pj:powerups/item/invertor-shard
execute if score timer powerups.spawn matches 200 if score powerup.id powerups.spawn matches 2 as @e[tag=items.marker,sort=random,limit=1] at @s run function pj:powerups/item/booster
execute if score timer powerups.spawn matches 200 if score powerup.id powerups.spawn matches 3 as @e[tag=items.marker,sort=random,limit=1] at @s run function pj:powerups/item/spidernest
execute if score timer powerups.spawn matches 200 if score powerup.id powerups.spawn matches 4 as @e[tag=items.marker,sort=random,limit=1] at @s run function pj:powerups/item/baseball-bat

# SECURE POWERUP POSITION
execute as @e[type=item,nbt={Item:{tag:{pjItem:["yes"]}}}] run data merge entity @s {Motion:[0.0,0.0,0.0]}

# ANTI MULTI ITEM DROP
execute as @e[type=item,tag=!notCollected,nbt={Item:{tag:{pjItem:["yes"]}}}] unless data entity @s {Item:{Count:1b}} run tag @s add returnItem
execute as @e[type=item,tag=!notCollected,nbt={Item:{tag:{pjItem:["yes"]}}}] unless data entity @s {Item:{Count:1b}} at @s as @a[sort=nearest,limit=1] run tellraw @s [{"text": "You just dropped multiple Powerups at the same time. You can't do that since it's only allowed to drop just one at the time.","color": "red"}]

# ITEM'S ABILITIES
      # INVERTOR SHARD
            # IS NOT BALLOWNER, BALLOWNER EXIST => INVERT BALLOWNER
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] if entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] unless score @s ball.own matches 1.. run title @s actionbar [{"text": "You inverted the current Ballowner (","color": "green"},{"selector": "@a[scores={ball.own=1..},sort=nearest,limit=1]","color": "gray"},{"text": ")","color": "green"}]
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] if entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] unless score @s ball.own matches 1.. at @s run playsound entity.enderman.teleport player @s ~ ~ ~ 1 1
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] if entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] unless score @s ball.own matches 1.. at @s as @a[sort=nearest,limit=1,distance=0.2..] at @s run tp @s ~ ~ ~ ~90 ~

            # IS BALLOWNER, BALLOWNER EXIST => INVERT NEAREST PLAYER
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] if entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] if score @s ball.own matches 1.. at @s run title @s actionbar [{"text": "You inverted the nearest Player (","color": "green"},{"selector": "@a[sort=nearest,limit=1,distance=0.2..]","color": "gray"},{"text": ")","color": "green"}]
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] if entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] if score @s ball.own matches 1.. at @s at @s run playsound entity.enderman.teleport player @s ~ ~ ~ 1 1
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] if entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] if score @s ball.own matches 1.. at @s as @a[sort=nearest,limit=1,distance=0.2..] at @s run tp @s ~ ~ ~ ~90 ~

            # IS NOT BALLOWNER, BALLOWNER ISNT EXIST => INVERT NEAREST PLAYER
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] unless entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] unless score @s ball.own matches 1.. at @s run title @s actionbar [{"text": "You inverted the nearest Player (","color": "green"},{"selector": "@a[sort=nearest,limit=1,distance=0.2..]","color": "gray"},{"text": ")","color": "green"}]
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] unless entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] unless score @s ball.own matches 1.. at @s at @s run playsound entity.enderman.teleport player @s ~ ~ ~ 1 1
            execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","invertorShard"]}}}] unless entity @a[scores={ball.own=1..}] at @s as @a[sort=nearest,limit=1] unless score @s ball.own matches 1.. at @s as @a[sort=nearest,distance=0.2..,limit=1] at @s run tp @s ~ ~ ~ ~90 ~

      # BOOSTER
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s if score @a[sort=nearest,limit=1] player.posY matches 66.. run tellraw @a[sort=nearest,limit=1] [{"text": "You're too high right now to use this powerup. Try again at a lower place","color": "red"}]
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s if score @a[sort=nearest,limit=1] player.posY matches 66.. at @s run playsound block.note_block.bass player @s ~ ~ ~ 1 0
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s if score @a[sort=nearest,limit=1] player.posY matches 66.. run tag @s add returnItem

      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s if data entity @a[sort=nearest,limit=1] {ActiveEffects:[{Id:25b}]} run tellraw @a[sort=nearest,limit=1] [{"text": "You're too high right now to use this powerup. Try again at a lower place","color": "red"}]
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s if data entity @a[sort=nearest,limit=1] {ActiveEffects:[{Id:25b}]} at @s run playsound block.note_block.bass player @s ~ ~ ~ 1 0
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s if data entity @a[sort=nearest,limit=1] {ActiveEffects:[{Id:25b}]} run tag @s add returnItem
      
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s as @a[sort=nearest,limit=1] unless score @s player.posY matches 66.. unless data entity @s {ActiveEffects:[{Id:25b}]} at @s run fill ~1 ~ ~1 ~-1 ~2 ~-1 air replace cobweb
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s as @a[sort=nearest,limit=1] unless score @s player.posY matches 66.. unless data entity @s {ActiveEffects:[{Id:25b}]} at @s run playsound entity.firework_rocket.launch player @s ~ ~ ~ 1 1
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s as @a[sort=nearest,limit=1] unless score @s player.posY matches 66.. unless data entity @s {ActiveEffects:[{Id:25b}]} at @s run particle campfire_cosy_smoke ~ ~ ~ 0 0 0 0.5 50 normal
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","booster"]}}}] at @s as @a[sort=nearest,limit=1] unless score @s player.posY matches 66.. unless data entity @s {ActiveEffects:[{Id:25b}]} run effect give @s levitation 1 16 true

      # SPIDERNEST
      execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes","spidernest"]}}}] at @s as @a[sort=nearest,limit=1] at @s run summon marker ~ ~ ~ {Tags:["spawn.spidernest"]}

      execute as @e[tag=spawn.spidernest] if score @s powerups.dataSpidernest matches 20..23 at @s run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 cobweb replace #pj:air
      execute as @e[tag=spawn.spidernest] if score @s powerups.dataSpidernest matches 0..20 at @s run particle spit ~ ~ ~ 2 2 2 0.05 50 force
      execute as @e[tag=spawn.spidernest] if score @s powerups.dataSpidernest matches 83..86 at @s run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 air replace cobweb
      execute as @e[tag=spawn.spidernest] at @s unless block ~ ~ ~ cobweb as @a[distance=..8] run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1
      execute as @e[tag=spawn.spidernest] run scoreboard players add @s powerups.dataSpidernest 1
      execute as @e[tag=spawn.spidernest] if score @s powerups.dataSpidernest matches 86.. run kill @s

      # BASEBALLBAT
      tag @e[nbt={Item:{id:"minecraft:blaze_rod",tag:{pjItem:["baseballbat"]}}}] add returnItem
      execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{pjItem:["baseballbat"]}}},scores={powerups.bat.hit=1..}] at @s run playsound block.note_block.bell player @s ~ ~ ~ 1 1
      execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{pjItem:["baseballbat"]}}},scores={powerups.bat.hit=1..}] run clear @s blaze_rod{pjItem:["baseballbat"]} 1
      scoreboard players reset @a[scores={powerups.bat.hit=1..}] powerups.bat.hit

# RETURN ITEM
execute as @e[tag=returnItem] at @s run tp @s @a[sort=nearest,limit=1,distance=..3]
execute as @e[tag=returnItem] run data merge entity @s {PickupDelay:0}

# REMOVE POWERUP
execute as @e[type=item,tag=!notCollected,tag=!returnItem,nbt={Item:{tag:{pjItem:["yes"]}}}] run kill @s


#Effect Pads
scoreboard players add count powerups.effectpad 1

execute if score count powerups.effectpad matches 100 unless score id game.event matches 1 run tag @e[tag=items.marker,sort=random,limit=3] add effectpad
execute if score count powerups.effectpad matches 100 if score id game.event matches 1 run tag @e[tag=items.marker,sort=random,limit=1] add effectpad
execute as @e[tag=effectpad] if score count powerups.effectpad matches 100 store result score @s powerups.effectpad run loot spawn 0 0 0 loot pj:choose_effectpad
execute as @e[tag=effectpad] at @s if score @s powerups.effectpad matches 1 unless block ~ ~ ~ #minecraft:slabs run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:light_blue_carpet
execute as @e[tag=effectpad] at @s if score @s powerups.effectpad matches 2 unless block ~ ~ ~ #minecraft:slabs run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:lime_carpet
execute as @e[tag=effectpad] at @s if score @s powerups.effectpad matches 3 unless block ~ ~ ~ #minecraft:slabs run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:white_carpet
execute as @e[tag=effectpad] at @s if score @s powerups.effectpad matches 4 unless block ~ ~ ~ #minecraft:slabs run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:purple_carpet
execute as @e[tag=effectpad] at @s if score @s powerups.effectpad matches 1 unless block ~ ~ ~ #minecraft:slabs run particle dust 0 1 1 1 ~ ~ ~ 0.6 0 0.6 0 20
execute as @e[tag=effectpad] at @s if score @s powerups.effectpad matches 2 unless block ~ ~ ~ #minecraft:slabs run particle dust 0 1 0 1 ~ ~ ~ 0.6 0 0.6 0 20
execute as @e[tag=effectpad] at @s if score @s powerups.effectpad matches 3 unless block ~ ~ ~ #minecraft:slabs run particle cloud ~ ~ ~ 0.2 0.2 0.2 0.05 10
execute as @e[tag=effectpad] at @s if score @s powerups.effectpad matches 4 unless block ~ ~ ~ #minecraft:slabs run particle dust 1 0 1 2 ~ ~ ~ 0.6 0 0.6 0 20
execute if score count powerups.effectpad matches 400 run tag @e[tag=effectpad] remove effectpad
execute as @e[tag=items.marker] at @s if score count powerups.effectpad matches 400 if score @s powerups.effectpad matches 1 run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace light_blue_carpet
execute as @e[tag=items.marker] at @s if score count powerups.effectpad matches 400 if score @s powerups.effectpad matches 2 run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace lime_carpet
execute as @e[tag=items.marker] at @s if score count powerups.effectpad matches 400 if score @s powerups.effectpad matches 3 run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace white_carpet
execute as @e[tag=items.marker] at @s if score count powerups.effectpad matches 400 if score @s powerups.effectpad matches 4 run fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:air replace purple_carpet

execute if score count powerups.effectpad matches 400.. run scoreboard players reset count powerups.effectpad

execute as @a[nbt=!{ActiveEffects:[{Id:25}]}] at @s if block ~ ~ ~ white_carpet run playsound entity.ender_dragon.flap player @s ~ ~ ~ 1 1
execute as @a at @s if block ~ ~ ~ white_carpet run effect give @s levitation 1 20 true

execute as @a[nbt=!{ActiveEffects:[{Id:1}]}] at @s if block ~ ~ ~ light_blue_carpet run playsound entity.illusioner.cast_spell player @s ~ ~ ~ 1 1
execute as @a at @s if block ~ ~ ~ light_blue_carpet run effect give @s speed 5 3 true

execute as @a at @s if block ~ ~ ~ purple_carpet run tag @s add playsound.tp
execute as @a at @s if block ~ ~ ~ purple_carpet at @e[tag=items.marker,sort=random,limit=1] run tp @s ~ ~ ~
execute as @a[tag=playsound.tp] at @s run playsound entity.enderman.teleport player @s ~ ~ ~ 1 1
execute as @a[tag=playsound.tp] at @s run tag @s remove playsound.tp


execute as @a[scores={powerups.jumpPad=1..},nbt={ActiveEffects:[{Id:8}]}] at @s run playsound block.slime_block.fall player @s ~ ~ ~ 1 1
execute as @a at @s if block ~ ~ ~ lime_carpet run effect give @s jump_boost 2 15 true
scoreboard players reset @a powerups.jumpPad