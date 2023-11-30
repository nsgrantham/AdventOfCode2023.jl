using AdventOfCode20XX
using Test


@testset "Day 1" begin
    example = ""

    @test AdventOfCode20XX.Day1.solve(IOBuffer(example)) == (0, 1)
end
