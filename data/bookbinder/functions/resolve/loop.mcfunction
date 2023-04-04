#> bookbinder:resolve/loop
#@within
#  function bookbinder:resolve/
#  function bookbinder:resolve/loop

data modify storage : _[-1].pages_rev append from storage : _[-2].pages[-1]
data remove storage : _[-2].pages[-1]
execute if data storage : _[-2].pages[-1] run function bookbinder:resolve/loop
item modify entity @e[type=item_display,tag=bookbinder.resolve,y=-200,distance=..0.01,limit=1] container.0 bookbinder:resolve
data modify storage : _[-2].pages append from entity @e[type=item_display,tag=bookbinder.resolve,y=-200,distance=..0.01,limit=1] item.tag.display.Lore[0]
data remove storage : _[-1].pages_rev[-1]
