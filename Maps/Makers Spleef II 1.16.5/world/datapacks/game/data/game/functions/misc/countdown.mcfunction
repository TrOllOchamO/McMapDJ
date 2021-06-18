
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

scoreboard players remove countdown var 1
title @a title [{"text":"Makers Spleef","color":"green"}]
title @a subtitle [{"text":"Game starts in ","color":"gold"},{"score":{"name":"countdown","objective":"var"}},{"text":" seconds"}]
execute if score countdown var matches 1 run title @a subtitle [{"text":"Game starts in ","color":"gold"},{"score":{"name":"countdown","objective":"var"}},{"text":" second"}]
execute if score countdown var matches 0 run function game:controller/start
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 10000