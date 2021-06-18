
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

function game:events/random

execute at @e[x=1000,y=100,z=1000,distance=..70,type=creeper] run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace #game:arena
execute at @e[x=1000,y=100,z=1000,distance=..70,type=zombie,tag=explode] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 air replace #game:arena

execute at @e[x=1000,y=100,z=1000,distance=..70,tag=explode] run particle explosion_emitter ~ ~ ~ 1 1 1 0.3 1
execute at @e[x=1000,y=100,z=1000,distance=..70,tag=explode] run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 100000 1

kill @e[x=1000,y=100,z=1000,distance=..70,type=creeper]
kill @e[x=1000,y=100,z=1000,distance=..70,type=zombie,tag=explode]

execute if score result! random matches 0..4 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Freeze!","color":"gray"}]
execute if score result! random matches 0..4 run playsound minecraft:block.glass.break master @a ~ ~ ~ 100000 1
execute if score result! random matches 0..4 run effect give @a[gamemode=adventure] minecraft:jump_boost 6 250 true
execute if score result! random matches 0..4 run effect give @a[gamemode=adventure] minecraft:slowness 6 250 true
execute if score result! random matches 0..4 at @a[gamemode=adventure] run particle item_snowball ~ ~0.5 ~ 0.5 0.6 0.5 0.05 50

execute if score result! random matches 10..14 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Color Splash!","color":"gray"}]
execute if score result! random matches 10..14 run playsound minecraft:entity.generic.splash master @a ~ ~ ~ 10000 1
execute if score result! random matches 10..14 run summon area_effect_cloud ~ ~ ~ {Tags:["splash"]}
execute if score result! random matches 10..14 run spreadplayers 1002 997 0 20 false @e[type=area_effect_cloud,tag=splash]
execute if score result! random matches 10..14 at @e[type=area_effect_cloud,tag=splash] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 black_terracotta replace #game:terracotta
execute if score result! random matches 10..14 run spreadplayers 1002 997 0 20 false @e[type=area_effect_cloud,tag=splash]
execute if score result! random matches 10..14 at @e[type=area_effect_cloud,tag=splash] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 red_terracotta replace #game:terracotta
execute if score result! random matches 10..14 run spreadplayers 1002 997 0 20 false @e[type=area_effect_cloud,tag=splash]
execute if score result! random matches 10..14 at @e[type=area_effect_cloud,tag=splash] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 lime_terracotta replace #game:terracotta
execute if score result! random matches 10..14 run spreadplayers 1002 997 0 20 false @e[type=area_effect_cloud,tag=splash]
execute if score result! random matches 10..14 at @e[type=area_effect_cloud,tag=splash] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 yellow_terracotta replace #game:terracotta
execute if score result! random matches 10..14 run spreadplayers 1002 997 0 20 false @e[type=area_effect_cloud,tag=splash]
execute if score result! random matches 10..14 at @e[type=area_effect_cloud,tag=splash] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 light_blue_terracotta replace #game:terracotta
execute if score result! random matches 10..14 run spreadplayers 1002 997 0 20 false @e[type=area_effect_cloud,tag=splash]
execute if score result! random matches 10..14 at @e[type=area_effect_cloud,tag=splash] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 white_terracotta replace #game:terracotta

execute if score result! random matches 17..19 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Zombie Rain!","color":"gray"}]
execute if score result! random matches 17..19 run playsound minecraft:entity.zombie.ambient master @a ~ ~ ~ 10000 0.7
execute if score result! random matches 17..19 at @a[gamemode=adventure] run summon minecraft:zombie ~ ~15 ~ {Invulnerable:1,ArmorItems:[{},{},{},{id:diamond_helmet,Count:1b,tag:{Enchantments:[{id:"minecraft:protection",lvl:1}],Unbreakable:1}}],HandItems:[{id:stick,Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:4}]}}],Tags:["zombie"],Attributes:[{Name:"generic.movementSpeed",Base:0.4}]}

execute if score result! random matches 20..26 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Swap!","color":"gray"}]
execute if score result! random matches 20..26 run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 10000 1
execute if score result! random matches 20..26 at @a[gamemode=adventure] run summon area_effect_cloud ~ ~ ~ {NoGravity:1,Tags:["swap"]}
execute if score result! random matches 20..26 as @a[gamemode=adventure] run tp @s @e[type=area_effect_cloud,tag=swap,distance=0.0001..,limit=1,sort=random]
execute if score result! random matches 20..26 at @a[gamemode=adventure] run particle portal ~ ~ ~ 0.5 0.5 0.5 0.4 100 force @a

