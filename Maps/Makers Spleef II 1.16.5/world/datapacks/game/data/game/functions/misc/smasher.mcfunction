
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

tag @a[nbt={HurtTime:10s},sort=nearest,limit=1,distance=0.0001..] add damage
execute as @a[tag=damage] at @s run playsound minecraft:entity.illusion_illager.prepare_mirror master @a ~ ~ ~ 1 0.2
execute as @a[tag=damage] at @s run fill ~1 ~1 ~1 ~-1 ~-3 ~-1 air replace #game:terracotta
execute as @a[tag=damage] at @s run tp @s ~ ~-1 ~
tag @a[tag=damage] remove damage
scoreboard players reset @s damage