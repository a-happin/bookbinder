#> bookbinder:resolve/
#@public
#@input storage : author String
#@input storage : title String
#@input storage : _[-1].pages [[String of JSON]]

# tellraw @s [{"text": "Debug» ", "color": "green"}, "bookbinder:resolve/» ", {"storage": ":", "nbt": "_[-1]"}]

#>
#@within function bookbinder:resolve/**
#declare tag make_book.item_holder
summon item_frame ~ -200 ~ {Facing: 1b, Fixed: 1b, Invisible: 1b, Invulnerable: 1b, ItemDropChance: -1e39f, Item: {id: "debug_stick", Count: 1b}, Tags: ["make_book.item_holder"]}
  data modify storage : _ append value {}
    execute if data storage : _[-2].pages[-1] run function bookbinder:resolve/loop
    execute if data storage : _[-1].pages run data modify storage : _[-2].pages set from storage : _[-1].pages
  data remove storage : _[-1]
kill @e[type=item_frame,tag=make_book.item_holder,y=-200,distance=..1]
