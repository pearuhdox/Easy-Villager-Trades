#Apply Trade to Villager
data remove entity @s Offers.Recipes[-1]

tellraw @p {"text":"Trade Removed From Villager!","color":"red","italic":false}
playsound minecraft:block.note_block.pling player @p ~ ~ ~ 1 0.5
playsound minecraft:entity.wandering_trader.hurt player @p ~ ~ ~ 1 0.85
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 20 normal