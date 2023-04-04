#> bookbinder:resolve/
#@public
#@input storage : _[-1].pages (String of JSON)[][]
#@output storage : _[-1].pages string[]

# tellraw @s [{"text": "Debug» ", "color": "green"}, "bookbinder:resolve/» ", {"storage": ":", "nbt": "_[-1]"}]

#>
#@public
  #declare storage :

#>
#@within function bookbinder:resolve/**
  #declare tag bookbinder.resolve

summon item_display ~ -200 ~ {Tags: ["bookbinder.resolve"]}
  data modify storage : _ append value {}
    execute if data storage : _[-2].pages[-1] run function bookbinder:resolve/loop
  data remove storage : _[-1]
kill @e[type=item_display,tag=bookbinder.resolve,y=-200,distance=..0.01]
