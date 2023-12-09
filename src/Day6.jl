module Day6

using AdventOfCode2023


# For a given race's time and dist, find all integer values 
# of hold such that (time - hold) * hold > dist, or, rather,
# -hold^2 + time * hold - dist > 0.
#
# Solving the quadratic we find that a - b < hold < a + b
# where a = time / 2 and b = sqrt(time^2 - 4 * dist) / 2.
# 
# Since hold must be an integer, then 
# ceil(Int, a - b) ≤ hold ≤ floor(Int, a + b). 

function possible_wins(time, dist)
    a = time / 2
    b = sqrt(time^2 - 4 * dist) / 2
    floor(Int, a + b) - ceil(Int, a - b) + 1
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day6.txt"))
    times, dists = [parse.(Int, split.(line)[2:end]) for line in eachline(input)]
    p1 = prod(possible_wins.(times, dists))
    p2 = possible_wins(parse(Int, join(times)), parse(Int, join(dists)))
    p1, p2
end

end
