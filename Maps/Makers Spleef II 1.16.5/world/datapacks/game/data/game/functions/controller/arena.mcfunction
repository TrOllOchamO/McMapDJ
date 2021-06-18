
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

fill 957 100 957 1042 103 1042 air replace #game:arena
fill 957 104 957 1042 107 1042 air replace #game:arena
fill 957 108 957 1042 111 1042 air replace #game:arena
fill 957 112 957 1042 115 1042 air replace #game:arena
fill 957 116 957 1042 119 1042 air replace #game:arena
fill 957 120 957 1042 123 1042 air replace #game:arena

execute if score arena var matches 5.. run scoreboard players set arena var 1


execute if score arena var matches 1 run data merge entity @e[type=item,tag=arena,limit=1] {CustomName:"{\"text\":\"Jungle\",\"color\":\"dark_green\",\"bold\":\"true\"}",Item:{id:"minecraft:oak_leaves"}}

execute if score arena var matches 1 run clone -23 38 -18 51 39 52 966 101 966 masked
execute if score arena var matches 1 run clone -23 40 -18 51 41 52 966 103 966 masked
execute if score arena var matches 1 run clone -23 42 -18 51 43 52 966 105 966 masked
execute if score arena var matches 1 run clone -23 44 -18 51 45 52 966 107 966 masked
execute if score arena var matches 1 run clone -23 46 -18 51 47 52 966 109 966 masked
execute if score arena var matches 1 run clone -23 48 -18 51 49 52 966 111 966 masked
execute if score arena var matches 1 run clone -23 50 -18 51 52 52 966 113 966 masked


execute if score arena var matches 2 run data merge entity @e[type=item,tag=arena,limit=1] {CustomName:"{\"text\":\"Beach\",\"color\":\"gold\",\"bold\":\"true\"}",Item:{id:"minecraft:sand"}}

execute if score arena var matches 2 run clone -23 0 -18 51 1 52 964 101 964 masked
execute if score arena var matches 2 run clone -23 2 -18 51 3 52 964 103 964 masked
execute if score arena var matches 2 run clone -23 4 -18 51 5 52 964 105 964 masked
execute if score arena var matches 2 run clone -23 6 -18 51 7 52 964 107 964 masked
execute if score arena var matches 2 run clone -23 8 -18 51 9 52 964 109 964 masked
execute if score arena var matches 2 run clone -23 10 -18 51 11 52 964 111 964 masked
execute if score arena var matches 2 run clone -23 12 -18 51 14 52 964 113 964 masked


execute if score arena var matches 3 run data merge entity @e[type=item,tag=arena,limit=1] {CustomName:"{\"text\":\"Antarctic\",\"color\":\"dark_aqua\",\"bold\":\"true\"}",Item:{id:"minecraft:ice"}}

execute if score arena var matches 3 run clone -23 58 -18 51 59 52 966 101 966 masked
execute if score arena var matches 3 run clone -23 60 -18 51 61 52 966 103 966 masked
execute if score arena var matches 3 run clone -23 62 -18 51 63 52 966 105 966 masked
execute if score arena var matches 3 run clone -23 64 -18 51 65 52 966 107 966 masked
execute if score arena var matches 3 run clone -23 66 -18 51 67 52 966 109 966 masked
execute if score arena var matches 3 run clone -23 68 -18 51 69 52 966 111 966 masked
execute if score arena var matches 3 run clone -23 70 -18 51 72 52 966 113 966 masked


execute if score arena var matches 4 run data merge entity @e[type=item,tag=arena,limit=1] {CustomName:"{\"text\":\"Volcano\",\"color\":\"dark_red\",\"bold\":\"true\"}",Item:{id:"minecraft:magma_block"}}

execute if score arena var matches 4 run clone -23 19 -18 51 20 52 960 101 966 masked
execute if score arena var matches 4 run clone -23 21 -18 51 22 52 960 103 966 masked
execute if score arena var matches 4 run clone -23 23 -18 51 24 52 960 105 966 masked
execute if score arena var matches 4 run clone -23 25 -18 51 26 52 960 107 966 masked
execute if score arena var matches 4 run clone -23 27 -18 51 28 52 960 109 966 masked
execute if score arena var matches 4 run clone -23 29 -18 51 30 52 960 111 966 masked
execute if score arena var matches 4 run clone -23 30 -18 51 32 52 960 113 966 masked