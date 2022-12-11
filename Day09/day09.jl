const directions = Dict("R"=>[1,0],"L"=>[-1,0],"U"=>[0,1],"D"=>[0,-1])

function day09(file)
    hd,tl = zeros(Int,2),zeros(Int,2);
    visited = Set{CartesianIndex{2}}((CartesianIndex(tl...),));
    for line in eachline(file)
        d,n = split(line," ");
        mv = directions[d];
        for _ in 1:parse(Int,n)
            hd += mv;
            diff = hd-tl;
            if any(abs.(diff).>1) # not touching
                tl += sign.(diff);
                push!(visited,CartesianIndex(tl...));
            end
        end
    end
    return length(visited)
end