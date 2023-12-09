module Day9

using AdventOfCode2023


function extrapolate(x::Vector{Int})
    y = Int[]
    while true
        push!(y, x[end])
        x = diff(x)
        all(==(0), x) && break
    end
    pop!(cumsum(reverse(y)))
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day9.txt"))
    xs = [parse.(Int, split(line)) for line in eachline(input)]
    p1 = sum(extrapolate.(xs))
    p2 = sum(extrapolate.(reverse.(xs)))
    p1, p2
end

end
