compartments(bag) = Iterators.partition(bag,length(bag)÷2);
commonality(groupsofitems)::Char = only(reduce(intersect,groupsofitems));
priority(c::Char)::Int = Int(c) - (isuppercase(c) ? Int('A')-27 : Int('a')-1);

function day03(file)
    bags::Vector{Vector{Char}} = [collect(l) for l in eachline(file)];
    return sum(priority(commonality(compartments(bag))) for bag in bags),
           sum(priority(commonality(group)) for group in Iterators.partition(bags,3))
end
