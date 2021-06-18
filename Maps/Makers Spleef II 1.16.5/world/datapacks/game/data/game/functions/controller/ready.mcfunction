
#Makers Spleef II - Copyright (c) MineMakers Team (by Maxo6)

execute if score players var matches ..1 run tellraw @a [{"text":"You have to wait for more players to start the game! ","color":"red"},{"text":"\n ► Click here to enter the testing mode","color":"gray","hoverEvent":{"action":"show_text","value":"click!"},"clickEvent":{"action":"run_command","value":"/trigger trigger set 34789134"}}]
execute if score players var matches ..1 run playsound minecraft:entity.item.break master @a ~ ~ ~ 1000000
execute if score players var matches 2.. run function game:controller/countdown