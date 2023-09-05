ENV["R_HOME"]="C://Program Files//R//R-4.2.3"
using Pkg
Pkg.build("RCall")
using RCall
