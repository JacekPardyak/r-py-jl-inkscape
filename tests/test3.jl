import Pkg
Pkg.add(["ZipFile", "CSV", "DataFrames", "Plots", "Shapefile"])
using Downloads: download
using ZipFile
using DataFrames
using Plots
using Shapefile
url = "https://gisco-services.ec.europa.eu/distribution/v2/countries/download/ref-countries-2020-60m.shp.zip"

zip = download(url, "./countries.zip")
using ZipFile
using CSV, DataFrames
#function process_zip(zip::ZipFile.ReadableFile)

#    if split(zip.name,".")[end] == "zip"

        iobuffer = IOBuffer(read(zip))
        r = ZipFile.Reader(iobuffer)

        for f in r.files
            print(f.name) 
        end
#    end
iobuffer = IOBuffer(read(r.files[1]))
r = ZipFile.Reader(iobuffer)
for f in r.files
    println(f.name) 
end
        
countries = Shapefile.Table(r.files[4])

#counties |> x -> plot(x, axis = ([], false))
#savefig(ARGS[1])
#savefig("out.svg")