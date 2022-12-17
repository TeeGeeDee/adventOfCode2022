const DIVIDER_PACKETS = ["[[2]]", "[[6]]"]

function day13(file)
    part1,i = 0,0;
    allpackets = copy(DIVIDER_PACKETS);
    while !eof(file)
        i += 1;
        left,right = getpair(file);
        if iscorrectorder(left,right)
            part1 += i;
        end
        push!(allpackets,left);
        push!(allpackets,right);
    end
    part2 = prod(indexin(DIVIDER_PACKETS,sort(allpackets,lt=iscorrectorder)));
    return part1,part2
end

getpair(file) = collect(Iterators.takewhile(!isempty,eachline(file)));

function iscorrectorder(x1,x2)
    s1,s2 = collect(reverse(x1)),collect(reverse(x2));
    while !isempty(s1) && !isempty(s2)
        left,right = popelement!(s1),popelement!(s2);
        if typeof(left)==Int && typeof(right)==Int && left!=right
            return left<right
        elseif xor(left==']',right==']')
            return left==']'
        elseif typeof(left)==Int && right=='['
            putinlist!(s1,left);
        elseif left=='[' && typeof(right)==Int
            putinlist!(s2,right);
        end
    end
end

function popelement!(s)
    x = pop!(s);
    while !isempty(s) && isnumeric(x[1]) && isnumeric(s[end])
        x *= pop!(s);
    end
    if isnumeric(x[1]) x = parse(Int,x) end
    return x
end

function putinlist!(s,i)
    push!(s,']');
    for c in collect(reverse(string(i)))
        push!(s,c);
    end
end
