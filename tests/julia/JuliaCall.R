library(JuliaCall)
julia_setup()

julia_call("sqrt", 2.0)

julia_source("tests//miscellaneous.jl")
julia_exists("agm")
