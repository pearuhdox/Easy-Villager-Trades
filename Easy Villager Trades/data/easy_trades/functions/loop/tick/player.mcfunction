execute if score @s evt.trade matches 1.. if entity @s[nbt={SelectedItem:{id:"minecraft:hopper"}}] if data entity @s SelectedItem.tag.BlockEntityTag.Items[{Slot:0b}].Count if data entity @s SelectedItem.tag.BlockEntityTag.Items[{Slot:2b}].Count run function easy_trades:create/find_villager
execute if score @s evt.trade matches 1.. if entity @s[nbt={SelectedItem:{id:"minecraft:poisonous_potato"}}] run function easy_trades:create/find_villager_v2

scoreboard players set @s evt.trade 0
