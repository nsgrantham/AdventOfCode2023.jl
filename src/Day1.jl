module Day1

using AdventOfCode2023


const digit_words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
const valid_digits = Regex("\\d|" * join(digit_words, "|"))
const valid_digits_reversed = Regex("\\d|" * join(reverse.(digit_words), "|"))

digitify(str) = all(isdigit, str) ? parse(Int, str) : findfirst(==(str), digit_words)

function get_calibration_value(line)
    first_digit = match(valid_digits, line).match
    last_digit = reverse(match(valid_digits_reversed, reverse(line)).match)
    10 * digitify(String(first_digit)) + digitify(String(last_digit))
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day1.txt"))
    lines = readlines(input)
    p1 = sum(parse(Int, first(digits) * last(digits)) for digits in filter.(isdigit, lines))
    p2 = sum(get_calibration_value.(lines))
    p1, p2
end

end
