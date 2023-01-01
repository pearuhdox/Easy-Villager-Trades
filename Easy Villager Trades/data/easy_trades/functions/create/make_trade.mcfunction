data modify storage easy_trades:template start set value {rewardExp:0b,maxUses:1,uses:0,xp:0,buy:{id:"minecraft:barrier",Count:1b},buyB:{id:"minecraft:barrier",Count:1b},sell:{id:"minecraft:barrier",Count:1b}}

#Get Trade Uses
execute store result score $max_uses evt.trade run data get storage easy_trades:template hopper.tag.BlockEntityTag.Items[{Slot:3b}].Count

execute store result score $max_uses_64 evt.trade run data get storage easy_trades:template hopper.tag.BlockEntityTag.Items[{Slot:4b}].Count
scoreboard players operation $max_uses_64 evt.trade *= $64 evt.trade

scoreboard players operation $max_uses evt.trade += $max_uses_64 evt.trade

execute store result storage easy_trades:template start.maxUses int 1 run scoreboard players add $max_uses evt.trade 0

execute if score $max_uses evt.trade matches 0 store result storage easy_trades:template start.maxUses int 1 run scoreboard players add $max_uses evt.trade 4096

#Items

#Buy A
data modify storage easy_trades:template start.buy set from storage easy_trades:template hopper.tag.BlockEntityTag.Items[{Slot:0b}]

#Sell
data modify storage easy_trades:template start.sell set from storage easy_trades:template hopper.tag.BlockEntityTag.Items[{Slot:2b}]

#Buy B
data modify storage easy_trades:template start.buy set from storage easy_trades:template hopper.tag.BlockEntityTag.Items[{Slot:1b}]
execute unless data storage easy_trades:template hopper.tag.BlockEntityTag.Items[{Slot:1b}] run data modify storage easy_trades:template start.buyB set value {}

#Apply Trade to Villager
data modify entity @s Offers.Recipes append from storage easy_trades:template start

data modify entity @s Offers.Recipes[-1].xp set value 0

tellraw @p {"text":"Trade Added To Villager!","color":"green","italic":false}
playsound minecraft:block.note_block.pling player @p ~ ~ ~ 1 2
playsound minecraft:entity.wandering_trader.yes player @p ~ ~ ~ 1 0.85
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 20 normal