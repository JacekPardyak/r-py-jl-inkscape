import Pkg
Pkg.add(["Shapefile", "CairoMakie", "AlgebraOfGraphics", "GBIF", "SimpleSDMLayers", "Colors"])
using Shapefile              # Import and manipulate raster data (e.g. .shp files)
using CairoMakie             # Plotting utilities 
using AlgebraOfGraphics      # Plotting utilities
#using DataFrames             # Create and manipulate DataFrame objects 
#using CSV                    # Import and process .csv files 
using GBIF                   # Plotting
#using SimpleSDMLayers        # Plotting 
#using Colors                 # Plotting

# Downloaded from: https://geoportal.icpac.net/layers/geonode%3Aafr_g2014_2013_0
table = Shapefile.Table("data/PRT_adm0.shp");

# Set map theme for AlgebraOfGraphics.jl
set_aog_theme!() 
update_theme!(   
    Axis = (
        topspinevisible = true, 
        rightspinevisible = true,
        bottomspinecolor = :black,
        leftspinecolor = :black,
        xtickcolor =:black,
        ytickcolor =:black
       )
);
# Step 1: Create a raster layer with the Portugal shapefile (.shp)
layer_map = geodata(table) * 
        mapping(
            :geometry
            ) * 
        visual(
            Poly,
            strokecolor = :black,
            strokewidth = 1,
            linestyle = :solid,
            color = "white"
);    

# Print Africa map
draw(layer_map)

#savefig("out.svg")

# https://statsforscaredecologists.netlify.app/posts/001_basic_map_julia/