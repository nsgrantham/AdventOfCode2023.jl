# AdventOfCode2023.jl

[![Build Status](https://github.com/nsgrantham/AdventOfCode2023.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nsgrantham/AdventOfCode2023.jl/actions/workflows/CI.yml?query=branch%3Amain)

My solutions to [Advent of Code 2023](https://adventofcode.com/2023) using Julia.

| Puzzle                                                              | Input                         | Solver                     | Topics                  |
|:--------------------------------------------------------------------|:------------------------------|:---------------------------|:------------------------|
| [Day 1: Trebuchet?!](https://adventofcode.com/2023/day/1)           | [Day1.txt](./data/Day1.txt)   | [Day1.jl](./src/Day1.jl)   | Regex                   |
| [Day 2: Cube Conundrum](https://adventofcode.com/2023/day/2)        | [Day2.txt](./data/Day2.txt)   | [Day2.jl](./src/Day2.jl)   | Regex, Sampling         |
| [Day 3: Gear Ratios](https://adventofcode.com/2023/day/3)           | [Day3.txt](./data/Day3.txt)   | [Day3.jl](./src/Day3.jl)   | Grid Traversal          |
| [Day 4: Scratchcards](https://adventofcode.com/2023/day/4)          | [Day4.txt](./data/Day4.txt)   | [Day4.jl](./src/Day4.jl)   | Regex, Counting         |
| [Day 6: Wait For It](https://adventofcode.com/2023/day/6)           | [Day6.txt](./data/Day6.txt)   | [Day6.jl](./src/Day6.jl)   | Quadratic Equations     |
| [Day 8: Haunted Wasteland](https://adventofcode.com/2023/day/8)     | [Day8.txt](./data/Day8.txt)   | [Day8.jl](./src/Day8.jl)   | Networks, Prime Factors |
| [Day 9: Mirage Maintenance](https://adventofcode.com/2023/day/9)    | [Day9.txt](./data/Day9.txt)   | [Day9.jl](./src/Day9.jl)   | Recursion               |
| [Day 11: Cosmic Expansion](https://adventofcode.com/2023/day/11)    | [Day11.txt](./data/Day11.txt) | [Day11.jl](./src/Day11.jl) | 2D Distances            |
| [Day 12: Hot Springs](https://adventofcode.com/2023/day/12)         | [Day12.txt](./data/Day12.txt) | [Day12.jl](./src/Day12.jl) | Recursion, Memoization  |


## Install

```julia
using Pkg

Pkg.add(url = "https://github.com/nsgrantham/AdventOfCode2023.jl")
```

## Test

```julia
using Pkg

Pkg.test("AdventOfCode2023")
```

## Solve

```julia
using AdventOfCode2023

AdventOfCode2023.Day1.solve()
```
