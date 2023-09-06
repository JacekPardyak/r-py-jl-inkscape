#!/usr/bin/env julia
using Plots, GeoJSON, DataFrames
url = "https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/"
df = download(url * "ne_50m_land.geojson") |> GeoJSON.read |> DataFrame
df.geometry |> plot
savefig(ARGS[1])
