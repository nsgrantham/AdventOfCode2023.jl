using AdventOfCode2023
using Test


@testset "Day 1" begin
    example = ""

    @test AdventOfCode2023.Day1.solve(IOBuffer(example)) == (0, 1)
end
