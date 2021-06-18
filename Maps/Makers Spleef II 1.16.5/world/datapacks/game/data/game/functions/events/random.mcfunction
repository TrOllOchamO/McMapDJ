
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

scoreboard players operation seed! random *= a! random
scoreboard players operation seed! random += c! random
execute if score seed! random matches -2147483648..-1 run scoreboard players operation seed! random *= inv! random
scoreboard players operation result! random = seed! random
scoreboard players operation result! random /= b! random
scoreboard players operation result! random %= m! random