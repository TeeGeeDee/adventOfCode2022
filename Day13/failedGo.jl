#5896.
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
    s1,s2 = Base.Iterators.Stateful(collect(x1)),Base.Iterators.Stateful(collect(x2));
    while !isempty(s1) && !isempty(s2)
        i,j = popfirst!(s1),popfirst!(s2);
        if isnumeric(i) && isnumeric(j) && i!=j
            return i<j
        elseif xor(i==']',j==']')
            return i==']'
        elseif isnumeric(i) && j=='['
            putinlist!(s1,i);
        elseif isnumeric(j) && i=='['
            putinlist!(s2,j);
        end
    end
    return isempty(s1)
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


