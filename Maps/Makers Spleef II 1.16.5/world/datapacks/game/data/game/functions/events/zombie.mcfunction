
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

playsound minecraft:entity.zombie.ambient master @a ~ ~ ~ 10000 0.7
execute at @a[gamemode=adventure] run summon minecraft:zombie ~ ~15 ~ {Invulnerable:1,ArmorItems:[{},{},{},{id:diamond_helmet,Count:1b,tag:{Enchantments:[{id:"minecraft:protection",lvl:1}],Unbreakable:1}}],HandItems:[{id:stick,Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:4}]}}],Tags:["zombie"],Attributes:[{Name:"generic.movementSpeed",Base:0.4}]}