module Day13

using AdventOfCode2023


struct Pattern
    values::Matrix{Char}
    has_smudge::Bool
end

function Base.parse(::Type{Pattern}, str::AbstractString)
    Pattern(permutedims(hcat(collect.(split(str, "\n"))...)), false)
end

function find_vertical_mirror(pattern::Pattern)
    smudge = pattern.has_smudge ? 1 : 0
    n = size(pattern.values, 2)
    for i in 1:n-1
        width = min(i, n-i)
        left  = pattern.values[:, i:-1:i-width+1]
        right = pattern.values[:, i+1:i+width]
        count(left .!= right) == smudge && return i
    end
    nothing
end

function find_horizontal_mirror(pattern::Pattern)
    find_vertical_mirror(Pattern(permutedims(pattern.values), pattern.has_smudge))
end

function summarize(pattern::Pattern)
    @something find_vertical_mirror(pattern) 100find_horizontal_mirror(pattern)
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day13.txt"))
    patterns = parse.(Pattern, split(readchomp(input), "\n\n"))
    p1 = sum(summarize, patterns)
    p2 = sum(summarize, Pattern(pattern.values, true) for pattern in patterns)
    p1, p2
end

end
