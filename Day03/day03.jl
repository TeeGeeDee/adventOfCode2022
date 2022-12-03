function rucksackpriority(backpack::String)::Int
    items = collect(backpack);
    l = length(items);
    overlap = intersect(items[1:(l÷2)],items[(l÷2+1):l]);
    return sum(priority(i) for i in overlap)
end

function grouppriority(group::Vector{String})::Int
    items = [collect(elf) for elf in group];
    return priority(first(foldl(intersect,items)))
end

priority(c::Char)::Int = Int(c) - (isuppercase(c) ? Int('A')-27 : Int('a')-1);

function day03(file)
    lines = readlines(file);
    ngroups = length(lines)÷3;
    return sum(rucksackpriority(r) for r in lines),sum(grouppriority(lines[3*(i-1)+1:3*i]) for i in 1:ngroups)
end
