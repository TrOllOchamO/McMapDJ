
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

scoreboard players set @a[tag=!initialized] connection 1
execute as @a[scores={connection=0..}] run function game:misc/connection

scoreboard players set players var 0
execute as @a[gamemode=adventure] run scoreboard players add players var 1


execute as @a[scores={trigger=34789134},tag=!testing] if score players var matches ..1 run function game:controller/countdown
execute as @a[scores={trigger=34789134},tag=!testing] if score players var matches ..1 run tag @s add testing
scoreboard players reset @a trigger
execute if score players var matches ..1 run scoreboard players enable @a[tag=!testing] trigger

replaceitem entity @a[gamemode=adventure,nbt={ActiveEffects:[{Id:14b}],Inventory:[{Slot:103b}]}] armor.head air

scoreboard players remove second var 1
execute if score second var matches ..0 run function game:second

execute if score status var matches 2 run function game:game

kill @e[type=item,tag=!invulnerable]
replaceitem entity @a[x=986,y=140,z=922,dx=28,dy=100,dz=28,gamemode=adventure] weapon minecraft:air

execute at @e[scores={particle=1},nbt=!{ActiveEffects:[{Id:14b}]}] run particle happy_villager ~ ~0.3 ~ 0.2 0.5 0.2 1 1
execute at @e[scores={particle=2},nbt=!{ActiveEffects:[{Id:14b}]}] run particle entity_effect ~ ~2.2 ~ 0.2 0.3 0.2 0.01 1
execute at @e[scores={particle=3},nbt=!{ActiveEffects:[{Id:14b}]}] run particle dragon_breath ~ ~0.4 ~ 0.2 0.2 0.2 0.01 1
execute at @e[scores={particle=4},nbt=!{ActiveEffects:[{Id:14b}]}] run particle note ~ ~2.5 ~ 0.3 0.3 0.3 1 1
execute at @e[scores={particle=5},nbt=!{ActiveEffects:[{Id:14b}]}] run particle end_rod ~ ~ ~ 0.2 0.3 0.2 0.02 1

particle block barrier 995 142 946 0.2 0.2 0.2 0.05 3 normal @a

clear @a minecraft:bow{Damage:365}
clear @a minecraft:wooden_sword{Damage:57}
clear @a minecraft:golden_axe{Damage:31}


scoreboard players reset @a[nbt={OnGround:1b}] nofall
scoreboard players add @a[nbt=!{OnGround:1b}] nofall 1

execute as @a[scores={nofall=9..},nbt=!{OnGround:1b}] at @s if block ~.3 ~-1 ~.3 #game:terracotta run effect give @s minecraft:slow_falling 1 0 true
execute as @a[scores={nofall=9..},nbt=!{OnGround:1b}] at @s if block ~-.3 ~-1 ~-.3 #game:terracotta run effect give @s minecraft:slow_falling 1 0 true
execute as @a[scores={nofall=9..},nbt=!{OnGround:1b}] at @s if block ~-.3 ~-1 ~.3 #game:terracotta run effect give @s minecraft:slow_falling 1 0 true
execute as @a[scores={nofall=9..},nbt=!{OnGround:1b}] at @s if block ~.3 ~-1 ~-.3 #game:terracotta run effect give @s minecraft:slow_falling 1 0 true

execute as @a[scores={nofall=20..},nbt=!{OnGround:1b}] at @s if block ~.3 ~-2 ~.3 #game:terracotta run effect give @s minecraft:slow_falling 1 0 true
execute as @a[scores={nofall=20..},nbt=!{OnGround:1b}] at @s if block ~-.3 ~-2 ~-.3 #game:terracotta run effect give @s minecraft:slow_falling 1 0 true
execute as @a[scores={nofall=20..},nbt=!{OnGround:1b}] at @s if block ~-.3 ~-2 ~.3 #game:terracotta run effect give @s minecraft:slow_falling 1 0 true
execute as @a[scores={nofall=20..},nbt=!{OnGround:1b}] at @s if block ~.3 ~-2 ~-.3 #game:terracotta run effect give @s minecraft:slow_falling 1 0 true

execute as @a[nbt={OnGround:1b}] run effect clear @s slow_falling

execute as @a[scores={jump=5000..}] run advancement grant @s only game:jump