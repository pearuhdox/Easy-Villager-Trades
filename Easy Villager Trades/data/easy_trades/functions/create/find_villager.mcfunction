data modify storage easy_trades:template hopper set value {}
data modify storage easy_trades:template hopper set from entity @s SelectedItem

execute positioned ^ ^ ^2 as @e[type=villager,limit=1,sort=nearest,distance=..3] at @s run function easy_trades:create/make_trade