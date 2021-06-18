
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

spreadplayers 1000 1000 0 23 false @a[gamemode=adventure]
execute as @a[gamemode=adventure] at @s run tp @s ~ ~5 ~
effect give @a[gamemode=adventure] minecraft:levitation 1 30 true
clear @s minecraft:carrot_on_a_stick 1
playsound minecraft:entity.endermen.teleport master @a ~ ~ ~ 100000
scoreboard players reset @s spreadplayers