execute if score result! random matches 31..33 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Acid Rain!","color":"gray"}]
execute if score result! random matches 31..33 run playsound minecraft:weather.rain master @a ~ ~ ~ 100000 0.1
execute if score result! random matches 31..33 at @a[gamemode=adventure] run summon minecraft:experience_bottle ~ ~30 ~
execute if score result! random matches 31..33 at @a[gamemode=adventure] run summon minecraft:experience_bottle ~5 ~20 ~-3
execute if score result! random matches 31..33 at @a[gamemode=adventure] run summon minecraft:experience_bottle ~-4 ~34 ~9

execute if score result! random matches 39..44 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Boom!","color":"gray"}]
execute if score result! random matches 39..44 run playsound minecraft:entity.creeper.primed master @a ~ ~ ~ 10000 0.6
execute if score result! random matches 39..44 at @a[gamemode=adventure] run summon minecraft:creeper ~ ~30 ~ {Invulnerable:1,Tags:["explode"],Fuse:10000,Attributes:[{Name:"generic.movementSpeed",Base:0.4}]}
execute if score result! random matches 39..44 at @a[gamemode=adventure] run summon minecraft:creeper ~ ~30 ~ {Invulnerable:1,Tags:["explode"],Fuse:10000,Attributes:[{Name:"generic.movementSpeed",Base:0.4}]}

execute if score result! random matches 27..29 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Woooosh!","color":"gray"}]
execute if score result! random matches 27..29 run playsound minecraft:entity.player.burp master @a ~ ~ ~ 10000 0.1
execute if score result! random matches 27..29 run effect give @a[gamemode=adventure] minecraft:levitation 6 0 true

execute if score result! random matches 34..38 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Heroes are real!","color":"gray"}]
execute if score result! random matches 34..38 run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 10000 2
execute if score result! random matches 34..38 run effect give @a[gamemode=adventure] minecraft:speed 15 3 true
execute if score result! random matches 34..38 run effect give @a[gamemode=adventure] minecraft:jump_boost 15 3 true
execute if score result! random matches 34..38 run effect give @a[gamemode=adventure] minecraft:glowing 15 3 true

execute if score result! random matches 5..9 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Mole!","color":"gray"}]
execute if score result! random matches 5..9 run playsound minecraft:entity.horse.eat master @a ~ ~ ~ 10000 1.2
execute if score result! random matches 5..9 at @a[gamemode=adventure] run summon minecraft:chicken ~ ~5 ~ {ActiveEffects:[{Id:14b,Amplifier:1,Duration:10000,ShowParticles:false},{Id:6b,Amplifier:4,Duration:1,ShowParticles:false}],Silent:1,Attributes:[{Name:"generic.maxHealth",Base:20},{Name:"generic.movementSpeed",Base:0.4}],Fire:1000s,Tags:["mole"]}
execute if score result! random matches 5..9 at @e[type=chicken,tag=mole] run summon minecraft:armor_stand ~ ~ ~ {Tags:["head_mole"],Invisible:1,ArmorItems:[{},{},{},{id:player_head,Count:1b,tag:{display:{Name:"Beaver"},SkullOwner:{Id:"b2ec560d-b1a8-452c-b9db-03e1bcad9aeb",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMWM1ZTZjNWI5ZGY5ZTI3ZWU1NjdiNjU1ZDBlZThhNWFjOGUxMWUxZjQ1YWJjY2U0NjI2NWNjMjFhNzk5YWMifX19"}]}}}}],NoGravity:1,Marker:1}

execute if score result! random matches 15..16 run advancement grant @a[gamemode=spectator,tag=is_playing,tag=resurrected] only game:resurrected2
execute if score result! random matches 15..16 run advancement grant @a[gamemode=spectator,tag=is_playing] only game:resurrected1
execute if score result! random matches 15..16 run tag @a[gamemode=spectator,tag=is_playing] add resurrected

execute if score result! random matches 15..16 run tellraw @a [{"text":"Event: ","color":"green"},{"text":"Heroes never die!","color":"gray"}]
execute if score result! random matches 15..16 run playsound minecraft:entity.evocation_illager.prepare_wololo master @a ~ ~ ~ 10000 1.5
execute if score result! random matches 15..16 run effect give @a[gamemode=spectator,tag=is_playing] minecraft:levitation 3 10 true
execute if score result! random matches 15..16 run spreadplayers 1002 997 0 20 false @a[gamemode=spectator,tag=is_playing]
execute if score result! random matches 15..16 as @a[gamemode=spectator,tag=is_playing] at @s run tp @s ~ ~5 ~
execute if score result! random matches 15..16 run gamemode adventure @a[gamemode=spectator,tag=is_playing]
