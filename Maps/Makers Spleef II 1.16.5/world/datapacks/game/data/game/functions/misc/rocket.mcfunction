
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

effect give @a[sort=nearest,limit=1] minecraft:levitation 1 30 true
particle explosion_emitter ~ ~ ~ 1 1 1 0.3 1
fill ~1 ~-3 ~1 ~-1 ~-1 ~-1 air replace #game:terracotta
playsound minecraft:entity.generic.explode master @a
kill @e[type=firework_rocket]