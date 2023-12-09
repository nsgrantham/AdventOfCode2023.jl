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

@testset "Day 3" begin
    # `raw` avoids automatic string interpolation with $
    example = raw"""
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
    """

    @test AdventOfCode2023.Day3.solve(IOBuffer(example)) == (4361, 467835)
end

@testset "Day 4" begin
    example = """
    Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
    Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
    Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
    Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
    Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
    Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
    """

    @test AdventOfCode2023.Day4.solve(IOBuffer(example)) == (13, 30)
end


@testset "Day 8" begin
    example1 = """
    RL
    
    AAA = (BBB, CCC)
    BBB = (DDD, EEE)
    CCC = (ZZZ, GGG)
    DDD = (DDD, DDD)
    EEE = (EEE, EEE)
    GGG = (GGG, GGG)
    ZZZ = (ZZZ, ZZZ)
    """
    
    example2 = """
    LLR
    
    AAA = (BBB, BBB)
    BBB = (AAA, ZZZ)
    ZZZ = (ZZZ, ZZZ)
    """
    
    example3 = """
    LR
    
    11A = (11B, XXX)
    11B = (XXX, 11Z)
    11Z = (11B, XXX)
    22A = (22B, XXX)
    22B = (22C, 22C)
    22C = (22Z, 22Z)
    22Z = (22B, 22B)
    XXX = (XXX, XXX)
    """
    
    @test AdventOfCode2023.Day8.solve(IOBuffer(example1))[1] == 2
    @test AdventOfCode2023.Day8.solve(IOBuffer(example2))[1] == 6
    @test AdventOfCode2023.Day8.solve(IOBuffer(example3))[2] == 6
end

@testset "Day 9" begin
    example = """
    0 3 6 9 12 15
    1 3 6 10 15 21
    10 13 16 21 30 45
    """

    @test AdventOfCode2023.Day9.solve(IOBuffer(example)) == (114, 2)
end
