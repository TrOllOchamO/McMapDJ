
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

execute if entity @a[tag=testing] run scoreboard players add players var 1
execute if score players var matches ..1 run function game:controller/stop


tag @a[nbt={ActiveEffects:[{Id:26b}]}] add invulnerable
execute as @a[gamemode=adventure,tag=!invulnerable] at @s if block ~ ~-0.2 ~ #minecraft:wool run function game:misc/eliminate
execute as @a[gamemode=adventure,tag=!invulnerable] at @s if block ~ ~-0.5 ~ air if block ~ ~-0.2 ~.3 #minecraft:wool run function game:misc/eliminate
execute as @a[gamemode=adventure,tag=!invulnerable] at @s if block ~ ~-0.5 ~ air if block ~.3 ~-0.2 ~ #minecraft:wool run function game:misc/eliminate
execute as @a[gamemode=adventure,tag=!invulnerable] at @s if block ~ ~-0.5 ~ air if block ~ ~-0.2 ~-.3 #minecraft:wool run function game:misc/eliminate
execute as @a[gamemode=adventure,tag=!invulnerable] at @s if block ~ ~-0.5 ~ air if block ~-.3 ~-0.2 ~ #minecraft:wool run function game:misc/eliminate
execute as @a[x=850,y=60,z=850,dx=300,dy=27,dz=300,gamemode=adventure] run function game:misc/eliminate
tag @a[tag=invulnerable] remove invulnerable


execute as @a[gamemode=adventure] store success score @s var run clear @s #game:tools{tool:true} 0

replaceitem entity @a[gamemode=adventure,scores={var=0}] hotbar.0 minecraft:wooden_pickaxe{Enchantments:[{id:"minecraft:efficiency",lvl:100}],display:{Name:"{\"text\":\"Wooden Pickaxe\",\"color\":\"gold\",\"italic\":\"false\"}"},Unbreakable:1,HideFlags:2047,AttributeModifiers:[{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:0,Operation:0,UUIDMost:1,UUIDLeast:1}],CanDestroy:["minecraft:terracotta","minecraft:white_terracotta","minecraft:orange_terracotta","minecraft:magenta_terracotta","minecraft:light_blue_terracotta","minecraft:yellow_terracotta","minecraft:lime_terracotta","minecraft:pink_terracotta","minecraft:gray_terracotta","minecraft:light_gray_terracotta","minecraft:cyan_terracotta","minecraft:purple_terracotta","minecraft:blue_terracotta","minecraft:brown_terracotta","minecraft:green_terracotta","minecraft:red_terracotta","minecraft:black_terracotta"],tool:true}
replaceitem entity @a[scores={pickaxe=2,var=0},gamemode=adventure] hotbar.0 minecraft:stone_pickaxe{Enchantments:[{id:"minecraft:efficiency",lvl:100}],display:{Name:"{\"text\":\"Stone Pickaxe\",\"color\":\"gray\",\"italic\":\"false\"}"},Unbreakable:1,HideFlags:2047,AttributeModifiers:[{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:0,Operation:0,UUIDMost:1,UUIDLeast:1}],CanDestroy:["minecraft:terracotta","minecraft:white_terracotta","minecraft:orange_terracotta","minecraft:magenta_terracotta","minecraft:light_blue_terracotta","minecraft:yellow_terracotta","minecraft:lime_terracotta","minecraft:pink_terracotta","minecraft:gray_terracotta","minecraft:light_gray_terracotta","minecraft:cyan_terracotta","minecraft:purple_terracotta","minecraft:blue_terracotta","minecraft:brown_terracotta","minecraft:green_terracotta","minecraft:red_terracotta","minecraft:black_terracotta"],tool:true}
replaceitem entity @a[scores={pickaxe=3,var=0},gamemode=adventure] hotbar.0 minecraft:golden_pickaxe{Enchantments:[{id:"minecraft:efficiency",lvl:100}],display:{Name:"{\"text\":\"Golden Pickaxe\",\"color\":\"yellow\",\"italic\":\"false\"}"},Unbreakable:1,HideFlags:2047,AttributeModifiers:[{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:0,Operation:0,UUIDMost:1,UUIDLeast:1}],CanDestroy:["minecraft:terracotta","minecraft:white_terracotta","minecraft:orange_terracotta","minecraft:magenta_terracotta","minecraft:light_blue_terracotta","minecraft:yellow_terracotta","minecraft:lime_terracotta","minecraft:pink_terracotta","minecraft:gray_terracotta","minecraft:light_gray_terracotta","minecraft:cyan_terracotta","minecraft:purple_terracotta","minecraft:blue_terracotta","minecraft:brown_terracotta","minecraft:green_terracotta","minecraft:red_terracotta","minecraft:black_terracotta"],tool:true}
replaceitem entity @a[scores={pickaxe=4,var=0},gamemode=adventure] hotbar.0 minecraft:iron_pickaxe{Enchantments:[{id:"minecraft:efficiency",lvl:100}],display:{Name:"{\"text\":\"Iron Pickaxe\",\"color\":\"white\",\"italic\":\"false\"}"},Unbreakable:1,HideFlags:2047,AttributeModifiers:[{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:0,Operation:0,UUIDMost:1,UUIDLeast:1}],CanDestroy:["minecraft:terracotta","minecraft:white_terracotta","minecraft:orange_terracotta","minecraft:magenta_terracotta","minecraft:light_blue_terracotta","minecraft:yellow_terracotta","minecraft:lime_terracotta","minecraft:pink_terracotta","minecraft:gray_terracotta","minecraft:light_gray_terracotta","minecraft:cyan_terracotta","minecraft:purple_terracotta","minecraft:blue_terracotta","minecraft:brown_terracotta","minecraft:green_terracotta","minecraft:red_terracotta","minecraft:black_terracotta"],tool:true}
replaceitem entity @a[scores={pickaxe=5,var=0},gamemode=adventure] hotbar.0 minecraft:diamond_pickaxe{Enchantments:[{id:"minecraft:efficiency",lvl:100}],display:{Name:"{\"text\":\"Diamond Pickaxe\",\"color\":\"aqua\",\"italic\":\"false\"}"},Unbreakable:1,HideFlags:2047,AttributeModifiers:[{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:0,Operation:0,UUIDMost:1,UUIDLeast:1}],CanDestroy:["minecraft:terracotta","minecraft:white_terracotta","minecraft:orange_terracotta","minecraft:magenta_terracotta","minecraft:light_blue_terracotta","minecraft:yellow_terracotta","minecraft:lime_terracotta","minecraft:pink_terracotta","minecraft:gray_terracotta","minecraft:light_gray_terracotta","minecraft:cyan_terracotta","minecraft:purple_terracotta","minecraft:blue_terracotta","minecraft:brown_terracotta","minecraft:green_terracotta","minecraft:red_terracotta","minecraft:black_terracotta"],tool:true}
execute if score mode var matches 2 run replaceitem entity @a[gamemode=adventure,scores={var=0}] hotbar.0 minecraft:bow{Enchantments:[{id:"minecraft:punch",lvl:2},{id:"minecraft:infinity",lvl:1}],display:{Name:"{\"text\":\"Bow\",\"color\":\"gold\",\"italic\":\"false\"}"},Unbreakable:1,HideFlags:2047,tool:true}

