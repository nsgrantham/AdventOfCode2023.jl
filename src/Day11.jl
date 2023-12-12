module Day11

using AdventOfCode2023
using Combinatorics


const Galaxy = Tuple{Int, Int}

function Base.parse(::Type{Vector{Galaxy}}, lines::Vector{String})
    universe = permutedims(hcat(collect.(lines)...))
    Galaxy.(Tuple.(findall(==('#'), universe)))
end

function expand_universe(galaxies::Vector{Galaxy}, factor::Int)
    galaxy_rows = unique(first.(galaxies))
    galaxy_cols = unique(last.(galaxies))
    empty_rows = setdiff(range(extrema(galaxy_rows)...), galaxy_rows)
    empty_cols = setdiff(range(extrema(galaxy_cols)...), galaxy_cols)
    factor -= 1
    Galaxy.((i + factor * count(<(i), empty_rows), j + factor * count(<(j), empty_cols)) for (i, j) in galaxies)
end

intergalactic_distance(a::Galaxy, b::Galaxy) = sum(abs.(a .- b))

function solve(input=pkgdir(AdventOfCode2023, "data", "Day11.txt"))
    galaxies = parse(Vector{Galaxy}, readlines(input))
    galaxies1 = expand_universe(galaxies, 2)
    galaxies2 = expand_universe(galaxies, 1_000_000)
    p1 = sum(intergalactic_distance(pair...) for pair in combinations(galaxies1, 2))
    p2 = sum(intergalactic_distance(pair...) for pair in combinations(galaxies2, 2))
    p1, p2    
end

end
