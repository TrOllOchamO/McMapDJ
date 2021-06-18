
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

scoreboard players set status var 0
playsound minecraft:entity.enderdragon.ambient master @a ~ ~ ~ 10000 1.5
title @a times 0 100 10
title @a subtitle [{"text":""}]
title @a title [{"text":"Draw","color":"red"}]

execute as @a[gamemode=adventure,limit=1] run title @a title [{"text":"The Winner is","color":"red"}]
execute as @a[gamemode=adventure,limit=1] run title @a subtitle [{"selector":"@s","color":"gold"}]

execute as @a[gamemode=adventure,limit=1] run tellraw @a [{"selector":"@s","color":"gold"},{"text":" won the game!","color":"yellow"}]
team modify team friendlyFire false

scoreboard players add @a[gamemode=adventure,limit=1] win 1

kill @e[type=experience_orb]
kill @e[type=ender_pearl]
kill @e[type=snowball]
kill @e[type=item,tag=bonus]
kill @e[type=zombie]
kill @e[type=creeper]
kill @e[type=chicken]

function game:controller/arena
scoreboard players set @a connection 0

advancement grant @a[gamemode=adventure,limit=1,scores={win=1}] only game:win1
advancement grant @a[gamemode=adventure,limit=1,scores={win=5}] only game:win2
advancement grant @a[gamemode=adventure,limit=1,scores={win=15}] only game:win3
advancement grant @a[gamemode=adventure,limit=1,scores={win=30}] only game:win4

advancement grant @a[gamemode=adventure,limit=1,nbt={ActiveEffects:[{Id:14b}]}] only game:invisible
advancement grant @a[gamemode=adventure,limit=1,nbt={ActiveEffects:[{Id:2b}]}] only game:freeze

advancement grant @a[advancements={game:zombie=true,game:mine3=true,game:win4=true,game:pickaxe3=true}] only game:pickaxe4
advancement grant @a[advancements={game:players=true,game:mine2=true,game:win3=true,game:pickaxe2=true}] only game:pickaxe3
advancement grant @a[advancements={game:arena=true,game:mode=true,game:win2=true,game:pickaxe1=true}] only game:pickaxe2
advancement grant @a[advancements={game:root=true,game:win1=true}] only game:pickaxe1

scoreboard players reset * damage
scoreboard players reset * spreadplayers
scoreboard players reset * terracotta
scoreboard players reset * cobweb
