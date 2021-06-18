
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

tellraw @s[x=850,y=60,z=850,dx=300,dy=27,dz=300,tag=revive] [{"text":"Your second life can't save you here...","color":"red"}]
tag @s[x=850,y=60,z=850,dx=300,dy=27,dz=300] remove revive

tellraw @s[tag=revive] [{"text":"You no longer have a second life!","color":"red"}]
playsound minecraft:entity.item.break master @s[tag=revive] ~ ~ ~ 10000
effect give @s[tag=revive] minecraft:levitation 1 30 true
tp @s[tag=revive] ~ ~4 ~

execute as @s[tag=!revive] run tellraw @a [{"text":"Sorry ","color":"red"},{"selector":"@s","color":"gray"},{"text":", you are eliminated!"}]
execute as @s[tag=!revive] run playsound minecraft:entity.wither.death master @a ~ ~ ~ 10000 2
gamemode spectator @s[tag=!revive]
tag @s remove revive

execute if score players var matches 2 as @s[x=850,y=60,z=850,dx=300,dy=27,dz=300] run advancement grant @a[gamemode=adventure,distance=0.0001..] only game:out