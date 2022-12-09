using DataStructures

const Tree = NamedTuple{(:ind, :height), Tuple{Int, Int}}

function day08(file)
heights = parse.(Int,reduce(vcat,permutedims.(collect.(readlines(file)))));
part1 = sum(    reduce(.|,mapslices(x->iscummax(x,r)    ,heights,dims=d) for d in [1,2] for r in [true,false]));
part2 = maximum(reduce(.*,mapslices(x->getviewdists(x,r),heights,dims=d) for d in [1,2] for r in [true,false]));
return part1,part2
end

function iscummax(heights::Vector{Int},rev::Bool)::Vector{Bool}
    ismax = fill(false,length(heights));
    currentmax = -1;
    f = rev ? reverse : x->x;
    for (i,h) in enumerate(f(heights))
        if (ismax[i] = h>currentmax)
            currentmax = h;
        end
    end
    return f(ismax)
end

function getviewdists(heights::Vector{Int},rev::Bool)::Vector{Int}
    ntrees = length(heights);
    viewdists = zeros(Int,ntrees);
    f = rev ? reverse : x->x;
    heap =  BinaryHeap{Tree}(Base.By(last)); # orders by height
    for (i,h) in enumerate(f(heights))
        isend = i==ntrees;
        while !isempty(heap) && (first(heap).height<=h || isend)
            j, = pop!(heap);
            viewdists[j] = i-j;
        end
        push!(heap,Tree((i,h)));
    end        
    return f(viewdists)
end
