function rucksackpriority(items::Vector{Char})::Int
    l = length(items);
    return priorityofshared([items[1:(l÷2)],items[(l÷2+1):l]])
end

priorityofshared(groupsofitems::Vector{Vector{Char}}) = priority(first(foldl(intersect,groupsofitems)));

priority(c::Char)::Int = Int(c) - (isuppercase(c) ? Int('A')-27 : Int('a')-1);

function day03(file)
    rucksacks = [collect(l) for l in eachline(file)];
    ngroups = length(rucksacks)÷3;
    return sum(rucksackpriority(bag) for bag in rucksacks),sum(priorityofshared(rucksacks[3*(i-1)+1:3*i]) for i in 1:ngroups)
end
