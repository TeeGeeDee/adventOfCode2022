function day13(file)
    part1,i = 0,0;
    while !eof(file)
        i += 1;
        if iscorrectorder(getpair(file)...)
            part1 += i;
        end
    end
    return part1
end

getpair(file) = collect(Iterators.takewhile(!isempty,eachline(file)));

function iscorrectorder(x1,x2)
    s1,s2 = collect(reverse(x1)),collect(reverse(x2));
    while !isempty(s1) && !isempty(s2)
        left,right = popelement!(s1),popelement!(s2);
        isLeftInt = typeof(left)==Int;
        isRightInt = typeof(right)==Int;
        if isLeftInt && isRightInt && left!=right
            return left<right
        elseif xor(left==']',right==']')
            return left==']'
        elseif isLeftInt && right=='['
            push!(s1,']');
            for c in collect(reverse(string(left)))
                push!(s1,c);
            end
        elseif left=='[' && isRightInt
            push!(s2,']');
            for c in collect(reverse(string(right)))
                push!(s2,c);
            end
        end
    end
    return true
end

function popelement!(s)
    x = pop!(s);
    while !isempty(s) && isnumeric(x[1]) && isnumeric(s[end])
        x *= pop!(s);
    end
    if isnumeric(x[1]) x = parse(Int,x) end
    return x
end

function runtoendoflist!(s)
    depth = 0;
    while !(depth==0 && peek(s)==']')
        c = popfirst!(s);
        if     c==']' depth -= 1;
        elseif c=='[' depth += 1;
        end
    end
end

putinlist!(s,c) = Iterators.reset!(s, vcat(c,']',collect(s)));


