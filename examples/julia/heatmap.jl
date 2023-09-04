#!/usr/bin/env julia
#import Pkg
#Pkg.add("Plots")
using Plots
gr()
xs = [string("x", i) for i = 1:10]
ys = [string("y", i) for i = 1:4]
z = float((1:4) * reshape(1:10, 1, :))
heatmap(xs, ys, z, aspect_ratio = 1)
savefig(ARGS[1])
        