
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

execute at @e[x=1000,y=100,z=1000,distance=..70,type=creeper] run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace #game:arena
execute at @e[x=1000,y=100,z=1000,distance=..70,type=creeper] run particle explosion_emitter ~ ~ ~ 1 1 1 0.3 1
execute at @e[x=1000,y=100,z=1000,distance=..70,type=creeper] run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 100000 1
kill @e[x=1000,y=100,z=1000,distance=..70,type=creeper]
playsound minecraft:entity.creeper.primed master @a ~ ~ ~ 10000 0.6
execute at @a[gamemode=adventure] run summon minecraft:creeper ~ ~30 ~ {Invulnerable:1,Tags:["creeper"],Fuse:10000,Attributes:[{Name:"generic.movementSpeed",Base:0.4}]}