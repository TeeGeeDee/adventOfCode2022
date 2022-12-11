function day10(file)
    X = 1;
    cycle = 0;
    stack = [];
    screen = fill('.',40,6); # transpose since more natural to use linear indexing (column first)
    for line in eachline(file)
        cycle += 1;
        if isspriteoverpixel(X,cycle)
            screen[cycle] = '#';
        end
        if cycle==20 || (cycle>20 && mod(cycle-20,40)==0)
            push!(stack,X*(cycle));
        end
        if line!="noop" # addx
            cycle += 1;
            if isspriteoverpixel(X,cycle)
                screen[cycle] = '#';
            end
            if cycle==20 || (cycle>20 && mod(cycle-20,40)==0)
                push!(stack,X*cycle);
            end
            _,n = split(line," ");
            X += parse(Int,n);
        end
    end
    screenview = rstrip(foldl(*,String(a)*"\n" for a in eachcol(screen)),'\n');
    return sum(stack),screenview
end

isspriteoverpixel(spritestart,CRTind) = spritestart<=mod1(CRTind,40)<=spritestart+2;