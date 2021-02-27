## imports
using SpacecraftDynamics

## tle declaration

tle = ["1 00005U 58002B   00179.78495062  .00000023  00000-0  28098-4 0  4753",
       "2 00005  34.2682 348.7242 1859667 331.7664  19.3264 10.82419157413667     0.00      4320.0        360.00"]

splitted = split.(tle)

function parsetle(line1::String, line2::String)

    satnum = parse(Int, line1[3:7])
    classification = line1[8]
    launchyear = parse(Int, line1[10:11])
    launchnum = parse(Int, line1[12:14])
    launchpiece = line1[15:17]
    epochyear = parse(Int, line1[19:20])
    epochday = parse(Float64, line1[21:32])
    ndot = parse(Float64, line1[34:43])
    nddot = parse(Float64, line1[45:50]) * 10. ^ parse(Int, line1[51:52])
    bstar = parse(Float64, line1[54:59]) * 10. ^ parse(Int, line1[60:61])
    ephemtype = line1[63]
    elementnum = line1[65:68]

    inclination = parse(Float64, line2[9:16])
    raan = parse(Float64, line2[18:25])
    eccentricity = parse(Float64, line2[27:33])
    meananomaly = parse(Float64, line2[44:51])
    meanmotion = parse(Float64, line2[53:63])
    revnum = parse(Int, line2[64:68])
end

parsetle(tle::Array{String,1}) = parsetle(tle[1], tle[2])
