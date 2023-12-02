module Day2

using AdventOfCode2023


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
    p1 = sum(game.id for game in filter(is_possible_rgb, games))
    p2 = sum(game.min_red * game.min_green * game.min_blue for game in games)
    p1, p2
end

end
