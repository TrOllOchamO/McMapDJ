
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

scoreboard players set status var 1
scoreboard players set countdown var 6
effect give @a minecraft:resistance 1000000 255 true
effect give @a minecraft:invisibility 1000000 0 true
effect give @a minecraft:instant_health 1 100 true
effect give @a minecraft:weakness 1000000 100 true
title @a times 0 50 10

gamemode adventure @a[x=1000,y=100,z=1000,distance=..500]

spreadplayers 1002 997 0 20 false @a[gamemode=adventure]
execute as @a[gamemode=adventure] at @s run tp @s ~ 136 ~
effect give @a[gamemode=adventure] levitation 1000000 255 true
function game:controller/arena

kill @e[type=experience_orb]
kill @e[type=ender_pearl]
kill @e[type=snowball]
kill @e[type=item,tag=bonus]
kill @e[type=zombie]
kill @e[type=creeper]
kill @e[type=chicken]

tellraw @a [{"text":"Rules: ","color":"gold"},{"text":"With your tools, dig under your opponents to make them fall on the wool. If you touch the wool, you die. You have to be the last player alive!","color":"gray"}]

scoreboard players set zombieTimer var 0