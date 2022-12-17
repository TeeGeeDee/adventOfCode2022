const MOVES_DOWN = [CartesianIndex(0,1),CartesianIndex(-1,1),CartesianIndex(1,1)]
const ORIGIN = CartesianIndex(500,0)

function day14(file)
    filled = Set{CartesianIndex}();
    lowestspace = 0;
    for line in eachline(file)
        nodes = [CartesianIndex(parse.(Int,m.captures)...) for m in eachmatch(r"([0-9]+),([0-9]+)",line)];
        paths = [makepath(nodes[i],nodes[i+1]) for i in 1:length(nodes)-1];
        for path in paths
            pathnodes = collect(path);
            filled = union(filled,pathnodes);
            lowestspace = max(lowestspace,maximum(n.I[2] for n in pathnodes));
        end
    end
    floorlevel = lowestspace+2;
    part1,part2 = 0,0;
    sandpos = ORIGIN;
    breachedbottom = false;
    while !(ORIGIN in filled)
        if !breachedbottom part1 += 1; end
        part2 += 1;
        sandpos = ORIGIN;
        while sandpos.I[2]<=floorlevel
            candidates = [sandpos+m for m in MOVES_DOWN];
            indnext = findfirst(x->!(x in filled),candidates);
            if isnothing(indnext) || sandpos.I[2]==floorlevel-1
                push!(filled,sandpos);
                break
            else
                sandpos = candidates[indnext];
            end
        end
        if sandpos.I[2]>=lowestspace breachedbottom = true; end
    end
    return part1-1,part2
end

function makepath(start,finish)
    i1,i2 = sort([start.I[1],finish.I[1]]);
    j1,j2 = sort([start.I[2],finish.I[2]]);
    return CartesianIndex(i1,j1):CartesianIndex(i2,j2)
end
