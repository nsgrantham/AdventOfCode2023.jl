module Day4

using AdventOfCode2023


function parse_wins(line)
    winners, mine = split.(match(r".+:([\d ]+)\|([\d ]+)", line).captures)
    length(intersect(winners, mine))
end

score_points(win) = win > 0 ? 2^(win-1) : 0

function count_cards(wins)
    cards = ones(Int, length(wins))
    for (i, n) in enumerate(wins)
        cards[i+1:i+n] .+= cards[i]
    end
    cards
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day4.txt"))
    wins = parse_wins.(eachline(input))
    p1 = sum(score_points.(wins))
    p2 = sum(count_cards(wins))
    p1, p2
end

end
