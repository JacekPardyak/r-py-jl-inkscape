import Pkg
Pkg.add(["ZipFile", "Plots", "Shapefile"])
using Downloads: download
using ZipFile
using Plots
using Shapefile
url = "https://gisco-services.ec.europa.eu/distribution/v2/countries/download/ref-countries-2020-60m.shp.zip"

output = download(url, "./countries.zip")
print(output)
r = ZipFile.Reader(output)
for f in r.files
  println("Filename: $(f.name)")
#  write(stdout, read(f, String));
end

output = r.files[1].name
print(output)


#county_shape_file = "PRT_adm0.shp"
#counties = Shapefile.Table(county_shape_file)

#counties |> x -> plot(x, axis = ([], false))
#savefig(ARGS[1])
#savefig("out.svg")