# AdventOfCode2023.jl

[![Build Status](https://github.com/nsgrantham/AdventOfCode2023.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nsgrantham/AdventOfCode2023.jl/actions/workflows/CI.yml?query=branch%3Amain)

My solutions to [Advent of Code 2023](https://adventofcode.com/2023) using Julia.

| Puzzle                                                              | Input                         | Solver                     | Topics |
|:--------------------------------------------------------------------|:------------------------------|:---------------------------|:-------|
| [Day 1](https://adventofcode.com/2023/day/1)                        | [Day1.txt](./data/Day1.txt)   | [Day1.jl](./src/Day1.jl)   |        |


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
