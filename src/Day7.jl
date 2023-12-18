module Day7

using AdventOfCode2023
using StatsBase: countmap


const type_ranks = (
    [1, 1, 1, 1, 1],
    [1, 1, 1, 2],
    [1, 2, 2],
    [1, 1, 3],
    [2, 3],
    [1, 4],
    [5]
)

struct Hand
    cards::Vector{Int}
    type::Int
    bid::Int
end

function Base.parse(::Type{Hand}, line::AbstractString; jokers_wild::Bool=false)
    cards, bid = split(line)

    card_ranks = jokers_wild ? "J23456789TQKA" : "23456789TJQKA"
    card_values = [findfirst(card, card_ranks) for card in cards]

    counts = countmap(cards)
    if jokers_wild && !isempty(setdiff(keys(counts), 'J'))
        jokers = pop!(counts, 'J', 0)
        counts[argmax(counts)] += jokers
    end
    sorted_counts = sort(collect(values(counts)))
    type_value = findfirst(sorted_counts == type_rank for type_rank in type_ranks)

    Hand(card_values, type_value, parse(Int, bid))
end

Base.isless(l::Hand, r::Hand) = l.type == r.type ? l.cards < r.cards : l.type < r.type

play!(hands::Vector{Hand}) = sum(i * hand.bid for (i, hand) in enumerate(sort!(hands)))

function solve(input=pkgdir(AdventOfCode2023, "data", "Day7.txt"))
    lines = readlines(input)
    p1 = play!(parse.(Hand, lines; jokers_wild=false))
    p2 = play!(parse.(Hand, lines; jokers_wild=true))
    p1, p2
end

end
