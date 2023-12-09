module Day6

using AdventOfCode2023


# 

function wins(time, dist)
    Δ = sqrt(time^2 - 4 * dist) / 2
    ceil(Int, time / 2 + Δ) - floor(Int, time / 2 - Δ) - 1
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day6.txt"))
    times, dists = [parse.(Int, split.(line)[2:end]) for line in eachline(input)]
    p1 = prod(wins.(times, dists))
    p2 = wins(parse(Int, join(times)), parse(Int, join(dists)))
    p1, p2
end

end
