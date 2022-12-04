chunkvec(v,sz) = [v[i:i+sz-1] for i in 1:sz:length(v)];
compartments(bag) = chunkvec(bag,length(bag)÷2);
commonality(groupsofitems::Vector{Vector{Char}})::Char = reduce(intersect,groupsofitems)[1];
priority(c::Char)::Int = Int(c) - (isuppercase(c) ? Int('A')-27 : Int('a')-1);

function day03(file)
    bags::Vector{Vector{Char}} = [collect(l) for l in eachline(file)];
    return sum(priority(commonality(compartments(bag))) for bag in bags),
           sum(priority(commonality(group)) for group in chunkvec(bags,3))
end
