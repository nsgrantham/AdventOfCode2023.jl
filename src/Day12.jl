module Day12

using AdventOfCode2023
using Memoize


@memoize function count_arrangements(springs::AbstractString, group_sizes::Tuple)
    # If there are no more groups, check whether there are any remaining ungrouped 
    # damaged springs ('#'). If so this is not a valid arrangement, do not count it.
    # Otherwise, count it. 
    isempty(group_sizes) && return '#' in springs ? 0 : 1

    # If the number of springs remaining cannot accommodate the sizes of the groups
    # and the number of operational springs ('.') required to separate these groups,
    # then this is not a valid arrangement, do not count it. 
    length(springs) < sum(group_sizes) + (length(group_sizes) - 1) && return 0

    # There is not enough information to determine if the arrangement is valid, so 
    # initialize a counter and count all arrangements that can be made from this
    # current arrangement.
    counts = 0

    # If the next spring is operational, whether that is known ('.') or unknown ('?'),
    # then a group cannot be made, so skip this spring and count arrangements starting 
    # from the following spring. 
    if first(springs) != '#'
        counts += count_arrangements(springs[2:end], group_sizes)
    end

    # If the next spring is damaged, whether that is known ('#') or unknown ('?'),
    # then try to form a group from it and, potentially, the following springs. A 
    # group cannot contain any operational springs ('.') and the spring following the 
    # end of a group, if one exists, cannot be damaged ('#'). If both conditions are 
    # met, form the group and count arrangments starting from two springs after the 
    # end of the group (the spring following the end of the group must be a separator 
    # between groups and can therefore be skipped) and the remaining groups.
    group_size, remaining_group_sizes... = group_sizes
    if !contains(springs[1:group_size], '.') && get(springs, group_size+1, '.') != '#'
        counts += count_arrangements(springs[group_size+2:end], remaining_group_sizes)
    end
    
    # Return all counted arrangements.
    counts
end

function solve(input=pkgdir(AdventOfCode2023, "data", "Day12.txt"))
    records1 = [(springs, Tuple(parse.(Int, split(group_sizes, ",")))) for (springs, group_sizes) in split.(readlines(input))] 
    records2 = [(join(fill(springs, 5), "?"), Tuple(repeat(collect(group_sizes), 5))) for (springs, group_sizes) in records1]
    p1 = sum(count_arrangements(record...) for record in records1)
    p2 = sum(count_arrangements(record...) for record in records2)
    p1, p2
end

end
