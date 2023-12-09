module Day9

using AdventOfCode2023


function extrapolate(x::Vector{Int})
    all(==(0), x) && return 0
    x[end] + extrapolate(diff(x))
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day9.txt"))
    xs = [parse.(Int, split(line)) for line in eachline(input)]
    p1 = sum(extrapolate, xs)
    p2 = sum(extrapolate, reverse.(xs))
    p1, p2
end

end