scoreboard players reset @a var

execute at @e[type=arrow] run particle minecraft:dust .9 0.1 0.2 1 ~ ~ ~ 0.15 0.15 0.15 1 5 force
execute at @e[type=arrow] positioned ~ ~.7 ~ run fill ~1 ~2 ~1 ~-1 ~-2 ~-1 air replace #game:terracotta

execute if score mode var matches 3 run effect give @a[gamemode=adventure] jump_boost 1000000 5 true
execute if score mode var matches 3 run effect give @a[gamemode=adventure] speed 1000000 0 true

execute if score bonus var matches -1 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"\",\"color\":\"gold\",\"italic\":false},{\"text\":\"B\",\"color\":\"yellow\"},{\"text\":\"onus\"}]",CustomNameVisible:1}
execute if score bonus var matches -3 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"B\",\"color\":\"gold\",\"italic\":false},{\"text\":\"o\",\"color\":\"yellow\"},{\"text\":\"nus\"}]",CustomNameVisible:1}
execute if score bonus var matches -5 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"Bo\",\"color\":\"gold\",\"italic\":false},{\"text\":\"n\",\"color\":\"yellow\"},{\"text\":\"us\"}]",CustomNameVisible:1}
execute if score bonus var matches -7 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"Bon\",\"color\":\"gold\",\"italic\":false},{\"text\":\"u\",\"color\":\"yellow\"},{\"text\":\"s\"}]",CustomNameVisible:1}
execute if score bonus var matches -9 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"Bonu\",\"color\":\"gold\",\"italic\":false},{\"text\":\"s\",\"color\":\"yellow\"},{\"text\":\"\"}]",CustomNameVisible:1}
execute if score bonus var matches -11 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"Bon\",\"color\":\"gold\",\"italic\":false},{\"text\":\"us\",\"color\":\"yellow\"},{\"text\":\"\"}]",CustomNameVisible:1}
execute if score bonus var matches -13 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"Bo\",\"color\":\"gold\",\"italic\":false},{\"text\":\"nus\",\"color\":\"yellow\"},{\"text\":\"\"}]",CustomNameVisible:1}
execute if score bonus var matches -15 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"B\",\"color\":\"gold\",\"italic\":false},{\"text\":\"onus\",\"color\":\"yellow\"},{\"text\":\"\"}]",CustomNameVisible:1}
execute if score bonus var matches -17 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"\",\"color\":\"gold\",\"italic\":false},{\"text\":\"Bonu\",\"color\":\"yellow\"},{\"text\":\"s\"}]",CustomNameVisible:1}
execute if score bonus var matches -19 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"\",\"color\":\"gold\",\"italic\":false},{\"text\":\"Bon\",\"color\":\"yellow\"},{\"text\":\"us\"}]",CustomNameVisible:1}
execute if score bonus var matches -21 as @e[type=item,tag=bonus] run data merge entity @s {CustomName:"[{\"text\":\"\",\"color\":\"gold\",\"italic\":false},{\"text\":\"Bo\",\"color\":\"yellow\"},{\"text\":\"nus\"}]",CustomNameVisible:1}

