module Day2

using AdventOfCode2023

# For a given game, let R be the number of red cubes in the bag, G the number
# of green cubes in the bag, and B the number of blue cubes in the bag. We do
# not get to observe R, G, or B, but by sampling with replacement from the
# bag we can determine lower bounds for each. For sample i, let r_i be the
# number of red cubes shown, g_i the number of green cubes shown, and b_i the
# number of blue cubes shown. Across n samples, R is max(r_1, r_2, ..., r_n)
# or greater, G is max(g_1, g_2, ..., g_n) or greater, and, finally, B is
# max(b_1, b_2, ..., b_n) or greater. Let min_red, min_green, and min_blue
# represent these lower bounds for R, G, and B respectively.

struct Game
    id::Int
    min_red::Int
    min_green::Int
    min_blue::Int
end

function Base.parse(::Type{Game}, line::String)
    game_id = parse(Int, only(match(r"Game (\d+):", line).captures))
    min_cubes(color) = maximum(parse(Int, only(m.captures)) for m in eachmatch(Regex("(\\d+) $color"), line); init=0)
    Game(game_id, min_cubes("red"), min_cubes("green"), min_cubes("blue"))
end

function is_possible(game::Game; red::Int=0, green::Int=0, blue::Int=0)
    game.min_red <= red && game.min_green <= green && game.min_blue <= blue
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day2.txt"))
    games = parse.(Game, readlines(input))
    is_possible_rgb(game) = is_possible(game; red=12, green=13, blue=14)
    p1 = sum(game.id for game in games if is_possible_rgb(game))
    p2 = sum(game.min_red * game.min_green * game.min_blue for game in games)
    p1, p2
end

end
