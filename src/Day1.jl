module Day1

using AdventOfCode2023


const digit_words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
const digit_regex = Regex("\\d|" * join(digit_words, "|"))
const reversed_digit_regex = Regex("\\d|" * join(reverse.(digit_words), "|"))

function digitize(s::String)
    all(isdigit, s) ? parse(Int, s) : findfirst(==(s), digit_words)
end

function calibrate(line::String)
    a = match(digit_regex, line).match
    z = reverse(match(reversed_digit_regex, reverse(line)).match)
    10 * digitize(String(a)) + digitize(String(z))
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day1.txt"))
    lines = readlines(input)
    p1 = sum(parse(Int, first(d) * last(d)) for d in filter.(isdigit, lines))
    p2 = sum(calibrate.(lines))
    p1, p2
end

end
