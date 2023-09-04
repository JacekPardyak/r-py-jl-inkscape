#!/usr/bin/env julia
#import Pkg
#Pkg.add("Plots")
using Plots
gr()
plot(sin, (x->begin
            sin(2x)
        end), 0, 2π, line = 4, leg = false, fill = (0, :orange))
savefig(ARGS[1])
        