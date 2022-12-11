function day10(file)
    X = 1;
    cycle = 0;
    stack = [];
    for line in eachline(file)
        cycle += 1;
        if cycle==20 || (cycle>20 && mod(cycle-20,40)==0)
            push!(stack,X*(cycle));
        end
        if line!="noop" # addx
            cycle += 1;
            if cycle==20 || (cycle>20 && mod(cycle-20,40)==0)
                push!(stack,X*cycle);
            end
            _,n = split(line," ");
            X += parse(Int,n);
        end
    end
    return sum(stack)
end