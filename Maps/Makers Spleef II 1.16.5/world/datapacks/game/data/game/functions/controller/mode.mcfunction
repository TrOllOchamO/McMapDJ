
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

execute if score mode var matches 9.. run scoreboard players set mode var 1

execute if score mode var matches 1 run data merge entity @e[type=item,tag=mode,limit=1] {CustomName:"{\"text\":\"Classic\",\"bold\":\"true\",\"color\":\"white\"}",Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"bc461525-6511-4417-92d7-f2ff0ab15b89",Properties:{textures:[{}]}}}}}
execute if score mode var matches 2 run data merge entity @e[type=item,tag=mode,limit=1] {CustomName:"{\"text\":\"Arrow\",\"bold\":\"true\",\"color\":\"gray\"}",Item:{id:"minecraft:skeleton_skull",tag:{}}}
execute if score mode var matches 3 run data merge entity @e[type=item,tag=mode,limit=1] {CustomName:"{\"text\":\"Bunny\",\"bold\":\"true\",\"color\":\"aqua\"}",Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"f2544255-6511-442d-92d7-f2ff09755b89",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYmU1MGFmNTA0MzhhZmZjNjVjZTNiN2E4NWI4ZTgyY2ZiYzNjYWIxOTdjMjVkNGE2MTQyMzBhMmQxZTA2MDVkIn19fQ=="}]}}}}}
execute if score mode var matches 4 run data merge entity @e[type=item,tag=mode,limit=1] {CustomName:"{\"text\":\"Creeper\",\"bold\":\"true\",\"color\":\"green\"}",Item:{id:"minecraft:creeper_head",tag:{}}}
execute if score mode var matches 5 run data merge entity @e[type=item,tag=mode,limit=1] {CustomName:"{\"text\":\"Zombie\",\"bold\":\"true\",\"color\":\"dark_green\"}",Item:{id:"minecraft:zombie_head",tag:{}}}
execute if score mode var matches 6 run data merge entity @e[type=item,tag=mode,limit=1] {CustomName:"{\"text\":\"Items\",\"bold\":\"true\",\"color\":\"gold\"}",Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"0a9e8efb-9191-4c81-80f5-e27ca5433156",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODIyZDhlNzUxYzhmMmZkNGM4OTQyYzQ0YmRiMmY1Y2E0ZDhhZThlNTc1ZWQzZWIzNGMxOGE4NmU5M2IifX19"}]}}}}}
execute if score mode var matches 7 run data merge entity @e[type=item,tag=mode,limit=1] {CustomName:"{\"text\":\"Events\",\"bold\":\"true\",\"color\":\"yellow\"}",Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"eb405652-f501-44b3-86f7-9fa2eebd5303",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNWNmYWRhZWM3NzZlZWRlNDlhNDMzZTA5OTdmZTA0NDJmNzY1OTk4OTI0MTliYWFiODNkMjhlOGJhN2YxZjMifX19"}]}}}}}
execute if score mode var matches 8 run data merge entity @e[type=item,tag=mode,limit=1] {CustomName:"{\"text\":\"Insane\",\"bold\":\"true\",\"color\":\"dark_red\"}",Item:{id:"minecraft:wither_skeleton_skull",tag:{}}}