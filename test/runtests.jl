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

  @test AdventOfCode2023.Day1.solve(IOBuffer(example1))[1] == 142
  @test sum(AdventOfCode2023.Day1.calibrate.(readlines(IOBuffer(example2)))) == 281
end

@testset "Day 2" begin
    example = """
    Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
    """

    @test AdventOfCode2023.Day2.solve(IOBuffer(example)) == (8, 2286)
end
