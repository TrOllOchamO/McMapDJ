
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

title @s[scores={connection=1..}] title [{"text":"Welcome to","color":"green"}]
title @s[scores={connection=1..}] subtitle [{"text":"Makers Spleef","color":"gold"}]
playsound minecraft:entity.player.levelup master @s[scores={connection=1..}] ~ ~ ~ 10000

spawnpoint @s 1000 141 940
effect clear @s 
clear @s
effect give @s minecraft:instant_health 1 10 true
team join team @s

execute if score status var matches 0 run tp @s[scores={connection=0..}] 1000 141 940 0 35
execute if score status var matches 0 run gamemode adventure @s[scores={connection=0..}]
execute if score status var matches 1.. run tp @s[scores={connection=0..}] 1000 125 965 0 30
execute if score status var matches 1.. run gamemode spectator @s[scores={connection=0..}]

scoreboard players reset @s connection
tag @s add initialized
tag @s remove testing
tag @s remove is_playing
tag @s remove resurrected