# AdventOfCode20XX.jl

[![Build Status](https://github.com/nsgrantham/AdventOfCode20XX.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/nsgrantham/AdventOfCode20XX.jl/actions/workflows/CI.yml?query=branch%3Amain)

My solutions to [Advent of Code 20XX](https://adventofcode.com/20XX) using Julia.

| Puzzle                                                              | Input                         | Solver                     |
|:--------------------------------------------------------------------|:------------------------------|:---------------------------|
| [Day 1](https://adventofcode.com/20XX/day/1)                        | [Day1.txt](./data/Day1.txt)   | [Day1.jl](./src/Day1.jl)   |


## Install

```julia
using Pkg

Pkg.add(url = "https://github.com/nsgrantham/AdventOfCode20XX.jl")
```

## Test

```julia
using Pkg

Pkg.test("AdventOfCode20XX")
```

## Solve

```julia
using AdventOfCode20XX

AdventOfCode20XX.Day1.solve()
```
