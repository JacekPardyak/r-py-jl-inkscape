import Pkg
Pkg.add(["ZipFile", "Plots", "Shapefile"])
using Downloads: download
using ZipFile
using Plots
using Shapefile
# dowload the data
url = "https://gisco-services.ec.europa.eu/distribution/v2/countries/download/ref-countries-2020-60m.shp.zip"
zip = download(url, "./countries.zip")
# unzip first archive
archive = ZipFile.Reader(zip)
for f in archive.files
    println(f.name)
    fullFilePath = joinpath("./", f.name)
    if endswith(f.name,"/")
        mkdir(fullFilePath)
    else
        out =  open(fullFilePath,"w")
        write(out,read(f,String))
        close(out) 
    end
end
# unzip second - nested - archive
zip = joinpath("./", archive.files[1].name)
archive = ZipFile.Reader(zip)

for f in archive.files
    println(f.name)
    fullFilePath = joinpath("./", f.name)
    if endswith(f.name,"/")
        mkdir(fullFilePath)
    else
        out =  open(fullFilePath,"w")
        write(out,read(f,String))
        close(out) 
    end
end
close(archive)
# read shapefile
shape = joinpath("./", archive.files[4].name)
countries = Shapefile.Table(shape)
countries |> x -> plot(x, axis = ([], false))
#savefig(ARGS[1])
savefig("out.svg")