scoreboard players remove bonus var 1
execute if score bonus var matches -24 run scoreboard players set bonus var -1


execute as @a[scores={spreadplayers=1..}] run function game:misc/spreadplayers
execute as @e[type=firework_rocket] at @s run function game:misc/rocket
execute at @e[x=1000,y=100,z=1000,distance=..200,type=experience_orb] run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace #game:terracotta
execute as @e[x=1000,y=100,z=1000,distance=..200,type=snowball] at @s run function game:misc/magicball
execute as @a[nbt={Inventory:[{id:"minecraft:emerald"}]},gamemode=adventure] run function game:misc/secondlife

execute as @a[scores={damage=0..},tag=smasher] at @s run function game:misc/smasher
tag @a[tag=smasher] remove smasher
tag @a[nbt={SelectedItem:{id:"minecraft:golden_axe"}}] add smasher

clear @a minecraft:glass_bottle

execute at @e[type=chicken,tag=mole] run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air replace #game:terracotta
execute at @e[type=chicken,tag=mole] run teleport @e[tag=head_mole,type=armor_stand,limit=1,sort=nearest] ~ ~-1.6 ~
tag @e[tag=head_mole,type=armor_stand] add kill
execute at @e[type=chicken,tag=mole] run tag @e[tag=head_mole,type=armor_stand,limit=1,sort=nearest] remove kill
kill @e[tag=head_mole,type=armor_stand,tag=kill]

execute as @e[type=item,tag=bonus] at @s if block ~ ~-.2 ~ #minecraft:wool run spreadplayers 1000 1000 0 23 false @s
execute as @e[type=item,tag=bonus] at @s if block ~ ~-.2 ~ #minecraft:wool run spreadplayers 1000 1000 0 23 false @s
execute as @e[type=item,tag=bonus] at @s if block ~ ~-.2 ~ #minecraft:wool run spreadplayers 1000 1000 0 23 false @s
execute as @e[type=item,tag=bonus] at @s if block ~ ~-.2 ~ #minecraft:wool run kill @s

effect give @a[scores={sneak=1..},gamemode=adventure] glowing 1 0 true
scoreboard players reset @a[scores={sneak=1..}] sneak

execute at @a[x=850,y=118,z=850,dx=300,dy=20,dz=300,gamemode=adventure,scores={terracotta=1..}] run fill ~7 120 ~7 ~-7 121 ~-7 air replace white_terracotta
execute at @a[x=850,y=118,z=850,dx=300,dy=20,dz=300,gamemode=adventure,scores={cobweb=1..}] run fill ~7 120 ~7 ~-7 121 ~-7 air replace cobweb
scoreboard players reset @a[scores={terracotta=1..}] terracotta
scoreboard players reset @a[scores={cobweb=1..}] cobweb

execute as @a[gamemode=adventure] at @s unless block ~ 100 ~ #minecraft:wool run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace white_terracotta
execute as @a[gamemode=adventure] at @s unless block ~ 100 ~ #minecraft:wool run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace cobweb


execute at @e[type=item,tag=bonus] run particle dust 255 255 255 1 ~ ~ ~ 0.1 0.1 0.1 1 1 force @a


#test if someone is leaving the areana outer