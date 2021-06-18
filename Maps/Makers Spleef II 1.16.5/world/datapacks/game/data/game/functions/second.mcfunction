
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

execute if score countdown var matches 1..6 run function game:misc/countdown

effect give @a minecraft:saturation 1 255 true
clear @a arrow
replaceitem entity @a[gamemode=adventure] inventory.0 minecraft:arrow
execute as @e[type=arrow] run data merge entity @s {life:1198}
xp add @a -100 levels

scoreboard players set second var 20

execute if score status var matches 2 if score mode var matches 3..8 run scoreboard players remove countevent var 1
execute if score status var matches 2 if score mode var matches 3..8 if score countevent var matches ..0 run function game:controller/event


clear @a[scores={hat=1},nbt=!{Inventory:[{Slot:103b}]}] dragon_head
replaceitem entity @a[scores={hat=1},nbt=!{ActiveEffects:[{Id:14b}]},nbt=!{Inventory:[{Slot:103b}]}] armor.head dragon_head{display:{Name:"{\"text\":\"Dragon Hat\",\"color\":\"green\",\"italic\":false}"}}
clear @a[scores={hat=2},nbt=!{Inventory:[{Slot:103b}]}] dispenser
replaceitem entity @a[scores={hat=2},nbt=!{ActiveEffects:[{Id:14b}]},nbt=!{Inventory:[{Slot:103b}]}] armor.head dispenser{display:{Name:"{\"text\":\"Dispenser Hat\",\"color\":\"gray\",\"italic\":false}"}}
clear @a[scores={hat=3},nbt=!{Inventory:[{Slot:103b}]}] hay_block
replaceitem entity @a[scores={hat=3},nbt=!{ActiveEffects:[{Id:14b}]},nbt=!{Inventory:[{Slot:103b}]}] armor.head hay_block{display:{Name:"{\"text\":\"Hay Hat\",\"color\":\"red\",\"italic\":false}"}}
clear @a[scores={hat=4},nbt=!{Inventory:[{Slot:103b}]}] command_block
replaceitem entity @a[scores={hat=4},nbt=!{ActiveEffects:[{Id:14b}]},nbt=!{Inventory:[{Slot:103b}]}] armor.head command_block{display:{Name:"{\"text\":\"Command Hat\",\"color\":\"blue\",\"italic\":false}"}}
clear @a[scores={hat=5},nbt=!{Inventory:[{Slot:103b}]}] jack_o_lantern
replaceitem entity @a[scores={hat=5},nbt=!{ActiveEffects:[{Id:14b}]},nbt=!{Inventory:[{Slot:103b}]}] armor.head jack_o_lantern{display:{Name:"{\"text\":\"Halloween Hat\",\"color\":\"yellow\",\"italic\":false}"}}


execute as @a[scores={mine1=1..}] run scoreboard players operation @s mine += @s mine1
execute as @a[scores={mine2=1..}] run scoreboard players operation @s mine += @s mine2
execute as @a[scores={mine3=1..}] run scoreboard players operation @s mine += @s mine3
execute as @a[scores={mine4=1..}] run scoreboard players operation @s mine += @s mine4
execute as @a[scores={mine5=1..}] run scoreboard players operation @s mine += @s mine5
execute as @a[scores={mine6=1..}] run scoreboard players operation @s mine += @s mine6
execute as @a[scores={mine7=1..}] run scoreboard players operation @s mine += @s mine7
execute as @a[scores={mine8=1..}] run scoreboard players operation @s mine += @s mine8
execute as @a[scores={mine9=1..}] run scoreboard players operation @s mine += @s mine9
execute as @a[scores={mine10=1..}] run scoreboard players operation @s mine += @s mine10
execute as @a[scores={mine11=1..}] run scoreboard players operation @s mine += @s mine11
execute as @a[scores={mine12=1..}] run scoreboard players operation @s mine += @s mine12
execute as @a[scores={mine13=1..}] run scoreboard players operation @s mine += @s mine13
execute as @a[scores={mine14=1..}] run scoreboard players operation @s mine += @s mine14
execute as @a[scores={mine15=1..}] run scoreboard players operation @s mine += @s mine15
execute as @a[scores={mine16=1..}] run scoreboard players operation @s mine += @s mine16
execute as @a[scores={mine17=1..}] run scoreboard players operation @s mine += @s mine17

scoreboard players reset @a[scores={mine1=1..}] mine1
scoreboard players reset @a[scores={mine2=1..}] mine2
scoreboard players reset @a[scores={mine3=1..}] mine3
scoreboard players reset @a[scores={mine4=1..}] mine4
scoreboard players reset @a[scores={mine5=1..}] mine5
scoreboard players reset @a[scores={mine6=1..}] mine6
scoreboard players reset @a[scores={mine7=1..}] mine7
scoreboard players reset @a[scores={mine8=1..}] mine8
scoreboard players reset @a[scores={mine9=1..}] mine9
scoreboard players reset @a[scores={mine10=1..}] mine10
scoreboard players reset @a[scores={mine11=1..}] mine11
scoreboard players reset @a[scores={mine12=1..}] mine12
scoreboard players reset @a[scores={mine13=1..}] mine13
scoreboard players reset @a[scores={mine14=1..}] mine14
scoreboard players reset @a[scores={mine15=1..}] mine15
scoreboard players reset @a[scores={mine16=1..}] mine16
scoreboard players reset @a[scores={mine17=1..}] mine17

execute as @a[scores={mine=500..}] run advancement grant @s only game:mine1
execute as @a[scores={mine=2000..}] run advancement grant @s only game:mine2
execute as @a[scores={mine=10000..}] run advancement grant @s only game:mine3

execute if score status var matches 2 if score mode var matches 4 run scoreboard players add zombieTimer var 1
execute if score status var matches 2 if score mode var matches 4 if score zombieTimer var matches 300 run advancement grant @a[gamemode=adventure] only game:zombie