module Day8

using AdventOfCode2023


const Network = Dict{String, Dict{Char, String}}

function Base.parse(::Type{Network}, lines::Vector{String})
    network = Network()
    for line in lines
        node, left, right = match(r"(\w{3}) = \((\w{3}), (\w{3})\)", line).captures
        network[node] = Dict('L' => left, 'R' => right)
    end
    network
end

function navigate(network::Network, dirs::Vector{Char}, start::String, finish::Vector{String})
    node = start
    for (i, dir) in enumerate(Iterators.cycle(dirs))
        node = network[node][dir]
        node in finish && return i
    end
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day8.txt"))
    lines = readlines(input)
    dirs = collect(lines[1])
    network = parse(Network, lines[3:end])
    
    nodes_in_network = "AAA" in keys(network) && "ZZZ" in keys(network)
    p1 = nodes_in_network ? navigate(network, dirs, "AAA", ["ZZZ"]) : 0
    
    starts = [node for node in keys(network) if endswith(node, 'A')]
    finish = [node for node in keys(network) if endswith(node, 'Z')]
    p2 = lcm([navigate(network, dirs, start, finish) for start in starts]...)
    
    p1, p2
end

end
