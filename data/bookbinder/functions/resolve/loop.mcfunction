#> bookbinder:resolve/loop
#@within
#  function bookbinder:resolve/
#  function bookbinder:resolve/loop

data modify storage : _[-1].pages_rev append from storage : _[-2].pages[-1]
data remove storage : _[-2].pages[-1]
execute if data storage : _[-2].pages[-1] run function bookbinder:resolve/loop
item modify entity @e[type=item_frame,tag=make_book.item_holder,y=-200,distance=..1] container.0 bookbinder:resolve
data modify storage : _[-1].pages append from entity @e[type=item_frame,tag=make_book.item_holder,y=-200,distance=..1,limit=1] Item.tag.display.Lore[0]
data remove storage : _[-1].pages_rev[-1]
