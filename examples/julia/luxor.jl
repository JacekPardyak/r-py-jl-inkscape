#!/usr/bin/env julia
#import Pkg; Pkg.add("Luxor")

using Luxor, Colors
Drawing(1200, 1400, ARGS[1])

origin()
cols = diverging_palette(60, 120, 20) # hue 60 to hue 120
background(cols[1])
setopacity(0.7)
setline(2)

# circumradius of 500
ngon(0, 0, 500, 8, 0, :clip)

for y in -500:50:500
    for x in -500:50:500
        setcolor(cols[rand(1:20)])
        ngon(x, y, rand(20:25), rand(3:12), 0, :fill)
        setcolor(cols[rand(1:20)])
        ngon(x, y, rand(10:20), rand(3:12), 0, :stroke)
    end
end
finish()
