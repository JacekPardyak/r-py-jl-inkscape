import Pkg; Pkg.add(["GeoJSON", "Pipe"])
using Plots, GeoJSON, DataFrames, Pipe

@pipe "https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/ne_50m_land.geojson" |> 
  download(_) |> 
  GeoJSON.read(_) |> 
  DataFrame(_) |> 
  _.geometry |> 
  plot
savefig(ARGS[1])
