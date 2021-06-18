
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

title @a subtitle [{"text":"The Game has just started! ","color":"gold"}]
title @a times 0 50 10
scoreboard players set status var 2
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 10000
effect clear @a
clear @a
effect give @a minecraft:weakness 1000000 100 true
effect give @a minecraft:resistance 1000000 255 true
effect give @a minecraft:jump_boost 2 255 true

team modify team friendlyFire true
tag @a[tag=revive] remove revive
tag @a[gamemode=adventure] add is_playing
scoreboard players set countevent var 6

advancement grant @a[gamemode=adventure] only game:root

execute if score mode var matches 1 run tag @a[gamemode=adventure] add mode1
execute if score mode var matches 2 run tag @a[gamemode=adventure] add mode2
execute if score mode var matches 3 run tag @a[gamemode=adventure] add mode3
execute if score mode var matches 4 run tag @a[gamemode=adventure] add mode4
execute if score mode var matches 5 run tag @a[gamemode=adventure] add mode5
execute if score mode var matches 6 run tag @a[gamemode=adventure] add mode6
execute if score mode var matches 7 run tag @a[gamemode=adventure] add mode7
execute if score mode var matches 8 run tag @a[gamemode=adventure] add mode8

advancement grant @a[gamemode=adventure,tag=mode1,tag=mode2,tag=mode3,tag=mode4,tag=mode5,tag=mode6,tag=mode7,tag=mode8] only game:mode

execute if score arena var matches 1 run tag @a[gamemode=adventure] add arena1
execute if score arena var matches 2 run tag @a[gamemode=adventure] add arena2
execute if score arena var matches 3 run tag @a[gamemode=adventure] add arena3
execute if score arena var matches 4 run tag @a[gamemode=adventure] add arena4

advancement grant @a[gamemode=adventure,tag=arena1,tag=arena2,tag=arena3,tag=arena4] only game:arena

execute if score players var matches 5.. run advancement grant @a[gamemode=adventure] only game:players
