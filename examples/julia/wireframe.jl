#!/usr/bin/env julia
using Plots
Plots.gr()

x=-1:0.1:1
y=-1:0.1:1
h(x,y)=x^2-y^2;

wireframe(x,y,h)
savefig(ARGS[1])
        