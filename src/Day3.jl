module Day3

using AdventOfCode2023


struct Schematic
    values::Matrix{Char}
    numbers::Vector{CartesianIndices}
    symbols::Vector{CartesianIndex}
end

function Base.parse(::Type{Schematic}, str::String)
    values = hcat(collect.(split(str, "\n"; keepempty=false))...)
    coords = CartesianIndices(values)
    
    numbers = CartesianIndices[]
    i = 1
    while i <= length(values)
        if isdigit(values[i])
            start = i
            while mod(i, size(coords, 1)) > 0  # not at last row
                !isdigit(values[i+1]) && break
                i += 1
            end
            push!(numbers, coords[start]:coords[i])
        end
        i += 1
    end 
    
    symbols = findall(v -> !isdigit(v) && v != '.', values)

    Schematic(values, numbers, symbols)
end

parse_number(digit_chars::Matrix{Char}) = parse(Int, *(digit_chars...))

function get_part_numbers(schematic::Schematic)
    parse_number.(schematic.values[i] for i in schematic.numbers if !isempty(find_adjacent(schematic.symbols, i)))
end

function get_gear_ratios(schematic::Schematic)
    gears = filter(i -> schematic.values[i] == '*', schematic.symbols)
    gear_numbers = Dict(zip(gears, [Int[] for _ in 1:length(gears)]))
    for i in schematic.numbers
        for gear in find_adjacent(gears, i)
            push!(gear_numbers[gear], parse_number(schematic.values[i]))
        end
    end
    prod.(numbers for numbers in values(gear_numbers) if length(numbers) == 2)
end

function find_adjacent(symbols::Vector{CartesianIndex}, number::CartesianIndices)
    adjacent_min = minimum(number) + CartesianIndex(-1, -1)
    adjacent_max = maximum(number) + CartesianIndex(1, 1)
    adjacent_box = setdiff(adjacent_min:adjacent_max, number)
    intersect(adjacent_box, symbols)
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day3.txt"))
    schematic = parse(Schematic, read(input, String))
    p1 = sum(get_part_numbers(schematic))
    p2 = sum(get_gear_ratios(schematic))
    p1, p2
end

end
