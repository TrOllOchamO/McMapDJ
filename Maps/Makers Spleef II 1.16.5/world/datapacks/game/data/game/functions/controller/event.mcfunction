
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

execute if score mode var matches 4 as @a[gamemode=adventure] at @s run function game:events/creeper
execute if score mode var matches 5 run function game:events/zombie
execute if score mode var matches 6 as @a[gamemode=adventure] at @s run function game:events/item
execute if score mode var matches 7 run function game:events/event

execute if score mode var matches 8 as @a[gamemode=adventure] at @s run function game:events/item
execute if score mode var matches 8 run function game:events/event
execute if score mode var matches 8 at @r[gamemode=adventure] run summon zombie ~ ~30 ~ {Attributes:[{Name:"generic.maxHealth",Base:1000},{Name:"generic.movementSpeed",Base:0.35}],HandItems:[{id:iron_shovel,Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:3}]}}],ArmorItems:[{},{},{},{id:tnt,Count:1b,Damage:0s,tag:{Unbreakable:1}}],IsBaby:1,Tags:["explode"],Invulnerable:1}

scoreboard players set countevent var 7