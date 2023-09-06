#!/usr/bin/env julia
using Plots, GeoJSON, DataFrames, Pipe
@pipe "https://gisco-services.ec.europa.eu/distribution/v2/countries/geojson/CNTR_BN_01M_2020_3035.geojson" |> download(_) |> 
  GeoJSON.read(_) |> 
  DataFrame(_) |>
  filter(:CNTR_CODE => n -> n == "PT", _) |>
  _.geometry |> 
  plot(_, ylimits=(1700000, 2300000), xlimits=(2600000, 3000000), aspect_ratio = :equal,  color=:royalblue1)
savefig(ARGS[1])
