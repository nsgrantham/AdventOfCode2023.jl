module Day1

using AdventOfCode2023


const digit_words = Dict(
    "one"   => 1,
    "two"   => 2,
    "three" => 3,
    "four"  => 4,
    "five"  => 5,
    "six"   => 6,
    "seven" => 7,
    "eight" => 8,
    "nine"  => 9
)

function get_calibration_value(line; parse_digit_words::Bool=true)
    digits = Int[]
    for i in eachindex(line)
        if isdigit(line[i])
            push!(digits, parse(Int, line[i]))
            continue
        end
        if parse_digit_words
            for (word, digit) in digit_words
                if startswith(line[i:end], word)
                    push!(digits, digit)
                    break
                end
            end
        end
    end
    10 * first(digits) + last(digits)
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day1.txt"))
    lines = readlines(input)
    p1 = sum(get_calibration_value.(lines, parse_digit_words=false))
    p2 = sum(get_calibration_value.(lines, parse_digit_words=true))
    p1, p2
end

end
