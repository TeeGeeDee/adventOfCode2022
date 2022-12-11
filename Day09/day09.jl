const directions = Dict("R"=>[1,0],"L"=>[-1,0],"U"=>[0,1],"D"=>[0,-1])

function day09(file)
    knots = fill(zeros(Int,2),10);
    visited2  = Set{Vector{Int64}}((knots[2],));
    visited10 = Set{Vector{Int64}}((knots[10],));
    for line in eachline(file)
        d,n = split(line," ");
        mv = directions[d];
        for _ in 1:parse(Int,n)
            knots[1] += mv;
            for i = 2:10
                diff = knots[i-1]-knots[i];
                if any(abs.(diff).>1) # not touching
                    knots[i] += sign.(diff);
                    if i == 2
                        push!(visited2,knots[2]);
                    elseif i==10
                        push!(visited10,knots[10]);
                    end
                end
            end
        end
    end
    return length(visited2),length(visited10)
end