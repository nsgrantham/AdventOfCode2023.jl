using AdventOfCode2023
using Test


@testset "Day 1" begin
    example1 = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet"""

    example2 = """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen"""

  @test sum(AdventOfCode2023.Day1.get_calibration_value.(readlines(IOBuffer(example1)))) == 142
  @test sum(AdventOfCode2023.Day1.get_calibration_value.(readlines(IOBuffer(example2)))) == 281
end
