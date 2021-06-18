
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

tellraw @s[tag=!revive] [{"text":"You now have a second life!","color":"green"}]
playsound minecraft:entity.player.levelup master @s[tag=!revive] ~ ~ ~ 10000
tellraw @s[tag=revive] [{"text":"Sorry, you already have a second life!","color":"red"}]
advancement grant @s[tag=revive] only game:lives
playsound minecraft:entity.item.break master @s[tag=revive] ~ ~ ~ 10000
tag @s add revive
clear @s emerald