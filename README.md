# esp_tools
some tools to use on your esp8266

## hsv2rgb.lua

Converts a given color in hsv color space (hue, saturation, value) to the corresponding color in the rgb (red, green, blue) color space. Returns a table containing the values for red, green and blue

### usage

``` lua
require("hsv2rgb")
rgb = hsv2rgb(0,100,100) --pure red
color = hsv2rgb(0,100,100)
print("red:   " .. color.r)
print("green: " .. color.g)
print("blue:  " .. color.b)
```

The example above returns the following output:
```
red:   255
green: 0
blue:  0
```

